'use client';

import { updateCustomer } from '@/app/lib/actions';
import { CustomerForm } from '@/app/lib/definitions';
import { Button } from '@/app/ui/button';
import { UserCircleIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

export default function EditCustomerForm({ customer }: { customer: CustomerForm }) {
  const router = useRouter();

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    const formData = {
      name: (event.currentTarget as any).name.value,
      email: (event.currentTarget as any).email.value,
    };

    try {
      const result = await Swal.fire({
        title: 'Confirm Update',
        text: 'Are you sure you want to update this customer?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Yes, update it',
        cancelButtonText: 'Cancel',
      });

      if (!result.isConfirmed) return;

      const response = await updateCustomer(customer.id, formData);
      if (!response.success) throw new Error(response.message);

      await Swal.fire('Updated!', 'The customer was updated successfully.', 'success');

      // Redirigir y actualizar la tabla
      router.push('/dashboard/customers');
      router.refresh();
    } catch (error: any) {
      console.error(error);
      await Swal.fire('Error!', error.message || 'Failed to update the customer.', 'error');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="rounded-md bg-gray-50 p-4 md:p-6">
        {/* Customer Fullname */}
        <div className="mb-4">
          <label htmlFor="name" className="mb-2 block text-sm font-medium">
            Customer FullName
          </label>
          <div className="relative mt-2 rounded-md">
            <div className="relative">
              <input
                id="name"
                name="name"
                type="text"
                defaultValue={customer.name}
                className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm placeholder:text-gray-500"
              />
              <UserCircleIcon className="pointer-events-none absolute left-3 top-1/2 h-5 w-5 -translate-y-1/2 text-gray-500" />
            </div>
          </div>
        </div>

        {/* Customer Email */}
        <div className="mb-4">
          <label htmlFor="email" className="mb-2 block text-sm font-medium">
            Customer Email
          </label>
          <div className="relative mt-2 rounded-md">
            <div className="relative">
              <input
                id="email"
                name="email"
                type="email"
                defaultValue={customer.email}
                className="peer block w-full rounded-md border border-gray-200 py-2 pl-10 text-sm placeholder:text-gray-500"
              />
              <UserCircleIcon className="pointer-events-none absolute left-3 top-1/2 h-5 w-5 -translate-y-1/2 text-gray-500" />
            </div>
          </div>
        </div>
      </div>

      <div className="mt-6 flex justify-end gap-4">
        <Link
          href="/dashboard/customers"
          className="flex h-10 items-center rounded-lg bg-gray-100 px-4 text-sm font-medium text-gray-600 hover:bg-gray-200"
        >
          Cancel
        </Link>
        <Button type="submit">Edit Customer</Button>
      </div>
    </form>
  );
}

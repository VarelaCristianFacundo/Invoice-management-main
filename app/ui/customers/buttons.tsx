// import { deleteCustomer } from '@/app/lib/actions';
import { PencilIcon, PlusIcon } from '@heroicons/react/24/outline';
import Link from 'next/link';

export function CreateCustomer() {

  return (
    <Link
      href="/dashboard/customers/create"
      className="flex h-10 items-center rounded-lg bg-gray-800 px-4 text-sm font-medium text-white transition-colors hover:bg-gray-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-800"
    >
      <span className="hidden md:block">Agregar Proveedor</span>{' '}
      <PlusIcon className="h-5 md:ml-4" />
    </Link>
  );
}

export function UpdateCustomer({ id }: { id: string }) {
  return (
    <Link
      href={`/dashboard/customers/${id}/edit`}
      className="rounded-md border p-2 hover:bg-gray-100"
    >
      <PencilIcon className="w-5" />
    </Link>
  );
}

export function DeleteCustomer({ id }: { id: string }) {
  // const deleteCustomerWithId = deleteCustomer.bind(null, id);
  return (
    true
    // <form action={deleteCustomerWithId}>
    //   <button className="rounded-md border p-2 hover:bg-gray-100">
    //     <span className="sr-only">Delete</span>
    //     <TrashIcon className="w-5" />
    //   </button>
    // </form>
  );
}

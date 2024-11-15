import { CheckIcon, ClockIcon, XCircleIcon } from '@heroicons/react/24/outline';
import clsx from 'clsx';

export default function BudgetStatus({ status }: { status: string }) {
  return (
    <span
      className={clsx(
        'inline-flex items-center rounded-full px-2 py-1 text-xs font-medium',
        {
          'bg-gray-100 text-gray-500': status === 'pending',
          'bg-green-500 text-white': status === 'approved',
          'bg-red-500 text-white': status === 'rejected',
        },
      )}
    >
      {status === 'pending' && (
        <>
          Pending
          <ClockIcon className="ml-1 w-4 text-gray-500" />
        </>
      )}
      {status === 'approved' && (
        <>
          Approved
          <CheckIcon className="ml-1 w-4 text-white" />
        </>
      )}
      {status === 'rejected' && (
        <>
          Rejected
          <XCircleIcon className="ml-1 w-4 text-white" />
        </>
      )}
    </span>
  );
}

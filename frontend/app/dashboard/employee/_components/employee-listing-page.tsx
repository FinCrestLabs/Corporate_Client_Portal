// EmployeeListingPage.tsx
import PageContainer from '@/components/layout/page-container';
import { buttonVariants } from '@/components/ui/button';
import { Heading } from '@/components/ui/heading';
import { Separator } from '@/components/ui/separator';
import { Employee } from '@/constants/data';
import { cn } from '@/lib/utils';
import { Plus } from 'lucide-react';
import Link from 'next/link';
import EmployeeTable from './employee-tables';

type TEmployeeListingPage = {};

export default async function EmployeeListingPage({}: TEmployeeListingPage) {
  const response = await fetch('http://localhost:3001/api/clients');
  const jsonData = await response.json();

  const employee: Employee[] = jsonData.data.clients.map((client: any) => ({
    id: client.id,
    name: client.name,
    email: client.email,
    phone: client.phone,
    date_of_birth: client.dob,
    address: client.address,
    city: client.city,
    country: 'USA', 
  }));

  const totalUsers = employee.length;

  return (
    <PageContainer scrollable>
      <div className="space-y-4">
        <div className="flex items-start justify-between">
          <Heading
            title={`Employee (${totalUsers})`}
            description="Manage employees (Server side table functionalities.)"
          />

          <Link
            href={'/dashboard/employee/new'}
            className={cn(buttonVariants({ variant: 'default' }))}
          >
            <Plus className="mr-2 h-4 w-4" /> Add New
          </Link>
        </div>
        <Separator />
        <EmployeeTable data={employee} totalData={totalUsers} />
      </div>
    </PageContainer>
  );
}

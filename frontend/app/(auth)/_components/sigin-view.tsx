import { Metadata } from 'next';
import Image from 'next/image';
import Login from './Login';

export const metadata: Metadata = {
  title: 'Authentication',
  description: 'Authentication forms built using the components.'
};
export default function SignInViewPage() {
  return (
    <div className="relative h-screen flex-col items-center justify-center">
        <div className="relative p-10 font-medium">
          <Image
          src='https://avatars.githubusercontent.com/u/166785499?v=4'
          alt='logo'
          height='70'
          width='70'
          className='rounded'/>
        </div>
      <Login/>
    </div>
  );
}

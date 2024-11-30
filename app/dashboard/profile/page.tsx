import { authOptions } from '@/authOptions';
import { getServerSession } from 'next-auth/next';
import { redirect } from 'next/navigation';

export default async function ProfilePage() {
    const session = await getServerSession(authOptions);

    if (!session || !session.user) {
        redirect('/login');
    }

    const user = session.user;

    return (
        <div className="p-6">
            <h1 className="mb-4 text-2xl font-semibold">Perfil de Usuario</h1>
            <p>
                <strong>Nombre:</strong> {user.name}
            </p>
            <p>
                <strong>Email:</strong> {user.email}
            </p>
            <p>
                <strong>Rol:</strong> {user.role}
            </p>
        </div>
    );
}

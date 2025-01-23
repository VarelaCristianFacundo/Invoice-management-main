import { pool } from '@/app/lib/db';
import { NextApiRequest, NextApiResponse } from 'next';

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse,
) {
  const { id } = req.query;

  if (req.method === 'DELETE') {
    try {
      // Ejecutar la consulta para eliminar el presupuesto
      const queryText = 'DELETE FROM budgets WHERE id = $1';
      const result = await pool.query(queryText, [id]);

      if (result.rowCount === 0) {
        return res.status(404).json({ message: 'Proyecto no encontrado' });
      }

      return res.status(200).json({ message: 'Proyecto eliminado con éxito' });
    } catch (error) {
      console.error('Error deleting budget:', error);
      return res.status(500).json({ message: 'Falló al eliminar un proyecto' });
    }
  }

  // Si el método HTTP no es DELETE
  res.setHeader('Allow', ['DELETE']);
  return res.status(405).end(`Method ${req.method} Not Allowed`);
}

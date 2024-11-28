import formidable, { Fields, Files } from 'formidable';
import { NextApiRequest, NextApiResponse } from 'next';
import path from 'path';

export const config = {
  api: {
    bodyParser: false, // Para usar formidable
  },
};

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse,
) {
  if (req.method === 'POST') {
    const form = formidable({
      uploadDir: path.join(process.cwd(), '/uploads'), // Directorio de subida
      keepExtensions: true, // Mantener las extensiones originales
    });

    form.parse(req, (err: Error | null, fields: Fields, files: Files) => {
      if (err) {
        return res.status(500).json({ error: 'File upload failed' });
      }

      // Guarda los detalles del archivo en la base de datos aquí si es necesario
      return res.status(200).json({
        message: 'File uploaded successfully',
        file: files,
      });
    });
  } else {
    res.setHeader('Allow', ['POST']);
    res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}

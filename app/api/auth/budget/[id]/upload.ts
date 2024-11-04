import formidable from 'formidable';
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
    const form = new formidable.IncomingForm();
    form.uploadDir = path.join(process.cwd(), '/uploads');
    form.keepExtensions = true;

    form.parse(req, (err, fields, files) => {
      if (err) return res.status(500).json({ error: 'File upload failed' });

      // Guarda los detalles del archivo en la base de datos aquí si es necesario
      res
        .status(200)
        .json({ message: 'File uploaded successfully', file: files });
    });
  } else {
    res.setHeader('Allow', ['POST']);
    res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}

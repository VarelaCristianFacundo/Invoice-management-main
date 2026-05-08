// next.config.js

/** @type {import('next').NextConfig} */
const nextConfig = {
  // Evita que Next.js intente conectar a la DB durante el build estático
  staticPageGenerationTimeout: 60,
};

module.exports = nextConfig;

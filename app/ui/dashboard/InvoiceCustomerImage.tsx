'use client';

import Image from 'next/image';
import { useState } from 'react';

type InvoiceCustomerImageProps = {
    src?: string | null;
    alt: string;
    className?: string;
    width: number;
    height: number;
};

export default function InvoiceCustomerImage({
    src,
    alt,
    className,
    width,
    height,
}: InvoiceCustomerImageProps) {
    const fallbackSrc = '/default-user.png';

    const [currentSrc, setCurrentSrc] = useState(
        src && src.trim().length > 0 ? src : fallbackSrc,
    );

    const handleImageError = () => {
        setCurrentSrc(fallbackSrc);
    };

    return (
        <Image
            src={currentSrc}
            alt={alt}
            className={className}
            width={width}
            height={height}
            onError={handleImageError}
        />
    );
}

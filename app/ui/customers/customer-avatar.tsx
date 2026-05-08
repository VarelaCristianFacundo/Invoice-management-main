import Image from 'next/image';

// Deterministic color palette keyed by first letter
const COLORS: Record<string, { bg: string; text: string }> = {
  A: { bg: '#dbeafe', text: '#1d4ed8' },
  B: { bg: '#fce7f3', text: '#9d174d' },
  C: { bg: '#d1fae5', text: '#065f46' },
  D: { bg: '#fef3c7', text: '#92400e' },
  E: { bg: '#ede9fe', text: '#5b21b6' },
  F: { bg: '#fee2e2', text: '#991b1b' },
  G: { bg: '#e0f2fe', text: '#0369a1' },
  H: { bg: '#fdf4ff', text: '#86198f' },
  I: { bg: '#f0fdf4', text: '#166534' },
  J: { bg: '#fff7ed', text: '#9a3412' },
  K: { bg: '#f1f5f9', text: '#334155' },
  L: { bg: '#ecfeff', text: '#155e75' },
  M: { bg: '#fef9c3', text: '#713f12' },
  N: { bg: '#f5f3ff', text: '#4c1d95' },
  O: { bg: '#e0e7ff', text: '#3730a3' },
  P: { bg: '#fce7f3', text: '#831843' },
  Q: { bg: '#d1fae5', text: '#14532d' },
  R: { bg: '#fee2e2', text: '#7f1d1d' },
  S: { bg: '#e0f2fe', text: '#075985' },
  T: { bg: '#fef3c7', text: '#78350f' },
  U: { bg: '#ede9fe', text: '#4c1d95' },
  V: { bg: '#d1fae5', text: '#065f46' },
  W: { bg: '#fdf2f8', text: '#9d174d' },
  X: { bg: '#f1f5f9', text: '#1e293b' },
  Y: { bg: '#fefce8', text: '#713f12' },
  Z: { bg: '#f8fafc', text: '#374151' },
};

const FALLBACK = { bg: '#f1f5f9', text: '#475569' };

function getColor(name: string) {
  const key = (name?.[0] ?? '').toUpperCase();
  return COLORS[key] ?? FALLBACK;
}

function isValidImageUrl(url: string | null | undefined): boolean {
  if (!url || !url.trim()) return false;
  if (url.includes('default.png')) return false;
  return true;
}

interface CustomerAvatarProps {
  name: string;
  imageUrl?: string | null;
  size?: number;
  priority?: boolean;
}

export default function CustomerAvatar({
  name,
  imageUrl,
  size = 28,
  priority = false,
}: CustomerAvatarProps) {
  if (isValidImageUrl(imageUrl)) {
    return (
      <Image
        src={imageUrl!}
        className="rounded-full object-cover"
        alt={`${name}'s profile picture`}
        width={size}
        height={size}
        priority={priority}
      />
    );
  }

  const initial = (name?.[0] ?? '?').toUpperCase();
  const { bg, text } = getColor(name);
  const fontSize = size <= 28 ? '0.65rem' : size <= 40 ? '0.8rem' : '1rem';

  return (
    <span
      style={{
        width: size,
        height: size,
        minWidth: size,
        backgroundColor: bg,
        color: text,
        fontSize,
        borderRadius: '9999px',
        display: 'inline-flex',
        alignItems: 'center',
        justifyContent: 'center',
        fontWeight: 700,
        lineHeight: 1,
        userSelect: 'none',
      }}
      aria-label={name}
      title={name}
    >
      {initial}
    </span>
  );
}

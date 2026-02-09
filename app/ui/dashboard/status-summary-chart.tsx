'use client';

import { formatCurrency } from '@/app/lib/utils';
import { roboto } from '@/app/ui/fonts';
import { useState } from 'react';
import {
    Bar,
    BarChart,
    CartesianGrid,
    Cell,
    Pie,
    PieChart,
    ResponsiveContainer,
    Tooltip,
    XAxis,
    YAxis,
} from 'recharts';

// Colores corporativos de CAMARCO (basados en tailwind.config.ts)
const COLORS = {
    presentado: '#F59E0B', // Amber
    aprobado: '#0070F3', // Azul de CAMARCO (primary)
    pagado: '#10B981', // Emerald
    rechazado: '#EF4444', // Red
};

const STATUS_LABELS = {
    presentado: 'Presentado',
    aprobado: 'Aprobado',
    pagado: 'Pagado',
    rechazado: 'Rechazado',
};

type ChartType = 'bar' | 'pie';

// Custom label que muestra el valor dentro del gráfico
const renderCustomLabel = (props: any) => {
    const { x, y, width, value } = props;
    const isNaN = Number.isNaN(value);

    return (
        <text
            x={x + width / 2}
            y={y + 15}
            fill="white"
            textAnchor="middle"
            dominantBaseline="middle"
            fontSize="12"
            fontWeight="bold"
        >
            {!isNaN && value > 0 ? value.toLocaleString('es-AR') : ''}
        </text>
    );
};

// Custom label para cantidad
const renderCountLabel = (props: any) => {
    const { x, y, width, value } = props;
    const isNaN = Number.isNaN(value);

    return (
        <text
            x={x + width / 2}
            y={y + 15}
            fill="white"
            textAnchor="middle"
            dominantBaseline="middle"
            fontSize="12"
            fontWeight="bold"
        >
            {!isNaN && value > 0 ? value : ''}
        </text>
    );
};

export function StatusSummaryChart({
    data,
}: {
    data: Array<{ status: string; count: number; amount: number }>;
}) {
    const [chartType, setChartType] = useState<ChartType>('bar');

    if (!data || data.length === 0) {
        return (
            <div className="rounded-xl bg-gray-50 p-4 shadow-sm">
                <h2 className={`${roboto.className} mb-4 text-lg font-semibold`}>
                    Resumen por Estado
                </h2>
                <div className="rounded-lg bg-white p-4 text-center py-8">
                    <p className="text-gray-500">No hay datos disponibles</p>
                </div>
            </div>
        );
    }

    // Transformar datos para el gráfico - garantizar que son números normales sin bigint
    const chartData: Array<{
        name: string;
        status: string;
        count: number;
        amount: number;
    }> = data.map((item) => {
        const count = typeof item.count === 'bigint'
            ? Number(item.count)
            : (item.count as number);
        const amount = typeof item.amount === 'bigint'
            ? Number(item.amount)
            : (item.amount as number);

        return {
            name: STATUS_LABELS[item.status as keyof typeof STATUS_LABELS] || item.status,
            status: item.status,
            count: isNaN(count) ? 0 : count,
            amount: isNaN(amount) ? 0 : amount,
        };
    });

    return (
        <div className="rounded-xl bg-gray-50 p-4 shadow-sm">
            <div className="flex items-center justify-between mb-4">
                <h2 className={`${roboto.className} text-lg font-semibold`}>
                    Resumen por Estado
                </h2>
            </div>

            <div className="grid grid-cols-1 gap-6 lg:grid-cols-3 mb-6">
                {/* Gráfico de Cantidad - Siempre Barras */}
                <div className="rounded-lg bg-white p-4">
                    <h3 className="text-sm font-medium text-gray-700 mb-4">
                        Cantidad de Facturas
                    </h3>
                    <ResponsiveContainer width="100%" height={300}>
                        <BarChart data={chartData} margin={{ top: 20, right: 30, left: 0, bottom: 20 }}>
                            <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                            <XAxis dataKey="name" tick={{ fontSize: 12 }} />
                            <YAxis tick={{ fontSize: 12 }} />
                            <Tooltip
                                formatter={(value: any) => value}
                                contentStyle={{
                                    backgroundColor: '#fff',
                                    border: '1px solid #e5e7eb',
                                    borderRadius: '8px',
                                }}
                            />
                            <Bar dataKey="count" fill="#0070F3" radius={[8, 8, 0, 0]} label={renderCountLabel} />
                        </BarChart>
                    </ResponsiveContainer>
                </div>

                {/* Gráfico de Monto (Variable según selección) */}
                <div className="rounded-lg bg-white p-4">
                    <h3 className="text-sm font-medium text-gray-700 mb-4">
                        Monto Total por Estado
                    </h3>
                    {chartData.some((item) => item.amount > 0) ? (
                        <ResponsiveContainer width="100%" height={300}>
                            {chartType === 'bar' && (
                                <BarChart data={chartData} margin={{ top: 20, right: 30, left: 0, bottom: 20 }}>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                                    <XAxis dataKey="name" tick={{ fontSize: 12 }} />
                                    <YAxis tick={{ fontSize: 12 }} />
                                    <Tooltip
                                        formatter={(value: any) => formatCurrency(value as number)}
                                        contentStyle={{
                                            backgroundColor: '#fff',
                                            border: '1px solid #e5e7eb',
                                            borderRadius: '8px',
                                        }}
                                    />
                                    <Bar dataKey="amount" fill="#10B981" radius={[8, 8, 0, 0]} label={renderCustomLabel} />
                                </BarChart>
                            )}
                            {chartType === 'pie' && (
                                <PieChart>
                                    <Pie
                                        data={chartData}
                                        cx="50%"
                                        cy="50%"
                                        labelLine={false}
                                        label={({ name, value }: any) =>
                                            value > 0 ? `${name}: ${formatCurrency(value)}` : ''
                                        }
                                        outerRadius={80}
                                        fill="#8884d8"
                                        dataKey="amount"
                                    >
                                        {chartData.map((entry, index) => (
                                            <Cell
                                                key={`cell-${index}`}
                                                fill={COLORS[entry.status as keyof typeof COLORS]}
                                            />
                                        ))}
                                    </Pie>
                                    <Tooltip
                                        formatter={(value: any) => formatCurrency(value as number)}
                                    />
                                </PieChart>
                            )}
                        </ResponsiveContainer>
                    ) : (
                        <div className="flex items-center justify-center h-80 text-gray-400">
                            <p>Sin datos para mostrar</p>
                        </div>
                    )}
                </div>

                {/* Tabla de resumen */}
                <div className="rounded-lg bg-white p-4">
                    <h3 className="text-sm font-medium text-gray-700 mb-4">Detalles</h3>
                    <div className="overflow-x-auto">
                        <table className="w-full text-sm">
                            <thead className="border-b border-gray-200">
                                <tr>
                                    <th className="text-left py-2 px-3 font-medium text-gray-600">
                                        Estado
                                    </th>
                                    <th className="text-right py-2 px-3 font-medium text-gray-600">
                                        Cantidad
                                    </th>
                                    <th className="text-right py-2 px-3 font-medium text-gray-600">
                                        Monto Total
                                    </th>
                                    <th className="text-right py-2 px-3 font-medium text-gray-600">
                                        Monto Promedio
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                {chartData.map((row, index) => {
                                    const originalData = data[index];
                                    const avgAmount =
                                        originalData.count > 0
                                            ? originalData.amount / originalData.count
                                            : 0;

                                    return (
                                        <tr
                                            key={row.name}
                                            className="border-b border-gray-100 hover:bg-gray-50"
                                        >
                                            <td className="py-3 px-3 text-gray-900 font-medium">
                                                <span
                                                    className="inline-block w-3 h-3 rounded mr-2"
                                                    style={{
                                                        backgroundColor: COLORS[row.status as keyof typeof COLORS],
                                                    }}
                                                ></span>
                                                {row.name}
                                            </td>
                                            <td className="text-right py-3 px-3 text-gray-700">
                                                {row.count}
                                            </td>
                                            <td className="text-right py-3 px-3 text-gray-700 font-semibold">
                                                {formatCurrency(row.amount)}
                                            </td>
                                            <td className="text-right py-3 px-3 text-gray-700">
                                                {formatCurrency(avgAmount)}
                                            </td>
                                        </tr>
                                    );
                                })}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


        </div>
    );
}

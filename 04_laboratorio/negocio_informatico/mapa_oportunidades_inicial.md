# Mapa inicial de oportunidades — negocio informático

**Estado:** hipótesis para validar. No son problemas confirmados ni resultados medidos.

## Procesos a observar
1. Entrada de consultas por WhatsApp, llamadas, redes o mostrador.
2. Identificación de equipo, falla reportada y urgencia.
3. Diagnóstico técnico y registro de hallazgos.
4. Presupuesto, autorización y compra de repuestos.
5. Reparación, pruebas y entrega.
6. Venta de equipos y accesorios.
7. Control de stock y actualización de precios.
8. Publicidad, consultas y seguimiento comercial.
9. Registro de ingresos, costos y rentabilidad.

## Oportunidades candidatas

| ID | Oportunidad | Primera versión posible | Métrica para validar |
|---|---|---|---|
| INF-01 | Ordenar consultas | Clasificar mensajes por tema y urgencia; sugerir respuestas para revisión | Tiempo de primera respuesta |
| INF-02 | Recepción de equipos | Formulario para registrar cliente, equipo, accesorios y falla declarada | Tiempo de recepción y datos faltantes |
| INF-03 | Seguimiento de reparaciones | Estado interno y mensaje preparado para informar al cliente | Consultas de seguimiento y tiempo dedicado |
| INF-04 | Presupuestos | Plantilla que arma un borrador desde diagnóstico y lista de precios | Tiempo de preparación y correcciones |
| INF-05 | Conocimiento técnico | Base consultable de procedimientos y soluciones propias | Tiempo para encontrar información |
| INF-06 | Stock | Alertas por mínimos y registro de movimientos | Faltantes y diferencias de inventario |
| INF-07 | Marketing | Generar borradores de publicaciones a partir de productos y servicios | Tiempo de producción y consultas generadas |
| INF-08 | Rentabilidad | Resumen de ventas, costos y margen por categoría | Tiempo para obtener reportes y calidad de datos |

## Orden de experimentación sugerido
**Primero:** recepción y seguimiento de reparaciones. Es un flujo acotado que permite aprender sobre registro estructurado, estados y comunicación sin entregar decisiones técnicas a un modelo.

**Después:** presupuestos asistidos y consultas frecuentes, siempre con revisión antes de enviar precios, plazos o diagnósticos.

**Luego:** stock y análisis de rentabilidad, cuando exista información suficientemente consistente.

## Piloto 1 — registro y seguimiento
- Registrar cada equipo con un identificador único.
- Guardar datos mínimos: fecha, equipo, falla declarada, accesorios, estado y próximo paso.
- Estados sugeridos: recibido, en diagnóstico, esperando autorización, esperando repuesto, en reparación, en pruebas, listo para retirar, entregado.
- Preparar mensajes de actualización a partir del estado, para que una persona los revise y envíe.
- No guardar contraseñas de equipos en planillas o herramientas de IA.
- No prometer diagnósticos, costos ni fechas automáticamente.

## Datos que faltan relevar
- Canales reales de entrada.
- Volumen aproximado de equipos y consultas.
- Cómo se registran hoy.
- Quién actualiza el estado.
- Qué información se comunica al cliente.
- Herramientas disponibles (planillas, sistema, WhatsApp).
- Problemas más frecuentes y tiempo que consumen.

## Criterio de éxito del piloto
Comparar una línea de base con el período de prueba: tiempo para registrar un ingreso, cantidad de registros incompletos, tiempo dedicado a responder consultas de estado y errores de comunicación. Acordar metas antes de probar.

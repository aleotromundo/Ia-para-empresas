# Diagnóstico real — negocio informático (fase 1)

**Estado:** relevamiento conversacional inicial.  
**Alcance:** información confirmada directamente por el responsable del negocio.  
**Importante:** este documento no incluye datos personales de clientes ni credenciales.

## 1. Flujo actual confirmado

1. Los clientes llegan principalmente por WhatsApp.
2. La conversación de WhatsApp funciona como registro del cliente y del diagnóstico técnico.
3. El seguimiento de los equipos pendientes se lleva consultando WhatsApp y mediante la memoria del responsable.
4. Habitualmente hay entre 2 y 5 reparaciones/equipos pendientes al mismo tiempo.
5. Cuando termina una reparación, el responsable escribe al cliente para avisarle que puede retirar el equipo.
6. Se comunica el presupuesto al cliente y se espera su confirmación antes de realizar el trabajo cuando corresponde.

## 1.1. Trabajos frecuentes identificados

El responsable indicó que entre los trabajos que realiza con mayor frecuencia están:
- Reemplazo de disco duro por una unidad SSD.
- Instalación de Windows.

En el caso de la instalación de Windows, el servicio normalmente se entrega completo, incluyendo instalación de programas, drivers, configuración y puesta a punto de la computadora.

Estos servicios quedan registrados como los primeros ejemplos confirmados para diseñar categorías de trabajo, paquetes de servicio, plantillas de recepción y referencias futuras de presupuestos. Todavía falta relevar otros trabajos habituales.

## 2. Presupuestos y decisiones de precio

- Los precios se calculan principalmente según la experiencia.
- En muchos casos se ofrece un precio total por resolver la reparación, sin desglose de repuestos y mano de obra.
- A veces el precio solo puede estimarse o definirse al terminar el trabajo.
- La forma de manejar esos casos varía según la situación y el acuerdo con el cliente.
- Puede ocurrir que el responsable mantenga el precio inicialmente comunicado aunque el trabajo resulte más costoso, que negocie cambios o que termine realizando trabajo adicional sin cobrarlo.
- El responsable identifica dos motivos frecuentes para no cobrar todo el trabajo realizado: dificultad para cobrar el tiempo invertido y deseo de evitar discusiones con el cliente.
- No existe una tarifa horaria fija: el precio se improvisa según cada trabajo y las necesidades del momento.

## 3. Registro y administración actuales

- No se registra sistemáticamente el tiempo dedicado a cada reparación.
- No se registra sistemáticamente el costo de repuestos.
- No se lleva un registro organizado y duradero de ingresos, costos y rentabilidad por reparación.
- La información operativa queda principalmente en los chats de WhatsApp y no se consolida en un historial propio de fácil consulta.
- El responsable indicó que ese registro queda en el chat por poco tiempo.

## 4. Oportunidades detectadas

| ID | Oportunidad | Necesidad que atiende | Prioridad preliminar |
|---|---|---|---|
| INF-09 | Memoria central de reparaciones | Evitar depender de chats y memoria para saber qué equipos están pendientes | Alta |
| INF-10 | Seguimiento simple por estados | Ver de un vistazo qué está en diagnóstico, esperando autorización, en reparación o listo | Alta |
| INF-11 | Historial de presupuestos y autorizaciones | Conservar qué se ofreció y qué aceptó el cliente | Alta |
| INF-12 | Registro ligero de tiempo y gastos | Empezar a conocer el costo real de cada trabajo | Alta |
| INF-13 | Asistente de presupuestos | Consultar antecedentes y preparar estimaciones basadas en trabajos anteriores | Media, después de reunir datos |
| INF-14 | Ayuda para comunicar cambios de alcance | Preparar mensajes claros y respetuosos cuando aparece trabajo adicional | Media |
| INF-15 | Análisis de rentabilidad | Comparar precio cobrado, gastos y tiempo invertido | Media, requiere registros consistentes |

## 5. Primera hipótesis de solución

Construir una memoria digital sencilla de reparaciones, que pueda convivir con WhatsApp en lugar de obligar a cambiar el canal de atención.

Cada reparación debería poder guardar, como mínimo:
- Identificador interno.
- Fecha de ingreso.
- Cliente y medio de contacto (con acceso restringido).
- Tipo de equipo y falla reportada.
- Diagnóstico y notas técnicas.
- Presupuesto comunicado y fecha.
- Estado de autorización.
- Cambios de alcance acordados.
- Estado de reparación y próximo paso.
- Fecha de finalización y aviso de retiro.
- Precio final cobrado.
- Tiempo aproximado o real invertido.
- Repuestos y otros gastos, cuando existan.

La carga debe ser muy rápida y permitir completar datos gradualmente. No se debe exigir información que el responsable no tenga todavía.

## 6. Principios de diseño y seguridad

- WhatsApp continúa siendo el canal de conversación con los clientes.
- La herramienta organiza y conserva información; no debe enviar mensajes ni tomar decisiones económicas sin aprobación humana.
- Ningún diagnóstico, presupuesto, cambio de precio o plazo debe comunicarse automáticamente sin revisión.
- Registrar por separado presupuesto inicial, cambios autorizados y precio final.
- No inventar costos, tiempos ni márgenes cuando falten datos.
- Evitar almacenar contraseñas de dispositivos o datos sensibles innecesarios.
- Proteger el acceso a datos de clientes y definir respaldo y política de conservación antes de usar el sistema en producción.

## 7. Próximos datos a relevar

- Tipos de reparaciones más frecuentes.
- Si se atienden también ventas de equipos, accesorios u otros servicios.
- Qué información mínima necesita conservarse de cada cliente y equipo.
- Qué dispositivos y herramientas usa habitualmente para trabajar.
- Qué forma de registro sería suficientemente rápida para mantenerla todos los días.

## 8. Próximo paso recomendado

Completar el relevamiento de los tipos de trabajos habituales y luego diseñar un flujo mínimo de registro. Probarlo con pocos casos, medir si realmente ahorra tiempo y recién después decidir qué automatizaciones o funciones de IA conviene incorporar.

---
*Documento de trabajo actualizado a partir de las respuestas del responsable durante el diagnóstico inicial. Las oportunidades son hipótesis de diseño, no resultados de un piloto medido.*

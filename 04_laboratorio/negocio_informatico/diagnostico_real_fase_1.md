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

## 1.2. Otros trabajos y soporte identificados

Además de los servicios anteriores, el responsable realiza:
- Reparaciones físicas de PC y notebooks, incluidos cambios de pantalla.
- Resolución de fallas y errores que puedan surgir en los equipos.
- Soporte de software y solución de problemas de configuración o funcionamiento.
- Resolución de problemas de conexión a Internet o conectividad.
- Asistencia y solución de problemas relacionados con televisores.

Esto amplía el alcance del negocio: no se limita a reparación de computadoras, sino que también ofrece soporte técnico y resolución de problemas tecnológicos de distinta naturaleza. Conviene distinguir estas categorías al registrar cada trabajo para poder comparar tiempos, precios, costos y rentabilidad por tipo de servicio.

## 1.3. Modalidad comercial

El responsable puede orientar y aconsejar a los clientes sobre qué computadora, notebook, componente o accesorio les conviene comprar, pero no le gusta dedicarse a la venta de productos. Por lo tanto, el valor comercial del negocio está principalmente en el asesoramiento técnico independiente y en los servicios de soporte y reparación, no en mantener un catálogo o impulsar ventas de equipos.

Esto abre una oportunidad para ofrecer asesoramiento de compra como parte del servicio: entender la necesidad y el presupuesto del cliente, explicar alternativas y recomendar opciones adecuadas sin que el negocio tenga que convertirse en una tienda.

## 1.4. Atención y diagnóstico a distancia

El responsable confirma que los clientes le envían **habitualmente y siempre que es necesario** fotos, audios y videos por WhatsApp para explicar consultas o problemas técnicos y recibir ayuda a distancia.

Este intercambio multimedia forma parte del flujo normal de atención, no es una excepción. En algunos casos, el responsable también utiliza **AnyDesk** para acceder de forma remota al equipo del cliente y realizar asistencia directamente. Se presentan ambas modalidades: a veces el cliente permanece presente y observa la intervención; otras veces autoriza el acceso y deja al responsable trabajar sin acompañar la sesión. Puede ser una fuente útil para:
- Entender mejor el problema antes de recibir físicamente un equipo.
- Hacer preguntas de diagnóstico más precisas.
- Identificar casos que podrían resolverse de forma remota y casos que requieren revisión presencial.
- Preparar instrucciones claras para que el cliente realice comprobaciones sencillas, cuando sea seguro y apropiado.

Una futura herramienta podría ayudar a ordenar la información que llega en texto, audio, fotos y videos, resumir el caso y sugerir preguntas de seguimiento. Las conclusiones técnicas deben ser revisadas por el responsable; una imagen o un audio por sí solos no garantizan un diagnóstico correcto.

## 1.5. Cobro por asistencia remota

El responsable ha aprendido a ponerle precio a la ayuda técnica que brinda a distancia y toma en cuenta factores como el tiempo requerido, la dificultad y el tipo de situación o cliente. Sin embargo, identifica dos situaciones frecuentes: a veces el cliente se sorprende cuando conoce el costo de esa asistencia y otras veces el trabajo termina sin cobrarse.

Esto señala una necesidad de hacer más claro el alcance del servicio remoto y comunicar sus condiciones económicas antes de dedicar tiempo significativo. No se trata necesariamente de fijar una tarifa rígida: podría definirse una forma sencilla de explicar cuándo una orientación inicial es gratuita, cuándo comienza una asistencia técnica cobrable y qué incluye cada intervención. Los criterios y valores deben ser definidos por el responsable.

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
| INF-16 | Asistente de prediagnóstico remoto | Ordenar mensajes, fotos, audios y videos recibidos por WhatsApp; resumir el caso y sugerir preguntas de seguimiento | Alta, sujeto a validación humana |
| INF-17 | Claridad y registro del cobro remoto | Explicar de antemano cuándo una asistencia a distancia tiene costo, qué incluye y registrar si fue cobrada | Alta |

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
- Las imágenes, audios y videos de clientes deben tratarse como información privada; no conservarlos más tiempo del necesario ni usarlos para otros fines sin autorización.

## 7. Próximos datos a relevar

- Tipos de reparaciones más frecuentes.
- Qué formato podría tener el asesoramiento de compra (por ejemplo, consulta puntual o servicio incluido en una reparación), sin convertirlo en venta de productos.
- Qué información mínima necesita conservarse de cada cliente y equipo.
- Qué dispositivos y herramientas usa habitualmente para trabajar (ya se confirmó el uso de AnyDesk para algunas asistencias remotas).
- Qué forma de registro sería suficientemente rápida para mantenerla todos los días.

## 8. Próximo paso recomendado

Completar el relevamiento de los tipos de trabajos habituales y luego diseñar un flujo mínimo de registro. Probarlo con pocos casos, medir si realmente ahorra tiempo y recién después decidir qué automatizaciones o funciones de IA conviene incorporar.

---
*Documento de trabajo actualizado a partir de las respuestas del responsable durante el diagnóstico inicial. Las oportunidades son hipótesis de diseño, no resultados de un piloto medido.*

# Arquitectura propuesta — OTROMUNDO AI

**Estado:** diseño inicial, pendiente de validación y prototipo.  
**Caso de uso:** asistente inteligente para el taller de reparación y soporte informático.  
**Principios:** una sola memoria del negocio, interfaz adaptable, voz y pantalla, automatización gradual, control humano y costos iniciales mínimos.

## 1. Objetivo

Construir un centro de operaciones para el taller que permita gestionar reparaciones, clientes, historial técnico, recordatorios, inventario recuperado, presupuestos y movimientos económicos. El asistente de IA debe consultar y operar sobre datos reales del sistema mediante funciones controladas; no debe inventar registros ni ejecutar acciones sensibles sin autorización.

La experiencia será dual:
- **Pantalla:** aplicación web adaptable a celular y computadora, con paneles, formularios rápidos, búsqueda y vistas de trabajo.
- **Voz:** el usuario podrá hablar para consultar o preparar acciones y recibir respuestas habladas cuando resulte útil. También podrá escribir. La voz no será el único modo de uso.

## 2. Arquitectura lógica

```text
CELULAR / COMPUTADORA
  Aplicación web adaptable (PWA)
  ├── Panel de trabajo
  ├── Fichas de clientes y equipos
  ├── Reparaciones y estados
  ├── Inventario
  ├── Finanzas
  └── Interfaz de voz y chat
            |
            v
BACKEND / API SEGURA
  ├── Autenticación y permisos
  ├── Reglas del negocio
  ├── Servicios de cada módulo
  ├── Registro de actividad
  └── Conector de IA con herramientas autorizadas
            |
      +-----+----------------+
      |                      |
      v                      v
BASE DE DATOS          SERVICIOS EXTERNOS
  PostgreSQL             ├── Modelo de IA
  ├── Clientes            ├── Voz: transcripción y síntesis
  ├── Equipos             ├── WhatsApp (fase posterior)
  ├── Reparaciones        └── Almacenamiento de archivos
  ├── Presupuestos
  ├── Movimientos
  └── Stock
```

## 3. Componentes recomendados

La elección definitiva se validará con un prototipo y con las condiciones vigentes de cada proveedor.

| Capa | Opción inicial | Motivo |
|---|---|---|
| Aplicación | Web responsive instalable (PWA) | Una misma experiencia en celular y computadora |
| Interfaz | HTML/CSS/JavaScript o framework liviano | Mantener el prototipo simple y rápido |
| Backend | API propia con validaciones | Centralizar reglas y proteger los datos |
| Base de datos | PostgreSQL administrado | Relaciones entre clientes, equipos, trabajos, repuestos y pagos |
| Autenticación | Servicio probado con acceso protegido | Evitar exponer fichas y datos financieros |
| IA | Capa intercambiable de proveedor/modelo | Poder cambiar de modelo sin rehacer el sistema |
| Voz | Captura de voz, transcripción y respuesta hablada | Conversar con el asistente sin depender de escribir |
| Archivos | Almacenamiento privado | Fotos de recepción y documentos con permisos |
| Integraciones | WhatsApp en una etapa posterior | Incorporar mensajes con autorización y trazabilidad |

Se priorizarán planes gratuitos o de bajo costo para desarrollo y pruebas. No se debe prometer costo cero permanente: los servicios gratuitos tienen límites, y el uso de modelos de IA, voz, almacenamiento o WhatsApp puede generar cargos. Antes de activar cualquier servicio pago se revisarán precios, límites y consentimiento del responsable.

## 4. Módulos funcionales

### 4.1. Inicio / centro de operaciones
- Resumen de trabajos activos, equipos en espera y equipos listos para retirar.
- Próximas acciones y reparaciones pausadas.
- Consultas y presupuestos pendientes de confirmación.
- Acceso rápido para registrar un ingreso o buscar un cliente.

### 4.2. Clientes, equipos e historial
- Ficha de cliente y datos de contacto con acceso restringido.
- Uno o varios equipos asociados a cada cliente.
- Historial de intervenciones por cliente y por equipo.
- Registro de fallas declaradas, diagnóstico, trabajo realizado, fechas y observaciones.
- Vincular una nueva visita con una reparación anterior sin asumir automáticamente garantía o causalidad.

### 4.3. Reparaciones
- Alta rápida de trabajo: cliente, dispositivo, falla, estado físico, accesorios y fotos disponibles.
- Estados configurables: consulta, recibido, diagnóstico, presupuesto enviado, esperando autorización, esperando repuesto, en reparación, pausado, terminado/cliente avisado y retirado.
- Próximo paso obligatorio opcional al pausar un trabajo.
- Registro de presupuesto inicial, cambios autorizados y precio final por separado.
- Etiqueta o identificador de trabajo imprimible.
- Ubicación física aproximada: mesa de trabajo, mueble u otra zona que se defina.
- Comprobante de recepción compartible o imprimible.

### 4.4. Memoria y recordatorios
- Lista de trabajos sin próximo paso o sin actividad reciente.
- Recordatorios configurables para retomar una reparación.
- Nota rápida al pausar: qué se hizo, qué falta y qué prueba sigue.
- No enviar mensajes a clientes ni crear recordatorios invasivos sin configuración y aprobación.

### 4.5. Asistencia técnica con IA
- Consultar antecedentes de un equipo y trabajos similares registrados.
- Ordenar la información que el usuario aporta: texto, fotos, audios y videos, cuando la integración lo permita.
- Proponer hipótesis, pruebas y preguntas de diagnóstico.
- Mostrar incertidumbre y diferenciar datos observados de sugerencias.
- La decisión técnica y cualquier instrucción al cliente quedan bajo revisión humana.

### 4.6. Inventario y equipos donantes
- Registrar primero el equipo completo que se conserva como fuente potencial de repuestos.
- Identificarlo por tipo/modelo, estado general, fecha aproximada y ubicación física.
- Registrar componentes individuales solo cuando se extraen o cuando sea útil hacerlo.
- Registrar origen del repuesto: aportado por el cliente, stock propio nuevo, usado o recuperado, o comprado por el responsable.
- Registrar estado, compatibilidad conocida, ubicación y trabajo donde se utilizó.
- No exigir inventariar de golpe todos los objetos dispersos por el taller.
- No asignar costos ficticios a piezas recuperadas.

### 4.7. Finanzas
- Ingresos efectivamente cobrados, pendientes y forma de pago.
- Diferenciar dinero de intercambios y acuerdos no monetarios.
- Costos de repuestos y gastos asociados.
- Tiempo invertido si el responsable decide registrarlo.
- Resumen mensual basado solo en movimientos cargados; mostrar datos faltantes y no llamar ganancia neta a una estimación incompleta.

### 4.8. WhatsApp e integraciones
- Primera etapa: permitir copiar mensajes preparados y registrar manualmente datos relevantes.
- Etapa posterior: evaluar integración oficial con WhatsApp Business Platform u otro conector compatible.
- Toda importación debe identificar el origen y permitir revisión.
- No asumir que el sistema puede leer chats personales automáticamente ni almacenar indefinidamente medios de clientes.

## 5. Modelo de datos inicial

Entidades principales y relaciones:

- **Cliente** 1:N **Equipo**
- **Equipo** 1:N **Reparación**
- **Reparación** 1:N **Presupuesto / autorización**
- **Reparación** 1:N **Intervención / nota técnica**
- **Reparación** 1:N **Repuesto utilizado**
- **Equipo donante** 1:N **Componente recuperado**
- **Componente** 0:N **Uso en reparación** (un componente solo puede estar disponible o asignado según su estado)
- **Reparación** 1:N **Movimiento económico**
- **Reparación** 1:N **Recordatorio / próximo paso**
- **Archivo** puede vincularse a cliente, equipo o reparación con permisos y retención definidos.

Las contraseñas y PIN de los dispositivos no forman parte del modelo de datos. Se podrá indicar si el acceso fue proporcionado y por qué canal, sin guardar el secreto.

## 6. Contrato de interacción con el asistente

El modelo de IA no tendrá acceso directo e irrestricto a la base de datos. Usará funciones específicas del backend, por ejemplo:

- `buscar_trabajos(filtros)`
- `consultar_cliente(cliente_id)`
- `ver_historial_equipo(equipo_id)`
- `crear_borrador_reparacion(datos)`
- `registrar_nota(reparacion_id, nota)`
- `proponer_recordatorio(reparacion_id, fecha, motivo)`
- `consultar_stock(filtros)`
- `preparar_resumen_mensual(periodo)`

Las funciones de escritura validan permisos y datos. Crear, modificar o cerrar registros, confirmar presupuestos, registrar pagos, enviar mensajes o eliminar información requiere confirmación explícita según el nivel de riesgo. Las consultas de solo lectura pueden responderse directamente cuando el usuario esté autenticado y autorizado.

Ejemplo:
- Usuario: «Dejé la notebook de Laura a medio armar, falta probarla».
- Asistente: identifica el trabajo correcto, propone agregar la nota y un próximo paso.
- Usuario confirma.
- Sistema guarda la nota y actualiza la actividad; no inventa fecha de entrega ni avisa al cliente.

## 7. Seguridad, privacidad y continuidad

- Acceso autenticado; no publicar la base de datos ni claves en GitHub.
- Separar datos de clientes de documentación pública del proyecto.
- Permisos por usuario y registro de acciones.
- Copias de seguridad y prueba de restauración.
- Archivos privados con acceso limitado.
- Política de conservación y eliminación de fotos, audios y documentos.
- No almacenar contraseñas ni PIN de equipos.
- Confirmación humana para cambios financieros, comunicaciones externas y acciones destructivas.
- Configuración de límites de uso y alertas de costos para servicios externos.

## 8. Plan de implementación por etapas

### Etapa 0 — Validación del diseño
Confirmar los flujos reales, campos mínimos, estados y experiencia de voz/pantalla. Definir qué datos son imprescindibles y cuáles opcionales.

### Etapa 1 — Núcleo operativo
Aplicación adaptable, acceso protegido, base de datos, clientes, equipos, reparaciones, estados, notas y próximos pasos. Importancia principal: que ningún trabajo quede olvidado.

### Etapa 2 — Memoria conversacional
Chat con IA conectado a funciones seguras: consultar pendientes, buscar historial, preparar registros y proponer recordatorios. Confirmación antes de guardar cambios.

### Etapa 3 — Voz
Entrada por voz y respuestas habladas, manteniendo siempre controles visuales y alternativa de escritura. Evaluar funcionamiento en los dispositivos reales.

### Etapa 4 — Inventario
Equipos donantes, componentes recuperados, ubicación y uso en reparaciones. Carga gradual, no inventario masivo inicial.

### Etapa 5 — Administración
Presupuestos, pagos, intercambios, gastos, costos y resumen mensual con datos verificables.

### Etapa 6 — Integraciones
Evaluar WhatsApp, archivos y otros conectores. Implementar solo cuando el beneficio supere el costo y la complejidad.

### Etapa 7 — Asistencia técnica avanzada
Análisis asistido de material multimedia, recuperación de antecedentes y sugerencias técnicas con validación humana.

## 9. Criterios para evaluar el piloto

- Tiempo necesario para registrar un equipo.
- Porcentaje de trabajos activos con estado y próximo paso identificados.
- Cantidad de trabajos olvidados o retomados gracias a recordatorios.
- Tiempo necesario para localizar antecedentes y repuestos.
- Porcentaje de movimientos económicos con datos completos.
- Utilidad real de la voz en tareas habituales.
- Errores, correcciones y acciones no autorizadas (objetivo: cero acciones sensibles sin confirmación).

## 10. Primera entrega a construir

El primer prototipo no intentará resolver todo. Debe incluir:
1. Inicio con trabajos activos y próximos pasos.
2. Alta y búsqueda de clientes/equipos.
3. Registro de reparación con estado, nota y ubicación.
4. Pausar y retomar un trabajo con recordatorio.
5. Chat de asistente que consulte los datos de prueba y prepare acciones para confirmar.

La voz se diseñará desde el comienzo, pero se activará después de comprobar que el flujo visual y los datos funcionan. El prototipo local existente puede servir como referencia de interfaz, pero su almacenamiento local no debe considerarse una base de datos compartida ni apta para producción.

---
*Documento de arquitectura inicial. Las tecnologías, proveedores, costos y requisitos de integración deberán verificarse antes de desplegar el sistema con datos reales.*


## 11. Dirección de experiencia e interfaz elegida

El responsable eligió el enfoque **B: asistente protagonista**. La pantalla inicial debe estar centrada en la conversación con el asistente, con entrada por texto y voz claramente accesible. El asistente será el punto de entrada principal a las funciones del taller, no una pantalla administrativa tradicional.

Criterios de diseño:
- Estética moderna, tecnológica y sobria, con identidad visual propia.
- Asistente conversacional como elemento principal.
- Accesos rápidos y discretos a reparaciones, clientes, inventario y finanzas.
- Respuestas que muestren de qué registro proviene la información y permitan abrir la ficha relacionada.
- Acciones sugeridas en forma de confirmaciones claras antes de modificar datos.
- Diseño responsive: misma identidad y memoria en computadora y celular, adaptando la distribución a cada pantalla.
- El panel de control y las vistas detalladas seguirán existiendo, pero como espacios secundarios a los que el asistente puede llevar al usuario.


## 12. Identidad y personalidad del asistente

El responsable eligió que el asistente se comporte como un **compañero de trabajo / amigo de taller**, no como un sistema administrativo frío. La conversación debe ser natural, cercana y práctica, manteniendo profesionalismo y respeto.

Rasgos definidos:
- Cercano y conversacional, con lenguaje cotidiano.
- Observador: puede señalar trabajos olvidados, próximos pasos y datos faltantes sin saturar al usuario.
- Resolutivo: además de responder, ayuda a preparar y completar tareas concretas.
- Técnicamente útil: organiza diagnósticos, investiga y propone pruebas o alternativas, diferenciando hipótesis de hechos confirmados.
- Honesto: reconoce incertidumbre y no inventa datos, diagnósticos, precios, autorizaciones ni resultados.
- Proactivo con criterio: sugiere acciones, pero no ejecuta operaciones sensibles ni contacta clientes sin autorización.

La personalidad nunca debe reemplazar la precisión: toda respuesta operativa debe apoyarse en registros reales del taller, indicar cuando falten datos y permitir abrir el registro de origen. El usuario mantiene la decisión final.

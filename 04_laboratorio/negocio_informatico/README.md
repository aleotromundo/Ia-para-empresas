# Laboratorio — negocio informático

Usaremos un negocio de reparación y venta de informática como primer entorno de práctica.

## Diagnóstico real
[Consultar diagnóstico real — fase 1](diagnostico_real_fase_1.md)

Este documento reúne lo confirmado en el relevamiento inicial: consultas y diagnósticos por WhatsApp, seguimiento apoyado en memoria, presupuestos, autorización, registro económico y oportunidades detectadas. Se irá actualizando a medida que avance el diagnóstico.

## Oportunidades iniciales
1. Asistente para consultas de clientes.
2. Guía de diagnóstico inicial.
3. Generador de presupuestos.
4. Seguimiento del estado de reparaciones.
5. Gestión de repuestos y stock.
6. Generador de publicaciones y anuncios.
7. Base de conocimiento técnica.
8. Recordatorios de mantenimiento.
9. Análisis de rentabilidad de servicios y ventas.

## Registro de cada experimento
- Problema que resuelve.
- Flujo actual.
- Prototipo.
- Herramientas utilizadas.
- Datos de prueba (sin información sensible).
- Resultado observado.
- Errores y mejoras.
- Posibilidad de adaptar a otros rubros.

## Primera meta
Elegir un problema frecuente, construir una solución pequeña y demostrable, probarla con casos reales controlados y documentar lo aprendido.

## Primer prototipo
[ Abrir prototipo de registro y seguimiento de reparaciones ](prototipo_reparaciones/index.html)

Es una prueba local: guarda los registros en el navegador mediante almacenamiento local. No sincroniza entre dispositivos, no tiene respaldo y no debe utilizarse todavía como sistema productivo. Sirve para validar el flujo y los campos antes de conectar una base de datos o incorporar automatizaciones.

## Arquitectura del asistente

- [Arquitectura propuesta — OTROMUNDO AI](arquitectura_otromundo_ai.md)

## Primera pantalla del compañero

[Probar la primera pantalla de OTROMUNDO AI](prototipo_asistente/index.html)

Maqueta navegable de la experiencia conversacional, con atajos y trabajos ficticios. No está conectada todavía a una IA ni a una base de datos.

## Base de datos Supabase

1. [Esquema SQL inicial](supabase/001_esquema_inicial.sql): tablas, relaciones, índices y políticas RLS. Ejecutar primero en un proyecto Supabase vacío.
2. [Migración 002 — permitir el estado inicial de ingreso](supabase/002_permitir_estado_ingresado.sql): ejecutar después del esquema inicial. Alinea la restricción de estados con el valor `ingresado` que ya usa el formulario del taller.

**Importante:** la migración fue incorporada al repositorio, pero todavía no fue ejecutada ni verificada contra el proyecto Supabase conectado. Probar primero y confirmar el resultado antes de registrar datos reales.

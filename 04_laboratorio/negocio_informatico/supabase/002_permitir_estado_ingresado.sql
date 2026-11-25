-- OTROMUNDO AI — migración 002
-- Corrige la lista de estados permitidos para las reparaciones.
--
-- Motivo verificado en el repositorio:
-- 001_esquema_inicial.sql define DEFAULT 'ingresado' y taller/index.html
-- también inserta estado='ingresado', pero el CHECK original no lo permitía.
-- Aplicar una vez en el SQL Editor de Supabase después de 001.
--
-- No crea datos ni modifica reparaciones existentes; reemplaza únicamente
-- la restricción CHECK de la columna estado.

begin;

alter table public.reparaciones
  drop constraint if exists reparaciones_estado_check;

alter table public.reparaciones
  add constraint reparaciones_estado_check
  check (
    estado in (
      'ingresado',
      'consulta',
      'presupuesto_pendiente',
      'esperando_confirmacion',
      'confirmado',
      'en_proceso',
      'pausado',
      'esperando_repuesto',
      'prueba_final',
      'listo',
      'cliente_notificado',
      'entregado',
      'no_realizado',
      'cancelado'
    )
  );

commit;

-- Verificación opcional: debe aparecer 'ingresado' en la definición.
select
  conname,
  pg_get_constraintdef(oid) as definicion
from pg_constraint
where conrelid = 'public.reparaciones'::regclass
  and conname = 'reparaciones_estado_check';

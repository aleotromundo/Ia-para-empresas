-- OTROMUNDO AI — esquema inicial para Supabase
-- Ejecutar en el SQL Editor de un proyecto NUEVO.
-- Modelo inicial de un solo taller/propietario. No contiene credenciales ni datos reales.
-- Todas las tablas tienen RLS y quedan aisladas por auth.uid().

create extension if not exists pgcrypto;

create or replace function public.actualizar_fecha_modificacion()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create table if not exists public.clientes (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  nombre text not null,
  telefono text,
  whatsapp text,
  email text,
  notas text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.equipos (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  cliente_id uuid references public.clientes(id) on delete set null,
  tipo text not null default 'otro',
  marca text,
  modelo text,
  numero_serie text,
  descripcion text,
  estado_fisico text,
  accesorios text,
  ubicacion text,
  es_donante boolean not null default false,
  notas text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.reparaciones (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  cliente_id uuid references public.clientes(id) on delete set null,
  equipo_id uuid references public.equipos(id) on delete set null,
  codigo text,
  falla_reportada text,
  diagnostico text,
  trabajo_realizado text,
  estado text not null default 'ingresado'
    check (estado in ('consulta','presupuesto_pendiente','esperando_confirmacion','confirmado','en_proceso','pausado','esperando_repuesto','prueba_final','listo','cliente_notificado','entregado','no_realizado','cancelado')),
  prioridad text not null default 'normal'
    check (prioridad in ('baja','normal','alta','urgente')),
  fecha_ingreso timestamptz not null default now(),
  fecha_prometida timestamptz,
  fecha_listo timestamptz,
  fecha_notificacion timestamptz,
  fecha_entrega timestamptz,
  proximo_paso text,
  ubicacion_fisica text,
  autorizacion_cliente text,
  notas text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.notas_reparacion (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  reparacion_id uuid not null references public.reparaciones(id) on delete cascade,
  contenido text not null,
  tipo text not null default 'nota'
    check (tipo in ('nota','diagnostico','pausa','avance','comunicacion','recordatorio')),
  created_at timestamptz not null default now()
);

create table if not exists public.presupuestos (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  reparacion_id uuid references public.reparaciones(id) on delete set null,
  estado text not null default 'borrador'
    check (estado in ('borrador','enviado','aceptado','rechazado','vencido')),
  moneda text not null default 'UYU',
  mano_obra numeric(12,2) not null default 0 check (mano_obra >= 0),
  otros_costos numeric(12,2) not null default 0 check (otros_costos >= 0),
  total numeric(12,2) not null default 0 check (total >= 0),
  validez_hasta date,
  observaciones text,
  fecha_envio timestamptz,
  fecha_respuesta timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.items_presupuesto (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  presupuesto_id uuid not null references public.presupuestos(id) on delete cascade,
  descripcion text not null,
  cantidad numeric(12,2) not null default 1 check (cantidad > 0),
  precio_unitario numeric(12,2) not null default 0 check (precio_unitario >= 0),
  created_at timestamptz not null default now()
);

create table if not exists public.repuestos (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  nombre text not null,
  categoria text,
  marca text,
  modelo text,
  estado text not null default 'usado'
    check (estado in ('nuevo','usado','para_revisar','donante','defectuoso')),
  origen text not null default 'stock_propio'
    check (origen in ('stock_propio','equipo_donante','cliente','compra')),
  cantidad numeric(12,2) not null default 1 check (cantidad >= 0),
  costo_unitario numeric(12,2) check (costo_unitario is null or costo_unitario >= 0),
  ubicacion text,
  equipo_donante_id uuid references public.equipos(id) on delete set null,
  notas text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.repuestos_reparacion (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  reparacion_id uuid not null references public.reparaciones(id) on delete cascade,
  repuesto_id uuid references public.repuestos(id) on delete set null,
  descripcion text not null,
  cantidad numeric(12,2) not null default 1 check (cantidad > 0),
  costo_unitario numeric(12,2) check (costo_unitario is null or costo_unitario >= 0),
  origen text not null default 'stock_propio'
    check (origen in ('stock_propio','equipo_donante','cliente','compra')),
  created_at timestamptz not null default now()
);

create table if not exists public.movimientos_stock (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  repuesto_id uuid not null references public.repuestos(id) on delete cascade,
  tipo text not null check (tipo in ('ingreso','egreso','ajuste','reserva')),
  cantidad numeric(12,2) not null check (cantidad > 0),
  motivo text,
  reparacion_id uuid references public.reparaciones(id) on delete set null,
  created_at timestamptz not null default now()
);

create table if not exists public.movimientos_economicos (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  reparacion_id uuid references public.reparaciones(id) on delete set null,
  tipo text not null check (tipo in ('ingreso','egreso')),
  concepto text not null,
  importe numeric(12,2) not null check (importe >= 0),
  moneda text not null default 'UYU',
  medio_pago text,
  es_intercambio boolean not null default false,
  fecha timestamptz not null default now(),
  notas text,
  created_at timestamptz not null default now()
);

create table if not exists public.recordatorios (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  reparacion_id uuid references public.reparaciones(id) on delete cascade,
  titulo text not null,
  detalle text,
  fecha_hora timestamptz,
  estado text not null default 'pendiente'
    check (estado in ('pendiente','hecho','descartado')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Índices para búsquedas habituales.
create index if not exists idx_clientes_owner_nombre on public.clientes(owner_id, nombre);
create index if not exists idx_equipos_owner_cliente on public.equipos(owner_id, cliente_id);
create index if not exists idx_reparaciones_owner_estado on public.reparaciones(owner_id, estado);
create index if not exists idx_reparaciones_owner_fecha on public.reparaciones(owner_id, fecha_ingreso desc);
create index if not exists idx_notas_reparacion_id on public.notas_reparacion(reparacion_id, created_at desc);
create index if not exists idx_presupuestos_reparacion on public.presupuestos(reparacion_id);
create index if not exists idx_repuestos_owner_nombre on public.repuestos(owner_id, nombre);
create index if not exists idx_movimientos_stock_repuesto on public.movimientos_stock(repuesto_id, created_at desc);
create index if not exists idx_movimientos_economicos_owner_fecha on public.movimientos_economicos(owner_id, fecha desc);
create index if not exists idx_recordatorios_owner_fecha on public.recordatorios(owner_id, fecha_hora)
  where estado = 'pendiente';

-- Actualización automática de updated_at.
do $$
declare tabla text;
begin
  foreach tabla in array array['clientes','equipos','reparaciones','presupuestos','repuestos','recordatorios']
  loop
    execute format('drop trigger if exists trg_%I_updated_at on public.%I', tabla, tabla);
    execute format('create trigger trg_%I_updated_at before update on public.%I for each row execute function public.actualizar_fecha_modificacion()', tabla, tabla);
  end loop;
end $$;

-- Seguridad: cada usuario autenticado solo ve y modifica sus propios registros.
do $$
declare tabla text;
begin
  foreach tabla in array array[
    'clientes','equipos','reparaciones','notas_reparacion','presupuestos',
    'items_presupuesto','repuestos','repuestos_reparacion','movimientos_stock',
    'movimientos_economicos','recordatorios'
  ]
  loop
    execute format('alter table public.%I enable row level security', tabla);
    execute format('drop policy if exists "Aislamiento por propietario" on public.%I', tabla);
    execute format(
      'create policy "Aislamiento por propietario" on public.%I for all to authenticated using (owner_id = auth.uid()) with check (owner_id = auth.uid())',
      tabla
    );
  end loop;
end $$;

-- IMPORTANTE:
-- 1) No se almacenan contraseñas, PIN ni credenciales de equipos de clientes.
-- 2) Las claves secretas nunca deben ir en el frontend.
-- 3) Este es un esquema inicial: probarlo en un proyecto vacío antes de usar datos reales.
-- 4) Las relaciones y escrituras desde el backend deben validar también la propiedad
--    del registro relacionado; RLS por fila no sustituye esa validación de negocio.

const crypto = require('node:crypto');

const json = (res, status, body) => {
  res.status(status).setHeader('Content-Type', 'application/json; charset=utf-8');
  res.setHeader('Cache-Control', 'no-store');
  return res.end(JSON.stringify(body));
};

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') {
    res.setHeader('Allow', 'POST');
    return json(res, 405, { error: 'Método no permitido' });
  }

  const authorization = req.headers.authorization || '';
  const accessToken = authorization.startsWith('Bearer ')
    ? authorization.slice('Bearer '.length).trim()
    : '';
  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseAnonKey = process.env.SUPABASE_ANON_KEY;
  const openaiKey = process.env.OPENAI_API_KEY;

  if (!accessToken) return json(res, 401, { error: 'Sesión requerida' });
  if (!supabaseUrl || !supabaseAnonKey || !openaiKey) {
    console.error('Faltan OPENAI_API_KEY, SUPABASE_URL o SUPABASE_ANON_KEY');
    return json(res, 500, { error: 'El motor realtime no está configurado en el servidor' });
  }

  try {
    const userResponse = await fetch(`${supabaseUrl.replace(/\/$/, '')}/auth/v1/user`, {
      headers: {
        apikey: supabaseAnonKey,
        Authorization: `Bearer ${accessToken}`,
      },
    });
    if (!userResponse.ok) return json(res, 401, { error: 'Sesión de Supabase inválida o vencida' });
    const user = await userResponse.json();
    const safetyIdentifier = crypto.createHash('sha256').update(String(user.id)).digest('hex');

    const realtimeResponse = await fetch('https://api.openai.com/v1/realtime/client_secrets', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${openaiKey}`,
        'Content-Type': 'application/json',
        'OpenAI-Safety-Identifier': safetyIdentifier,
      },
      body: JSON.stringify({
        session: {
          type: 'realtime',
          model: 'gpt-realtime-2.1',
          instructions: 'Sos Compañero, el asistente de confianza de un taller informático. Hablá en español rioplatense, con calidez y precisión. Sé breve en voz, hacé una pregunta por vez y nunca inventes datos del taller. Antes de guardar, modificar o borrar información pedí confirmación explícita. Si no tenés conexión con una herramienta o dato real, decilo claramente.',
          audio: {
            input: {
              transcription: {
                model: 'gpt-live-transcribe',
                language: 'es',
                prompt: 'Taller informático, reparaciones, clientes, equipos, repuestos, diagnósticos y presupuestos.',
              },
              turn_detection: {
                type: 'semantic_vad',
                eagerness: 'auto',
                create_response: true,
                interrupt_response: true,
              },
            },
            output: {
              voice: 'marin',
              speed: 1,
            },
          },
        },
      }),
    });

    const data = await realtimeResponse.json();
    return json(res, realtimeResponse.status, realtimeResponse.ok ? data : { error: data.error?.message || 'No se pudo crear la sesión realtime' });
  } catch (error) {
    console.error('Realtime token error:', error);
    return json(res, 500, { error: 'No se pudo iniciar el motor de voz realtime' });
  }
};

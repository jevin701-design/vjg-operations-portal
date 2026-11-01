export default async (req) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), { status: 405 });
  }

  try {
    const body = await req.json();
    const { code, code_verifier, redirect_uri } = body;

    if (!code || !code_verifier) {
      return new Response(JSON.stringify({ error: 'Missing code or code_verifier' }), { status: 400 });
    }

    const tokenBody = new URLSearchParams({
      grant_type: 'authorization_code',
      client_id: 'ifc_u3T5ked03Tovv6YxIQihXr9czDu42LSV',
      code,
      redirect_uri: redirect_uri || 'https://vistajet-group.netlify.app/',
      code_verifier
    });

    const res = await fetch('https://api.infiniteflight.com/auth/v2/connect/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: tokenBody
    });

    const data = await res.json();
    return new Response(JSON.stringify(data), {
      status: res.status,
      headers: { 'Content-Type': 'application/json' }
    });
  } catch (e) {
    return new Response(JSON.stringify({ error: e.message }), { status: 500 });
  }
};

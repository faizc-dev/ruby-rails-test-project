export default async function request(method: string, path: string, params?: any) {
    // Remove last segment (e.g., '/something') from the path
    const cleanedPath = path.replace(/\/[^/]+$/, '')

    const url = new URL(`http://localhost:3000${cleanedPath}`)

    if (method === 'get' && params) {
      Object.entries(params).forEach(([key, value]) =>
        url.searchParams.append(key, String(value))
      )
    }

    const res = await fetch(url.toString(), {
      method: method.toUpperCase(),
      headers: {
        'Content-Type': 'application/json',
      },
      body: method !== 'get' ? JSON.stringify(params) : undefined,
    })

    if (!res.ok) throw new Error(`HTTP ${res.status}`)

    return await res.json()
  }

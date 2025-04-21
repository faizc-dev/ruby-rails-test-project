import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src') // Add the alias to resolve `@` to the `src` directory
    }
  },
  
  server: {
    port: 8080, // 👈 change the port here
  },
})

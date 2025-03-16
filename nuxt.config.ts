// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: [
    '@pinia/nuxt',
    '@vueuse/nuxt',
    '@nuxtjs/tailwindcss'
  ],

  devServer: {
    host: '0.0.0.0',
    port: 3000
  },

  app: {
    head: {
      title: 'Cilari Compliance Training Portal',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'description', content: 'Cilari Compliance Training Portal' }
      ]
    }
  },

  compatibilityDate: '2025-03-16'
})
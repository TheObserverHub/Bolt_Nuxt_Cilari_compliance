export default defineNuxtPlugin(async () => {
  const { checkAuth } = useAuth()
  
  // Check authentication status on app load
  await checkAuth()
})
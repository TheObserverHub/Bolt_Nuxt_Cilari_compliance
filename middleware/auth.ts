export default defineNuxtRouteMiddleware((to) => {
  const { checkAuth } = useAuth()
  const token = useCookie('auth_token')
  
  // If user is not logged in and trying to access protected route
  if (!token.value && to.path !== '/auth/login' && to.path !== '/auth/register' && to.path !== '/') {
    return navigateTo('/auth/login')
  }

  // If user is logged in and trying to access auth pages
  if (token.value && (to.path === '/auth/login' || to.path === '/auth/register')) {
    return navigateTo('/dashboard')
  }
})
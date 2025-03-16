<template>
  <div class="max-w-7xl mx-auto py-8 px-4">
    <div class="mb-8">
      <h1 class="text-3xl font-bold text-cilari-800 mb-4">Admin Dashboard</h1>
      <p class="text-gray-600">Manage users and track their training progress.</p>
    </div>

    <!-- Create User Form -->
    <div class="bg-white rounded-lg shadow-md p-6 mb-8">
      <h2 class="text-xl font-semibold text-cilari-800 mb-4">Create New User</h2>
      <form @submit.prevent="handleCreateUser" class="space-y-4">
        <div>
          <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
          <input
            id="email"
            type="email"
            v-model="newUser.email"
            required
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-cilari-500 focus:ring-cilari-500"
          />
        </div>

        <div>
          <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
          <input
            id="password"
            type="password"
            v-model="newUser.password"
            required
            minlength="8"
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-cilari-500 focus:ring-cilari-500"
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700">User Role</label>
          <div class="mt-1">
            <label class="inline-flex items-center mr-4">
              <input
                type="radio"
                v-model="newUser.role"
                value="user"
                class="form-radio text-cilari-600"
              />
              <span class="ml-2">Regular User</span>
            </label>
            <label class="inline-flex items-center">
              <input
                type="radio"
                v-model="newUser.role"
                value="admin"
                class="form-radio text-cilari-600"
              />
              <span class="ml-2">Admin</span>
            </label>
          </div>
        </div>

        <div v-if="error" class="bg-red-50 border border-red-400 text-red-700 px-4 py-3 rounded">
          {{ error }}
        </div>

        <button
          type="submit"
          :disabled="loading"
          class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-cilari-600 hover:bg-cilari-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cilari-500 disabled:opacity-50"
        >
          {{ loading ? 'Creating...' : 'Create User' }}
        </button>
      </form>
    </div>

    <!-- User List -->
    <div class="bg-white rounded-lg shadow-md p-6">
      <h2 class="text-xl font-semibold text-cilari-800 mb-4">User Progress</h2>
      
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead>
            <tr>
              <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
              <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Role</th>
              <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Modules Completed</th>
              <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Last Activity</th>
              <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr v-for="user in users" :key="user.id">
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ user.email }}</td>
              <td class="px-6 py-4 whitespace-nowrap text-sm">
                <span
                  :class="[
                    'px-2 py-1 rounded-full text-xs font-medium',
                    user.role === 'admin' ? 'bg-purple-100 text-purple-800' : 'bg-gray-100 text-gray-800'
                  ]"
                >
                  {{ user.role === 'admin' ? 'Admin' : 'User' }}
                </span>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ user.completed_modules }}/{{ totalModules }}
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ user.last_activity ? formatDate(user.last_activity) : 'No activity' }}
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm">
                <button
                  @click="viewUserProgress(user.id)"
                  class="text-cilari-600 hover:text-cilari-900"
                >
                  View Progress
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const client = useSupabaseClient();
const router = useRouter();

const loading = ref(false);
const error = ref<string | null>(null);
const users = ref<any[]>([]);
const totalModules = ref(0);

const newUser = ref({
  email: '',
  password: '',
  role: 'user' as 'user' | 'admin'
});

// Format date helper
const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString();
};

// Create new user
const handleCreateUser = async () => {
  try {
    loading.value = true;
    error.value = null;

    // Create user in auth
    const { data: userData, error: signUpError } = await client.auth.admin.createUser({
      email: newUser.value.email,
      password: newUser.value.password,
      email_confirm: true
    });

    if (signUpError) throw signUpError;

    // Add user role
    const { error: roleError } = await client
      .from('user_roles')
      .insert({
        user_id: userData.user.id,
        role: newUser.value.role
      });

    if (roleError) throw roleError;

    // Reset form
    newUser.value = {
      email: '',
      password: '',
      role: 'user'
    };

    // Refresh user list
    await fetchUsers();
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'An error occurred while creating user';
  } finally {
    loading.value = false;
  }
};

// Fetch users and their progress
const fetchUsers = async () => {
  try {
    loading.value = true;

    // Get total number of modules
    const { count } = await client
      .from('modules')
      .select('*', { count: 'exact' });
    
    totalModules.value = count || 0;

    // Get users with their progress and roles
    const { data, error: fetchError } = await client
      .from('users')
      .select(`
        id,
        email,
        user_roles (role),
        user_progress (
          completed,
          updated_at
        )
      `);

    if (fetchError) throw fetchError;

    users.value = data?.map(user => ({
      id: user.id,
      email: user.email,
      role: user.user_roles?.[0]?.role || 'user',
      completed_modules: user.user_progress?.filter((p: any) => p.completed).length || 0,
      last_activity: user.user_progress?.length 
        ? Math.max(...user.user_progress.map((p: any) => new Date(p.updated_at).getTime()))
        : null
    })) || [];
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'An error occurred while fetching users';
  } finally {
    loading.value = false;
  }
};

// View user progress
const viewUserProgress = (userId: string) => {
  router.push(`/admin/users/${userId}`);
};

// Initial fetch
onMounted(fetchUsers);
</script>
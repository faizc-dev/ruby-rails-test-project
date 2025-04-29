<template>
  <div class="container">
    <h1 class="title">Fullstack Assessment - Vue + Rails</h1>

    <!-- Refresh Button -->
    <div class="refresh-button-container">
      <button class="refresh-button" @click="refreshPage">Refresh</button>
    </div>

    <!-- Message after user creation -->
    <div v-if="createdMessage" class="success-message">
      New user creates on every refresh
    </div>

    <!-- Loading state -->
    <div v-if="loading" class="loading">Loading user...</div>

    <!-- User details -->
    <div v-else class="user-details">
      <div class="user-header">User Information</div>
      <div class="user-info">
        <div><strong>UUID:</strong> {{ uuid }}</div>
        <div><strong>Name:</strong> {{ user?.name + ' ' + user?.id }}</div>
        <div><strong>Biography:</strong> {{ user?.biography }}</div>
        <div><strong>ID:</strong> {{ user?.id }}</div>
        <div><strong>Tone:</strong> {{ tone || 'Detecting...' }}</div>
      </div>
    </div>

    <!-- Error state -->
    <div v-if="error" class="error">{{ error }}</div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import api from '@/api/endpoints'

const uuid = ref('')
const user = ref<any>(null)
const tone = ref<string | null>(null)
const loading = ref(true)
const error = ref<string | null>(null)
const createdMessage = ref(false)

// Fetch UUID from /id
const fetchUUID = async () => {
  try {
    const res = await api.id.getId()
    uuid.value = res.id
  } catch {
    error.value = 'Failed to fetch UUID'
  }
}

// Create user with retry
const createUser = async () => {
  let attempt = 0
  const maxAttempts = 3

  while (attempt < maxAttempts) {
    try {
      const res = await api.user.createUser({ name: 'John Doe', biography: 'Auto-created bio' })
      createdMessage.value = true
      return res.user
    } catch {
      attempt++
      if (attempt === maxAttempts) {
        error.value = 'User creation failed after retries'
        return null
      }
    }
  }
}

// Fetch user details
const fetchUser = async () => {
  try {
    const res = await api.user.getUser()
    user.value = res
  } catch {
    error.value = 'Failed to fetch user'
  }
}

// Fetch tone from /tone
const fetchTone = async () => {
  try {
    const res = await api.tone.getTone()
    tone.value = res.tone
  } catch {
    tone.value = 'Unknown'
  }
}

// Refresh the page
const refreshPage = () => {
  window.location.reload()
}

// Initialize on mount
onMounted(async () => {
  await fetchUUID()
  await createUser()
  await fetchUser()
  await fetchTone()
  loading.value = false
})
</script>

<style scoped>
/* Container for the page */
.container {
  width: 80%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f7f7f7;
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Title */
.title {
  text-align: center;
  font-size: 2.5rem;
  color: #4CAF50;
  margin-bottom: 20px;
}

/* Refresh button container */
.refresh-button-container {
  text-align: center;
  margin-bottom: 30px;
}

/* Refresh button */
.refresh-button {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.3s;
}

.refresh-button:hover {
  background-color: #45a049;
}

/* Success message */
.success-message {
  text-align: center;
  color: #0a7ce6;
  font-weight: bold;
  font-size: 1.2rem;
  margin-bottom: 20px;
}

/* User details */
.user-details {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.user-header {
  font-size: 1.75rem;
  color: #007BFF;
  margin-bottom: 20px;
}

.user-info {
  font-size: 1.2rem;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 10px;
}

.user-info strong {
  color: #333;
}

.loading {
  font-size: 1.25rem;
  color: #f39c12;
  text-align: center;
}

.error {
  color: red;
  font-weight: bold;
  text-align: center;
  margin-top: 20px;
}

@media (max-width: 768px) {
  .user-info {
    grid-template-columns: 1fr;
  }
}
</style>

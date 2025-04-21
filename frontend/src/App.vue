<template>
  <div id="app">
    <!-- Navbar or Menu for Navigation -->
    <div class="navbar">
      <router-link to="/" class="nav-link">Home</router-link>
    </div>

    <!-- Main content will be rendered based on the route -->
    <router-view></router-view>
  </div>
</template>

<script setup lang="ts">
</script>

<style scoped>
/* Global styles */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Arial', sans-serif;
  background-color: #f4f7fa;
  color: #333;
}

.navbar {
  background-color: #4CAF50;
  padding: 10px;
  text-align: center;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-size: 1.2rem;
}

.nav-link:hover {
  color: #f4f7fa;
}
</style>

<template>
  <div class="container mx-auto">
    <nav class="flex justify-around py-8 mx-auto bg-white">
      <div>
        <h3 class="text-2xl font-medium text-blue-500">
          <router-link :to="{ name: 'reports' }">Coding Test</router-link>
        </h3>
      </div>
      <div class="space-x-8">
        <router-link :to="{ name: 'reports' }">
          Go to Nessus import tool
        </router-link>
      </div>
    </nav>

    <slot></slot>
  </div>
</template>
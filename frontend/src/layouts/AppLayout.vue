<template>
  <div class="container mx-auto">
    <nav class="flex justify-around py-8 mx-auto bg-white">
      <div>
        <h3 class="text-2xl font-medium text-blue-500">
          <router-link :to="{ name: 'reports' }">Coding Test</router-link>
        </h3>
      </div>
      <div class="space-x-8">
        <router-link :to="{ name: 'reports' }">Reports</router-link>
        <a href="">Plugins</a>
        <a href="">Hosts</a>
      </div>
    </nav>

    <slot></slot>
  </div>
</template>
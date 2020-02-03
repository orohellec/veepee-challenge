<template>
  <div id="maintitle">
    <h1>{{ title }}</h1>
  </div>
</template>

<script>
  export default {
    props: ["title"]
  }
</script>

<style scoped>
  h1 {
    text-align: center
  }
</style>
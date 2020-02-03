<template>
  <div id="app" data-behavior="vue">
    <button v-on:click="counter += 1">Add 1</button>
    <p>Le bouton ci-dessus a été cliqué {{ counter }} fois.</p>
  </div>
</template>

<script>


  export default {
    props: ["message"],
    data: function () {
      return({
        counter: 0
      })
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>

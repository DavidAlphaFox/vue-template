<template>
  <div class="background">
    <router-view></router-view>
  </div>
</template>

<script lang="coffee">
    module.exports =
        data: -> {}
</script>

<style lang="sass">
    .background
        height: 100vh
        width: 100vw
        background-color: red
        background-image: url("img/background.jpg")
        background-size: cover
        background-position: center center
        background-repeat: no-repeat
</style>

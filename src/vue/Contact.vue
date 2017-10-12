<template >
  <h1>
    <router-link to="/" v-text="message"></router-link>
  </h1>
</template>

<script lang="coffee">
    module.exports =
        data: ->
            message: "This is the Contact page"
</script>

<style lang="sass" scoped>
    h1
        font-family: "Arial", sans-serif
        text-align: center
        line-height: 100vh
        color: #FFF
        text-shadow: 1px 1px 10px #000
        margin: 0
        padding: 0

    a
        text-decoration: none
        color: inherit
</style>

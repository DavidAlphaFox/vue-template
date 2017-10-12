Vue         = require "./router.coffee"
App         = require "../vue/App.vue"



window.addEventListener "load", ->
    document.body.style.margin = 0

    new Vue.vue
        el: "#app"
        components:
            App: App
        router: Vue.router
        render: (h) -> h(App)

Vue         = require "vue"
VueRouter   = require "vue-router"

Home        = require "../vue/Home.vue"
Contact     = require "../vue/Contact.vue"
NotFound    = require "../vue/404.vue"

Vue.use VueRouter

HomeRoute =
    path: "/"
    component: Home

ContactRoute =
    path: "/contact"
    component: Contact

DefaultRoute =
    path: "*"
    component: NotFound

mode = "history"

routes = [ HomeRoute, ContactRoute, DefaultRoute ]

module.exports =
    router: new VueRouter
        mode: mode
        routes: routes
    vue: Vue

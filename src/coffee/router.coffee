Vue         = require "vue"
VueRouter   = require "vue-router"
Vuex        = require "vuex"

Home        = require "../vue/Home.vue"
Contact     = require "../vue/Contact.vue"
NotFound    = require "../vue/404.vue"

Vue.use VueRouter
Vue.use Vuex

store = new Vuex.Store()

store.registerModule 'vuex',
  state: {}
  mutations: {}
  actions: {}


HomeRoute =
    path: "/"
    component: Home

ContactRoute =
    path: "/contact"
    component: Contact

DefaultRoute =
    path: "*"
    component: NotFound

#mode = "history"
mode = "hash"

routes = [ HomeRoute, ContactRoute, DefaultRoute ]

module.exports =
    router: new VueRouter
        mode: mode
        routes: routes
    vue: Vue

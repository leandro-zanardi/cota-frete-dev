import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import { auth } from '../firebase'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('../views/About.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/fornecedores',
    name: 'Fornecedores',
    component: () => import('../views/Fornecedores.vue'),
    meta: {
      requiresAdmin: true
    }
  },
  {
    path: '/cadastro-fornecedores',
    name: 'Cadastro Fornecedores',
    component: () => import('../views/Cadastro-Fornecedores.vue'),
    meta: {
      requiresAdmin: false
    }
  },
  {
    path: '/configuracoes-fornecedor',
    name: 'Configurações Fornecedor',
    component: () => import('../views/Configuracao-Fornecedor.vue'),
    meta: {
      requiresAdmin: true
    }
  },
  {
    path: '/configuracoes-usuario',
    name: 'Configurações Usuário',
    component: () => import('../views/Configuracao-Usuario.vue'),
    meta: {
      requiresAdmin: false
    }
  },
  {
    path: '/historico',
    name: 'Histórico de Fretes',
    component: () => import('../views/Historico.vue'),
    meta: {
      requiresAdmin: false
    }
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach(async (to, from, next) => {
  try {
    let idTokenResult = null;
    console.log("current user");
    console.log(auth.currentUser);
    if (auth.currentUser) {
      idTokenResult = await auth.currentUser.getIdTokenResult();
      console.log("idToken");
      console.log(idTokenResult);
    }


    if (to.path === '/login' && auth.currentUser) {
      next('/')
      return;
    }

    if (to.matched.some(record => record.meta.requiresAuth) && !auth.currentUser) {
      next('/login')
      return;
    }

    if (to.matched.some(record => record.meta.requiresAdmin) && idTokenResult && !idTokenResult.claims.admin) {

      
      console.log(idTokenResult.claims.admin);

      console.log('Nao eh admin')
      next('/login')
      // TODO pagina de permissao negada
      return;
    }

    next();

  } catch(e) {
    console.log(e);
    next('/')
    return;
  }

  
})

export default router
import router from '../router'
import { auth } from '../firebase'
import {
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
  signOut
} from 'firebase/auth'

const userStore = {

  namespaced: true,

  state: {
    user: null,
    isAdmin: false
  },
  mutations: {

    SET_USER(state, user) {
      state.user = user
    },

    CLEAR_USER(state) {
      state.user = null
    },

    SET_ADMIN(state, admin) {
      console.log('commit admin', admin)
      state.isAdmin = admin
    }

  },
  actions: {
    async login({ commit, dispatch }, details) {
      const { email, password } = details

      try {
        await signInWithEmailAndPassword(auth, email, password)
      } catch (error) {
        switch (error.code) {
          case 'auth/user-not-found':
            alert("User not found")
            break
          case 'auth/wrong-password':
            alert("Wrong password")
            break
          default:
            alert("Something went wrong")
        }

        return
      }

      commit('SET_USER', auth.currentUser)
      
      dispatch('isAdmin');

      router.push('/')
    },

    async register({ commit, dispatch }, details) {
      const { email, password } = details

      try {
        await createUserWithEmailAndPassword(auth, email, password)
      } catch (error) {
        switch (error.code) {
          case 'auth/email-already-in-use':
            alert("Email already in use")
            break
          case 'auth/invalid-email':
            alert("Invalid email")
            break
          case 'auth/operation-not-allowed':
            alert("Operation not allowed")
            break
          case 'auth/weak-password':
            alert("Weak password")
            break
          default:
            alert("Something went wrong")
        }

        return
      }

      commit('SET_USER', auth.currentUser)

      dispatch('isAdmin');

      router.push('/')
    },

    async logout({ commit }) {
      await signOut(auth)

      commit('CLEAR_USER')

      router.push('/login')
    },

    async isAdmin({commit}) {

      console.log("IS ADMIN")

      try {
        let idTokenResult = await auth.currentUser.getIdTokenResult();
        console.log(idTokenResult);
        if (idTokenResult.claims.admin) {
          commit('SET_ADMIN', true);
        } else {
          commit('SET_ADMIN', false);
        }
      } catch(e) {
        console.log(e);
        commit('SET_ADMIN', false);
      }
    },

    fetchUser({ commit, dispatch }) {
      auth.onAuthStateChanged(async user => {
        if (user === null) {
          commit('CLEAR_USER')
        } else {
          commit('SET_USER', user)

          dispatch('isAdmin');
          

          if (router.isReady() && router.currentRoute.value.path === '/login') {
            router.push('/')
          }
        }
      })
    }

  }
};

export default userStore;
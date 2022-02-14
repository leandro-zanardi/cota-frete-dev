<template>
	<main class="login">
		<section class="forms">

			<form class="register" @submit.prevent="register">
				<h2>Crie sua conta aqui</h2>
				<input 
					type="email" 
					placeholder="Crie seu Email"
					v-model="register_form.email" />
				<input 
					type="password" 
					placeholder="Crie sua senha" 
					v-model="register_form.password" />
				<input 
					type="submit" 
					value="Cadastrar" />
			</form>

			<form class="login" @submit.prevent="login">
				<h2>Acesse sua conta</h2>
				<input 
					type="email" 
					placeholder="Digite seu email"
					v-model="login_form.email" />
				<input 
					type="password" 
					placeholder="Digite sua senha" 
					v-model="login_form.password" />
				<input 
					type="submit" 
					value="Login" />

				<img src="../assets/login.png" alt="mapa login">
			</form>

		</section>
	</main>
</template>

<script>
import { ref } from 'vue'
import { useStore } from 'vuex'
export default {
	setup () {
		const login_form = ref({});
		const register_form = ref({});
		const store = useStore();
		const login = () => {
			store.dispatch('login', login_form.value);
		}
		const register = () => {
			store.dispatch('register', register_form.value);
		}
		return {
			login_form,
			register_form,
			login,
			register
		}
	}
}
</script>

<style>

.forms {
	display: flex;
	min-height: 100vh;
}
form {
	flex: 1 1 0%;
	padding: 8rem 1rem 1rem;
}
form.register {
	color: #FFF;
	background-color: rgb(167, 50, 202);
	background-image: linear-gradient(135deg, #6b6b6b 0%, #a0b5b4 100%);

}
h2 {
	font-size: 2rem;
	text-transform: initial;
	margin-bottom: 2rem;
}
input {
	appearance: none;
	border: none;
	outline: none;
	background: none;
	display: block;
	width: 100%;
	max-width: 400px;
	margin: 0 auto;
	font-size: 1.5rem;
	margin-bottom: 2rem;
	padding: 0.5rem 0rem;
}
input:not([type="submit"]) {
	opacity: 0.8;
	transition: 0.4s;
}
input:focus:not([type="submit"]) {
	opacity: 1;
}
input::placeholder {
	color: inherit;
}
form.register input:not([type="submit"]) {
	color: #FFF;
	border-bottom: 2px solid #FFF;
}
form.login input:not([type="submit"]) {
	color: #2c3e50;
	border-bottom: 2px solid #2c3e50;
}
form.login input[type="submit"] {
	background-color: rgb(93, 66, 245);
	color: #FFF;
	font-weight: 700;
	padding: 1rem 2rem;
	border-radius: 0.5rem;
	cursor: pointer;
	text-transform: uppercase;
}

form.register input[type="submit"] {
	background-color: #FFF;
	color: rgb(100, 66, 101);
	font-weight: 700;
	padding: 1rem 2rem;
	border-radius: 0.5rem;
	cursor: pointer;
	text-transform: uppercase;
}

form.register input[type="submit"]:hover {
	transition: .6s ease;
	color: white;
	background-color:  rgb(6, 0, 43);
}

img {
	height: 350px;
	/* margin-top: -80px; */
}
         
</style>
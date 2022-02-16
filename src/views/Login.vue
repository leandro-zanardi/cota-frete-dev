<template>
	<MDBRow>
		<MDBCol sm="12" lg="6">
			<form @submit.prevent="register">
				<h2>Crie sua conta</h2>
				<MDBInput
					size="lg"
					type="email" 
					label="Insira seu email" 
					v-model="register_form.email" 
				/>
				
				<MDBInput
					size="lg"
					type="password" 
					label="Crie uma senha" 
					v-model="register_form.password" />
				<MDBBtn
					color="primary"
					type="submit"
					size="lg"
				>
					Cadastrar
				</MDBBtn>
			</form>
		</MDBCol>
		<MDBCol sm="12" lg="6">
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
				<MDBBtn color="primary" type="submit">
					Entrar
				</MDBBtn>
			</form>
		</MDBCol>
	</MDBRow>

</template>


<script setup>
	import { ref } from 'vue'
	import { useStore } from 'vuex'
	import { MDBRow } from "mdb-vue-ui-kit";
	import { MDBCol } from "mdb-vue-ui-kit";
	import { MDBBtn } from "mdb-vue-ui-kit";
	import { MDBInput } from "mdb-vue-ui-kit";

	const login_form = ref({});
	const register_form = ref({});
	const store = useStore();

	function login () {
		store.dispatch('login', login_form.value);
	}

	function register () {
		store.dispatch('register', register_form.value);
	}

</script>

<style>

form.login {
	background: url('../assets/login.png') no-repeat;
	background-position: bottom;
	background-clip: content-box;
	background-size: 25rem;
}
         
</style>
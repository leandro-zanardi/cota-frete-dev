<template>
	<div class="h-100 d-flex justify-content-around align-items-center">
			<form @submit.prevent="register" class="register flex-fill p-3">
				<h2>Crie sua conta</h2>
				<MDBInput
					size="lg"
					type="email" 
					label="Insira seu email" 
					v-model="register_form.email"
					wrapperClass="mb-3"
				/>
				
				<MDBInput
					size="lg"
					type="password" 
					label="Crie uma senha" 
					v-model="register_form.password"
					wrapperClass="mb-3"
					/>
				<MDBBtn
					color="primary"
					type="submit"
					size="lg"
				>
					Cadastrar
				</MDBBtn>
			</form>
	
			<form class="login flex-fill  p-3" @submit.prevent="login">
				<h2>Acesse sua conta</h2>
				<MDBInput
					size="lg"
					wrapperClass="mb-3"
					type="email" 
					placeholder="Digite seu email"
					v-model="login_form.email" />
				<MDBInput
					size="lg"
					wrapperClass="mb-3"
					type="password" 
					placeholder="Digite sua senha" 
					v-model="login_form.password" />
				<MDBBtn color="primary" type="submit" size="lg">
					Entrar
				</MDBBtn>
			</form>
	</div>
</template>


<script setup>
	import { ref } from 'vue'
	import { useStore } from 'vuex'
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
	max-height:450px;
	min-height: 400px;
}

form.register {
	max-height:450px;
	min-height: 400px;
}
         
</style>
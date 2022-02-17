<template>
	<div class="login-container h-100 p-2 d-flex justify-content-sm-around align-items-sm-center">
			<form @submit.prevent="register" class="register form-outline form-white flex-fill p-3">
				<h2 class="mt-2 mb-3">Crie sua conta</h2>
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
				<h2  class="mt-2 mb-3">Acesse sua conta</h2>
				<MDBInput
					size="lg"
					wrapperClass="mb-3"
					type="email" 
					label="Insira seu email" 
					v-model="login_form.email" />
				<MDBInput
					size="lg"
					wrapperClass="mb-3"
					type="password" 
					label="Digite sua senha" 
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
	border-radius: 8px;
	background: url('../assets/login.png') no-repeat;
	background-position: bottom;
	background-clip: content-box;
	background-size: 25rem;
	max-height:450px;
	min-height: 400px;
}

form.register {
	border-radius: 8px;
	color: #ffffff;
	max-height:450px;
	min-height: 400px;
	background-image: linear-gradient(135deg, #6b6b6b 0%, #a0b5b4 100%);
}

@media (max-width: 575px) {
	.login-container {
		flex-direction: column !important;
	}
	form.register {
		max-height:350px;
		min-height: 250px;
	}
}
         
</style>
<template>
	<div class="h-100 background">
		<figure class="logo">
			<img src="../assets/bg.png"
				style="object-fit:cover;
					width:150px;
					height:150px;"/>
		</figure>
		<div class="login-container d-flex justify-content-end align-items-end h-center w-100">
			<form v-if="showRegister" class="register form-outline form-white p-3 col-sm-12 col-md-4" @submit.prevent="register">
				<h2 class="mt-2 mb-3">Crie sua conta</h2>
				<h6>Crie sua conta com:</h6>
				<a class="m-1" href="#!" role="button" style="color: rgb(59, 89, 152);">
					<MDBIcon iconStyle="fab" icon="facebook-f" size="lg"></MDBIcon>
				</a>
				<a class="m-1" href="#!" role="button" style="color: rgb(172, 43, 172);">
					<MDBIcon iconStyle="fab" icon="instagram" size="lg"></MDBIcon>
				</a>
				<a class="m-1" href="#!" role="button" style="color: rgb(221, 75, 57);">
					<MDBIcon iconStyle="fab" icon="google" size="lg"></MDBIcon>
				</a>
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
				<h6>
					Já é um usuário? 
					<a @click="setRegister" href="#" class="stretched-link" style="position: relative">Entre!</a>
				</h6>
			</form>
			
			<form v-else class="login form-outline form-white p-3 col-sm-12 col-md-4" @submit.prevent="login">
				<h2 class="mt-2 mb-3">Acesse sua conta</h2>
				<h6>Acesse sua conta com:</h6>
				<a class="m-1" href="#!" role="button" style="color: rgb(59, 89, 152);">
					<MDBIcon iconStyle="fab" icon="facebook-f" size="lg"></MDBIcon>
				</a>
				<a class="m-1" href="#!" role="button" style="color: rgb(172, 43, 172);">
					<MDBIcon iconStyle="fab" icon="instagram" size="lg"></MDBIcon>
				</a>
				<a class="m-1" href="#!" role="button" style="color: rgb(221, 75, 57);">
					<MDBIcon iconStyle="fab" icon="google" size="lg"></MDBIcon>
				</a>
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
				<MDBCheckbox label="Lembre de mim" v-model="checkbox1" />
				<h6>
					<a @click="esqueceuSenha" href="#" class="stretched-link" style="position: relative">Esqueceu sua senha?</a>
				</h6>
				<MDBBtn color="primary" type="submit" size="lg">
					Entrar
				</MDBBtn>
				<h6>
					Ainda não é um usuário? 
					<a @click="setRegister" href="#" class="stretched-link" style="position: relative">Registre-se!</a>
				</h6>
				<h6>
					É fornecedor? 
					<router-link class="p-2" to ="/cadastro-fornecedores">Trabalhe conosco!</router-link>
				</h6>
			</form>
		</div>
	</div>
</template>


<script setup>
	import { ref } from 'vue'
	import { useStore } from 'vuex'
	import { MDBBtn, MDBIcon } from "mdb-vue-ui-kit";
	import { MDBInput } from "mdb-vue-ui-kit";
	import { MDBCheckbox } from "mdb-vue-ui-kit";

	const login_form = ref({});
	const register_form = ref({});
	const store = useStore();
	let showRegister = ref(false);
	// const toggleBtn2 = ref(true);

	function login () {
		store.dispatch('userStore/login', login_form.value);
	}

	function register () {
		store.dispatch('userStore/register', register_form.value);
	}

    function setRegister () {
		if (showRegister.value === false){
			showRegister.value = true;
			console.log(showRegister);
		} else {
			showRegister.value = false;			
			console.log(showRegister);
		}
		return {
		showRegister
		};
	}

	function esqueceuSenha() {
		
	}
  
</script>

<style>


form.login {
	border-radius: 8px;
	color: #ffffff;
	max-height:450px;
	min-height: 400px;
	background-image: linear-gradient(135deg, #00BCD4 0%, #a0dad7 100%);
}

form.register {
	border-radius: 8px;
	color: #ffffff;
	max-height:450px;
	min-height: 400px;
	background-image: linear-gradient(135deg, #00BCD4 0%, #a0dad7 100%);
}

@media (max-width: 575px) {
	.login-container {
		flex-direction: column !important;
		padding-left: 50px;
	}
	form.register {
		max-height:350px;
		min-height: 250px;
		padding-left: 50px;
	}
}

.h-center {
	position: absolute;
	top: 50%;
	transform: translate(0, -50%);
	padding-right: 12.5%;
}

.background{
	background: url('../assets/bg2.png');
	background-repeat: no-repeat;
	background-position: center left 10%;
	background-size: 35%;
}

.logo{
	padding-left: 20px;
}
</style>
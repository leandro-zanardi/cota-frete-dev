<template>
    <div class="h-100 background">
		<figure class="logo">
			<img src="../assets/bg.png"
				style="object-fit:cover;
					width:150px;
					height:150px;"/>
		</figure>
        <div class="login-container d-flex justify-content-end align-items-end h-center w-100">
			<form class="register form-outline form-white p-3 col-sm-12 col-md-4" @submit.prevent="register">
				<h2 class="mt-2 mb-3">Cadastre-se como fornecedor</h2>
				<h6>Cadastre-se como fornecedor:</h6>
				<div class="rede-social">
					<a class="m-1" href="#!" role="button" style="color: rgb(59, 89, 152);">
						<MDBIcon iconStyle="fab" icon="facebook-f" size="lg"></MDBIcon>
					</a>
					<a class="m-1" href="#!" role="button" style="color: rgb(172, 43, 172);">
						<MDBIcon iconStyle="fab" icon="instagram" size="lg"></MDBIcon>
					</a>
					<a class="m-1" href="#!" role="button" style="color: rgb(221, 75, 57);">
						<MDBIcon iconStyle="fab" icon="google" size="lg"></MDBIcon>
					</a>
				</div>
                <MDBInput
					size="lg"
					type="empresa" 
					label="Nome da empresa" 
					v-model="temporario"
					wrapperClass="mb-3"
				/>
                <MDBInput
					size="lg"
					type="cnpj" 
					label="CNPJ" 
					v-model="temporario"
					wrapperClass="mb-3"
				/>
				<MDBInput
					size="lg"
					type="email" 
					label="e-mail" 
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
                <MDBInput
					size="lg"
					type="confirm-password" 
					label="Confirme a senha" 
					v-model="temporario"
					wrapperClass="mb-3"
				/>
				<MDBBtn
					color="primary"
					type="submit"
					size="lg"
				>
					Cadastrar
				</MDBBtn>
				<h6 class= "p-2 pt-3 ps-0">
					Já é um usuário? 
					<router-link class="p-2" to ="/login">Entre!</router-link>
				</h6>
			</form>
        </div>
    </div>
</template>
<script setup>
    import { MDBBtn, MDBIcon } from "mdb-vue-ui-kit";
    import { MDBInput } from "mdb-vue-ui-kit";
	import { ref } from 'vue'
	import { useStore } from 'vuex'

	const store = useStore();
	const register_form = ref({});

    function register () {
		store.dispatch('userStore/register', register_form.value);
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
	max-height:600px;
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

.rede-social{
	padding-bottom: 5px;
}

</style>
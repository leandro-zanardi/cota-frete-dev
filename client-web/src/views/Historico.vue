<template>
  <div class="h-100 background">
    <header>
      <h1 id="title">Histórico de Fretes</h1>
    </header>
    <main class="about">
      <div>
        <h2>Comparador de Logística</h2>
        <p>
          Este aplicativo foi desenvolvido visando ajudar
          as pessoas a escolher a melhor opção logística
          para aquisição de produtos.
        </p>
      </div>
    </main>
  </div>
</template>

<style scoped>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  .about {
    margin: 0 auto;
    width: 80%;
  }

  #title {
    color: black;
    padding: 100px;
    text-align: center;
    margin-bottom: 30px;
  }

  h2 {
    margin-bottom: 20px;
  }

  .background{
	background: url('../assets/bg.png');
	background-repeat: no-repeat;
	background-position: bottom 30px left 10px;
	background-size: 100px;
  }
</style>
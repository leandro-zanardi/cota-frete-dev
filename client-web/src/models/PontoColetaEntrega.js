class PontoColetaEntrega {
    constructor( id, ativaModalEntrega, ehPrimeiroPonto, retornaParaOrigem ) {
      this.id = id;
      this.point = null;
      this.ativaModalEntrega = ativaModalEntrega ?? false;
      this.ehPrimeiroPonto = ehPrimeiroPonto ?? false;
      this.retornaParaOrigem = retornaParaOrigem ?? false;
    }

    setPoint(point) {
        this.point = point;
    }

    setRetornaParaOrigem( retorna ) {
      this.retornaParaOrigem = retorna;
    }
}

export {PontoColetaEntrega};
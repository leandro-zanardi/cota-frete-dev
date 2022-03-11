class PontoColetaEntrega {
    constructor( id ) {
      this.id = id;
      this.point = null;
    }

    setPoint(point) {
        this.point = point;
    }
}

export {PontoColetaEntrega};
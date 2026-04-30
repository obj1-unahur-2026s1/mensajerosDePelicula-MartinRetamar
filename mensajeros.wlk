object paquete {
var estaPago = false 

  method puedeSerEntregado(mensajero, destino) = mensajero.puedeLlevarPaquete(destino) and self.estaPago()
  method estaPago() = estaPago

  method serPagado() {
    estaPago = true
  }
}

//Destinos

object puenteBroklyn {
  method dejaPasarA(mensajero) = mensajero.peso() < 1000
}

object laMatrix {
  method dejaPasarA(mensajero) = mensajero.puedeLlamar()
}

// Mensajeros
object roberto {
  var vehiculo = bicicleta

  method peso() = self.pesoPropio() + vehiculo.peso()
  method puedeLlamar() = true
  method pesoPropio() = 90  
  method puedeLlevarPaquete(destino) = destino.dejaPasarA(self) and paquete.estaPago()

  method cambiaTransporte(transporteNuevo) {
    vehiculo = transporteNuevo
  }
}

object chuck {
  method peso() = 80
  method puedeLlamar() = true
  method puedeLlevarPaquete(destino) = destino.dejaPasarA(self) and paquete.estaPago()
}

object neo {
  var credito = 10

  method peso() = 0
  method puedeLlamar() = 0 < credito 
  method puedeLlevarPaquete(destino) = destino.dejaPasarA(self) and paquete.estaPago()

  method cargarCredito(creditos) {
    credito += creditos
  }
}

// Vehiculos

object bicicleta {
  method peso() = 5 
}

object camion {
  var cantidadDeAcoplados = 1

  method peso() = 500 * cantidadDeAcoplados 
  method cambiarAcoplados(cantidad) {
    cantidadDeAcoplados = cantidad
  } 
}



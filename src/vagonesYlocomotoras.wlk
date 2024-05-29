class VagonDePasajeros {
	var property largo
	var property ancho
	var property tieneBanios
	var property estaOrdenado
	
	method anchoEsMenorOIgualA3() = ancho <= 3
	method cantidadDePasajeros() = (largo * if(ancho <= 3) 8 else 10 ) -  if (not estaOrdenado) 15 else 0 
	method cantidadMaximaDeCarga() = if(tieneBanios) 300 else 800
	method pesoMaximo() = 2000 + (80 * self.cantidadDePasajeros()) + self.cantidadMaximaDeCarga()
	method hacerMantenimiento(){
		estaOrdenado = true
	}
}

class VagonDeCarga {
	var property cargaMaximaIdeal
	var property cantidadDeMaderaSuelta
	const property tieneBanios = false
	const property cantidadDePasajeros = 0
	method cantidadMaximaDeCarga() = cargaMaximaIdeal - 400 * cantidadDeMaderaSuelta
	method pesoMaximo() = 1500 + self.cantidadMaximaDeCarga()
	method hacerMantenimiento(){
		cantidadDeMaderaSuelta = 0.max(cantidadDeMaderaSuelta - 2)
	}
}

class VagonDormitorio {
	var property cantidadDeCompartimientos
	var property cantidadDeCamasPorCompartimientos
	const property tieneBanios = true
	
	method cantidadDePasajeros() = cantidadDeCompartimientos * cantidadDeCamasPorCompartimientos
	method cantidadMaximaDeCarga() = 1200
	method pesoMaximo() = 4000 + (80 * self.cantidadDePasajeros()) + self.cantidadMaximaDeCarga()
	method hacerMantenimiento(){}
}

class Locomotora {
	var property peso
	var property pesoQuePuedeArrastrar
	var property velocidadMaxima
	
	method esEficiente() = pesoQuePuedeArrastrar >= (peso * 5)
}
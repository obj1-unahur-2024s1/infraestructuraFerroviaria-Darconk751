import vagonesYlocomotoras.*

class Formacion {
	const vagones = []
	const locomotoras = []
	method locomotoras() = locomotoras
	method agregarLocomotora(unaLocomotora){
		locomotoras.add(unaLocomotora)
	}
	method sacarLocomotora(unaLocomotora){
		locomotoras.remove(unaLocomotora)
	}
	method vagones() = vagones 
	method agregarVagon(unVagon){
		vagones.add(unVagon)
	}
	method sacarVagon(unVagon){
		vagones.remove(unVagon)
	}
	method cantidadMaximaDePasajeros() = vagones.sum({vagon => vagon.cantidadDePasajeros()})
	method cantidadDeVagonesPopulares() = vagones.count({vagon => vagon.cantidadDePasajeros() > 50})
	method formacionCarguera() = vagones.all({vagon => vagon.cantidadMaximaDeCarga() >= 1000})
	method vagonMasPesado() = vagones.max({vagon => vagon.pesoMaximo()})
	method vagonMasLiviano() = vagones.min({vagon => vagon.pesoMaximo()})
	method dispersionDePesos() = self.vagonMasPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo()
	method cantidadDeBaniosEnUnaFormacion() = vagones.count({vagon => vagon.tieneBanios()})
	method vagonConMasPasajeros() = vagones.max({vagon => vagon.cantidadDePasajeros()})
	method vagonConMenosPasajeros() = vagones.min({vagon => vagon.cantidadDePasajeros()})
	method estaEquilibradoEnPasajeros() = self.vagonConMasPasajeros().cantidadDePasajeros() - self.vagonConMenosPasajeros().cantidadDePasajeros() <= 20
	method estaOrganizada(){
		const cantidadDeVagonesConPasajeros = vagones.count({vagon => vagon.cantidadDePasajeros() >= 1})
		
		return if(cantidadDeVagonesConPasajeros >= 1) vagones.take(cantidadDeVagonesConPasajeros).all({vagon => vagon.cantidadDePasajeros() >= 1}) else true
	}
	method hacerMantenimiento(){
		vagones.forEach({vagon => vagon.hacerMantenimiento()})
	}
	method velocidadMaxima() = locomotoras.min({locomotora => locomotora.velocidadMaxima()})
	method esEficiente() = locomotoras.all({locomotora => locomotora.esEficiente()})
	method totalDePesoQuePuedeArrastrar() = locomotoras.sum({locomotora => locomotora.pesoQuePuedeArrastrar()})
	method sumaDePesoMaximoDeVagonesYPesoDeLocomotoras() = vagones.sum({vagon => vagon.pesoMaximo()}) + locomotoras.sum({locomotora => locomotora.pesoMaximo()})
	method puedeMoverse() = self.totalDePesoQuePuedeArrastrar() >= self.sumaDePesoMaximoDeVagonesYPesoDeLocomotoras()
	method kilosDeEmpujeFaltante() = 0.max(self.sumaDePesoMaximoDeVagonesYPesoDeLocomotoras() - self.totalDePesoQuePuedeArrastrar())
	method esCompleja() = locomotoras.size() + vagones.size() > 8 or self.sumaDePesoMaximoDeVagonesYPesoDeLocomotoras() > 80000
}

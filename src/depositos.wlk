import formaciones.*
import vagonesYlocomotoras.*

class Deposito {
	const formacionesArmadas = []
	const locomotorasSueltas = []
	
	method formacionesArmadas() = formacionesArmadas
	method agregarFormacionArmada(unaFormacion){
		formacionesArmadas.add(unaFormacion)
	}
	method sacarFormacionArmada(unaFormacion){
		formacionesArmadas.remove(unaFormacion)
	}
	method locomotorasSueltas() = formacionesArmadas
	method agregarlocomotoraSuelta(unaLocomotora){
		locomotorasSueltas.add(unaLocomotora)
	}
	method sacarlocomotoraSuelta(unaLocomotora){
		locomotorasSueltas.remove(unaLocomotora)
	}
	method conjuntoDeVagonesMasPesadosDeCadaFormacion() = formacionesArmadas.map({formacion => formacion.vagonMasPesado()})
	method necesitaConductorExperimentado() = formacionesArmadas.any({formacion => formacion.esCompleja()})
	method hayLocomotoraQuePuedeArrastrar(cantidad) = locomotorasSueltas.any({locomotora => locomotora.pesoQuePuedeArrastrar() >= cantidad})
	method locomotoraConArrastre(cantidad) = locomotorasSueltas.find({locomotora => locomotora.pesoQuePuedeArrastrar() >= cantidad})
	method hacerMovibleA(unaFormacion){
		const empujeFaltante = unaFormacion.kilosDeEmpujeFaltante()
		if (self.hayLocomotoraQuePuedeArrastrar(empujeFaltante)){
			unaFormacion.agregarLocomotora(self.locomotoraConArrastre(empujeFaltante))
		}
	}
	method agregarLocomotoraSueltaA(unaFormacion){
		if(not unaFormacion.puedeMoverse()){
			self.hacerMovibleA(unaFormacion)
		}
	}
}

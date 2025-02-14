/*
commandPalette, wollok REPL
const brian = new Mago(poderInnato =2, nombre= "Brian")

clientes.count{each => each == "Brian"}

OcurrencesOf???

existe size, no length

var nuevaLista = listaNumeros + listaNumneros2

[2,3,4].min()

lista.add(elemento)

pedido.map{pizza => pizza.agregarIngrediente(ingredienteEspecial)}

method noContiene(ingrediente) = self.pizzasFinales().all{p => p.ingredientes().not().contains(ingrediente)}

(10*20).max(1500)

class VentaInvalida inherits Exception{}

override method validarQuePuedeSerVendido(){
		throw new VentaInvalida("No se puede vender un local")
	}
	
override method reservarPara(operacion, cliente){
	operacion.estado(new Reservada(cliente))
}
	
const reservas = #{}

method totalComisiones() = operacionesCerradas.sum({operacion => operacion.comision()})
		
[2,3,4].any({elem => elem == 3})
numeros.contains(23)  
numeros.isEmpty()
paridad -> (numero %  2) == 0

const telefonos = new Dictionary()
>>> telefonos.put("ricky", "15-21...")
>>> telefonos.get("ricky")
var suma = 0
numeros.forEach({ n => suma = suma + n })
telefonos.forEach { persona, tel => console.println(persona + " tiene " + tel) }

[3, 1, 0, 2].filter { n => n > 1 }  // [3, 2]
[3, 1].all { n => n > 0 } // true
[10, 12].map { n => n / 2 } // [5,6]
*/

const brian = new Mago(poderInnato =2, resistenciaMagica = 20, nombre= "Brian", listaObjetos = [sauco])
const eliana = new Mago(poderInnato =2, resistenciaMagica = 20, nombre= "Eliana", listaObjetos = [sauco])
const sauco = new Varita()

class Mago
{
    var property listaObjetos = []
    var property poderInnato
    var property resistenciaMagica 
    const property nombre

    method sumatoriaPoderObjetos() = self.listaObjetos().sum({objeto => objeto.poderAportado(self)})
       
    method poderTotal(){
        return self.sumatoriaPoderObjetos() * self.poderInnato()
    }
    method agregarObjeto(elemento){
        self.listaObjetos().add(elemento)
    }
}

class ObjetoMagico {
    var property valorBase
    method poderAportado(mago)
}

class Varita inherits ObjetoMagico(valorBase = 2){
    
    override method poderAportado(mago) {
        if ((mago.nombre().size() %  2) == 0) {
            return valorBase * 1.5
        }
        else 
            return valorBase 
    }

}

class Tunica inherits ObjetoMagico{

    override method poderAportado(mago) {
        return 2*mago.resistenciaMagica() 
    }
}

class TunicaEpica inherits ObjetoMagico{

    override method poderAportado(mago) {
        return 2*mago.resistenciaMagica() + 10 
    }
}

class Amuleto {
    method poderAportado(mago) = 200
}

object ojota{
    method poderAportado(mago) = 10* mago.nombre().size()
}
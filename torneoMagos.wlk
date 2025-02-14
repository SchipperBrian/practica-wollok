/*
commandPalette, wollok REPL, var mago = new Mago()
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

class Mago
{
    var property poderInnato
    var property poderTotal  

    method agregarPoder(){
        self.poderInnato() + 2
    }
}
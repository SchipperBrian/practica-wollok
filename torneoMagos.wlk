/*
commandPalette, wollok REPL
const brian = new Mago(poderInnato =2, nombre= "Brian")

abstract class -> clase sin cuerpo, solo firma(ojo que no es lo mismo que cuerpo vacio)
no puedo instanciar una clase abstracta

clientes.count{each => each == "Brian"}

OcurrencesOf???

existe size, no length

var nuevaLista = listaNumeros + listaNumneros2

[2,3,4].min()

lista.add(elemento)
oro += monedas

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

const brian = new Mago(poderInnato =2, resistenciaMagica = 20, energiaMagica = 20, nombre= "Brian", listaObjetos = [sauco])
const eliana = new Mago(poderInnato =2, resistenciaMagica = 20, energiaMagica = 20, nombre= "Eliana", listaObjetos = [sauco])
const sauco = new Varita()

class Mago
{
    var property listaObjetos = []
    var property poderInnato
    var property resistenciaMagica 
    var property energiaMagica
    const property nombre
    //var property categoria //aprendiz o veterano o inmortal

    method sumatoriaPoderObjetos() = self.listaObjetos().sum({objeto => objeto.poderAportado(self)})
    method aumentarEnergiaMagica(cantidad) {
         energiaMagica += cantidad
    }
    method cambiarResistencia(valor) = self.resistenciaMagica() + valor

    method esVencidoPor(atacante) {}
       
    method poderTotal(){
        return self.sumatoriaPoderObjetos() * self.poderInnato()
    }
    method agregarObjeto(elemento){
        self.listaObjetos().add(elemento)

    /* Todo lo que pasa depende de la categoría del mago desafiado, 
    entonces deberías delegarle a ese objeto hacer todo esto.
    method desafiaA(magoDesafiado) = 
        if (magoDesafiado.categoria().esVencido(self.poderTotal(),magoDesafiado))  
        magoDesafiado.categoria().efectoVencido(self, magoDesafiado)
    */
    }
}

//objetoMagico, podría definirse como una clase abstracta? quizás pero lo mejor sería tner al metodo con una
//respuesta "default" lo que haría que almenos responda algo y varita y túnica sean casos particulares
class ObjetoMagico {
    var property valorBase
    method poderAportado(mago)
}

/* class Varitas inherits ObjetoMagico {
  const property letrasMinimas 

  method tieneCantidadDeLetrasElMago(magoPropietario) = magoPropietario.letrasNombreMago() > self.letrasMinimas()
  override method poderAportado(magoPropietario) {
    if (self.tieneCantidadDeLetrasElMago(magoPropietario))
      self.poderBase() * 0.5
    else
      self.poderBase()
  } 
} */

class Varita inherits ObjetoMagico(valorBase = 2){
    
    override method poderAportado(mago) {
        if ((mago.nombre().size() %  2) == 0) {
            return valorBase * 1.5
        }
        else 
            return valorBase 
    }
}

class Tunica inherits ObjetoMagico(valorBase = 2){

    override method poderAportado(mago) = valorBase + 2 * mago.resistenciaMagica() 
}

class TunicaEpica inherits ObjetoMagico(valorBase = 2){

    override method poderAportado(mago) = valorBase + 2*mago.resistenciaMagica() + 10
    //override method poderAportado(magoPropietario) = super(magoPropietario).poderAportado(magoPropietario) + 10 
}
//No heredan de ObjetoMagico, porque no hay nada que reutilizar
class Amuleto {
    method poderAportado(mago) = 200
}

object ojota{
    method poderAportado(mago) = 10* mago.nombre().size()
}

class Desafio {
    method esAtacanteGanador(atacante, defensor)
    {
        if (defensor.resistenciaMagica() < atacante.poderTotal())
            defensor.esVencidoPor(atacante)
    }
}


class Aprendices inherits Mago{

    override method esVencidoPor(atacante) {
        //self.energiaMagica() = self.energiaMagica() 
        //atacante.energiaMagica() += self.energiaMagica()/2
    }
}

class Veteranos inherits Mago{
    
}

class Inmortales inherits Mago{
    
}

/*--------------------------------------------------


//var unMago = new Mago(poderInnato = 200, objetosEquipados =[], nombre= "brian", energia= 20, resistenciaMagica=10, categoria = esAprendiz)




class Amuletos inherits ObjetoMagico {
  override method poderAportado(magoPropietario) = 200
}

object ojota {
  method poderAportado(magoPropietario) = magoPropietario.letrasNombreMago() * 10
}

class Categoria {
  method esVencido(poderTotalAcumulado, magoDefensor) 
  method efectoVencido(magoAtacante, magoDefensor)
}

class Aprendiz inherits Categoria{
   override method esVencido(poderTotalAcumulado, magoDefensor) = (poderTotalAcumulado > magoDefensor.resistenciaMagica())

   override method efectoVencido(magoAtacante, magoDefensor) {
      magoDefensor.cambiarEnergia(-(magoDefensor.energia() *0.5))
      magoAtacante.cambiarEnergia(magoDefensor.energia() *0.5)
   }
}

class Veterano inherits Categoria{

  override method esVencido(poderTotalAcumulado, magoDefensor) = 
    poderTotalAcumulado > 1.5* magoDefensor.resistenciaMagica()
   override method efectoVencido(magoAtacante, magoDefensor) {
      magoDefensor.cambiarEnergia(-(magoDefensor.energia() *0.25))
      magoAtacante.cambiarEnergia(magoDefensor.energia() *0.25)
   }
}

class Inmortal inherits Categoria{
   override method esVencido(poderTotalAcumulado, magoDefensor) = false
}

class Gremio{
  var property magosMiembros // [primerMago, segundoMago,tercerMago,cuartoMago]
  var property lider //cuartoMago

  method initialize() {
    if (self.magosMiembros().size() < 2)
     throw new PocosMagosParaElGremio()
  }

  method poderTotal() = (magosMiembros.map{mago => mago.poderTotal()}).sum() + lider.poderTotal()
  method reservaEnergiaMagica() = (magosMiembros.map{mago => mago.energia()}).sum() + lider.energia()
  method desafiarAMago(magoDesafiado) {
    if (magoDesafiado.esVencido(self.poderTotal(), magoDesafiado))
      magoDesafiado.efectoVencido(self.lider(), magoDesafiado)
  }

  method desafiarAGremio(gremioDesafiado) {
    if (self.poderTotal() > gremioDesafiado.reservaEnergiaMagica())
      gremioDesafiado.forEach{mago => mago.efectoVencido(self.lider(), mago)}
  }

  /* method declararLider() {
      self.lider() = (self.magosMiembros().map{miembro => miembro.poderTotal()}).max()
  } 
  //[mago1(poder100), mago2(poder 200), [mago3(poder80), mago4(poder70)]]
}

class PocosMagosParaElGremio inherits Exception{}

*/
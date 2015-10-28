(semanaAnio)
==========

Fuentes diversas en Python, MySQL, Ruby y Bash que te digan la semana del año en la que te encuentras.

BASH
====
```
#/usr/bin/bash

echo " "
fecha=`date '+%V'`
echo "Estamos en la semana ${fecha} de este año."
```

RUBY
====

```
#encoding: utf-8
require "date"
time = Time.new
puts " "
puts "Estamos en la semana " + (time.strftime("%W").to_i + 1).to_s + " de este año."
```


# STRATEGY (ESTRATEGIA)

## Propósito

Define una familia de algoritmos, encapsula cada uno de ellos y los hace intercambiables. Permite que un algoritmo varíe independientemente de los clientes que lo usen.
También conocido como
Policy (Política)
Motivación
Normalmente existen muchos algoritmos para solucionar un problema dado. Codificar dichos algoritmos en las propias clases que los utilizan no resulta una buena práctica por varias razones.
Los problemas se vuelven más complejos si tienen que incluir dichos algoritmos, lo que los hace más grandes y difíciles de mantener, sobre todo si permiten varios algoritmos diferentes.
Cada uno de los diferentes algoritmos serán apropiados en distintos momentos. No se tiene por qué permitir múltiples algoritmos si no los vamos a usar todos.
Es difícil añadir nuevos algoritmos o modificar los existentes cuando el problema es parte integral de un cliente.
Estos problemas pueden evitarse definiendo clases que encapsulen los diferentes algoritmos del/los problemas. Un algoritmo así encapsulado se denomina estrategia.


Aplicabilidad
Úsese el patrón 'Strategy' cuando:
Se necesitan distintas variantes de un algoritmo. Por ejemplo, podríamos definir algoritmos que reflejasen distintas soluciones de compromiso entre tiempo y espacio.
Un algoritmo usa datos que los clientes no deberían conocer. Úsese el patrón 'Strategy' para evitar exponer estructuras de datos complejas y dependientes del algoritmo.
Una clase define muchos comportamientos, y estos se representan como múltiples sentencias condicionales, podemos mover las ramas de estos a su propia clase 'Estrategia'.
Estructura



Participantes
Estrategia (Componedor)
Declara una interfaz común a todos los algoritmos permitidos. El contexto usa esta interfaz para llamar al algoritmo definido por una EstrategiaConcreta.
EstrategiaConcreta (ComponedorSimple, ComponedorTeX, ComponedorMatriz)
Implementa el algoritmo usando la interfaz Estrategia.
Contexto (Composición)
Se configura con un objeto EstrategiaConcreta.
Mantiene una referencia a un objeto Estrategia.
Puede definir una interfaz que permita a la Estrategia acceder a sus datos.
Código de ejemplo.
Comenzaremos con la clase ‘MiniDuckSimulator’ que es la clase desde donde comienza todo.

```
public class MiniDuckSimulator{
    public static void main (String[] args){
        System.out.println("");

        Duck mallard = new MallardDuck();
        mallard.display();
        mallard.performQuack();
        mallard.performFly();
        mallard.swim();

        System.out.println("++++++++++++++++++++++++++++++");
        System.out.println("++++++++++++++++++++++++++++++");
        System.out.println("++++++++++++++++++++++++++++++");

        Duck model = new ModelDuck();
        model.display();
        model.performFly();
        model.swim();
        System.out.println("");
        model.setFlyBehavior(new FlyRocketPowered());
        model.display();
        model.performFly();
        model.swim();

        System.out.println("");
    }
}

```

Esta es la clase ‘Duck’. Es la clase principal desde la que partimos.

public abstract class Duck{
    
    FlyBehavior flyBehavior;
    QuackBehavior quackBehavior;

    public Duck(){
    }

    public abstract void display();

    public void performFly(){
        flyBehavior.fly();
    }

    public void performQuack(){
        quackBehavior.quack();
    }

    public void swim(){
        System.out.println("Todos los patos flotan, incluso los decoys! ");
    }

    public void setFlyBehavior(FlyBehavior fb){
        flyBehavior = fb;
    }

    public void setQuackBehavior(QuackBehavior qb){
        quackBehavior = qb;
    }
}

public class ModelDuck extends Duck {

    public ModelDuck(){
        quackBehavior = new Quack();
        flyBehavior = new FlyNoWay();
    }

    public void display(){
        System.out.println("Soy un pato de plástico.");
    }
}

public class MallardDuck extends Duck {

    public MallardDuck(){
        quackBehavior = new Quack();
        flyBehavior = new FlyWithWings();
    }

    public void display(){
        System.out.println("Soy un auténtico pato de verdad.");
    }
}


Las dos interfaces principales Java. Con sus diferentes códigos (algoritmos) que heredan respectivamente de las Interfaces.

public interface QuackBehavior {
    public void quack();
}

public class Quack implements QuackBehavior {
    public void quack() {
        System.out.println("Cuac, cuac.");
    }
}

public class Squeak implements QuackBehavior {
    public void quack() {
        System.out.println("Squeak.");
    }
}

public class MuteQuack implements QuackBehavior {
    public void quack() {
        System.out.println("<< SILENCIO BRUTAL >>");
    }
}


public interface FlyBehavior{
    public void fly();
}

public class FlyNoWay implements FlyBehavior {
    public void fly(){
        System.out.println("No puedo volar.");
    }
}

public class FlyRocketPowered implements FlyBehavior {
    public void fly() {
        System.out.println("Yo puedo volar gracias a un cohete autopropulsado.");
    }
}

public class FlyWithWings implements FlyBehavior {
    public void fly(){
        System.out.println("Estoy volando.");
    }
}

Esquema

OBSERVER (OBSERVADOR)
Propósito
Define una dependencia de uno-a-muchos entre objetos, de forma que cuando un objeto cambie de estado se notifique y se actualicen automáticamente todos los objetos que dependen de él.
También conocido como
Dependents (Dependientes), Publish-Subscribe (Publicar-Suscribir).
Motivación
Un efecto lateral habitual de dividir un sistema en una colección de clases cooperantes es la necesidad de mantener una consistencia entre objetos relacionados. No queremos alcanzar esa consistencia haciendo a las clases fuertemente acopladas, ya que eso reduciría su utilización.
El patrón 'Observer' describe cómo establecer las relaciones entre las clases que los representan. Los principales objetos de este patrón son el sujeto y el observador. Un sujeto puede tener cualquier número de observadores dependientes de él. Cada vez que el sujeto cambia su estado se notifica a todos sus observadores. En respuesta , cada observador consultará al sujeto para sincronizar su estado con el estado de éste.
Este tipo de interacción también se conoce como publicar_suscribir. El sujeto es quien publica las notificaciones. Envía estas notificaciones sin tener que conocer quiénes son sus observadores. Pueden suscribirse un número indeterminado de observadores para recibir notificaciones.
Aplicabilidad
Úsese el patrón 'Observer' en cualquiera de las siguientes situaciones:
Cuando una abstracción tiene dos aspectos y uno depende del otro. Encapsular estos aspectos en objetos separados permite modificarlos y reutilizarlos de forma independiente.
Cuando un cambio en un objeto requiere cambiar otros, y no sabemos cuántos objetos necesitan cambiarse.
Cuando un objeto debería ser capaz de notificar a otros sin hacer suposiciones sobre quiénes son dichosa objetos. En otras palabras, cuando no queremos que estos objetos están fuertemente acoplados.
Estructura

Participantes
Sujeto
Conoce a sus observadores. Un sujeto puede ser observado por cualquier número de objetos 'Observador'.
Proporciona una interfaz para asignar y quitar objetos 'Observador'.
Observador
Define una interfaz para actualizar los objetos que deben ser notificados ante cambios en un sujeto.
SujetoConcreto
Almacena el estado de interés para los objetos 'ObservadorConcreto'.
Envía una notificación a sus observadores cuando cambia su estado.
ObservadorConcreto
Mantiene una referencia a un objeto 'SujetoConcreto'.
Guarda un estado que debería ser consistente con el del sujeto.
Implementa la interfaz de actualización del 'Observador' para mantener su estado consistente.
Colaboraciones
SujetoConcreto notifica a sus observadores cada vez que se produce un cambio que pudiera hacer que el estado de éstos fuera inconsistente con el tuyo.
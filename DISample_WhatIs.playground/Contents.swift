//: Playground - noun: a place where people can play

protocol Propulsion {
    func move()
}

class Vehicle
{
    
    let engine: Propulsion
    
    init() {
        engine = RaceCarEngine()
    }
    
    func forward() {
        engine.move()
    }
}

/**
 You have a special car: you can switch out its engine for anything you want: a jet engine, a rocket engine, a race car engine…
 To make sure any engine actually works, you’ve defined a rule for engines for your car: they must be able to move
 */

class RaceCarEngine: Propulsion {
    func move() {
        print("Vrrrooooommm!!")
    }
}

var car = Vehicle()
car.forward()

/**
 
 So what’s the dependency here?
 
 The dependency is inside the init() function of Vehicle, because it references the RaceCarEngine class. Class Vehicle is tightly coupled with the RaceCarEngine class. You don’t want that!
 
 Because you’ve directly referenced RaceCarEngine from Vehicle, the Vehicle class now depends on the RaceCarEngine to function.
 
 */

// MARK: --

class NewVehicle
{
    let engine: Propulsion
    
    init(engine: Propulsion) {
        self.engine = engine
    }
    
    func forward() {
        engine.move()
    }
}

/**
 
 The difference is subtle. Instead of directly using the RaceCarEngine class, the Vehicle class now takes a Propulsion instance as an initializer parameter.
 
 */

let raceCarEngine = RaceCarEngine()

var newCar = NewVehicle(engine: raceCarEngine)
newCar.forward()

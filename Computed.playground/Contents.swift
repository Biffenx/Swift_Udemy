import Foundation

var pizzaInInches: Int = 10 {
    willSet {
        
    }
    didSet {
        if pizzaInInches >= 18 {
            print("Invalid size specified, pizzaInInces set to 18.")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 30
print(pizzaInInches)


var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}

var numberOfPizzas: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}











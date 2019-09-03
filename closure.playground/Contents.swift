import UIKit

struct MathOperation {
    var units: String
    var operation: (Double, Double) -> Double
    
    init?(units: String, operation: @escaping (Double, Double) -> Double) {
        if (units == "") {
            return nil
        }
        self.units = units
        self.operation = operation
    }
}


var test = MathOperation(units: "", operation: {
    (x, y) in
    return x + y
})

if test == nil {
    print("It failed!")
}

var distance = MathOperation(units: "km", operation: {
    (x, y) in
    return x + y
})


if let distance = distance {
    let sum = distance.operation(12.5, 22.4)
    let units = distance.units
    print("\(sum) \(units)")
}

let multiply = {
    (a: Double, b: Double) in
    return a * b
}

var area = MathOperation(units: "square meters", operation: multiply)

if let area = area {
    let result = area.operation(10.0, 20.0)
    let units = area.units
    print("\(result) \(units)")
}

func divide(i: Double, j: Double) -> Double {
    return i/j
}

var speed = MathOperation(units: "km/hr", operation: divide)

if let speed = speed {
    let result = speed.operation(150.0, 2.0)
    let units = speed.units
    print("\(result) \(units)")
}

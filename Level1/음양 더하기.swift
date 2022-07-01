import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {

    func add(_ a: Int, to b: Int) -> Int {
        return a + b
    }

    func subtract(_ a:Int, from b: Int) -> Int {
        return b - a
    }
    
    var result: Int = 0
    
    for i in 0..<absolutes.count {
        if signs[i] {
            result = add(absolutes[i], to: result)
        } else {
            result = subtract(absolutes[i], from: result)
        }
    }
    
    return result
}

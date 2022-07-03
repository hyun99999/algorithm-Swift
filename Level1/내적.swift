import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sum: Int = 0
    for i in 0..<a.count {
        sum += a[i]*b[i]
    }
    
    return sum
}

import Foundation
/*
func solution(_ left:Int, _ right:Int) -> Int {
    var sum: Int = 0
    for i in left...right {
        var count: Int = 0
        for j in 1...i {
            if i % j == 0 {
                count += 1
            }
        }
        
        if count % 2 == 0 {
            // 짝
            sum += i
        } else {
            // 홀
            sum -= i
        }
    }
    
    return sum
}
*/

// 함수로 분리

func solution(_ left:Int, _ right:Int) -> Int {
    var sum: Int = 0
    
    for i in left...right {
        if divisorNumberIsEven(i) {
            sum += i
        } else {
            sum -= i
        }
    }
    
    return sum
}

func divisorNumberIsEven(_ number: Int) -> Bool {
    var count: Int = 0
    
    for n in 1...number {
        if number % n == 0 {
            count += 1
        }
    }
    return count % 2 == 0 ? true : false
}


import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var money: Int = money
    
    for n in 1...count {
        var price: Int = price
        price *= n
        money -= price
    }
    
    if money >= 0 {
        return 0
    } else {
        answer = Int64(abs(money))
        return answer
    }
}

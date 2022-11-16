import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    // 빈 병 2개를 가져다주면 1병을 줌
    // 20개를 가져다주면 몇병을 받을 수 있는가?
    // 빈병이 2개 미만이면 콜라를 받을 수 없다.
    
    // 빈병 a 개를 주면 b 개의 콜라를 받을 수 있다.
    // 총 n개의 빈병을 가져다주면 몇병을 받을 수 있는가?
    
    // 처음에 n / a * b 개를 받음 + 남은 갯수
    
    var emptyBottle: Int = n
    var totalReturnBottle: Int = 0
    
    // 빈병이 2개 미만
    while emptyBottle >= a {
        let returnBottle: Int = emptyBottle / a * b
        let restBottle: Int = emptyBottle % a
        emptyBottle = returnBottle + restBottle
        totalReturnBottle += returnBottle
    }
    
    return totalReturnBottle
}

print(solution(3, 1, 20))
// 9

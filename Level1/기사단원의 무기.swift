import Foundation

// 1-number 까지 지정된 숫자나라 기사단.
// 각 기사는 자신의 숫자의 약수의 갯수에 공격력이 해당하는 무기를 구매.
// 공력력은 limit 있음. 그 이상은 power 로 설정.

// 공격력 1 당 1kg 인 무기. 총 무게는?
func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var answer: Int = 0

    for num in 1...number {
        let powerOfNum: Int = getPower(of: num)
        
        if powerOfNum > limit {
            answer += power
        } else {
            answer += powerOfNum
        }
    }
    
    return answer
}

/*
/// 약수의 갯수 구하기
func getPower(of num: Int) -> Int {
    var power: Int = 0
    
    for i in 1...num {
        if num % i == 0 {
            power += 1
        }
    }
    
    return power
}
*/

// 테스트 11-16, 18, 24, 25 시간 초과.
// getPower(of:) 메소드의 알고리즘을 간략화 하니 시간 초과된 테스트가 모두 실패가 되었다.(시간 초과는 아니라는 뜻.)
// -> 약수 구하는 알고리즘의 시간 복잡도의 문제라고 판단.

func getPower(of num: Int) -> Int {
    var power: Int = 0
    
    if num == 1 {
        power = 1
    } else if num == 2 {
        power = 2
    } else if num == 3 {
        power = 2
    } else {
        for i in 1...Int(sqrt(Double(num))) {
            if num % i == 0 {
                if (i * i) == num {
                    power += 1
                } else {
                    power += 2
                }
            }
        }
    }
    
    return power
}

print(solution(10, 3, 2))
// 21



import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    // n - 1 과 n 번 게임
    // 다음 라운드에서 번호 재배정
    // 최종 한명이 남을 때까지 진행
    // a 와 b 번호를 가진 참가자는 항상 이기고 몇번째 라운드에서 만나게 되는가?
    var round: Int = 1
    var a = a
    var b = b
    
    // 최대 20번 라운드를 진행할 것이기 때문에 while 문.
    while group(of: a) != group(of: b) {
        a = group(of: a)
        b = group(of: b)
        
        round += 1
    }
    
    return round
}

/// 다음 라운드에서의 매칭되는 그룹 구하기.
func group(of number: Int) -> Int{
    return  number % 2 == 0 ? number / 2 : number / 2 + 1
}

print(solution(8, 4, 7))
// 3

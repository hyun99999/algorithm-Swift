import Foundation

// 택배상자는 1번부터 n번까지 번호 순서대로 전달. 순서대로 내릴 수 있다.
// 택배 기사님이 알려준 순서에 맞게 영재가 실어야 합니다.
// 보조 컨테이너 벨트(=스택)
// 보조 컨테이너 벨트를 사용해도 순서대로 못 실는다면, 더 이상 싣지 않습니다.
// 몇개까지 실을 수 있는지 반환.
func solution(_ order:[Int]) -> Int {
    /// 순서대로 실은 택배의 수.
    var answer: Int = 0
    
    /// 보조 컨테이너(스택 구조)
    var stack: [Int] = []
    
    /// order 에 있는 택배 순서
    var index: Int = 0
    
    for boxNumber in 1...order.count {
        // boxNumber: 컨테이너 벨트의 택배 순서.
        if order[index] != boxNumber {
            // 컨테이너 벨트에서 상자가 택배 순서와 맞지 않을 때.
            stack.append(boxNumber)
            continue
        } else {
            // 컨테이너 벨트에서 상자가 택배 순서와 맞을 때.
            index += 1
            answer += 1
        }
        
        // 보조 컨테이너벨트에 다음 상자가 있는지 확인.
        while !stack.isEmpty {
            if order[index] == stack.last! {
                stack.removeLast()
                index += 1
                answer += 1
            } else {
                break
            }
        }
    }
    
    return answer
}

// 참고 코드: https://velog.io/@biny22/프로그래머스-택배상자

print(solution([4, 3, 1, 2, 5]))
// 2

print(solution([5, 4, 3, 2, 1]))
// 5

print(solution([1, 2, 4, 3, 5]))
// 5

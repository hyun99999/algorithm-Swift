import Foundation

/*
// nonzeroBitCount 사용하기
func solution(_ n:Int) -> Int {
    // 다음 큰 숫자 정의.
    // 조건 1. n의 다음 큰 숫자는 n보다 큰 자연수 입니다.
    // 조건 2. n의 다음 큰 숫자와 n은 2진수로 변환했을 때 1의 갯수가 같습니다.
    // 조건 3. n의 다음 큰 숫자는 조건 1, 2를 만족하는 수 중 가장 작은 수 입니다.
    var answer : Int = n + 1
 
    while true {
        if n.nonzeroBitCount == answer.nonzeroBitCount {
            break;
        }
        answer += 1
    }
 
    return answer
}
 */

// nonzeroBitCount 사용하지 않고 해결하기.

func solution(_ n: Int) -> Int {
    var answer: Int = n + 1
    
    while true {
        let nCount = String(n, radix: 2).filter { $0 == "1" }.count
        let answerCount = String(answer, radix: 2).filter { $0 == "1" }.count
        
        if nCount == answerCount {
            break
        } else {
            answer += 1
        }
    }
    
    return answer
}

print(solution(78))
// 83

import Foundation

// 정확성 테스트 통과.
// 효율성 테스트 시간초과.
/*
func solution(_ A:[Int], _ B:[Int]) -> Int {
    var A = A
    var B = B
    var answer = 0
    // 배열의 길이만큼 반복
    // 두 수를 곱한 값을 누적하여 더함.
    // 이때 최종적으로 누적된 값이 최소.
    var a: Int = 0
    var b: Int = 0
    
    for _ in A.indices {
        if A.max()! > B.max()! {
            a = A.max()!
            b = B.min()!
            answer += a * b
            
            A.remove(at: A.firstIndex(of: a)!)
            B.remove(at:B.firstIndex(of: b)!)
        } else {
            a = A.min()!
            b = B.max()!
            answer += a * b
         
            A.remove(at: A.firstIndex(of: a)!)
            B.remove(at:B.firstIndex(of: b)!)
        }
    }

    return answer
}
 */

// 아이디어 : 최대값을 선정하는 max() 대신 정렬을 통해서 진행.
func solution(_ A:[Int], _ B:[Int]) -> Int {
    // 어떻게 정렬하든 반대로 정렬하면 된다.
    let A = A.sorted(by: >)
    let B = B.sorted(by: <)
    var answer = 0
    
    for i in A.indices {
        answer += A[i] * B[i]
    }

    return answer
}

print(solution([1,4,2], [5,4,4]))
// 29

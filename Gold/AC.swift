import Foundation
// AC 언어는 정수 배열에 연산을 하기 위해 만든 언어.
// 이 언어에는 R(뒤집기) : 수의 순서를 뒤집는다.
// D(버리기) : 첫 번째 수를 버린다.(배열이 비어있는 경우 사용하면 에러 발생.)

/// 테스트 케이스. 최대 100.
let t: Int = Int(readLine()!) ?? 0

for _ in 0..<t {
    let p: [String] = readLine()!.map { String($0) }
    let n: Int = Int(readLine()!) ?? 0
    let x: [Int] = readLine()!.dropFirst().dropLast().split(separator: ",").map { Int($0) ?? 0 }
    
    // 🚨
    // 함수 P 의 길이는 <= 100,000
    // n 은 <= 100,000
    // reverse 와 dropFirst, removeFirst(앞으로 당겨야 함) O(n)
    // O(pn) 시간초과.
    // 아이디어: 이렇게 인덱스 접근에 대해 나오면 투 포인터 고려.
    
    var first: Int = 0
    var last: Int = x.count - 1
    var isReversed: Bool = false
    
    // 우선, error 확인.
    if p.filter ({ $0 == "D" }).count > n {
        print("error")

        continue
    }
    
    // MARK: - P 함수 실행.
    
    for i in 0..<p.count {
        if p[i] == "R" {
            isReversed.toggle()
        } else if p[i] == "D" {
            if isReversed {
                last -= 1
            } else {
                first += 1
            }
        }
    }
    
    var result: [Int] = []
    
    if first > last {
        if !isReversed {
            print("[]")
            continue
        }
    } else {
        if !isReversed {
            result = Array(x[first...last])
        } else {
            result = Array(x[first...last].reversed())
        }
    }
    
    print("[\(result.map { String($0) }.joined(separator: ","))]")
}

/*
 4
 RDD
 4
 [1,2,3,4]
 DD
 1
 [42]
 RRD
 6
 [1,1,2,3,5,8]
 D
 0
 []
 */

/*
 [2,1]
 error
 [1,2,3,5,8]
 error
 */

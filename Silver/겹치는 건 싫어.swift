import Foundation

// 도현이는 수열에 같은 원소가 여러 개 들어있는 수열을 싫어한다.
// 도현이를 위해 같은 원소가 k개 이하로 들어있는 최장 연속 부분 수열의 길이를 구하려고 한다.

let nk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let n: Int = nk[0]
let k: Int = nk[1]
let array: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var a: [Int] = Array(repeating: 0, count: 100001)

// 아이디어: 100001 배열을 만들어서 부분 수열 안에 중복으로 얼마나 존재하는지 체크.
// 투 포인터로 늘려간다.

var start: Int = 0
var end: Int = k - 1
/// 같은 원소의 개수.
var count: Int = 0
var answer: Int = 0

if n > k {
    for i in 0...end {
        a[array[i]] += 1
    }

    for i in (end + 1)..<n {
        end += 1
        a[array[i]] += 1
        
        if a[array[i]] > k {
            while a[array[i]] > k {
                a[array[start]] -= 1
                start += 1
            }
        }
        
        answer = max(answer, end - start + 1)
    }

    print(answer)
} else {
    // k 가 n 이상일때는 수열이 최장 연속 부분수열이 될 수 있음.
    print(n)
}

/*
 9 2
 3 2 5 5 6 4 4 5 7
 
 결과
 7
 */

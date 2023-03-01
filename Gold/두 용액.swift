import Foundation

// 산성은 1~1,000,000,000까지
// 알칼리성은 -1~-1,000,000,000까지
// 두 용액을 혼합한 특성값은 각 용액의 특성값의 합으로 정의. 0에 가장 가까운 용액을 만들려고 한다.

// 참고로, 두 종류의 산성과 알칼리성 용액으로 0에 가까운 혼합 용액을 만드는 경우도 있을 수 있음.
// 이 두 용액을 반환.

// 2이상 100,000이하
let n: Int = Int(readLine()!) ?? 0
var nArray: [Int] = readLine()!.components(separatedBy: " ").map { Int($0) ?? 0 }

// 출력할 때 오름차순으로 출력. 0에 가장 가까운 용액을 만들어내는 경우가 두 개 이상일 때 아무것이나 하나 출력.

nArray.sort(by: <)

// 2중 for 문은 시간초과.
/*
 for i in 0..<n - 1 {
 for j in i + 1..<n {
 // ...
 }
 }
 */

// 아이디어: 투 포인터
// 오름차순으로 정렬. 맨앞과 맨 뒤의 합이 양수면, 맨 뒤가 이동. 음수면, 맨 앞이 이동.

var start: Int = 0
var end: Int = n - 1
var sum: Int = nArray[start] + nArray[end]
var answer: [Int] = [nArray[start], nArray[end]]

while !(sum == 0 || end - start == 1) {
    if nArray[start] + nArray[end] > 0 {
        // 양수
        end -= 1
    } else {
        // 음수
        start += 1
    }
    
    if nArray[start] + nArray[end] == 0 {
        answer = [nArray[start], nArray[end]]
        
        break
    }
    
    if abs(nArray[start] + nArray[end]) < abs(sum) {
        answer = [nArray[start], nArray[end]]
        sum = nArray[start] + nArray[end]
    }
}

print(answer[0], answer[1])


// 5
// -2 4 -99 -1 98

// 결과
// -99 98

import Foundation

// 홍준이는 날 별로 주가를 예상하고 항상 맞아떨어진다. 그는 매일 아래 세 가지 중 하나의 행동을 한다.
// 1. 주식 하나를 산다.
// 2. 원하는 만큼 가지고 있는 주식을 판다.
// 3. 아무것도 안한다.

// 날 별로 주식의 가격을 알려주었을 때 최대 이익이 얼마나 되는지 계산.
// 2<= n <= 1,000,000
// 날 별 주가는 10,000 이하

let n: Int = Int(readLine()!) ?? 0

// 아이디어: 역순으로 확인하며 최대값보다 작다면 구입.
// 최대값보다 크다면 갱신.

var answer: [Int] = []

for _ in 0..<n {
    let _ : Int = Int(readLine()!) ?? 0
    let array: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
    
    var maxPrice: Int = array.last ?? 0
    var sum: Int = 0
    
    for index in (0..<array.count).reversed() {
        if maxPrice > array[index] {
            // 해당 날짜에 구매해서 팜.
            sum += maxPrice - array[index]
        } else {
            // 하락세 혹은 동일하기 때문에 구입하지 않거나 아무것도 하지 않음.
            // 최댓값을 재정의.
            maxPrice = array[index]
        }
    }
    answer.append(sum)
}

answer.forEach { print($0) }

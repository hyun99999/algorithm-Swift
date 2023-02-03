// PT를 받을 때 운동기구를 최대 두 개까지 선택할 수 있따.
// 근손실 정도가 M을 넘지 않도록 진행.
// 이전에 사용하지 않은 운동기구를 선택한다.
// M의 최솟값은?

let n: Int = Int(readLine()!)!
var m: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var maxWeight: Int = 0

// 아이디어: 홀수와 짝수인 경우가 다를 것.
// 정렬하고, 맨앞과 맨끝에서부터 서로 합을 구해서 최대값 출력.

m.sort(by: >)

if m.count % 2 != 0 {
    maxWeight = m.removeFirst()
}
    
for index in 0..<m.count / 2 {
    maxWeight = max(maxWeight, m[index] + m[m.count - index - 1])
}

print(maxWeight)

/*
입력:
5
1 2 3 4 5
*/

// 출력
// 5

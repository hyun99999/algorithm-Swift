import Foundation

// 서로 다른 두 곳을 골라 벌을 한 마리씩 둔다.
// 또 다른 장소를 골라 벌통을 둔다.
// 두 마리의 벌은 벌통으로 날아가면서 모든 칸에서 꿀을 딴다. 각 장소에 적힌 숫자가 벌이 딸 수 있는 꿀의 양.(벌통 포함)
// 벌이 시작한 곳에서는 어떤 벌도 꿀을 얻을 수 없음.
// 벌들이 딸 수 있는 최대의 꿀의 양을 계산.

/// 장소의 수.
let n: Int = Int(readLine()!) ?? 0
/// 딸 수 있는 꿀의 양.
let honey: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 아이디어: 그리디.
// 누적합 사용.

// 벌1 벌2 꿀
// sum[꿀] - 꿀[벌1] - 꿀[벌2]
// + sum[꿀] - sum[벌2]

// 꿀 벌1 벌2
// sum[벌2] - 꿀[벌2] - 꿀[벌1]
// + sum[벌1] - 꿀[벌1]

// 벌1 꿀 벌2
// sum[꿀] - 꿀[벌1]
// + sum[벌2] - sum[꿀-1] - 꿀[벌2]

var sum: [Int] = Array(repeating: 0, count: n)
sum[0] = honey[0]

for index in 1..<n {
    sum[index] = honey[index] + sum[index - 1]
}

var answer: Int = 0

// 벌1 벌2 꿀
for index in 1..<n - 1 {
    answer = max(answer, (sum[n - 1] - honey[0] - honey[index]) + (sum[n - 1] - sum[index]))
}

// 꿀 벌1 벌2
for index in 1..<n - 1 {
    answer = max(answer, (sum[n - 1] - honey[n - 1] - honey[index]) + (sum[index] - honey[index]) )
}

// 벌1 꿀 벌2
for index in 1..<n - 1 {
    answer = max(answer, (sum[index] - honey[0]) + (sum[n - 1] - sum[index - 1] - honey[n - 1]))
}

print(answer)

//7
//9 9 4 1 4 9 9
//결과
//57

//7
//4 4 9 1 9 4 4
//결과
//54


//3
//2 5 4
//결과
//10

// atm 앞에 n명의 사람들이 줄을 섬
// i번 사람이 돈을 인출하는데 걸리는 시간은 pi 이다.
// 앞서 사람이 뽑는 시간 + i번 사람이 돈을 인출하는 시간이 걸린다.
// 필요한 시간의 최솟값을 구하시오.

// 아이디어: 적게 걸리는 순서로 정렬.

let n: Int = Int(readLine()!) ?? 0
let p: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

let sortedP: [Int] = p.sorted()

var answer: Int = 0
var time: Int = 0

for i in 0..<sortedP.count {
    answer += time + sortedP[i]
    time += sortedP[i]
}

print(answer)

/*
 5
 3 1 4 3 2
 */

// 32

// x일 동안 가장 많이 들어온 방문자 수와 그 기간의 개수를 구하시오.

let nx: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 최대 방문자 수가 0명이라면 SAD 출력.

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 1 <= x <= n <= 250,000
// x일 기간을 잡고 n일을 순회하면 O(nx) 걸려서 시간초과.
// 슬라이딩 윈도우.

var sum: Int = Array(input[0..<nx[1]]).reduce(0, +)
var count: Int = 1
var max: Int = sum

for i in 0..<nx[0] - nx[1] {
    // 양쪽에 대해서 연산.
    sum -= input[i]
    sum += input[i + nx[1]]
    
    if sum > max {
        max = sum
        count = 1
    } else if sum == max {
        count += 1
    }
}

if max == 0 {
    print("SAD")
} else {
    print(max)
    print(count)
}

/*
 5 2
 1 4 2 5 1
 */

// 7
// 1

/*
 5 3
 0 0 0 0 0
 */

// SAD

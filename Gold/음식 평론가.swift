// 소시지의 개수 n
// 평론가가 가지는 소시지의 길이 m
// 평론가는 소시지의 n/m 만큼 가진다.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 최대 공약수

func gcd(a: Int, b: Int) -> Int {
    if b == 0 {
        return a
    }
    return gcd(a: b, b: a % b)
}

print(nm[1] - gcd(a: nm[0], b: nm[1]))

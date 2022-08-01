func solution(_ n:Int, _ m:Int) -> [Int] {
    // [최대공약수, 최소공배수]
    return [gcd(n, m), lcm(n, m)]
}

// 최대공약수 구하기
// Greatest Common Divisor(GCD)
func gcd(_ n: Int, _ m: Int) -> Int {
    if (m == 0) {
        return n
    }
    return gcd(m, n % m)
}

// 최소공배수 구하기
// Lowest Common Multiple(LCM)
func lcm(_ n: Int, _ m: Int) -> Int {
    return n * m / gcd(n, m)
}

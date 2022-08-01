func solution(_ arr:[Int]) -> Int {
    // 아이디어 : arr 를 순회하면서 최소공배수를 구한다.
    
    var x = arr[0]
    
    for i in 0..<arr.count - 1 {
        x = lcm(x, arr[i + 1])
    }
    return x
}

func gcd(_ x: Int, _ y: Int) -> Int {
    if y == 0 {
        return x
    }
    return gcd(y, x % y)
}

func lcm(_ x: Int, _ y: Int) -> Int {
    return x * y / gcd(x, y)
}

print(solution([2,6,8,14]))
// 168

print(solution([1,2,3]))
// 6

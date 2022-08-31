// 다이나믹 프로그래밍
func solution(_ n:Int) -> Int {
    // 2 <= n <= 100000
    var array: [Int] = Array(repeating: 0, count: 100001)
    
    array[1] = 1
    
    for index in 2...n {
        // 1234567 의 나머지를 저장하지 않는 경우 테스트 7-14 까지 런타임에러가 나왔다.
        // array[index] = (array[index - 1] + array[index - 2])
        array[index] = (array[index - 1] + array[index - 2]) % 1234567
    }
    
    return array[n]
}


print(solution(3))
// 2

print(solution(5))
// 5

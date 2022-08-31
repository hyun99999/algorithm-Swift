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

// 재귀 호출은 언어마다 재귀 호출을 할 수 있는 횟수가 정해져 있기 때문에 이 횟수를 넘어서 호출하면 런타임 에러.
/*
func solution(_ n: Int) {
  if ( n <= 1 ) {
    return n;
  }
   
  return fibonacci(n-1) + fibonacci(n-2);
}
*/

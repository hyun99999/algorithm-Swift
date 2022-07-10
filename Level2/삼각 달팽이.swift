import Foundation

func solution(_ n:Int) -> [Int] {
    var n = n
    var array: [[Int]] = []
    var number: Int = 1
    
    for i in 0..<n {
        array.append(Array(repeating: 0, count: i + 1))
    }
    var row = -1
    var col = 0
    
    // 중간의 break 문은 한 사이클을 다 돌지 않아도 삼각형이 완성되는 경우가 있기 때문이다. n = 2 인 경우.
    
    while n > 0  {
        // 아래로
        for _ in 0..<n {
            row += 1
            array[row][col] = number
            number += 1
        }
        
        if n - 1 <= 0 {
            break
        }
        
        // 오른쪽으로
        for _ in 0..<n - 1 {
            col += 1
            array[row][col] = number
            number += 1
        }
        
        if n - 2 <= 0 {
            break
        }
        
        // 대각선 위쪽으로 이동
        for _ in 0..<n - 2 {
            row -= 1
            col -= 1
            array[row][col] = number
            number += 1
        }
        
        // 속에 있는 새로운 삼각형을 꾸린다.
        n -= 3
    }
    
    return array.flatMap { $0 }
}

let result = solution(4)
// [1,2,9,3,10,8,4,5,6,7]
print(result)

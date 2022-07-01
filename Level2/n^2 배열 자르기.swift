import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    /*
    var array: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var result = [Int]()

    // 2차원 배열 생성.
    for x in 0..<n {
        var count: Int = 1
        for y in 0..<n {
            if y <= x {
                array[x][y] = x + 1
            } else {
                array[x][y] = count
            }
            count += 1
        }
    }
    
    // 새로운 1차원 배열 생성.
    let newArray: [Int] = array.flatMap { $0 }
    for i in left...right {
        result.append(newArray[Int(i)])
    }

    return result
    // -> 시간 오류. 테스트 케이스만 통과.
    */
    
    // left 와 right 를 가지고 좌표간의 관계 파악.
    let startX = Int(left) / n
    let startY = Int(left) % n
    let endX = Int(right) / n
    let endY = Int(right) % n
    
    var array: [Int] = []
    
    for x in startX...endX {
        for y in 0..<n {
            
            // startX, stratY 보다 작은 경우 계속.
            if x == startX && y < startY {
                continue
            }
            
            // endX, endY 좌표 초과하는 경우 탈출.
            if x == endX && y > endY {
                break
            }
            
            if y <= x {
                array.append(x + 1)
            } else {
                array.append(y + 1)
            }
        }
    }
    
    return array
}

let result = solution(4, 7, 14)
// [4,3,3,3,4,4,4,4]
print(result)

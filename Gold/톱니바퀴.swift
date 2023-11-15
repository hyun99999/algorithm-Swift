// 8개의 톱니를 가진 톱니바퀴 4개
// 톱니는 n또는 s극을 가짐
// 톱니바퀴를 총 k번 회전시킨다.(반시계/시계)
// 맞닿은 톱니가 극이 다르다면 반대 방향으로 회전한다.
// 같으면 회전하지 않는다.
// 최종 톱니바퀴의 상태를 구하시오.

// n 0 / s 1

var geares: [[Int]] = []

for _ in 0..<4 {
    let input: [Int] = readLine()!.map { Int(String($0)) ?? 0 }
    
    geares.append(input)
}

let times: Int = Int(readLine()!) ?? 0

for _ in 0..<times {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    let gear: Int = input[0] - 1
    let direction: Int = input[1]
    
    let firstRightGear: Int = geares[0][2]
    let secondLeftGear: Int = geares[1][6]
    let secondRightGear: Int = geares[1][2]
    let thirdLeftGear: Int = geares[2][6]
    let thirdRightGear: Int = geares[2][2]
    let fourthLeftGear: Int = geares[3][6]
    
    if gear == 0 {
        rotation(direction: direction, gear: 0)
        
        if firstRightGear != secondLeftGear {
            rotation(direction: direction == 1 ? -1 : 1, gear: 1)
            
            if secondRightGear != thirdLeftGear {
                rotation(direction: direction == 1 ? 1 : -1, gear: 2)
                
                if thirdRightGear != fourthLeftGear {
                    rotation(direction: direction == 1 ? -1 : 1, gear: 3)
                }
            }
        }
    }
    if gear == 1 {
        rotation(direction: direction, gear: 1)
        
        if firstRightGear != secondLeftGear {
            rotation(direction: direction == 1 ? -1 : 1, gear: 0)
        }
        if secondRightGear != thirdLeftGear {
            rotation(direction: direction == 1 ? -1 : 1, gear: 2)
            
            if thirdRightGear != fourthLeftGear {
                rotation(direction: direction == 1 ? 1 : -1, gear: 3)
            }
        }
    }
    if gear == 2 {
        rotation(direction: direction, gear: 2)
        
        if secondRightGear != thirdLeftGear {
            rotation(direction: direction == 1 ? -1 : 1, gear: 1)
            
            if firstRightGear != secondLeftGear {
                rotation(direction: direction == 1 ? 1 : -1, gear: 0)
            }
        }
        if thirdRightGear != fourthLeftGear {
            rotation(direction: direction == 1 ? -1 : 1, gear: 3)
        }
    }
    if gear == 3 {
        rotation(direction: direction, gear: 3)
        
        if thirdRightGear != fourthLeftGear {
            rotation(direction: direction == 1 ? -1 : 1, gear: 2)
            
            if secondRightGear != thirdLeftGear {
                rotation(direction: direction == 1 ? 1 : -1, gear: 1)
                
                if firstRightGear != secondLeftGear {
                    rotation(direction: direction == 1 ? -1 : 1, gear: 0)
                }
            }
        }
    }
}

func rotation(direction: Int, gear: Int) {
    if direction == 1 {
        // 시계
        let last: Int = geares[gear].removeLast()
        geares[gear].insert(last, at: 0)
    } else {
        // 반시계
        let first: Int = geares[gear].removeFirst()
        geares[gear].append(first)
    }
}

// 정답 구하기

var answer: Int = 0

for i in 0..<4 {
    if geares[i][0] == 1 {
        if i == 0 {
            answer += 1
        } else if i == 1 {
            answer += 2
        } else if i == 2 {
            answer += 4
        } else {
            answer += 8
        }
    }
}

print(answer)


/*
10101111
01111101
11001110
00000010
2
3 -1
1 1
*/

// 답 7

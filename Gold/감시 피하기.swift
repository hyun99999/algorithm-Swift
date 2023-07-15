// 복도에 나온 학생들은 선생님의 감시에 들키지 않도록 한다.
// 선생님은 상하좌우 방향으로 감시.
// 장애물이 있는 경우 뒤편의 학생은 볼 수 없음.
// 선생님T 학생S 장애물O
// 3개의 장애물을 설치하여 모든 학생들이 감시를 피할 수 있는지 계산.
// 피할 수 있으면 YES 없으면 NO 출력.


// 아이디어: 최대 n은 6이기 때문에 36C3 조합의 수를 가질 수 있음.
// 10,000 이하이기 때문에 완전탐색 가능.
// dfs 를 사용하여 모든 조합을 반환.

let n: Int = Int(readLine()!) ?? 0
// 상하좌우.
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]

var board: [[String]] = Array(repeating: Array(repeating: "", count: n), count: n)
var answer: String = "NO"
/// 선생님들의 위치 정보.
var teachers: [Point] = []
/// 빈 공간 위치 정보.
var spaces: [Point] = []

typealias Point = (row: Int, col: Int)

// MARK: - board 초기화.

for row in 0..<n {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    
    for col in 0..<input.count {
        if input[col] == "T" {
            teachers.append((row, col))
        }
        if input[col] == "X" {
            spaces.append((row, col))
        }
        
        board[row][col] = input[col]
    }
}

/// 선생님이 학생을 찾아내는지 확인.
func find() -> Bool {
    for teacher in teachers {
        for i in 0..<4 {
            var next: Point = (teacher.row, teacher.col)
            
            while true {
                next = (next.row + drow[i], next.col + dcol[i])
                
                if n > next.row && next.row >= 0 &&
                    n > next.col && next.col >= 0 {
                    if board[next.row][next.col] == "O" {
                        break
                    } else if board[next.row][next.col] == "S" {
                        return true
                    }
                } else {
                    break
                }
            }
        }
    }
    return false
}

// MARK: - DFS

func dfs(_ startIndex: Int, _ count: Int) {
    if count == 3 {
        if !find() {
            answer = "YES"
        }
        // 🚨 리턴하지 않으면 시간초과.
        return
    }
    
    for index in startIndex..<spaces.count {
        board[spaces[index].row][spaces[index].col] = "O"
        dfs(index + 1, count + 1)
        board[spaces[index].row][spaces[index].col] = "X"
    }
}

dfs(0, 0)
print(answer)

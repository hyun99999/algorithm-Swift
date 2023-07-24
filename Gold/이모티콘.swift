// 효빈이에게 이모티콘 s개를 보낸다.
// 화면에 이미 이모티콘 1개 입력. 다음의 3가지 연산만을 사용해 이모티콘 s개를 만든다.

// 화면의 모든 이모티콘을 복사해서 저장.
// 붙여넣기. 이때 클립보드에 있는 이모티콘의 개수가 추가됨.
// 이모티콘 중 하나를 삭제

// 모든 연산은 1초. 복사하면 클립보드는 덮어쓰기.
// 최솟값을 구하시오.

let s: Int = Int(readLine()!) ?? 0

// 복사 -> 붙여넣기 -> 붙여넣기도 가능하다. 이때는 총 3초 소요.
typealias Emoticon = (index: Int, clipboard: Int, count: Int)

var queue: [Emoticon] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
var answer: Int = 0

func bfs(_ start: Emoticon) {
    queue.append(start)
    // 🚨 복사 할 때 같은 인덱스 방문.
//    visited[start.index][start.clipboard] = true
    
    while !queue.isEmpty {
        let first: Emoticon = queue.removeFirst()
        
        if first.index == s {
            answer = first.count
            break
        }
        
        // 복사. 1초.
        if !visited[first.index][first.index] {
            queue.append((first.index, first.index, first.count + 1))
            visited[first.index][first.index] = true
        }
        
        // 삭제. 1초.
        if first.index - 1 >= 1 && !visited[first.index - 1][first.clipboard] {
            queue.append((first.index - 1, first.clipboard, first.count + 1))
            visited[first.index - 1][first.clipboard] = true
        }
        
        // 붙여넣기. 1초.
        if first.clipboard != 0 && first.index + first.clipboard <= s
            && !visited[first.index + first.clipboard][first.clipboard] {
            queue.append((first.index + first.clipboard, first.clipboard, first.count + 1))
            visited[first.index + first.clipboard][first.clipboard] = true
        }
    }
}

bfs((1, 0, 0))
print(answer)

// 2
// 2

// 6
// (--> 2 --> 4 -> 6)
// 5

// 18
// (--> 2 -> 3 --> 6 --> 12 -> 18)
// 8

import Foundation

typealias Tuple = (x: Int, y: Int, dist: Int)
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

extension Array where Element == [Character] {
    func BFS(_ x: Int, _ y: Int) -> Bool {
        var tRoom = self
        tRoom[x][y] = "X"
        var queue: [Tuple] = [(x, y, 0)]
        var cur = 0
        while cur < queue.count {
            let nowPos = (x: queue[cur].x, y: queue[cur].y)
            let dist = queue[cur].dist
            cur += 1
            for ddx in dx.indices {
                let nX = nowPos.x + dx[ddx]
                let nY = nowPos.y + dy[ddx]
                if nX < 0 || nX >= 5 || nY < 0 || nY >= 5 || tRoom[nX][nY] == "X" { continue }
                if tRoom[nX][nY] == "P" { return false }
                tRoom[nX][nY] = "X"
                if dist + 1 < 2 {
                    queue.append((nX, nY, dist + 1))
                }
            }
        }
        return true
    }
}

extension Array where Element == String {
    func isGoodRoom() -> Bool {
        let room = self.reduce(into: [[Character]]()) { result, string in
            let array = [Character](string)
            result.append(array)
        }
        for x in room.indices {
            for y in room[x].indices{
                if room[x][y] == "P" && !room.BFS(x, y) {
                    return false
                }
            }
        }
        return true
    }
}

func solution(_ places:[[String]]) -> [Int] {
    return places.reduce(into: [Int]()) { answer, room in
        answer.append(room.isGoodRoom() ? 1 : 0)
    }
}



print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))


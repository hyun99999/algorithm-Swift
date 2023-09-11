import Foundation

// 미리 정해진 명렁어대로 산책을 진행.
func solution(_ park:[String], _ routes:[String]) -> [Int] {
    typealias Point = (row: Int, col: Int)

    var start: Point = (0, 0)
    var newPark: [[String]] = Array(repeating: [], count: park.count)

    for i in 0..<park.count {
        newPark[i] = park[i].map { String($0) }
    }

    for row in 0..<newPark.count {
        for col in 0..<newPark[0].count {
            if newPark[row][col] == "S" {
                start = (row, col)
            }
        }
    }
    
    /// 남북동서.
    let dictionary: [String: Point] = ["N" : (-1, 0), "S": (1, 0), "W": (0, -1), "E": (0, 1)]

    for route in routes {
        var route: [String] = route.split(separator: " ").map { String($0) }
        
        let distance: Int = Int(route[1]) ?? 0
        let d: Point = dictionary[route[0]]!
        
        var isAvailable: Bool = true
        var end: Point = (start.row, start.col)
        
        for _ in 0..<distance {
            let next: Point = (end.row + d.row, end.col + d.col)
            
            if 0 <= next.row && next.row < newPark.count &&
                0 <= next.col && next.col < newPark[0].count &&
                newPark[next.row][next.col] != "X" {
                end = (next.row, next.col)
            } else {
                isAvailable = false
                break
            }
        }
        
        if isAvailable {
            start = end
        }
    }

    return [start.row, start.col]
}

//print(solution(["SOO","OXX","OOO"], ["E 2","S 2","W 1"]))
// [0, 1]
print(solution(["OSO", "OOO", "OXO", "OOO"], ["E 2", "S 3", "W 1"]))
// [0, 0]

import Foundation

func solution(_ dirs:String) -> Int {
    let direction: [String : [Int]] = ["U" : [0, -1], "D" : [0, 1], "R" : [1, 0], "L" : [-1, 0]]
    
    var dx: Int = 0
    var dy: Int = 0
    var x: Int = 0
    var y: Int = 0
    var visted: Set<String> = []

    let dirArray = dirs.map { String($0) }

    dirArray.forEach {
        dx += direction[$0]![0]
        dy += direction[$0]![1]

        // 좌표 평면 안으로 이동.
        if dx >= -5 && dx <= 5 && dy <= 5 && dy >= -5 {
            // 간 곳인지 체크.
            if !(visted.contains("\(x),\(y)->\(dx),\(dy)") && visted.contains("\(dx),\(dy)->\(x),\(y)")) {
                visted.insert("\(x),\(y)->\(dx),\(dy)")
                visted.insert("\(dx),\(dy)->\(x),\(y)")
            }
        } else {
            dx -= direction[$0]![0]
            dy -= direction[$0]![1]
        }
        x = dx
        y = dy
    }

    // 왕복에 대한 set 이기 때문에 나누기 2.
    return visted.count / 2
}

print(solution("ULURRDLLU"))

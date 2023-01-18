import Foundation

// 선들이 교점 중 정수가 되는 교점을 구하고 별이 출력되는 직사각형을 출력.
// line 에는 Ax + By + C = 0 으로 표현되는 매개변수가 들어있음.
func solution(_ line:[[Int]]) -> [String] {
    // ✅아이디어:
    // Ax + By + E = 0
    // Cx + Dy + F = 0
    // 교점은 x = (BF-ED)/(AD-BC)
    // y = (EC-AF)/(AD-BC)
    // AD-BC = 0 인 경우 평행 또는 일치.(문제 설명에서 일치한 경우는 없다고 나옴.)
    
    var locations: [(x: Int, y: Int)] = []
    
    var maxX: Int = Int.min
    var minX: Int = Int.max
    var maxY: Int = Int.min
    var minY: Int = Int.max
    
    // 세워둔 공식을 기반으로 교점의 set 배열 생성.
    for i in 0..<line.count - 1 {
        for j in i + 1..<line.count {
            let adbc = line[i][0] * line[j][1] - line[i][1] * line[j][0]
            let bfed = line[i][1] * line[j][2] - line[i][2] * line[j][1]
            let ecaf = line[i][2] * line[j][0] - line[i][0] * line[j][2]
            
            if adbc != 0 && bfed % adbc == 0 && ecaf % adbc == 0 {
                locations.append((bfed / adbc, ecaf / adbc))
                
                maxX = max(maxX, bfed / adbc)
                minX = min(minX, bfed / adbc)
                maxY = max(maxY, ecaf / adbc)
                minY = min(minY, ecaf / adbc)
            }
        }
    }
    
    // 별 출력.
    var array: [[String]] = Array(repeating: Array(repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)
    
    for location in locations {
        array[location.y - minY][location.x - minX] = "*"
    }
    
    return array.reversed().map { $0.reduce("", +) }
}

// 참고 : https://hogumachu.tistory.com/19

print(solution([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]]))
// ["....*....", ".........", ".........", "*.......*", ".........", ".........", ".........", ".........", "*.......*"]

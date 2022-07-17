import Foundation

func solution(_ name:String) -> Int {
    //    ▲ - 다음 알파벳
    //    ▼ - 이전 알파벳 (A에서 아래쪽으로 이동하면 Z로)
    //    ◀ - 커서를 왼쪽으로 이동 (첫 번째 위치에서 왼쪽으로 이동하면 마지막 문자에 커서)
    //    ▶ - 커서를 오른쪽으로 이동 (마지막 위치에서 오른쪽으로 이동하면 첫 번째 문자에 커서)
    // A = 65, Z = 90
    let aValue: Int = Int(Character("A").asciiValue!)
    let zValue: Int = Int(Character("Z").asciiValue!)
    
//    let name: [String.Element] = name.map { $0 }
    // Array 를 사용해서 [String.Element] 타입을 만들 수 있다.
    // String 의 서브스크립트를 활용할 경우 아래와 같이 사용하면 좋을 것 같다.
    let name = Array(name)
    
    var result: Int = 0
    
    /// 각 문자에 대한 알파벳 설정.
    func stickUpDown(c: Character) -> Int {
        // Character 타입으로 asciiValue 프로퍼티 사용.
        let ascii = Int(c.asciiValue!)
        
        // c 가 앞에서 가까운지 뒤에서 가까운지 판별.
        let front = ascii - aValue
        let back = zValue - ascii + 1
        
        return min(front, back)
    }
    
    // i 의 타입은 String.Element
    // typealias Element = Character
    for i in name {
        result += stickUpDown(c: i)
    }
    
    //MARK: - 이미 각 자리에 대한 설정은 끝남. 각 자리에 도달하는데 걸리는 진행횟수 구하기.
    
    // min(진행 방향으로 진행 회수, 반대 방향으로 진행 횟수) 구하기.
    
    // 진행 방향으로 끝까지 진행.
    var count: Int = name.count - 1
    // 진행, 반대 방향으로 갔다가 되돌아가기
    for i in 0..<name.count {
        var nextIndex = i + 1
        while nextIndex < name.count && name[nextIndex] == "A" {
            nextIndex += 1
        }
        // 진행 방향으로 갔다가 되돌아가기
        let moveFront = i * 2 + (name.count - nextIndex)
        // 반대 방향으로 갔다가 되돌아가기
        let moveBack = (name.count - nextIndex) * 2 + i
        
        count = min(count, moveFront)
        count = min(count, moveBack)
    }
    result += count
    
    return result
}

print(solution("JEROEN"))
// 56

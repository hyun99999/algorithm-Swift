import Foundation

// ✅ 아이디어 : O(n) 이 아닌 O(1) 로 삽입,삭제 연산을 하기 위해서 링크드리스트를 구현해서 사용.
// struct 는 재귀적으로 포함하는 저장 프로퍼티를 가질 수 없기때문에 Class 로 선언
class Node {
    var data: Int = 0
    var next: Node?
    var prev: Node?
    
    init(data: Int, next: Node? = nil, prev: Node? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}

// 정확성 + 효율성 검사를 진행함.
func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    // 명령어 기반 표의 행 선택, 삭제, 복구 프로그램
    // D : 행 선택
    // C : 삭제, 아래 행 선택. 마지막 행이라면 그 위에 행 선택
    // Z : 삭제 복구. 현제 선택된 행은 바뀌지 않음.
    
    // 삭제는 stack 구조로 최근에 삭제된 인덱스 저장.
    // 표의 범위를 벗어나는 이동은 입력으로 주어지지 않음.
    
    var linkedList: [Node] = []
    var answer: [String] = Array(repeating: "O", count: n)
    var stack: [Node] = []
    
    // linkedList 초기화
    for index in 0..<n {
        linkedList.append(Node(data: index))
    }
    
    linkedList[0].next = linkedList[1]
    for index in 1..<n - 1 {
        linkedList[index].prev = linkedList[index - 1]
        linkedList[index].next = linkedList[index + 1]
    }
    
    linkedList[n - 1].prev = linkedList[n - 2]
    //

    var cursor: Node = linkedList[k]
    
    for index in 0..<cmd.count {
        let commend:[String] = cmd[index].components(separatedBy: " ")
        if commend[0] == "D" {
            // 아래로 이동
            for _ in 0..<Int(commend[1])! {
                cursor = cursor.next!
            }
        } else if commend[0] == "U" {
            // 위로 이동
            for _ in 0..<Int(commend[1])! {
                cursor = cursor.prev!
            }
        }
        else if commend[0] == "C" {
            // 삭제
            answer[cursor.data] = "X"
            stack.append(cursor)
            
            cursor.prev?.next = cursor.next
            cursor.next?.prev = cursor.prev
            if cursor.next == nil {
                cursor = cursor.prev!
            } else {
                cursor = cursor.next!
            }
        } else {
            // 삭제 복구
            let restoredNode = stack.removeLast()
            answer[restoredNode.data] = "O"
            restoredNode.next?.prev = restoredNode
            restoredNode.prev?.next = restoredNode
        }
    }
    
    return answer.joined()
}

print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]))
// "OOXOXOOO"

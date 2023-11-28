// 두 팀으로 나눠 같은 곳을 다른 순서로 방문해서 먼저 순회를 마친 팀이 승리하는 것
// 방문 할 곳이 이진트리의 노드가 됨
// 모든 노드는 서로 다른 x값
// 같은 레벨에 있는 노드는 같은 y좌표
// 자식 노드의 y값은 부모 보다 항상 작다
// V의 왼쪽 서브 트리 x값은 V의 x값보다 작다
// V의 오른쪽 서브 트리 x값은 V의 x값보다 크다
 
// 이진트리에 대해서 전위 순회, 후위 순회 반환.

import Foundation

class Node {
    var key: Int
    var x: Int
    var left: Node?
    var right: Node?
    
    init(key: Int, x: Int, left: Node? = nil, right: Node? = nil) {
        self.key = key
        self.x = x
        self.left = left
        self.right = right
    }
}

class BinarySerachTree {
    var root: Node?
    
    // 노드를 삽입하는 과정은 트리의 높이만큼
    // O(logN)
    
    func insert(key: Int, x: Int) {
        let newNode = Node(key: key, x: x)
        self.root = self.insert(from: root, newNode: newNode)
    }
    
    func insert(from node: Node?, newNode: Node) -> Node {
        guard let node  = node else {
            return newNode
        }
        
        if newNode.x < node.x {
            node.left = insert(from: node.left, newNode: newNode)
        } else {
            node.right = insert(from: node.right, newNode: newNode)
        }
        
        return node
    }
    
    // O(N)
    func preorder() -> [Int] {
        var result: [Int] = []
        self.preorder(node: root, result: &result)
        
        return result
    }
    
    private func preorder(node: Node?, result: inout [Int]) {
        guard let node = node else { return }
        result.append(node.key)
        preorder(node: node.left, result: &result)
        preorder(node: node.right, result: &result)
    }
    
    func postorder() -> [Int] {
        var result: [Int] = []
        self.postorder(node: root, result: &result)
        
        return result
    }
    
    private func postorder(node: Node?, result: inout [Int]) {
        guard let node = node else { return }
        postorder(node: node.left, result: &result)
        postorder(node: node.right, result: &result)
        result.append(node.key)
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var index: Int = 0
    
    // node 에 index 를 포함하여 순회할 때 사용.
    let sortedNodes: [[Int]] = nodeinfo.map {
        index += 1
        return $0 + [index]
    }.sorted { $0[1] > $1[1] }
    
    var bst = BinarySerachTree()
    
    for node in sortedNodes {
        let x: Int = node[0]
        let key: Int = node[2]
        
        bst.insert(key: key, x: x)
    }
    
    return [bst.preorder(), bst.postorder()]
}

print(solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]))
// [[7,4,6,9,1,8,5,2,3],[9,6,5,8,1,4,3,2,7]]

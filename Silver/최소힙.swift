// 최소 힙을 구현
// 배열에 자연수 x를 넣는다.
// 배열에서 가장 작은 수를 출력, 제거한다.
import Foundation

// 힙은 완전 이진 트리
// 왼쪽 오른쪽 크기 상관 없음.

struct MinHeap<T: Comparable> {
    var heap: [T] = []
    
    init() { }
    init(_ element: T) {
        heap.append(element) // 0번째 인덱스 채우기.
        heap.append(element)
    }
    
    mutating func insert(_ element: T) {
        if heap.isEmpty {
            heap.append(element)
            heap.append(element)
            
            return
        }
        
        heap.append(element)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {
                // root node
                return false
            }
            let parentIndex: Int = insertIndex / 2
            
            return heap[insertIndex] < heap[parentIndex] ? true : false
        }
        
        var insertIndex = heap.count - 1
        
        while isMoveUp(insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus {
        case left
        case right
        case none
    }
    
    mutating func pop() -> T? {
        if heap.count <= 1 {
            return nil
        }
        
        let returnElement: T = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex: Int = poppedIndex * 2
            let rightChildIndex: Int = poppedIndex * 2 + 1
            
            // 1.왼쪽 자식 노드가 없는 경우.
            if leftChildIndex >= heap.count {
                return .none
            }
            
            // 2.왼쪽 자식 노드만 있는 경우.
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] < heap[poppedIndex] ? .left : .none
            }
            
            // 3.왼쪽 오른쪽 자식 노드 모두 있는 경우.
            // 3-1.자식들이 자신보다 큰 경우.
            if heap[leftChildIndex] > heap[poppedIndex] && heap[rightChildIndex] > heap[poppedIndex] {
                return .none
            }
            
            // 3-2.자식들이 자신보다 모두 작은 경우.
            if heap[leftChildIndex] < heap[poppedIndex] && heap[rightChildIndex] < heap[poppedIndex] {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            // 3-3.자식들 중 하나만 자신보다 작은 경우.
            if heap[leftChildIndex] < heap[poppedIndex] || heap[rightChildIndex] < heap[poppedIndex] {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            return .none
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .left:
                let leftChiledIndex = poppedIndex * 2
                heap.swapAt(leftChiledIndex, poppedIndex)
                poppedIndex = leftChiledIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(rightChildIndex, poppedIndex)
                poppedIndex = rightChildIndex
            case .none:
                return returnElement
            }
        }
    }
}
// 출처 : https://babbab2.tistory.com/109

let n: Int = Int(readLine()!) ?? 0

var heap: MinHeap<Int> = MinHeap()

for _ in 0..<n {
    let x: Int = Int(readLine()!) ?? 0
    
    if x == 0 {
        // 가장 작은 수를 출력, 제거.
        // 배열이 비어있다면 0 출력.
        print(heap.pop() ?? 0)
    } else {
        // x 추가.
        heap.insert(x)
    }
}

/*
9
0
12345678
1
2
0
0
0
0
32
 */

/*
 0
 1
 2
 12345678
 0
 */

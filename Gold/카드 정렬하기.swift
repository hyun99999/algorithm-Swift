// 정렬된 숫자 카드
// 두 묶음을 합쳐서 하나로 만들려면 A+B의 비교 해야한다.

// 매우 많은 숫자 카드 묶음이 있다. 두 묶음씩 골라 합쳐나간다면 고르는 순서에 따라서 비교 횟수가 달라진다.
// 최소한 몇 번의 비교가 필요한지 구하시오

let n: Int = Int(readLine()!) ?? 0

// 최대 1,000장씩 최대 100,000 묶음
// O(nm) 시간초과 예상

// 문제를 해석하자면, 항상 가장 작은 두 개의 묶음을 비교
// ✅ 우선 순위큐

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

var heap: MinHeap<Int> = MinHeap()

for _ in 0..<n {
    heap.insert(Int(readLine()!) ?? 0)
}

var answer: Int = 0

for _ in 0..<n - 1 {
    let sum: Int = heap.pop()! + heap.pop()!
    answer += sum
    heap.insert(sum)
}

print(answer)

/*
3
10
20
40
*/

// 100

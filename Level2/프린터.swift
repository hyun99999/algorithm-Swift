import Foundation

// 큐
func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities = priorities
    var indexes: [Int] = []
    var printedList: [Int] = []
    
    for i in 0..<priorities.count {
        indexes.append(i)
    }
    
    while !priorities.isEmpty {
        if priorities.count == 1 {
            priorities.removeFirst()
            printedList.append(indexes.removeFirst())
            break
        } else {
            let priority = priorities.removeFirst()
            if priority >= priorities.max()! {
                printedList.append(indexes.removeFirst())
            } else {
                priorities.append(priority)
                
                let index = indexes.removeFirst()
                indexes.append(index)
            }
        }
    }
    
    return printedList.firstIndex(of: location)! + 1
}

let result = solution([2, 1, 3, 2], 2)
print(result)

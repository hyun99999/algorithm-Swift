func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    // 디비에서 게시물을 가져오는 시간이 오래 걸림.
    // 캐시를 적용하여 hit 1 / miss 5
    
    var time: Int = 0
    var queue: [String] = []
    
    for city in cities {
        // 테스트케이스를 통해 대소문자를 구분하지 않음을 알아냄.
        let city = city.lowercased()
        if queue.contains(city) {
            queue.remove(at: queue.firstIndex(of: city)!)
            queue.append(city)
            time += 1
        } else {
            time += 5
            queue.append(city)
            if queue.count > cacheSize {
                queue.removeFirst()
            }
        }
    }
    
    return time
}

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
// 50

print(solution(0, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
// 0

print(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))
// 16

import Foundation

// cpp, java, python
// backend, forntend
// junior, senior
// chicken, pizza

// 형식
// 개발언어 직군 경력 소울푸드 점수

func solution(_ info:[String], _ query:[String]) -> [Int] {
    // split -> [Substring]
    //    let infoes: [[String.SubSequence]] = info.map { $0.split(separator: " ") }
    //    let queries: [[String.SubSequence]] = query.map { $0.split(separator: " ").filter { $0 != "and" } }
    var db: [String : [Int]] = [:]
    // components -> [String]
    let infoes: [[String]] = info.map { $0.components(separatedBy: " ") }
    let queries: [[String]] = query.map { $0.components(separatedBy: " ").filter { $0 != "and" } }
    var result: [Int] = []
    
    // 아이디어 : 해당 점수는 - 쿼리문에도 포함될 수 있다. - 를 포함한 쿼리문도 만듦.
    for info in infoes {
        let languages = [info[0], "-"]
        let jobs = [info[1], "-"]
        let careers = [info[2], "-"]
        let foods = [info[3], "-"]
        let score = Int(info[4])!
        
        // db 생성
        for language in languages {
            for job in jobs {
                for career in careers {
                    for food in foods {
                        let key = language + job + career + food
                        if db[key] == nil {
                            db[key] = [score]
                        } else {
                            db[key]!.append(score)
                        }
                    }
                }
            }
        }
    }
    
    // 효율성
    // 이진 탐색. 정렬된 배열 필요함.
    
    // 오름차순 정렬 배열.
    for i in db {
        let sortedArray = i.value.sorted()
        db[i.key] = sortedArray
    }
    
    // query 문으로 db 탐색
    for query in queries {
        let key = query[0] + query[1] + query[2] + query[3]
        let score = Int(query[4])!
        
        if let scores = db[key] {
            // 이진 탐색.
            var low = 0
            var mid = 0
            var high = scores.count - 1
            
            while low <= high {
                mid = (low + high) / 2
                // scores[mid] 를 포함하는 경우 low 가 아닌 high 를 빼서 result 에 추가해야 한다.
                if scores[mid] < score {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            result.append(scores.count - low)
        } else {
            // 존재 하지 않는 db
            result.append(0)
        }
    }
    
    return result
}

// 쿼리문을 통한 검색에서 효율성 테스트.
// 선형 검색이 아닌 이진 탐색을 사용.

print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"],
               ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
// [1,1,1,1,2,4]

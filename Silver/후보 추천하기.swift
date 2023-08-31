// 학생회장 후보는 학생의 추천에 의하여 정해진 수만큼 선정된다.
// 사진틀에 후보의 사진을 게시하고, 추천횟수를 표시하는 규칙은 다음과 같다.

// 1.모든 사진틀은 비어있다.
// 2.추천받으면 학생은 사진틀에 게신된다.
// 3.비어있는 사진틀이 없는 경우, 추천 받은 횟수가 가장 적은 학생의 사진을 삭제, 새롭게 추천받은 학생의 사진을 게시. 횟수가 같다면 오래된 사진이 삭제.
// 4.이미 있는 후보가 추천받으면 추천횟수만 증가.
// 5.삭제되는 경우, 학생의 추천횟수는 0

// 최종 후보를 결정하시오.

/// 사진틀의 개수
let n: Int = Int(readLine()!) ?? 0
/// 총 추천 횟수
let x: Int = Int(readLine()!) ?? 0
/// 추천받은 학생 배열
let y: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

/// [학생: (횟수, 시간)]
var dictionary: [Int: (count: Int, time: Int)] = [:]

for i in 0..<y.count {
    if dictionary[y[i]] != nil {
        // 사진틀에 학생이 있다.
        dictionary[y[i]]!.count += 1
    } else {
        // 사진틀에 학생이 없다.
        if dictionary.count < n {
            // 사진틀에 학생을 넣을 수 있다.
            dictionary[y[i]] = (1, i)
        } else {
            // 사진틀에 학생을 넣을 수 없다.
            let sortedDictionary = dictionary.sorted {
                if $0.value.count == $1.value.count {
                    // 추천 횟수가 동일.
                    return $0.value.time < $1.value.time
                } else {
                    // 추천 횟수순으로 정렬.
                    return $0.value.count < $1.value.count
                }
            }
            let deletedStudent: Int = sortedDictionary[0].key
            
            dictionary[deletedStudent] = nil
            dictionary[y[i]] = (1, i)
        }
    }
}

print(dictionary.sorted { $0.key < $1.key }.map { String($0.key) }.joined(separator: " "))

/*
3
9
2 1 4 3 5 6 2 7 2
*/

// 답: 2 6 7

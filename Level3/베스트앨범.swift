import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    // 장르별로 가장 많이 재생된 노래 두 개씩
    // 가장 많이 노래가 재생된 장르부터 수록
    // 장르 내에 많이 재생된 노래부터 수록
    // 같다면 고유번호가 낮은 노래 먼저 수록
    
    var genreDictionary: [String : Int] = [:]
    /// plays 의 인덱스를 저장.
    var playDictionary: [String : [Int]] = [:]
    
    for index in 0..<genres.count {
        if playDictionary[genres[index]] == nil {
            genreDictionary[genres[index]] = plays[index]
            playDictionary[genres[index]] = [index]
        } else {
            genreDictionary[genres[index]]! += plays[index]
            playDictionary[genres[index]]!.append(index)
        }
    }
    
    // ✅ dictionary 를 정렬하기 위해서 Array 로 변환 후 정렬.
    let sortedGenres: [String] = Array(genreDictionary.keys).sorted { genreDictionary[$0]! > genreDictionary[$1]! }
    
    var answer: [Int] = []
    for sortedGenre in sortedGenres {
        let plays: [Int] = playDictionary[sortedGenre]!.sorted { plays[$0] > plays[$1] }
        
        answer.append(plays[0])
        if plays.count > 1 {
            answer.append(plays[1])
        }
    }
    
    return answer
}

print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
// [4, 1, 3, 0]

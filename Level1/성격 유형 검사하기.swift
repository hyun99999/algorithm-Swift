import Foundation

// 첫 번째 문자 : 비동의 1-3
// 4
// 두 번째 문자 : 동의 5-7
func solution(_ survey:[String], _ choices:[Int]) -> String {
    var choiceDictionary: [Character : Int] = [:]
    choiceDictionary = ["R" : 0, "T" : 0, "C" : 0, "F" : 0, "J" : 0, "M" : 0, "A" : 0, "N" : 0]
    var answer: String = ""
    
    for (index, choice) in choices.enumerated() {
        let survey = survey[index].map { $0 }
        
        if choice >= 1 && choice <= 3 {
            choiceDictionary[survey[0]]! += 4 - choice
        } else if choice >= 5  && choice <= 7 {
            choiceDictionary[survey[1]]! += choice - 4
        } else {
            // choice == 4
            continue
        }
    }
    
    if choiceDictionary["R"]! >= choiceDictionary["T"]! {
        answer += "R"
    } else {
        answer += "T"
    }

    if choiceDictionary["C"]! >= choiceDictionary["F"]! {
        answer += "C"
    } else {
        answer += "F"
    }
    
    if choiceDictionary["J"]! >= choiceDictionary["M"]! {
        answer += "J"
    } else {
        answer += "M"
    }
    
    if choiceDictionary["A"]! >= choiceDictionary["N"]! {
        answer += "A"
    } else {
        answer += "N"
    }
    
    return answer
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
// "TCMA"

print(solution(["TR", "RT", "TR"], [7, 1, 3]))
// "RCJA"

import Foundation

func solution(_ s:String) -> String {
    // Returns an array.
    let array = s.components(separatedBy: " ")
    
    var answer: String = ""
    for i in array {
        for (index, value) in i.enumerated() {
            answer += index % 2 == 0 ? value.uppercased() : value.lowercased()
        }
        answer += " "
    }
    
    answer.removeLast()
   
    return answer
}

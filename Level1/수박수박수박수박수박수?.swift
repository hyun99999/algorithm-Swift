func solution(_ n:Int) -> String {
    var answer: String = ""
    
    for n in 0..<n {
        answer += n % 2 == 0 ? "수" : "박"
    }
    return answer
}

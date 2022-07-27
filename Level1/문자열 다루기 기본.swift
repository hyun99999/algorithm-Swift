func solution(_ s:String) -> Bool {
    // if s.count == 4 || s.count == 6 {
    //     if let s = Int(s) {
    //         return true
    //     }
    //     else { return false }
    // } else { return false }
    
    return (s.count == 4 || s.count == 6) && Int(s) != nil ? true : false
}

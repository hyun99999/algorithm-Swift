func solution(_ phone_number:String) -> String {
    return "\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))"
}

print(solution("01033334444"))
// "*******4444"

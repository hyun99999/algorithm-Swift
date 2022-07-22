import Foundation

func solution(_ n:Int) -> Int {
    return String(n).map { String($0) }.map { Int($0)!}.reduce(0, +)
}

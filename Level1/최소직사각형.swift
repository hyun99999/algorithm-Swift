import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    let sorted = sizes.map { $0.sorted() }
    return sorted.map { $0[0] }.max()! * sorted.map { $0[1] }.max()!
}

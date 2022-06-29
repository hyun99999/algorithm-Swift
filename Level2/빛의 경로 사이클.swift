//
//  main.swift
//  test
//
//  Created by kimhyungyu on 2022/06/29.
//

import Foundation

struct Location: Equatable {
    var x, y: Int
    var d: String
}

func solution(_ grid:[String]) -> [Int] {
    // 좌표에 더할 다음 진행방향.
    let dValue = ["up" : (0, -1), "down" : (0, 1), "left" : (-1, 0), "right" : (1, 0)]
    // "S", "L", "R" 의 4방향에 따른 다음 진행방향.
    let next: [String : [String : String]] = ["L" : ["down" : "right", "right" : "up", "left" : "down", "up" : "left"],
                                              "R" : ["down" : "left", "right" : "down", "left" : "up", "up" : "right"],
                                              "S" : ["down" : "down", "right" : "right", "left" : "left", "up" : "up"]]
    let g = grid.map { $0.map { String($0) } }
    // x, y 좌표
    let x = g[0].count
    let y = g.count
    
    // grid 의 칸이 가지는 방문 여부.
    var visited = Array(repeating: Array(repeating: ["up" : false, "down" : false, "left" : false, "right" : false], count: x), count: y)
    
    var answer: [Int] = []
    
    for y in 0..<y {
        for x in 0..<x {
            for d in dValue.keys {
                // 4방향에 대해서 확인
                let first = Location(x: x, y: y, d: d)
                var location: Location = first
                var count: Int = 0
                while true {
                    // 방문한 곳인 경우 종료. while 탈출 조건.
                    if visited[location.y][location.x][location.d]! { break }
                    
                    visited[location.y][location.x][location.d] = true
                    count += 1
                    
                    let direction = g[location.y][location.x]
                    // 다음 location 설정.
                    location.d = next[direction]![location.d]!
                    location.x += dValue[location.d]!.0
                    location.y += dValue[location.d]!.1
                    
                    // 끝에 도달했을 때 반대편으로 이동.
                    location.x = location.x < 0 ? g[0].count - 1 : location.x % g[0].count
                    location.y = location.y < 0 ? g.count - 1 : location.y % g.count
                    
                    // 사이클이 만들어지는 경우. while 탈출 조건.
                    if location == first {
                        answer.append(count)
                        break
                    }
                }
            }
        }
    }
    
    // 오름차순.
    return answer.sorted()
}

let result = solution(["SL", "LR"])
//let result = solution(["S"])
print(result)

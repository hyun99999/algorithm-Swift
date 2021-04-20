//
//  main.swift
//  cranePickGame-CodingTest
//
//  Created by kimhyungyu on 2021/04/20.
//

import Foundation


func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var count = 0
    var basket = [Int]()
    var board = board
    
    for i in moves {
        let index = i - 1
        for j in 0..<board.count {
            if board[j][index] != 0 {
                basket.append(board[j][index])
                board[j][index] = 0
                
                break
            }
        }
        if basket.count > 1 && basket[basket.count - 1] == basket[basket.count - 2] {
            count += 2
            print(basket.removeLast())
            print(basket.popLast())
            
        }
        
    }
    return count
}

var board = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]

let moves = [1,5,3,5,1,2,1,4]


print(solution(board, moves))

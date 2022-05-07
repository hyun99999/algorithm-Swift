//
//  main.swift
//  양과 늑대
//
//  Created by kimhyungyu on 2022/05/06.
//

import Foundation

var tree: [Int : [Int]] = [:]

// 정점들끼리의 간선을 연결
func connectEdge(_ edges:[[Int]]) {
    for edge in edges {
        if tree[edge[0]] == nil {
            tree[edge[0]] = [edge[1]]
        } else {
            tree[edge[0]]?.append(edge[1])
        }
    }
}


func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    // tree 생성.
    connectEdge(edges)
    
    // 양 최대값.
    var result = 0
    // 깊이 우선 탐색 활용.
    func dfs(_ node: Int, _ nextNodes: [Int], _ sheep: Int, _ wolf: Int) {
        var newNextNodes = nextNodes
        var wolfCount: Int = wolf
        var sheepCount:Int = sheep
        
        if info[node] == 0 {
            // 양
            sheepCount += 1
        } else {
            // 늑대
            wolfCount += 1
        }
        
        if wolfCount >= sheepCount { return }
        result = max(result, sheepCount)
        
        newNextNodes.append(contentsOf: tree[node] ?? [])
        if let index = newNextNodes.firstIndex(of: node) {
            newNextNodes.remove(at: index)
        }
        for i in newNextNodes {
            dfs(i, newNextNodes, sheepCount, wolfCount)
        }
    }
    dfs(0, [0], 0, 0)
    return result
}

let result = solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]])
print(result)

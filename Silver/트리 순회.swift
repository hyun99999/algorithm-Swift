//전위 순회, 중위 순회, 후위 순회 한 결과를 출력 하시오.
// 모든 노드 탐색. dfs

typealias Node = (parent: String, child: String)

let n: Int = Int(readLine()!) ?? 0

var tree: [String : [String]] = [:]
// 전위, 중위, 후위 순회.
var answer: [String] = Array(repeating: "", count: 3)

for _ in 0..<n {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    
    tree[input[0], default: []] += [input[1], input[2]]
}

func dfs(_ node: String) {
    // 종료 조건.
    if node == "." {
        return
    }
    
    // 전위
    answer[0].append(node)
    dfs(tree[node, default: []][0])
    // 중위
    answer[1].append(node)
    dfs(tree[node, default: []][1])
    // 후위
    answer[2].append(node)
}

// A 는 root.
dfs("A")

answer.forEach { print($0) }

/*
 7
 A B C
 B D .
 C E F
 E . .
 F . G
 D . .
 G . .
 */

/*
 ABDCEFG
 DBAECFG
 DBEGFCA
 */

// 출처: https://jeong9216.tistory.com/331

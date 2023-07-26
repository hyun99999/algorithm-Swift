// 혜빈이는 한 번 입었던 옷은 절대 다시 입지 않는다.
// 의상들이 주어졌을때 며칠동안 입을 수 있을까?

let t: Int = Int(readLine()!) ?? 0

for _ in 0..<t {
    /// 0 <= n <= 30
    let n: Int = Int(readLine()!) ?? 0
    
    var dictionary: [String: [String]] = [:]
    
    if n == 0 {
        print(0)
        
        continue
    }
    
    for _ in 0..<n {
        let input: [String] = readLine()!.split(separator: " ").map { String($0) }
        
        dictionary[input[1], default: []] += [input[0]]
    }
    
    var count: Int = 1
    
    // 의상 종류 + 해당 의상을 입지 않는 경우.
    for clothes in dictionary {
        count *= clothes.value.count + 1
    }

    // 모두 입지 않는 경우 1뺌.
    print(count - 1)
}

/*
 2
 3
 hat headgear
 sunglasses eyewear
 turban headgear
 3
 mask face
 sunglasses face
 makeup face
 */


// 5
// 3

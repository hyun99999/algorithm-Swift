// 포켓몬 도감에서 이름을 보고 번호를 말하거나
// 번호를 보고 이름을 말해보자.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var nameDictionary: [String : Int] = [:]
var numberDictionary: [Int : String] = [:]

for n in 1...nm[0] {
    let input: String = readLine()!
    
    nameDictionary[input, default: 0] = n
    numberDictionary[n, default: ""] = input
}

for _ in 0..<nm[1] {
    let input: String = readLine()!
    
    if let input = Int(input) {
        print(numberDictionary[input, default: ""])
    } else {
        print(nameDictionary[input, default: 0])
    }
}

/*
26 5
Bulbasaur
Ivysaur
Venusaur
Charmander
Charmeleon
Charizard
Squirtle
Wartortle
Blastoise
Caterpie
Metapod
Butterfree
Weedle
Kakuna
Beedrill
Pidgey
Pidgeotto
Pidgeot
Rattata
Raticate
Spearow
Fearow
Ekans
Arbok
Pikachu
Raichu
25
Raichu
3
Pidgey
Kakuna
*/

/*
 Pikachu
 26
 Venusaur
 16
 14
 */

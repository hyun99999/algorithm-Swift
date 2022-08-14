import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    // skill : 선행 스킬 순서
    // skill_trees : 스킬
    
    let answer = skill_trees.filter { skillTree in
        // 선행 스킬들만 추출.
        let preSkills: String = skillTree.filter { skill.contains($0) }
        // 선행 스킬들만 추출해서 prefix 확인.
        return skill.hasPrefix(preSkills)
    }.count
    
    // 가능한 스킬트리 개수 반환.
    return answer
}

print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
// 2

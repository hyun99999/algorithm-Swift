def solution(nums):
    sets = set(nums)
    answer = 0
    
    if len(nums) / 2 > len(sets):
        answer = len(sets)
    else:
        answer = len(nums) / 2
    
    return answer
    

solution([3,1,2,3])
# 2

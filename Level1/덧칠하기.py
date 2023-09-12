def solution(n, m, section):
    # 일부만 페인트를 새로 칠하여 예산을 아끼려고 한다.
    # 롤러의 길이는 m미터
    # 벽은 n미터
    # 최소로 페인트를 칠하시오.
    start = section[0]
    end = start + m - 1
    answer = 1
    
    for i in range(1, len(section)):
        if end >= section[i]:
            continue
        else:
            start = section[i]
            end = start + m - 1
            answer += 1
    
    return answer

print(solution(8, 4, [2, 3, 6]))
# 2

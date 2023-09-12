def solution(wallpaper):
    # 빈칸은 . 파일이 있는 칸은 #
    minX, minY, maxX, maxY = 50, 50, 0, 0
    
    for row in range(len(wallpaper)):
        for col in range(len(wallpaper[0])):
            if wallpaper[row][col] == "#":
                minX = min(minX, row)
                minY = min(minY, col)
                maxX = max(maxX, row)
                maxY = max(maxY, col)
    
    answer = [minX, minY, maxX + 1, maxY + 1]
    
    return answer

print(solution([".#...", "..#..", "...#."]))
# [0, 1, 3, 4]

import Foundation

func solution(_ board:[[Int]]) -> Int {

    let row = board.count
    let col = board.count
    var visitArray = [[Int]:Int]()


    // 항상 두번째요소가 최신.
    func canRotate(loc1:(Int,Int),loc2:(Int,Int)) ->  [[Int]] {
        var rotateList = [[Int]]()
        //가로일때,
        if loc1.0 == loc2.0 {
            var leftLoc = loc1
            var rightLoc = loc2
            if loc1.1 > loc2.1 {
                leftLoc = loc2
                rightLoc = loc1
            }
            //아래로
            if leftLoc.0+1 < row &&  board[leftLoc.0+1][leftLoc.1] != 1 && board[leftLoc.0+1][rightLoc.1] != 1  {
                let next1 = (rightLoc)
                let next2 = (rightLoc.0+1,rightLoc.1)

                let next3 = (leftLoc)
                let next4 = (leftLoc.0+1,leftLoc.1)

                rotateList.append([next1.0,next1.1,next2.0,next2.1])
                rotateList.append([next3.0,next3.1,next4.0,next4.1])
            }

            // 위로
            if  leftLoc.0-1 >= 0 &&  board[leftLoc.0-1][leftLoc.1] != 1 && board[leftLoc.0-1][rightLoc.1] != 1 {
                let next1 = (rightLoc)
                let next2 = (rightLoc.0-1,rightLoc.1)

                let next3 = (leftLoc)
                let next4 = (leftLoc.0-1,leftLoc.1)

                rotateList.append([next1.0,next1.1,next2.0,next2.1])
                rotateList.append([next3.0,next3.1,next4.0,next4.1])
            }

        //세로일때,
        }else {
            var topLoc = loc1
            var bottomLoc = loc2
            if loc2.0 < loc1.0 {
                topLoc = loc2
                bottomLoc = loc1
            }
            // 오른쪽으로
            if topLoc.1+1 < col &&  board[topLoc.0][topLoc.1+1] != 1 && board[bottomLoc.0][bottomLoc.1+1] != 1 {
                let next1 = (bottomLoc)
                let next2 = (bottomLoc.0,bottomLoc.1+1)

                let next3 = (topLoc)
                let next4 = (topLoc.0,topLoc.1+1)

                rotateList.append([next1.0,next1.1,next2.0,next2.1])
                rotateList.append([next3.0,next3.1,next4.0,next4.1])
            }
            //왼쪽으로
            if topLoc.1-1 >= 0 &&  board[topLoc.0][topLoc.1-1] != 1 && board[bottomLoc.0][bottomLoc.1-1] != 1 {
                let next1 = (bottomLoc)
                let next2 = (bottomLoc.0,bottomLoc.1-1)

                let next3 = (topLoc)
                let next4 = (topLoc.0,topLoc.1-1)

                rotateList.append([next1.0,next1.1,next2.0,next2.1])
                rotateList.append([next3.0,next3.1,next4.0,next4.1])
            }

        }
        return rotateList
    }


    func canMove(loc1:(Int,Int),loc2:(Int,Int)) ->  [[Int]] {
        var directionList = [[Int]]()
        // 가로일때,
        if loc1.0 == loc2.0 {
            var leftLoc = loc1
            var rightLoc = loc2
            if loc1.1 > loc2.1 {
                leftLoc = loc2
                rightLoc = loc1
            }
            // 오른쪽으로
            if rightLoc.1+1 < col &&  board[rightLoc.0][rightLoc.1+1] != 1  {
                let next1 = (rightLoc)
                let next2 = (rightLoc.0,rightLoc.1+1)
                directionList.append([next1.0,next1.1,next2.0,next2.1])
            }
            //왼쪽으로
            if leftLoc.1-1 >= 0 &&  board[leftLoc.0][leftLoc.1-1] != 1 {
                let next1 = (leftLoc)
                let next2 = (leftLoc.0,leftLoc.1-1)
                directionList.append([next1.0,next1.1,next2.0,next2.1])
            }

        }else {
            var topLoc = loc1
            var bottomLoc = loc2
            if loc2.0 < loc1.0 {
                topLoc = loc2
                bottomLoc = loc1
            }

            //아래로
            if bottomLoc.0+1 < row &&  board[bottomLoc.0+1][bottomLoc.1] != 1  {
                let next1 = (bottomLoc)
                let next2 = (bottomLoc.0+1,bottomLoc.1)

                directionList.append([next1.0,next1.1,next2.0,next2.1])
            }

            // 위로
            if  topLoc.0-1 >= 0 &&  board[topLoc.0-1][topLoc.1] != 1  {
                let next1 = (topLoc)
                let next2 = (topLoc.0-1,topLoc.1)

                directionList.append([next1.0,next1.1,next2.0,next2.1])
            }



        }
        return directionList
    }
    func canMove2(loc1:(Int,Int),loc2:(Int,Int)) ->  [[Int]] {
        var directionList = [[Int]]()
        // 가로일때,
        if loc1.0 == loc2.0 {
            var leftLoc = loc1
            var rightLoc = loc2
            if loc1.1 > loc2.1 {
                leftLoc = loc2
                rightLoc = loc1
            }


            //🔥아래로
            if rightLoc.0+1 < col &&  board[leftLoc.0+1][leftLoc.1] != 1 && board[rightLoc.0+1][rightLoc.1] != 1  {
                let next1 = (leftLoc.0+1,leftLoc.1)
                let next2 = (rightLoc.0+1,rightLoc.1)

                directionList.append([next1.0,next1.1,next2.0,next2.1])

            }
            //위로   이경우는 어떡하지.. 두개가 다 최신인데...
            if leftLoc.0-1 >= 0 &&  board[leftLoc.0-1][leftLoc.1] != 1 && board[rightLoc.0-1][rightLoc.1] != 1 {
                let next1 = (leftLoc.0-1,leftLoc.1)
                let next2 = (rightLoc.0-1,rightLoc.1)

                directionList.append([next1.0,next1.1,next2.0,next2.1])
            }


        }else {
            var topLoc = loc1
            var bottomLoc = loc2
            if loc2.0 < loc1.0 {
                topLoc = loc2
                bottomLoc = loc1
            }

            //오른쪽
            if topLoc.1+1 < col &&  board[topLoc.0][topLoc.1+1] != 1 && board[bottomLoc.0][bottomLoc.1+1] != 1  {
                let next1 = (topLoc.0,topLoc.1+1)
                let next2 = (bottomLoc.0,bottomLoc.1+1 )

                directionList.append([next1.0,next1.1,next2.0,next2.1])

            }
            //왼쪽
            if topLoc.1-1 >= 0  &&  board[topLoc.0][topLoc.1-1] != 1 && board[bottomLoc.0][bottomLoc.1-1] != 1  {
                let next1 = (topLoc.0,topLoc.1-1)
                let next2 = (bottomLoc.0,bottomLoc.1-1 )

                directionList.append([next1.0,next1.1,next2.0,next2.1])

            }
        }
        return directionList
    }
    func simulate() -> Int {
        var queue = [[0,0,0,1]]
        visitArray[[0,0,0,1]] = 0
        var costQueue = [0]

        while !queue.isEmpty {
            let first = queue.removeFirst()
            let cost = costQueue.removeFirst()

            if (first[0],first[1]) == (row-1,col-1) || (first[2],first[3]) == (row-1,col-1) {
                return cost
            }else {
                let pathList = canRotate(loc1: (first[0],first[1]), loc2: (first[2],first[3])) + canMove(loc1: (first[0],first[1]), loc2: (first[2],first[3])) + canMove2(loc1: (first[0],first[1]), loc2: (first[2],first[3]))
                for path in pathList {

                    if visitArray[path] == nil {
                        queue.append(path)
                        visitArray[path] = 0
                        costQueue.append(cost+1)
                    }

                }
            }
        }
        return 0
    }

    return simulate()
}

print(solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]]))
// 7

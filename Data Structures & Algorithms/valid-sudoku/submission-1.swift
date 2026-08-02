class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        guard !board.isEmpty else { return true }
        let rowLength = board[0].count

        func gridIndex(row: Int, col: Int) -> Int {
            ((row / 3) * rowLength) + (col / 3)
        }

        var rowNums = [Int: Set<Character>]()
        var colNums = [Int: Set<Character>]()
        var gridNums = [Int: Set<Character>]()

        for r in board.indices {
            for c in board[r].indices {
                let char = board[r][c]
                guard char.isNumber else { continue }

                let gI = gridIndex(row: r, col: c)
                if 
                    rowNums[r, default: Set()].contains(char) || 
                    colNums[c, default: Set()].contains(char) || 
                    gridNums[gI, default: Set()].contains(char)
                {
                    return false
                }

                rowNums[r, default: Set()].insert(char)
                colNums[c, default: Set()].insert(char)
                gridNums[gI, default: Set()].insert(char)
            }
        }

        return true
    }
}

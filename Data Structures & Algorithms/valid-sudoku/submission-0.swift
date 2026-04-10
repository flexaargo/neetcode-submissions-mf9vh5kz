private enum Constants {
    static let subBoxSize = 3
}

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // numbers seen per row (key)
        var seenRowNums: [Int: Set<Int>] = [:]
        // numbers seen per col (key)
        var seenColNums: [Int: Set<Int>] = [:]
        // numbers seen per row box (key)
        var seenSubBoxNums: [Int: Set<Int>] = [:]

        /// number of sub boxes along one side of the board
        let subBoxSideCount = board.count / Constants.subBoxSize

        for (rowIndex, rowValues) in board.enumerated() {
            let subBoxRowIndex = rowIndex / subBoxSideCount
            for (colIndex, colValue) in rowValues.enumerated() {
                guard colValue.isNumber, let num = Int(String(colValue)) else { continue }
                let subBoxColIndex = colIndex / subBoxSideCount
                let subBoxIndex = (subBoxRowIndex * subBoxSideCount) + subBoxColIndex

                let insertedRow = seenRowNums[rowIndex, default: []].insert(num).inserted
                guard insertedRow else { return false }

                let insertedCol = seenColNums[colIndex, default: []].insert(num).inserted
                guard insertedCol else { return false }

                let insertedSubBox = seenSubBoxNums[subBoxIndex, default: []].insert(num).inserted
                guard insertedSubBox else { return false }
            }
        }

        return true
    }

    func subBoxIndex(
        row: Int, 
        col: Int
    ) -> (row: Int, col: Int) {
        let rowIndex = row / Constants.subBoxSize
        let colIndex = col / Constants.subBoxSize
        return (rowIndex, colIndex)
    }
}

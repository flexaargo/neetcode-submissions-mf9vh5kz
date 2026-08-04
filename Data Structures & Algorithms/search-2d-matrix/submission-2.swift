class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty, !matrix[0].isEmpty else {
            return false
        }
    
        var top = 0
        var bottom = matrix.count - 1
        var selectedRow: Int?
    
        while top <= bottom {
            let row = top + (bottom - top) / 2
            let first = matrix[row][0]
            let last = matrix[row][matrix[row].count - 1]
    
            if target < first {
                bottom = row - 1
            } else if target > last {
                top = row + 1
            } else {
                selectedRow = row
                break
            }
        }
    
        guard let row = selectedRow else {
            return false
        }
    
        var lhs = 0
        var rhs = matrix[row].count - 1
    
        while lhs <= rhs {
            let col = lhs + (rhs - lhs) / 2
            let value = matrix[row][col]
    
            if value == target {
                return true
            } else if target < value {
                rhs = col - 1
            } else {
                lhs = col + 1
            }
        }
    
        return false
    }
}

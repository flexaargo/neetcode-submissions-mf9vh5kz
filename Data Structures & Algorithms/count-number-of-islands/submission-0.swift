class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var islands = 0
        var grid = grid

        for row in grid.indices {
            for col in grid[row].indices {
                guard grid[row][col] != "X" && grid[row][col] != "0" 
                else { continue }
                removeIsland(row, col, &grid)
                islands += 1
            }
        }

        return islands
    }

    func removeIsland(_ row: Int, _ col: Int, _ grid: inout [[Character]]) {
        guard grid.indices.contains(row), grid[row].indices.contains(col), grid[row][col] == "1" else { return }
        grid[row][col] = "X"
        removeIsland(row - 1, col, &grid)
        removeIsland(row + 1, col, &grid)
        removeIsland(row, col - 1, &grid)
        removeIsland(row, col + 1, &grid)
    }
}

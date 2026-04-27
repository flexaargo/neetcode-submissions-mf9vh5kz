class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var visited = Set<[Int]>()
        var islands = 0

        func visitIsland(_ row: Int, _ col: Int) {
            var queue: [[Int]] = [[row, col]]
            visited.insert([row, col])

            let directions: [[Int]] = [
                [-1,  0],
                [ 1,  0],
                [ 0, -1],
                [ 0,  1],
            ]

            while !queue.isEmpty {
                let item = queue.removeFirst()
                for direction in directions {
                    let row = item[0] + direction[0]
                    let col = item[1] + direction[1]
                    guard grid.indices.contains(row), grid[row].indices.contains(col), grid[row][col] == "1", !visited.contains([row, col]) else { continue }
                    queue.append([row, col])
                    visited.insert([row, col])
                }
            }
        }

        for row in grid.indices {
            for col in grid[row].indices {
                guard grid[row][col] == "1" && !visited.contains([row, col]) else { continue }
                visitIsland(row, col)
                islands += 1
            }
        }

        return islands
    }
}

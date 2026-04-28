struct Position: Hashable, Sendable {
    var row: Int
    var col: Int

    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var visited: Set<Position> = []
        var largestIslandSize = 0

        for row in grid.indices {
            for col in grid[row].indices {
                let position = Position(row, col)
                let hasVisited = visited.contains(position)
                guard !hasVisited, grid[position].isLand() else { continue }
                let islandSize = visitIsland(
                    at: position,
                    in: grid,
                    visited: &visited
                )
                largestIslandSize = max(largestIslandSize, islandSize)
            }
        }

        return largestIslandSize
    }

    /// Visits the island and returns the size
    private func visitIsland(
        at position: Position,
        in grid: [[Int]], 
        visited: inout Set<Position>
    ) -> Int {
        guard !visited.contains(position), grid.containsPosition(position), grid[position].isLand() else { return 0 }
        visited.insert(position)
        let nextPositions = [
            Position(position.row - 1, position.col),
            Position(position.row + 1, position.col),
            Position(position.row, position.col - 1),
            Position(position.row, position.col + 1),
        ]

        return 1 + nextPositions.map { visitIsland(at: $0, in: grid, visited: &visited) }.reduce(0, +)
    }
}

extension Int {
    func isLand() -> Bool {
        self == 1
    }
}

extension Array where Element: RandomAccessCollection, Element.Index == Int {
    subscript(_ position: Position) -> Element.Element {
        self[position.row][position.col]
    }

    func containsPosition(_ position: Position) -> Bool {
        indices.contains(position.row) && self[position.row].indices.contains(position.col)
    }
}
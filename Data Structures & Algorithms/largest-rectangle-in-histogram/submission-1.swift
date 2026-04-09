class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var largestArea: Int = Int.min
        var stack: [(startIndex: Int, height: Int)] = []

        for (index, height) in heights.enumerated() {
            var startIndex = index
            while let prev = stack.last, prev.height > height {
                let width = index - prev.startIndex
                largestArea = max(prev.height * width, largestArea)

                stack.popLast()
                startIndex = prev.startIndex
            }
            stack.append((startIndex, height))
        }

        while let last = stack.popLast() {
            let width = heights.count - last.startIndex
            largestArea = max(last.height * width, largestArea)
        }

        return largestArea
    }
}
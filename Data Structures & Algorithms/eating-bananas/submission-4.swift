class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard let maxRate = piles.max() else { return 0 }
        var lhs = 1
        var rhs = maxRate
        var minRate = maxRate
        while lhs < rhs {
            let testRate = lhs + (rhs - lhs) / 2
            var consumeTime = 0
            for pileSize in piles {
                consumeTime += (pileSize + testRate - 1) / testRate
            }
            if consumeTime > h {
                lhs = testRate + 1
                continue
            }
            rhs = testRate
            minRate = min(minRate, testRate)
        }
        return minRate
    }
}

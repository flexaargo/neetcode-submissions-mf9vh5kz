class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }

        var maxProfit = 0
        
        var buyIdx = 0

        for i in 0 ..< prices.count {
            if prices[i] < prices[buyIdx] {
                buyIdx = i
            } else {
                maxProfit = max(maxProfit, prices[i] - prices[buyIdx])
            }
        }

        return maxProfit
    }
}

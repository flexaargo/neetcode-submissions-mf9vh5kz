class MinStack {
    var vals: [Int] = []
    var mins: [Int] = []

    init() {

    }

    func push(_ val: Int) {
        vals.append(val)

        if val <= mins.last ?? Int.max {
            mins.append(val)
        }
    }

    func pop() {
        let popped = vals.popLast()

        if popped == mins.last {
            mins.popLast()
        }
    }

    func top() -> Int {
        vals.last!
    }

    func getMin() -> Int {
        mins.last!
    }
}

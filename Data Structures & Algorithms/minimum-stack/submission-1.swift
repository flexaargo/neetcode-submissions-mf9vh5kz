class MinStack {
    var _stack: [Int] = []
    var _minStack: [Int] = []

    init() {

    }

    func push(_ val: Int) {
        _stack.append(val)
        guard let lastMin = _minStack.last else { 
            _minStack.append(val)
            return
        }
        _minStack.append(min(lastMin, val))
    }

    func pop() {
        _stack.popLast()
        _minStack.popLast()
    }

    func top() -> Int {
        _stack.last ?? 0
    }

    func getMin() -> Int {
        _minStack.last ?? 0
    }
}

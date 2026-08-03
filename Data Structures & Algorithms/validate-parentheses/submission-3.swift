class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        var pStack = [Character]()

        for c in s {
            if c.isOpenParen {
                pStack.append(c)
            } else {
                guard 
                    let prevClosing = pStack.popLast(), 
                    Character.matchingParenPair(c) == prevClosing 
                else { return false }
            }
        }

        return pStack.count == 0
    }
}

extension Character {
    private static let openParens = CharacterSet(charactersIn: "([{")
    private static let closeParens = CharacterSet(charactersIn: ")]}")
    private static let parenPairs: [Character: Character] = [
        "[": "]",
        "]": "[",
        "(": ")",
        ")": "(",
        "{": "}",
        "}": "{",
    ]

    var isParen: Bool { isOpenParen || isClosingParen }
    
    var isOpenParen: Bool { 
        unicodeScalars.allSatisfy(Self.openParens.contains)
    }

    var isClosingParen: Bool { 
        unicodeScalars.allSatisfy(Self.closeParens.contains)
    }
    
    static func matchingParenPair(_ c: Character) -> Character? { parenPairs[c] }
}

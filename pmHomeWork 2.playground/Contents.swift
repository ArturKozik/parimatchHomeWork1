import UIKit

func factorialRecursion(of number: Int) -> Int? {
    if number < 0 {
        print("You can not get factorical of negative number")
        return nil
    } else if number == 0 {
        return 1
    } else {
        if let factorial = factorialRecursion(of: number - 1) {
            return number * factorial
        }
        
        return nil
    }
}

func factorialIteration(of number: Int) -> Int? {
    var res = 1
    
    if number < 0 {
        print("You can not get factorical of negative number")
        return nil
    } else if number == 0 {
        return res
    }
    
    for n in 1...number {
        res = res * n // 1 * 1 = 1; 1 * 2 = 2; 2 * 3 = 6; 6 * 4 = 24; 24 * 5 = 120
        res *= n
    }
    
    return res
}

let n = 10

print(factorialIteration(of: n) ?? 0)
print(factorialRecursion(of: n) ?? 0)

func findFibonacchi(of num: Int) -> [Int] {
    var res: [Int] = []
    
    guard num > 1 else {
        print("Number should be greater than 1.")
        return res
    }
    
    res.append(0)
    
    for n in 1...num - 1 {
        res.append(fib(n))
    }
    
    return res
}

func fib(_ n: Int) -> Int {
    guard n > 1 else { return n }
    return fib(n - 1) + fib(n - 2)
}

// fib(5) -> fib(5 - 1) + fib(5 - 2)
// 5 -> fib(4) + fib(3)
// 5 -> fib(3) + fib(2) + fib(2) + fib(1)
// 5 -> fib(2) + fib(1) + fib(1) + fib(0) + fib(1) + fib(0) + 1
// 5 -> fib(1) + fib(0) + 1 + 1 + 0 + 1 + 0 + 1
// 5 -> 1 + 0 + 1 + 1 + 0 + 1 + 0 + 1

print(findFibonacchi(of: n))

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

func findDigitOfPiFraction(digit: Int) -> Int {
    let string = String(Double.pi).components(separatedBy: ".").last ?? ""
    let index = digit - 1
    print("Pi is \(Double.pi)")
    return Int(string[index]) ?? 0
}

print(findDigitOfPiFraction(digit: 4))

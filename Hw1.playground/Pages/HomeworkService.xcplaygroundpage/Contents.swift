import UIKit

protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

class MyHomeworkService : HomeworkService {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var sequence = [Int]()
        sequence.append(0)
        
        if n == 0 {
            return sequence
        }
        sequence.append(1)
        if n == 1 {
            return sequence
        }
        for i in 2..<n {
            let nextNumber = sequence[i - 1] + sequence[i - 2]
            sequence.append(nextNumber)
        }
        return sequence
    }
    
    func sort(rawArray: [Int]) -> [Int] {
        var result = rawArray
        for i in 0..<result.count {
            for j in 0..<result.count - i - 1 {
                if result[j] > result[j+1] { result.swapAt(j, j+1) }
            }
        }
        return result
    }
    
    func firstLetter(strings: [String]) -> [Character] {
        var result = [Character]()
        for string in strings {
            result.append(string[string.startIndex])
        }
        return result
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var result = [Int]()
        for e in array {
            if condition(e) {result.append(e)}
        }
        return result
    }
}

/*
let service = MyHomeworkService()
let arrayInt = [Int] (arrayLiteral: 7, 9, 3, 0, 1, 0, 2)
let arrayString = [String] (arrayLiteral: "MGFD", "IUG", "LKJHD", "kGD", "idfgh", "SDFG")
func conditionalDividedBy3(number: Int) -> Bool {
    if number % 3 == 0 { return true }
    else { return false }
}

print(service.divideWithRemainder(10, by: 3))
print(service.fibonacci(n: 6))
print(service.sort(rawArray: arrayInt))
print(service.firstLetter(strings: arrayString))
print(service.filter(array: arrayInt, condition: conditionalDividedBy3(number:)))
*/


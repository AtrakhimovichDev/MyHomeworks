
import UIKit

// MARK: - Optionals
var username: String? = "John"
username = nil
username = "Max"

var age: String? = nil
var age1: String?
print("Age is \(age)")

var greeting = ""
let firstCharacter = greeting.first
print("Test")
print(firstCharacter)

let number: Int? = nil
let isAdmin: Bool? = nil

let name = "John"
let value: Character? = nil

var intNumber: Int? = 10

// Unwraping Values
// Force unwrap (НИКОГДА ЭТО НЕ ИСПОЛЬЗУЙТЕ!!!)
let greetingText: String? = nil
//let greetingTextUnwrapped = greetingText!
print(greetingText)

// А какая разница тогда между String! String?
let forceUsername: String! = nil
// forceUsername.isEmpty
print(forceUsername)

// Проверка через if
if greetingText != nil {
    print("Знение есть внутри!")
    print(greetingText!)
} else {
    print("Пустое значение!")
}

// Optional Binding (опциональное связывание)
if let unwrappedValue = greetingText,
    let uwrappedNumber = number {
    print(unwrappedValue)
} else {
    print("Пустое значение!")
}

// guard let
let isOwner = true
//guard isOwner else {
//    print("Ты не владелец. Доступ закрыт")
//}
// print("Ты владелец!")

func giveAccess(isOwner: Bool) {
    guard isOwner else {
        print("Ты не владелец. Доступ закрыт")
        return
    }

    print("Вы владелец. Доступ получен!")
}

giveAccess(isOwner: true)
giveAccess(isOwner: false)

func greet(name: String?) {
    guard let unwrappedName = name else {
        print("Hello, guest!")
        return
    }

    print("Hello, \(unwrappedName)!")
}

greet(name: "John")
greet(name: nil)

func greet(name: String?, lastName: String?) {
    guard let unwrappedName = name,
        let unwrappedLastName = lastName else {
        print("Hello, guest!")
        return
    }

    print("Hello, \(unwrappedName) \(unwrappedLastName)!")
}

greet(name: "Max", lastName: "Rocket")

// Nil Coaleasing
let product: String? = nil
let unwrappedProduct = product ?? "some food"
print(unwrappedProduct)

let id: Int? = nil
let unwrappedID = id ?? 0
print(unwrappedID)

let username1: String? = nil
let unwrappedUsername1 = username1 ?? "Anonymous"

let font = UIFont(name: "Your-Font", size: 12) ?? UIFont.systemFont(ofSize: 12)

// Optional chaining
let optionalString: String? = "Hello wor!"
let count = optionalString?.count
let isEmpty = optionalString?.isEmpty
print(count)
print(isEmpty)

if let uwrappedString = optionalString {
    let count = uwrappedString.count
    let isEmpty = uwrappedString.isEmpty
}

if let unwrappedCount = optionalString?.count {
    print("unwrappedCount \(unwrappedCount)")
//    optionalString.isEmpty
}

// MARK: - Enum/Перечисление

let operation = "#"
let number1 = 10
let number2 = 10

func calculate(operation: String, number1: Int, number2: Int) -> Int? {
    switch operation {
    case "+":
        return number1 + number2
    case "-":
        return number1 - number2
    case "^":
        return Int(pow(Float(number1), Float(number2)))
    default:
        return nil
    }
}

let result = calculate(operation: operation, number1: number1, number2: number2)
print("Math result: \(result)")

// 2 пример с enum
// let str: String, Int, Double, Bool
enum MathOperation {
    case plus
    case minus
    case multiply
    case division
}

let operationWithEnum: MathOperation = .plus
let operationWithEnum1 = MathOperation.plus

func calculate(operation: MathOperation, number1: Int, number2: Int) -> Int {
    switch operation {
    case .plus:
        return number1 + number2
    case .minus:
        return number1 - number2
    case .multiply:
        return number1 * number2
    case .division:
        return number1 / number2
    }
}

let resultWithEnum = calculate(operation: .minus, number1: number1, number2: number2)
print("Math result with enum: \(resultWithEnum)")

// Ассоциативные знаечения
enum Result {
    case success(String)
    case failure(Error)
}

func handleResult(_ result: Result) {
    switch result {
    case .success(let value):
        print("Success with value: \(value)")
    case .failure(let error):
        print("Failure with error: \(error)")
    }
}

let resultEnum: Result = .success("")
let resultEnumError: Result = .failure(NSError(domain: "Login error", code: 1))

handleResult(resultEnum)
handleResult(resultEnumError)

enum ResultTest {
    case success(String, Int, Bool)
    case failure(Error)
}

let resultTest = ResultTest.success("Hello", 10, true)

switch resultTest {
case let .success(useranme, age, isAdmin):
    print("\(useranme), \(age), \(isAdmin)")
case let .failure(error):
    print("Failure with error: \(error)")
}

enum ResultTest1 {
    case success(username: String)
    case failure(error: Error)
}

let resultTest1 = ResultTest1.success(username: "Admin")
let resultTestError1 = ResultTest1.failure(error: NSError(domain: "", code: 0))

// MARK: - rawValue (enum с исходными значениями)
enum HTTPCode: Int {
    case ok = 200
    case serviceUnavailable = 404
    case serviceDead = 500
    case unknownError = 999
}


let code = HTTPCode(rawValue: 99)

// 1
switch code {
case .ok:
    print("OK")
case .serviceUnavailable:
    print("oops!")
case .serviceDead:
    print("oops! Service dead!")
case .unknownError:
    print("Unknown error")
case nil:
    print("Unknown code!")
}

// 2
switch code {
case .ok:
    print("OK")
case .serviceUnavailable:
    print("oops!")
case .serviceDead:
    print("oops! Something with service!")
default:
    print("Unknown code!")
}

// 3
if let unwrappedCode = code {
    switch unwrappedCode {
    case .ok:
        print("OK")
    case .serviceUnavailable:
        print("oops!")
    case .serviceDead:
        print("oops! Service dead!")
    case .unknownError:
        print("Unknown error")
    }
}

// 4
let unwrappedCode1 = HTTPCode(rawValue: 99) ?? HTTPCode.unknownError
switch unwrappedCode1 {
case .ok:
    print("OK")
case .serviceUnavailable:
    print("oops!")
case .serviceDead:
    print("oops! Service dead!")
case .unknownError:
    print("Unknown error")
}


// rawValue
enum UserPerk: String {
    case badge = "badge"
    case invisible = "invisible"
    case unlimitedRequst = "unlimitedRequst"
    case unknown
}

func getUserPerk(rawValue: String) -> UserPerk {
    UserPerk(rawValue: rawValue) ?? .unknown
}

// All cases
enum CoffeBar: CaseIterable {
    case coffee, tea, juice, water
}

let allCases = CoffeBar.allCases
print(allCases)

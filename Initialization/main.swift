//
//  main.swift
//  Initialization
//
//  Created by 2lup on 05.10.2021.
//

import Foundation

print("Hello, World!")

//MARK: Инициализаторы
print("\n//Инициализаторы")

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print(f.temperature)


//MARK: Дефолтные значения свойств
print("\n//Дефолтные значения свойств")

struct Fahrenheit1 {
    var temperature = 32.0
}

var f1 = Fahrenheit()
print(f1.temperature)


//MARK: Параметры инициализации
print("\n//Параметры инициализации")

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperatureInCelsius)

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius)


//MARK: Локальные и внешние имена параметров
print("\n//Локальные и внешние имена параметров")

struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)


//MARK: Параметры инициализатора без внешних имен
print("\n//Параметры инициализатора без внешних имен")

struct Celsius1 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius1(37.0)


//MARK: Опциональные типы свойств
print("\n//Опциональные типы свойств")

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Нравится ли вам сыр?")
cheeseQuestion.ask()
print(cheeseQuestion.response)
cheeseQuestion.response = "Да, я люблю сыр"


//MARK: Присваивание значений постоянным свойствам во время инициализации
print("\n//Присваивание значений постоянным свойствам во время инициализации")

class SurveyQuestion1 {
  let text: String
  var response: String?
  init(text: String) {
    self.text = text
  }
  func ask() {
    print(text)
  }
}
let beetsQuestion = SurveyQuestion1(text: "Что насчет свеклы?")
beetsQuestion.ask()
beetsQuestion.response = "Я люблю свеклу, но не в сыром виде!"


//MARK: Дефолтные инициализаторы
print("\n//Дефолтные инициализаторы")

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
print(item.name, item.quantity, item.purchased)


//MARK: Почленные инициализаторы структурных типов
print("\n//Почленные инициализаторы структурных типов")

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)


//MARK: Делегирование инициализатора для типов значения
print("\n//Делегирование инициализатора для типов значения")

struct Size1 {
    var width = 0.0, height = 0.0
}
struct Point1 {
    var x = 0.0, y = 0.0
}

struct Rect1 {
    var origin = Point1()
    var size = Size1()
    init() {}
    init(origin: Point1, size: Size1) {
        self.origin = origin
        self.size = size
    }
    init(center: Point1, size: Size1) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point1(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect1()
print(basicRect.origin, basicRect.size)
//исходная точка Rect (0.0, 0.0) и его размер (0.0, 0.0)

let originRect = Rect1(origin: Point1(x: 2.0, y: 2.0), size: Size1(width: 5.0, height: 5.0))
print(originRect.origin, originRect.size)
//исходная точка Rect (2.0, 2.0) и его размер (5.0, 5.0)

let centerRect = Rect1(center: Point1(x: 4.0, y: 4.0), size: Size1(width: 3.0, height: 3.0))
print(centerRect.origin, centerRect.size)
//исходная точка centerRect’а равна (2.5, 2.5) и его размер (3.0, 3.0)


//MARK: Наследование и переопределение инициализатора
print("\n//Наследование и переопределение инициализатора")

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) колес(а)"
    }
}

let vehicle = Vehicle()
print("Транспортное средство: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Велосипед: \(bicycle.description)")


//MARK: Назначенные и вспомогательные инициализаторы в действии
print("\n//Назначенные и вспомогательные инициализаторы в действии")

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Бекон")
print(namedMeat.name)

let mysteryMeat = Food()
print(mysteryMeat.name)

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.name, oneMysteryItem.quantity)
let oneBacon = RecipeIngredient(name: "Bacon")
print(oneBacon.name, oneBacon.quantity)
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print(sixEggs.name, sixEggs.quantity)

class ShoppingListItem1: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem1(),
    ShoppingListItem1(name: "Bacon"),
    ShoppingListItem1(name: "Eggs", quantity: 6)
]

for item in breakfastList {
    print(item.description)
}

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true

for item in breakfastList {
    print(item.description)
}


//MARK: Проваливающиеся инициализаторы
print("\n//Проваливающиеся инициализаторы")

let wholeNumber: Double = 12345.0
let pi = 3.14159
 
if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) преобразование в Int поддерживает значение \(valueMaintained)")
}
// Выведет "12345.0 преобразование в Int поддерживает значение 12345"
 
let valueChanged = Int(exactly: pi)
// valueChanged is of type Int?, not Int
 
if valueChanged == nil {
    print("\(pi) преобразование в Int невозможно")
}
// Выведет "3.14159 преобразование в Int невозможно"


struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Жираф")
// someCreature имеет тип Animal?, но не Animal
 
if let giraffe = someCreature {
 print("Мы инициализировали животное типа \(giraffe.species) ")
}
// Выведет "Мы инициализировали животное типа Жираф "

let anonymousCreature = Animal(species: "")
// anonymousCreature имеет тип Animal?, но не Animal
 
if anonymousCreature == nil {
    print("Неизвестное животное не может быть инициализировано")
}
// Выведет "Неизвестное животное не может быть инициализировано"


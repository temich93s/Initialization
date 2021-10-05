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

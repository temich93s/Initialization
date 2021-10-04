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

//
//  BaseNumeric.swift
//  ComplexNumbers
//
//  Created by Lee Barney on 8/19/14.
//  Copyright (c) 2014 Lee Barney. All rights reserved.
//

import Foundation
protocol BaseNumeric {
    func asDouble() -> Double
    func asInt() -> Int
}

extension Int:BaseNumeric {
    func asDouble() -> Double{
        return Double(self)
    }
    func asInt() -> Int{
    return self
    }
}
extension Double:BaseNumeric {

    func asDouble() -> Double{
        return self
    }
    func asInt() -> Int{
        return Int(self)
    }
}

func - (lhs:BaseNumeric, rhs:BaseNumeric) -> BaseNumeric{
    if lhs is Double || rhs is Double {
        return lhs.asDouble() - rhs.asDouble()
    }
    else{
        return lhs.asInt() - rhs.asInt()
    }
}

func + (lhs:BaseNumeric, rhs:BaseNumeric) -> BaseNumeric{
    if lhs is Double || rhs is Double {
        return lhs.asDouble() + rhs.asDouble()
    }
    else{
        return lhs.asInt() + rhs.asInt()
    }
}

func * (lhs:BaseNumeric, rhs:BaseNumeric) -> BaseNumeric{
    if lhs is Double || rhs is Double {
        return lhs.asDouble() * rhs.asDouble()
    }
    else{
        return lhs.asInt() * rhs.asInt()
    }
}

func / (lhs:BaseNumeric, rhs:BaseNumeric) -> BaseNumeric{
    if lhs is Double || rhs is Double {
        return lhs.asDouble() / rhs.asDouble()
    }
    else{
        return lhs.asInt() / rhs.asInt()
    }
}


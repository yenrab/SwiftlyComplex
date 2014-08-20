//
//  Complex.swift
//  ComplexNumbers
//
//  Created by Lee Barney on 8/19/14.
//  Copyright (c) 2014 Lee Barney. All rights reserved.
//

/*
 * This class can be used to represent both complex numbers and Gausian rational numbers
*/

struct Complex:Printable{
    var real:BaseNumeric
    var imaginary:BaseNumeric
    
    var description: String{
        return "\(self.real) + \(self.imaginary)i"
    }
    
    func combine(rhs:Complex, combineBehavior:(BaseNumeric, BaseNumeric) -> BaseNumeric) -> Complex{
        
        var realPart = combineBehavior(self.real, rhs.real)
        var imaginaryPart = combineBehavior(self.imaginary, rhs.imaginary)
        return Complex(real: realPart, imaginary: imaginaryPart)
    }
}
func +(lhs:Complex, rhs:BaseNumeric) -> Complex{
    return lhs + Complex(real: rhs, imaginary: 0)
}
func +(lhs:BaseNumeric, rhs:Complex) -> Complex{
    return Complex(real: lhs, imaginary: 0) * rhs
}
func +(lhs: Complex, rhs: Complex) -> Complex{
    return lhs.combine(rhs, combineBehavior: {(leftValue:BaseNumeric,rightValue:BaseNumeric) -> BaseNumeric in
        return leftValue + rightValue
        })
}

func -(lhs:Complex, rhs:BaseNumeric) -> Complex{
    return lhs - Complex(real: rhs, imaginary: 0)
}
func -(lhs:BaseNumeric, rhs:Complex) -> Complex{
    return Complex(real: lhs, imaginary: 0) - rhs
}

func -(lhs: Complex, rhs: Complex) -> Complex{
    return lhs.combine(rhs, combineBehavior: {(leftValue:BaseNumeric,rightValue:BaseNumeric) -> BaseNumeric in
        return leftValue - rightValue
    })
}

func *(lhs:Complex, rhs: BaseNumeric) -> Complex{
    return lhs * Complex(real: rhs, imaginary: 0)
}
func *(lhs:BaseNumeric, rhs:Complex) -> Complex{
    return Complex(real: lhs, imaginary: 0) * rhs
}
func *(lhs: Complex, rhs: Complex) -> Complex{
    //this is an optimized implementation. It only requires 3 mutliplications
    //instead of the naive implementation's 4 multiplications
    let productOfReals = lhs.real * rhs.real
    let productOfImaginaries = rhs.imaginary * lhs.imaginary
    let realPart = productOfReals - productOfImaginaries
    let imaginaryPart = ((lhs.real + lhs.imaginary) * (rhs.real + rhs.imaginary)) - productOfReals - productOfImaginaries
    return Complex(real:realPart, imaginary:imaginaryPart)
}
/*
 *divide is here defined as returning doubles for the real and imaginary parts
 * if any one of those parts is a double
 */
func /(lhs: Complex, rhs:BaseNumeric) -> Complex{
    return lhs / Complex(real: rhs, imaginary: 0)
}
func /(lhs:BaseNumeric, rhs:Complex) -> Complex{
    return Complex(real: lhs, imaginary: 0) / rhs
}
func /(lhs: Complex, rhs: Complex) -> Complex{
    let denominator = rhs.real * rhs.real + rhs.imaginary * rhs.imaginary
    let realPart = (lhs.real * rhs.real + lhs.imaginary * rhs.imaginary) / denominator
    let imaginaryPart = (lhs.imaginary * rhs.real - lhs.real * rhs.imaginary) / denominator
    return Complex(real: realPart,imaginary: imaginaryPart)
}
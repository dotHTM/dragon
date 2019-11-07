#!/usr/bin/swift

import Foundation
// import UIKit

func dragonFractal(iteration : Int) -> [Bool]{
  if( iteration <= 0 ){
    return []
  }
  let lastIter = dragonFractal(iteration: iteration-1)
  var result = lastIter
  result.append(true)
  lastIter.reversed().forEach{result.append(!$0)}
  return result
} // dragonFractal

func turnNumber(_ paperFractal : (Int)->[Bool] , number: Int)->Bool{
    return turnNumber( paperFractal : paperFractal , number: number, iter: 0)
} // turnNumber
func turnNumber( paperFractal : (Int)->[Bool] , number: Int, iter: Int)->Bool{
    let pf = paperFractal( iter)
  if pf.count > number {
    return pf[number]
  }
  return turnNumber( paperFractal : paperFractal , number: number, iter: iter+1)
} // turnNumber


func dragonFractalTN(_ number: Int, iter: Int)->Bool{
let df = dragonFractal(iteration: iter)
  if df.count > number {
    return df[number]
  }
  return dragonFractalTN(number, iter: iter+1 )
} // dragonFractalTN

var startTime : Double



let maxIteration = 25
print("calculating fractal up to", maxIteration)
startTime = Date().timeIntervalSince1970
let df = dragonFractal(iteration: maxIteration)
// print(df)
print("Calculated in " + String(Date().timeIntervalSince1970 - startTime ))

print("----")
print("length of flatfoldlist")
startTime = Date().timeIntervalSince1970
print( " ", df.count)
print("Accessed in " + String(Date().timeIntervalSince1970 - startTime ))

let turnNumber = 33554430
print("----")
print("turn number \(turnNumber)")
startTime = Date().timeIntervalSince1970
print("   is \(turnNumber(dragonFractal, number: turnNumber ))")
print("Accessed in " + String(Date().timeIntervalSince1970 - startTime ))


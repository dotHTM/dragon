#!/usr/bin/swift

import Foundation
// import UIKit

func dragonFractal(iteration : Int) -> [Bool]{
  if( iteration <= 0 ){
    return []
  }
  let lastIter = dragonFractal(iteration: iteration-1)
  let reversedLastIter = lastIter.reversed().map{!$0}
  
  return lastIter + [true] + reversedLastIter
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



let maxIteration = 25
print("calculating fractal up to", maxIteration)
let maxIteration_startTime = Date().timeIntervalSince1970
let df = dragonFractal(iteration: maxIteration)
// print(df)
print("Calculated in " + String(Date().timeIntervalSince1970 - maxIteration_startTime ))

print("----")
print("length of flatfoldlist")
let flatfoldlist_startTime = Date().timeIntervalSince1970
print( " ", df.count)
print("Accessed in " + String(Date().timeIntervalSince1970 - flatfoldlist_startTime ))

let turnNumber = 33554431
print("----")
print("turn number \(turnNumber)")
let turnNumber_startTime = Date().timeIntervalSince1970
print("   is \(turnNumber(dragonFractal, number: turnNumber ))")
print("Accessed in " + String(Date().timeIntervalSince1970 - turnNumber_startTime ))


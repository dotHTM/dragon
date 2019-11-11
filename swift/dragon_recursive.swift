#!/usr/bin/swift


import Foundation
// import UIKit

struct PaperFractal {
  let foldlist : [[Bool]]
  var iteration : Int{ get{ foldlist.count } }
  var flatFoldList : [Bool] { get {foldlist.reduce([], +)} }
}

let emptyPaperFractal  = PaperFractal(foldlist: [])
typealias PaperFractalStep = (PaperFractal)->PaperFractal
func dragonStep(_ pastState: PaperFractal)->PaperFractal{
  return  PaperFractal(foldlist : ( [pastState.flatFoldList + [true] + pastState.flatFoldList.reversed().map{!$0}] ))
}

func iterateUpTo(previousState: PaperFractal, fractalStep: PaperFractalStep,  iteration requestedIteraton: Int)->PaperFractal{
  return  requestedIteraton <= previousState.iteration
    ? previousState
    : fractalStep(
        iterateUpTo(
          previousState: previousState,
          fractalStep: fractalStep,
          iteration: requestedIteraton - 1)
        )
}

func turnNumber(previousState: PaperFractal, fractalStep: PaperFractalStep, requestedTurnNumber : Int)->Bool{
  if requestedTurnNumber <= previousState.flatFoldList.count {
    return previousState.flatFoldList[requestedTurnNumber - 1]
  }
  return turnNumber(previousState: fractalStep(previousState), fractalStep: fractalStep, requestedTurnNumber : requestedTurnNumber - 1)
}

let maxIteration = 25
print("calculating fractal up to", maxIteration)
let maxIteration_startTime = Date().timeIntervalSince1970
let df = iterateUpTo(previousState: emptyPaperFractal, fractalStep: dragonStep, iteration: maxIteration )
// print(df)
print("Calculated in " + String(Date().timeIntervalSince1970 - maxIteration_startTime ))

print("----")
print("length of flatfoldlist")
let flatfoldlist_startTime = Date().timeIntervalSince1970
let lastTurnNumber = df.flatFoldList.count
print( " ", lastTurnNumber)
print("Accessed in " + String(Date().timeIntervalSince1970 - flatfoldlist_startTime ))

print("----")
print("turn number \(lastTurnNumber)")
let turnNumber_startTime = Date().timeIntervalSince1970
print("   is \( turnNumber(previousState: df, fractalStep: dragonStep, requestedTurnNumber : lastTurnNumber))")
print("Accessed in " + String(Date().timeIntervalSince1970 - turnNumber_startTime ))


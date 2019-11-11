#!/usr/bin/swift

import Foundation
// import UIKit

struct PaperFractal {
  let foldList: [Bool]
  let iteration: Int
}

let emptyPaperFractal  = PaperFractal(foldList: [], iteration: 0)
typealias PaperFractalStep = (PaperFractal)->PaperFractal
func dragonStep(_ pastState: PaperFractal)->PaperFractal{
  return  PaperFractal(
    foldList: pastState.foldList + [true] + pastState.foldList.reversed().map{!$0},
    iteration: pastState.iteration + 1
  )
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

func turnNumber(previousState: PaperFractal, fractalStep: PaperFractalStep, requestedTurnNumber: Int)->Bool{
  return requestedTurnNumber <= previousState.foldList.count
    ? previousState.foldList[requestedTurnNumber - 1]
   : turnNumber(previousState: fractalStep(previousState), fractalStep: fractalStep, requestedTurnNumber: requestedTurnNumber - 1)
}

let maxIteration = 32
print("calculating fractal up to", maxIteration)
let maxIteration_startTime = Date().timeIntervalSince1970
let df = iterateUpTo(previousState: emptyPaperFractal, fractalStep: dragonStep, iteration: maxIteration )
// print(df.foldList)
print("Calculated in " + String(Date().timeIntervalSince1970 - maxIteration_startTime ))

print("----")
print("length of foldList")
let foldList_startTime = Date().timeIntervalSince1970
let lastTurnNumber = df.foldList.count
print( " ", lastTurnNumber)
print("Accessed in " + String(Date().timeIntervalSince1970 - foldList_startTime ))

print("----")
print("turn number \(lastTurnNumber)")
let turnNumber_startTime = Date().timeIntervalSince1970
print("   is \( turnNumber(previousState: df, fractalStep: dragonStep, requestedTurnNumber: lastTurnNumber))")
print("Accessed in " + String(Date().timeIntervalSince1970 - turnNumber_startTime ))


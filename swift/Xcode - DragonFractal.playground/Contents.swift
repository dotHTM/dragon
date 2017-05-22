//: Playground - noun: a place where people can play

import Foundation
import UIKit

struct DragonBrain {
    var foldLists : [[Bool]] = []
    var currentIteration : Int {
        get{ return foldLists.count }
    }
    func flatFoldList(_ thruIteration: Int) -> [Bool]{
        var result : [Bool] = []
        result.reserveCapacity(
            2^currentIteration-1)
        if thruIteration <= currentIteration {
            foldLists[0..<thruIteration].forEach({ result.append(contentsOf: $0) })
        }
        return result
    }
    func flatFoldList() -> [Bool] {
        return flatFoldList(currentIteration)
    }
    
    mutating func nextIteration(){
        var newFolds = [true]
        newFolds.reserveCapacity(
            2^currentIteration-1)
        foldLists.joined().reversed().forEach({newFolds.append(!$0)})
        foldLists.append(newFolds)
    }
    
    mutating func iterationUpTo(someIteration: Int)
    { while someIteration > currentIteration { nextIteration() } }
    
    init(_ startingIteration: Int){
        for _ in 1 ... startingIteration {
            nextIteration()
        }
    }
    init(){}
}

class PaperFoldedStrip{
    var foldLists : [[Bool]] = []
    var currentIteration : Int {
        get{ return foldLists.count }
    }
    func flatFoldList(_ thruIteration: Int) -> [Bool]{
        var result : [Bool] = []
        result.reserveCapacity(
            2^currentIteration-1)
        if thruIteration <= currentIteration {
            foldLists[0..<thruIteration].forEach({ result.append(contentsOf: $0) })
        }
        return result
    }
    func flatFoldList() -> [Bool] {
        return flatFoldList(currentIteration)
    }
}

class PaperFractal : PaperFoldedStrip{
    func nextIteration(){
        foldLists.append([true])
    }
    
    func iterationUpTo(someIteration: Int)
    { while someIteration > currentIteration { nextIteration() } }
    
    init(_ startingIteration: Int){
        super.init()
        iterationUpTo(someIteration: startingIteration)
    }
    override init(){}
}

class DragonFractal: PaperFractal{
    override func nextIteration(){
        var newFolds = [true]
        newFolds.reserveCapacity(
            2^currentIteration-1)
        foldLists.joined().reversed().forEach({newFolds.append(!$0)})
        foldLists.append(newFolds)
    }
}

class TriangleFractal: PaperFractal{
    override func nextIteration(){
        var newFolds = [true]
        if currentIteration % 2 == 1 {
            newFolds = [false]
        }
        newFolds.reserveCapacity(
            2^currentIteration-1)
        foldLists.joined().reversed().forEach({newFolds.append(!$0)})
        foldLists.append(newFolds)
    }
}

let someDragon = DragonFractal(3)

someDragon.iterationUpTo(someIteration: 10)
someDragon.iterationUpTo(someIteration: 7)

someDragon.currentIteration

someDragon.flatFoldList()

pow(2, someDragon.currentIteration)

let someTriangle = TriangleFractal(3)

someTriangle.iterationUpTo(someIteration: 10)
someTriangle.iterationUpTo(someIteration: 7)

someTriangle.currentIteration

someTriangle.flatFoldList()

pow(2, someTriangle.currentIteration)

//
//  ViewController.swift
//  molecular wedth
//
//  Created by Filip Cernov on 14/01/2020.
//  Copyright © 2020 Filip Cernov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //H(NO3)2
        //H(CH3)2(CH2)
        //H(CH3)2
//  giveMassOfMolecule(molecule: "H(CH3)2(CH)3")
        
//        giveMassOfMolecule(molecule: "CH(CH)2(CH)")
//        giveMassOfMolecule(molecule: "(CH)2HO3(CHO)")
    
        
        
        
        giveMassOfMolecule(molecule: "(CH)(CMnHO)")
    }



func giveMassOfMolecule (molecule : String) {
  
      let hydrogen = ("H" , 1)
      let oxygen = ("O" , 16)
  
  
  
      var strings : [String] = []
      var numbersAndTheirsIndexes : [(Int , Int)] = []
  
      var numberOfChemicalElementInMolecule = 0
      //var numberOfIteration = 0
  
      var stringsInParenatacies : [(String , String)] = []
      var thereIsParentacies : Bool?
      var weAreLookingForMultiplyerAfterParentacies : Bool?
      var numbersAndThersIndexexInParentaciew : [(Int , Int)] = []
      var numberOfChemicalElementsInMoleculeInParentiacies = 0
  
  
      var generalMultiplayersOfParantacies : [(String? , String?)] = []
  
      var numberOfParentacies = 0
  
    var numberOfIterations = 0
      for character in molecule {
          numberOfIterations = numberOfIterations + 1
  
          if thereIsParentacies != true {
  
  
              if character.isUppercase || character.isLowercase {
                
                
                  
                
//                  weAreLookingForMultiplyerAfterParentacies = false
                
                
                 weAreLookingForMultiplyerAfterParentacies = false
  
  
  
                  if character.isUppercase {
                      strings.append(String(character))
                      numberOfChemicalElementInMolecule = numberOfChemicalElementInMolecule + 1
                      
                    
                      
                    
                  }else if character.isLowercase {
  
                      strings[strings.count - 1] = strings[strings.count - 1] + String(character)
  
                  }
                
                  
                    
                
                
//                generalMultiplayersOfParantacies.append((String(1) ,String(numberOfParentacies) ))
  
       
  
              }
  
              if character.isNumber {
  
  
  
  
                      if weAreLookingForMultiplyerAfterParentacies == true {
                          if generalMultiplayersOfParantacies.count > 0 {
                              if generalMultiplayersOfParantacies.count == numberOfParentacies {
                                  generalMultiplayersOfParantacies[numberOfParentacies - 1].0 = generalMultiplayersOfParantacies[numberOfParentacies - 1].0! + String(character)
                              }else{
                                  generalMultiplayersOfParantacies.append((String(character) ,String(numberOfParentacies) ))
                              }
                              print("Number Of \(generalMultiplayersOfParantacies.count) parentacies \(numberOfParentacies)")
  
                          } else {
      //                         print("Number Of \(generalMultiplayersOfParantacies.count) parentacies \(numberOfParentacies)")
                               generalMultiplayersOfParantacies.append((String(character) ,String(numberOfParentacies) ))
                          }
                      }else{
                          let indexIs = Int(String(character))
                                  let atomThatNeedToMultiply = numberOfChemicalElementInMolecule
                                  numbersAndTheirsIndexes.append((indexIs! , atomThatNeedToMultiply))
               
                      }
  
  
  
  
  
              }
  
          }
  
          if thereIsParentacies == true {
  
                     if character.isUppercase || character.isLowercase {
  
                         if character.isUppercase {
      //                       stringsInParenatacies.append(String(character))
                          stringsInParenatacies.append((String(character) , String(numberOfParentacies)))
                             numberOfChemicalElementsInMoleculeInParentiacies = numberOfChemicalElementsInMoleculeInParentiacies + 1
                                               
                                             
                         }else if character.isLowercase {
  
                          stringsInParenatacies[stringsInParenatacies.count - 1].0 = stringsInParenatacies[stringsInParenatacies.count - 1].0 + String(character)
                            
                            
  
                         }
                        
                        
                  
  
                     }
  
                     if character.isNumber {
  
  
  
                          let indexIs = Int(String(character))
                          let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                          numbersAndThersIndexexInParentaciew.append((indexIs! , atomThatNeedToMultiply))
  
  
  
  
                     }
          }
  
  
  
          if character == "("  {
                      thereIsParentacies = true
              numberOfParentacies = numberOfParentacies + 1
          }
          if character == ")" {
                     thereIsParentacies = false
                     weAreLookingForMultiplyerAfterParentacies = true
            
            
            
            
            
            
            var letters : [String?] = []
            if numberOfIterations < molecule.count || numberOfIterations == molecule.count {
                for charakterito in molecule {
                    letters.append(String(charakterito))
                }
                
                
               
//                    var nextLetter = letters[numberOfIterations]
//                                   if Int(nextLetter) == nil {
//                                       generalMultiplayersOfParantacies.append((String(1) ,String(numberOfParentacies) ))
//                    }
                
               
                if numberOfIterations != letters.count  {
                    print("I am here number of iteration is \(numberOfIterations) and letters are there \(letters.count)")
                    if let nextLetter = letters[numberOfIterations] {
                        if Int(nextLetter) == nil {
                            generalMultiplayersOfParantacies.append((String(1) ,String(numberOfParentacies) ))
                        }
                    }
                }else if numberOfIterations == letters.count {
                    generalMultiplayersOfParantacies.append((String(1) ,String(numberOfParentacies) ))
                }
                
                
              
            
            
            }
            
            
  
          }
  
  
  
      }
  
  //Its bicycle
     
  
  
  
   print("numbersAndThersIndexexInParentaciew \(numbersAndThersIndexexInParentaciew)")
    
    if numbersAndThersIndexexInParentaciew.count == 0 {
        numbersAndThersIndexexInParentaciew.append((1 , 1))
    }
  
      //
  
  
  
      func giveMeBigMultiplyer (numbersAndTheirIndexes : [(Int , Int)] ) -> Int {
  
  
          var multiplyer : String?
  
          for (coeficient , index ) in numbersAndTheirsIndexes {
  
              if index == 0 {
                  if multiplyer == nil {
                      multiplyer = String(coeficient)
                  }else{
                      multiplyer = multiplyer! + String(coeficient)
                  }
              }
  
          }
  
          if multiplyer == nil {
              return 1
          }else{
              return Int(multiplyer!)!
          }
  
  
  
  
      }
  
  
  
  
  
  
  
  
  
  
  
      print("General Multiplyer is equal \(giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes))")
  
  
      var mendeleevChart = [
  
        "H" : 1 , "O" : 16 , "Fe" : 17 , "Se" : 15 , "N" : 14 , "C" : 12 , "Mn" : 55
  
      ]
  
      func giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies : [String]) -> Int {
  
          var mass = 0
          var indexOfElementsWhichAreNotInParenetecies = 0
  
          for chemicalElement in elementsNotInParentecies {
  
              indexOfElementsWhichAreNotInParenetecies = indexOfElementsWhichAreNotInParenetecies + 1
  
              if mendeleevChart[chemicalElement] != nil {
                  var multiplayer = "1"
  
  
  
  
                  for (multiplyerFromArray , index) in numbersAndTheirsIndexes {
  
                      if index != 0 {
                          if indexOfElementsWhichAreNotInParenetecies == index {
  
                              if multiplayer == "1" {
                                  multiplayer = String(multiplyerFromArray)
                              }else{
                                  multiplayer = multiplayer + String(multiplyerFromArray)
                              }
  
                          }
  
                      }
  
                  }
  
                  mass = mass +  (mendeleevChart[chemicalElement]! * Int(multiplayer)!)
  
  
  
              }
          }
  
  
          return mass
      }
 
  
  
  
      //print("Molecule is \(molecule)")
      ////print(stringsInParenatacies)
      //print(numbersAndThersIndexexInParentaciew)
      //print(generalMultiplayersOfParantacies )
  
      //print(strings)
      //print(numbersAndTheirsIndexes)
  
      print("numbersAndThersIndexexInParentaciew \(numbersAndThersIndexexInParentaciew)")
      var emptyArray : [(Int , Int)] = []
      var iteration = 0
  
      for (multiplayer , index ) in numbersAndThersIndexexInParentaciew {
          iteration = iteration + 1
  
          if emptyArray.count > 0 {
              if emptyArray.last?.1 == index {
  
                  emptyArray[emptyArray.count - 1].0 = Int(String(emptyArray.last!.0) + String(multiplayer))!
              }else{
                  emptyArray.append((multiplayer , index))
              }
          }else{
              emptyArray.append((multiplayer , index))
          }
      }
  
      //print("Number of atom for atom in parentacies \(emptyArray)")
  
  
  
  
  
  
  
  
  
  
  
  
      print("Molecule is \(molecule)")
      print("stringsInParenatacies \(stringsInParenatacies)")
      print("generalMultiplayersOfParantacies \(generalMultiplayersOfParantacies)")
      print("emptyArray \(emptyArray)")
    
    
    var massOfParentaciesWithoutAddingAndMultiplayerForThem : [(mass : Int , numberOfParentacie : Int)]  = []
    
    
    
    var iterationToGetMass = 0
    for (chemicalElement , numberOfPrantacie) in stringsInParenatacies {
        iterationToGetMass = iterationToGetMass + 1
        for (multiplyerr , iterationToGiveMass) in emptyArray {
            if iterationToGetMass == iterationToGiveMass {
                massOfParentaciesWithoutAddingAndMultiplayerForThem.append((mendeleevChart[chemicalElement]! * multiplyerr , Int(numberOfPrantacie)!))
            }else{
                massOfParentaciesWithoutAddingAndMultiplayerForThem.append((mendeleevChart[chemicalElement]! , Int(numberOfPrantacie)!))
            }
        }
        
    }
    
    print("massOfParentaciesWithoutAddingAndMultiplayerForThem \(massOfParentaciesWithoutAddingAndMultiplayerForThem)")
    
    //EMPTY array уже больше не нужен
    
    
    var massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer : [(mass : Int , numberOfParentacie : Int)] = []
    
    
    var iterationAgain = 0
    for (mass , parentecie) in massOfParentaciesWithoutAddingAndMultiplayerForThem {
        iterationAgain = iterationAgain + 1
        if massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.count > 0 {
            if massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.last?.numberOfParentacie == parentecie {
                massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer[massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.count - 1].mass = massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer[massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.count - 1].mass + mass
            }else{
                massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.append((mass , parentecie))
            }
        }else{
            massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.append((mass , parentecie))
        }
    }
    
    print("massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer  \(massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer)")
    print("generalMultuplyer is \(generalMultiplayersOfParantacies)")
    
    
    //Оно не посчитает если написать () Без индекс после ) , типа H(CH)
    
    var massInPareneteciesWithGeneralMyltyplying : [(mass : Int , numberOfParentecie : Int)] = []
    
    for (mass , numberOfparentecieOne) in massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer {
        for (generalMultiplyer , numberOfparentecie) in generalMultiplayersOfParantacies {
            if Int(numberOfparentecie!) == numberOfparentecieOne {
                massInPareneteciesWithGeneralMyltyplying.append((mass * Int(generalMultiplyer!)! , Int(numberOfparentecie!)!))
            }
        }
    }
    
    print("massInPareneteciesWithGeneralMyltyplying \(massInPareneteciesWithGeneralMyltyplying)")
    
    var massOfParentaciesWithEvething = 0
    
    for (mass , _ ) in massInPareneteciesWithGeneralMyltyplying {
        massOfParentaciesWithEvething = massOfParentaciesWithEvething + mass
    }
    
  
  
    var massMolecule = giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes) * (massOfParentaciesWithEvething + giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))
    
    print("massOfParentaciesWithEvething \(massOfParentaciesWithEvething)")
    print("giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings) \(giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))")
    
    print("MASS OF MOLECULE IF EQUAL \(massMolecule)")
  
  }

  


// giveMassOfMolecule(molecule: "H(CH3)2(CH)3")

//giveMassOfMolecule(molecule: "(CH)2(CH)3(CH)2")


//giveMassOfMolecule(molecule: "CH(CH)1(CH)1")
//giveMassOfMolecule(molecule: "CH(CH)(CH)")

    
//    func giveMassOfMolecule (molecule : String) {
//
//        let hydrogen = ("H" , 1)
//        let oxygen = ("O" , 16)
//
//
//
//        var strings : [String] = []
//        var numbersAndTheirsIndexes : [(Int , Int)] = []
//
//        var numberOfChemicalElementInMolecule = 0
//        //var numberOfIteration = 0
//
//        var stringsInParenatacies : [(String , String)] = []
//        var thereIsParentacies : Bool?
//        var weAreLookingForMultiplyerAfterParentacies : Bool?
//        var numbersAndThersIndexexInParentaciew : [(Int , Int)] = []
//        var numberOfChemicalElementsInMoleculeInParentiacies = 0
//
//
//        var generalMultiplayersOfParantacies : [(String? , String?)] = []
//
//        var numberOfParentacies = 0
//
//
//        for character in molecule {
//        //    numberOfIteration = numberOfIteration + 1
//
//            if thereIsParentacies != true {
//
//
//                if character.isUppercase || character.isLowercase {
//
//                    if  weAreLookingForMultiplyerAfterParentacies == true {
//                        generalMultiplayersOfParantacies.append((String(1) ,String(numberOfParentacies) ))
//                    }
//                    weAreLookingForMultiplyerAfterParentacies = false
//
//
//
//
//
//                    if character.isUppercase {
//                        strings.append(String(character))
//                        numberOfChemicalElementInMolecule = numberOfChemicalElementInMolecule + 1
//                    }else if character.isLowercase {
//
//                        strings[strings.count - 1] = strings[strings.count - 1] + String(character)
//
//                    }
//
//
//
//                }
//
//                if character.isNumber {
//
//
//
//
//                        if weAreLookingForMultiplyerAfterParentacies == true {
//                            if generalMultiplayersOfParantacies.count > 0 {
//                                if generalMultiplayersOfParantacies.count == numberOfParentacies {
//                                    generalMultiplayersOfParantacies[numberOfParentacies - 1].0 = generalMultiplayersOfParantacies[numberOfParentacies - 1].0! + String(character)
//                                }else{
//                                    generalMultiplayersOfParantacies.append((String(character) ,String(numberOfParentacies) ))
//                                }
//                                print("Number Of \(generalMultiplayersOfParantacies.count) parentacies \(numberOfParentacies)")
//
//                            } else {
//        //                         print("Number Of \(generalMultiplayersOfParantacies.count) parentacies \(numberOfParentacies)")
//                                 generalMultiplayersOfParantacies.append((String(character) ,String(numberOfParentacies) ))
//                            }
//                        }else{
//                            let indexIs = Int(String(character))
//                                    let atomThatNeedToMultiply = numberOfChemicalElementInMolecule
//                                    numbersAndTheirsIndexes.append((indexIs! , atomThatNeedToMultiply))
//                        }
//
//
//
//
//
//                }
//
//            }
//
//            if thereIsParentacies == true {
//
//                       if character.isUppercase || character.isLowercase {
//
//                           if character.isUppercase {
//        //                       stringsInParenatacies.append(String(character))
//                            stringsInParenatacies.append((String(character) , String(numberOfParentacies)))
//                               numberOfChemicalElementsInMoleculeInParentiacies = numberOfChemicalElementsInMoleculeInParentiacies + 1
//                           }else if character.isLowercase {
//
//                            stringsInParenatacies[stringsInParenatacies.count - 1].0 = stringsInParenatacies[stringsInParenatacies.count - 1].0 + String(character)
//
//                           }
//
//                       }
//
//                       if character.isNumber {
//
//
//
//                            let indexIs = Int(String(character))
//                            let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
//                            numbersAndThersIndexexInParentaciew.append((indexIs! , atomThatNeedToMultiply))
//
//
//
//
//                       }
//            }
//
//
//
//            if character == "("  {
//                        thereIsParentacies = true
//                numberOfParentacies = numberOfParentacies + 1
//            }
//            if character == ")" {
//                       thereIsParentacies = false
//                       weAreLookingForMultiplyerAfterParentacies = true
//
//            }
//
//
//
//        }
//
//
//
//
//
//
//
//
//        //
//
//
//
//        func giveMeBigMultiplyer (numbersAndTheirIndexes : [(Int , Int)] ) -> Int {
//
//
//            var multiplyer : String?
//
//            for (coeficient , index ) in numbersAndTheirsIndexes {
//
//                if index == 0 {
//                    if multiplyer == nil {
//                        multiplyer = String(coeficient)
//                    }else{
//                        multiplyer = multiplyer! + String(coeficient)
//                    }
//                }
//
//            }
//
//            if multiplyer == nil {
//                return 1
//            }else{
//                return Int(multiplyer!)!
//            }
//
//
//
//
//        }
//
//
//
//
//
//
//
//
//
//
//
//        print("General Multiplyer is equal \(giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes))")
//
//
//        var mendeleevChart = [
//
//            "H" : 1 , "O" : 16 , "Fe" : 17 , "Se" : 15 , "N" : 14 , "Mn" : 55 , "K" : 39 , "C" : 12
//
//        ]
//
//        func giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies : [String]) -> Int {
//
//            var mass = 0
//            var indexOfElementsWhichAreNotInParenetecies = 0
//
//            for chemicalElement in elementsNotInParentecies {
//
//                indexOfElementsWhichAreNotInParenetecies = indexOfElementsWhichAreNotInParenetecies + 1
//
//                if mendeleevChart[chemicalElement] != nil {
//                    var multiplayer = "1"
//
//
//
//
//                    for (multiplyerFromArray , index) in numbersAndTheirsIndexes {
//
//                        if index != 0 {
//                            if indexOfElementsWhichAreNotInParenetecies == index {
//
//                                if multiplayer == "1" {
//                                    multiplayer = String(multiplyerFromArray)
//                                }else{
//                                    multiplayer = multiplayer + String(multiplyerFromArray)
//                                }
//
//                            }
//
//                        }
//
//                    }
//
//                    mass = mass +  (mendeleevChart[chemicalElement]! * Int(multiplayer)!)
//
//
//
//                }
//            }
//
//
//            return mass
//        }
//
//        giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings)
//
//
//
//        //print("Molecule is \(molecule)")
//        ////print(stringsInParenatacies)
//        //print(numbersAndThersIndexexInParentaciew)
//        //print(generalMultiplayersOfParantacies )
//
//        //print(strings)
//        //print(numbersAndTheirsIndexes)
//
//
//        var emptyArray : [(Int , Int)] = []
//        var iteration = 0
//
//        for (multiplayer , index ) in numbersAndThersIndexexInParentaciew {
//            iteration = iteration + 1
//
//            if emptyArray.count > 0 {
//                if emptyArray.last?.1 == index {
//
//                    emptyArray[emptyArray.count - 1].0 = Int(String(emptyArray.last!.0) + String(multiplayer))!
//                }else{
//                    emptyArray.append((multiplayer , index))
//                }
//            }else{
//                emptyArray.append((multiplayer , index))
//            }
//        }
//
//        print("Number of atom for atom in parentacies \(emptyArray)")
//
//
//
//
//
//
//
//
//
//
//
//
//        print("Molecule is \(molecule)")
//        print(stringsInParenatacies)
//        print(generalMultiplayersOfParantacies )
//        print(emptyArray)
//
//
//        var arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom : [(Int , Int)] = []
//
//
//
//
//
//
//            var iterationHere = 0
//            var indexesThatMustBeRemoved : [Int] = []
//            for (chemicalElement , parentecie) in stringsInParenatacies {
//                iterationHere = iterationHere + 1
//
//                for (indexForAtom , iteratorFromThere) in emptyArray {
//
//                    if iterationHere == iteratorFromThere {
//
//
//                        indexesThatMustBeRemoved.append(iterationHere - 1)
//                        arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.append((mendeleevChart[chemicalElement]! * indexForAtom , Int(parentecie)!)  )
//
//
//
//                    }
//
//
//
//
//
//
//                }
//
//
//
//            }
//
//        print("HELLLO ! \(arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom) indexes that must be removed is")
//
//        if indexesThatMustBeRemoved.count != 0 {
//            for indexToRemove in 0...indexesThatMustBeRemoved.count - 1 {
//
//
//
//                print("""
//                We have situation indexed that must be removed in \(stringsInParenatacies)
//
//                            are \(indexesThatMustBeRemoved)
//
//                       and index to remove is \(indexToRemove)
//                """)
//
//
////
//                if stringsInParenatacies.count > 0 {
//                    if stringsInParenatacies.count == indexesThatMustBeRemoved.count {
//                        stringsInParenatacies.removeAll()
//                    }else{
//                              stringsInParenatacies.remove(at: indexToRemove)
//                    }
//                }
////
//
//
//
//
//            }
//        }
//
//
//
//
//
//
//
//
//        print(stringsInParenatacies)
//
//        //makeMassForArray()
//        //print(arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom)
//
//
//
//
//
//        for (chemicalElement , parentecie) in stringsInParenatacies {
//            arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.append((mendeleevChart[chemicalElement]! , Int(parentecie)!))
//        }
//
//        print("HELLLO \(arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom) indexes that must be removed is")
//
//
//        var massForEveryParentecieButWithoutMultiplicationOfGeneralIndex : [(Int , Int)] = []
//        var iterationAgain = 0
//        arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.sorted { $0.1 > $1.1 }
//        print("arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom is \(arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.sorted { $0.1 > $1.1 })}")
//        for (mass , parentecie ) in arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.sorted(by: { $0.1 > $1.1 }) {
//            print("Masss isss \(mass)")
//
//            iterationAgain = iterationAgain + 1
//
//            if massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.count == 0 {
//                massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.append((mass , parentecie))
//            }else{
//
//                if massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.last!.1 == parentecie {
//                    massForEveryParentecieButWithoutMultiplicationOfGeneralIndex[massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.count - 1].0 = massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.last!.0 + mass
//
//                }else {
//                    massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.append((mass , parentecie))
//                }
//            }
//
//
//
//        }
//
//
//
//
//
//        // 432
//        print(massForEveryParentecieButWithoutMultiplicationOfGeneralIndex)
//
//        print("massForEveryParentecieButWithoutMultiplicationOfGeneralIndex is \(massForEveryParentecieButWithoutMultiplicationOfGeneralIndex) ")
//
//
//
//
//
//        var massOfAllParentaciesIncludingGeneralMultiplyaersForThem = 0
//
//        for (generalMultiplayerForParenteciew , numberOfParenectie) in generalMultiplayersOfParantacies.sorted(by: { Int($0.1!)! > Int($1.1!)! }) {
//            for (mass ,  parentc) in massForEveryParentecieButWithoutMultiplicationOfGeneralIndex {
//                if Int(numberOfParenectie!) == parentc {
//                    massOfAllParentaciesIncludingGeneralMultiplyaersForThem = massOfAllParentaciesIncludingGeneralMultiplyaersForThem + (mass * Int(generalMultiplayerForParenteciew!)!)
//                }
//
//            }
//        }
//
//        print("mass is \(massOfAllParentaciesIncludingGeneralMultiplyaersForThem)")
//
//
//    //    print("Big multiplyers is \(giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes))")
//    //    print("MassOfAllPerentacies \(massOfAllParentaciesIncludingGeneralMultiplyaersForThem) ")
//    //    print("Mass of evertything that is not in perantacies \(giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))")
//
//
//        var massMolecule = giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes) * (massOfAllParentaciesIncludingGeneralMultiplyaersForThem + giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))
//        print("Mass of molecule is uqual \(massMolecule) g / mol")
//
//        print("Mass of all in parentacies is \(massOfAllParentaciesIncludingGeneralMultiplyaersForThem) , mass everything that is not in parentacies is \(giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))")
//
//
//    }
//    //giveMassOfMolecule(molecule: "HNO3(O2)2")
//
//
//
//
//
//}
//
}

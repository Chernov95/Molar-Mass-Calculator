//
//  ViewController.swift
//  molecular wedth
//
//  Created by Filip Cernov on 14/01/2020.
//  Copyright © 2020 Filip Cernov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    
    @IBOutlet weak var chemicalFormula: UITextField!
    @IBOutlet weak var resultOfCalculation: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Fe(Se2Mn)2
    
        resultOfCalculation.text = ""
        
        
        
        
        
        
        
    }
    @IBAction func calculateMolecularMass(_ sender: Any) {
        
        if chemicalFormula.text?.count != 0 {
            let mass = giveMassOfMolecule(molecule: (chemicalFormula.text!))
             
                resultOfCalculation.text = "\(String(mass!)) g / mol "
            
        }else{
            //To show the alert that user havent provided any text
        }
        
        
    }
    
    
    
    func giveMassOfMolecule (molecule : String) ->Int? {
      
         
      
      
      
          var strings : [String] = []
          var numbersAndTheirsIndexes : [(Int , Int)] = []
          var numberOfChemicalElementInMolecule = 0
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
                    
                    
                      
                    
   
                    
                    
                     weAreLookingForMultiplyerAfterParentacies = false
      
      
      
                      if character.isUppercase {
                          strings.append(String(character))
                          numberOfChemicalElementInMolecule = numberOfChemicalElementInMolecule + 1
                          
                        
                          
                        
                      }else if character.isLowercase {
      
                          strings[strings.count - 1] = strings[strings.count - 1] + String(character)
      
                      }
                    
                      
                        
                    
                    

      
           
      
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
          
                              stringsInParenatacies.append((String(character) , String(numberOfParentacies)))
                                 numberOfChemicalElementsInMoleculeInParentiacies = numberOfChemicalElementsInMoleculeInParentiacies + 1
                                                   var letters : [String?] = []
                                                                                          if numberOfIterations < molecule.count || numberOfIterations == molecule.count {
                                                                                              for charakterito in molecule {
                                                                                                  letters.append(String(charakterito))
                                                                                              }
                                                                                            
                                                                                            print("I am here current charakter is \(character)")

                                                                                              var nextLetter = letters[numberOfIterations]
                                                                                            if Int(nextLetter!) == nil  {
                                                                                                
                                                                                                if Character(nextLetter!).isLowercase != true  {
                                                                                                    let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                                                                                                    numbersAndThersIndexexInParentaciew.append((1 , atomThatNeedToMultiply))
                                                                                                    print(numbersAndThersIndexexInParentaciew.count)
                                                                                               print("Current charakter is \(character) next is \(nextLetter)")
                                                                                                    
                                                                                                
                                                                                            }

                                                                                                
                                                                                                
                                                                                                
                                                                                                  
                                                                                              }

                                                                                          }
                                                 
                             }else if character.isLowercase {
      
                              stringsInParenatacies[stringsInParenatacies.count - 1].0 = stringsInParenatacies[stringsInParenatacies.count - 1].0 + String(character)
                                var letters : [String?] = []
                                if numberOfIterations < molecule.count || numberOfIterations == molecule.count {
                                    for charakterito in molecule {
                                        letters.append(String(charakterito))
                                    }
                                  
                                  print("I am here current charakter is \(character)")

                                    var nextLetter = letters[numberOfIterations]
                                  if Int(nextLetter!) == nil  {
                                      
                                      if Character(nextLetter!).isUppercase == true  {
                                          let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                                          numbersAndThersIndexexInParentaciew.append((1 , atomThatNeedToMultiply))
                                          print(numbersAndThersIndexexInParentaciew.count)
                                     print("Current charakter is \(character) next is \(nextLetter) I am adding number 1")
                                      
                                      
                                  }
                                    
                                    if Character(nextLetter!) == ")" {
                                        let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                                        numbersAndThersIndexexInParentaciew.append((1 , atomThatNeedToMultiply))
                                        print(numbersAndThersIndexexInParentaciew.count)
                                    }
                                
      
                             }
                                }
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
      
    
         
      
      
      
       print("numbersAndThersIndexexInParentaciew \(numbersAndThersIndexexInParentaciew)")
        
            if numbersAndThersIndexexInParentaciew.count == 0 {
                numbersAndThersIndexexInParentaciew.append((1 , 1))
            }
      
         
      
      
      
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
      
            "H" : 1 , "O" : 16 , "Fe" : 56 , "Se" : 79 , "N" : 14 , "C" : 12 , "Mn" : 55
      
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
      
      
      
      
      
      
      
      
      
      
      
      
      
      
          print("Molecule is \(molecule)")
          print("stringsInParenatacies \(stringsInParenatacies)")
          print("generalMultiplayersOfParantacies \(generalMultiplayersOfParantacies)")
          print("emptyArray \(emptyArray)")
        
        
        var massOfParentaciesWithoutAddingAndMultiplayerForThem : [(mass : Int , numberOfParentacie : Int)]  = []
        
        
        

        
        
        //Сдесь нужно умножить атом на его количество в парентеси
        var iterationHere = -1

        for (multiplyer , _) in emptyArray {
         iterationHere = iterationHere + 1
            if stringsInParenatacies.count > 0 {
                 massOfParentaciesWithoutAddingAndMultiplayerForThem.append(((mendeleevChart[stringsInParenatacies[iterationHere].0]! * multiplyer) , Int(stringsInParenatacies[iterationHere].1)!))
            }
           



        }
        
        print("massOfParentaciesWithoutAddingAndMultiplayerForThem \(massOfParentaciesWithoutAddingAndMultiplayerForThem)")
        
       print("Empty array is again the game \(emptyArray)")
        
        
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
        //Тут ты не умножил эти цифры на количество атомов(это нужно сделать ранее?) , тут ты просто сложил массы атомов
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
        
      
      
        let massMolecule = giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes) * (massOfParentaciesWithEvething + giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))
        
        print("massOfParentaciesWithEvething \(massOfParentaciesWithEvething)")
        print("giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings) \(giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))")
        
        print("MASS OF MOLECULE IF EQUAL \(massMolecule)")
        
        return massMolecule
      
      }

        

}

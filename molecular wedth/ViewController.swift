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
        
  giveMassOfMolecule(molecule: "C(H2)C(H2)CH4(O2)2")
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


        for character in molecule {
        //    numberOfIteration = numberOfIteration + 1

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

            }



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

            "H" : 1 , "O" : 16 , "Fe" : 17 , "Se" : 15 , "N" : 14 , "Mn" : 55 , "K" : 39 , "C" : 12

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

        giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings)



        //print("Molecule is \(molecule)")
        ////print(stringsInParenatacies)
        //print(numbersAndThersIndexexInParentaciew)
        //print(generalMultiplayersOfParantacies )

        //print(strings)
        //print(numbersAndTheirsIndexes)


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
        print(stringsInParenatacies)
        print(generalMultiplayersOfParantacies )
        print(emptyArray)


        var arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom : [(Int , Int)] = []




            
            
            var iterationHere = 0
            var indexesThatMustBeRemoved : [Int] = []
            for (chemicalElement , parentecie) in stringsInParenatacies {
                iterationHere = iterationHere + 1
              
                for (indexForAtom , iteratorFromThere) in emptyArray {
                    
                    if iterationHere == iteratorFromThere {
                    
                        
                        indexesThatMustBeRemoved.append(iterationHere - 1)
                        arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.append((mendeleevChart[chemicalElement]! * indexForAtom , Int(parentecie)!)  )
                       
                        
                        
                    }
                    
                    
                }
                
                
                
            }
        
        print("""
 indexes that must be removed is \(indexesThatMustBeRemoved)
            
            

""")
        
        if indexesThatMustBeRemoved.count != 0 {
            for indexToRemove in 0...indexesThatMustBeRemoved.count - 1 {
                        
                
                
                print("""
                We have situation indexed that must be removed in \(stringsInParenatacies)
                             
                            are \(indexesThatMustBeRemoved)
                            
                       and index to remove is \(indexToRemove)
                """)
                
          
                if stringsInParenatacies.count > 0 {
                    if stringsInParenatacies.count == indexesThatMustBeRemoved.count {
                        stringsInParenatacies.removeAll()
                    }else{
                              stringsInParenatacies.remove(at: indexToRemove)
                    }
                }
                
                
                
               
                
            }
        }

        
          
            
            
            


        print(stringsInParenatacies)

        //makeMassForArray()
        //print(arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom)





        for (chemicalElement , parentecie) in stringsInParenatacies {
            arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.append((mendeleevChart[chemicalElement]! , Int(parentecie)!))
        }


        var massForEveryParentecieButWithoutMultiplicationOfGeneralIndex : [(Int , Int)] = []
        var iterationAgain = 0
        arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.sorted { $0.1 > $1.1 }
        print(arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.sorted { $0.1 > $1.1 })
        for (mass , parentecie ) in arrayWhereChemicalElementsWasReplacedByMassWhichWasMultiplyedByIndexForAtom.sorted(by: { $0.1 > $1.1 }) {
            print("Masss isss \(mass)")
            
            iterationAgain = iterationAgain + 1
            
            if massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.count == 0 {
                massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.append((mass , parentecie))
            }else{
          
                if massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.last!.1 == parentecie {
                    massForEveryParentecieButWithoutMultiplicationOfGeneralIndex[massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.count - 1].0 = massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.last!.0 + mass
                   
                }else {
                    massForEveryParentecieButWithoutMultiplicationOfGeneralIndex.append((mass , parentecie))
                }
            }
            
            
            
        }



         

        // 432
        print(massForEveryParentecieButWithoutMultiplicationOfGeneralIndex)





        var massOfAllParentaciesIncludingGeneralMultiplyaersForThem = 0

        for (generalMultiplayerForParenteciew , numberOfParenectie) in generalMultiplayersOfParantacies.sorted(by: { Int($0.1!)! > Int($1.1!)! }) {
            for (mass ,  parentc) in massForEveryParentecieButWithoutMultiplicationOfGeneralIndex {
                if Int(numberOfParenectie!) == parentc {
                    massOfAllParentaciesIncludingGeneralMultiplyaersForThem = massOfAllParentaciesIncludingGeneralMultiplyaersForThem + (mass * Int(generalMultiplayerForParenteciew!)!)
                }
                
            }
        }

        print("mass is \(massOfAllParentaciesIncludingGeneralMultiplyaersForThem)")

        
    //    print("Big multiplyers is \(giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes))")
    //    print("MassOfAllPerentacies \(massOfAllParentaciesIncludingGeneralMultiplyaersForThem) ")
    //    print("Mass of evertything that is not in perantacies \(giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))")
        
        
        var massMolecule = giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes) * (massOfAllParentaciesIncludingGeneralMultiplyaersForThem + giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings))
        print("Mass of molecule is uqual \(massMolecule) g / mol")

    }
    //giveMassOfMolecule(molecule: "HNO3(O2)2")


   


}


//
//  Calculation.swift
//  molecular wedth
//
//  Created by Filip Cernov on 14/04/2022.
//  Copyright © 2022 Filip Cernov. All rights reserved.
//

import Foundation




struct Calculation {
    
    var dictionaryToShowPercantageOfEveryAtom : [String : (massOfChemicelElement : Double ,numberOfAtoms : Int)] = [:]
    var keysForDictionaryAbove : [String] = []
    var massOfWholeMoleculeToCalculatePersentage = 0.0
    var bigMultiplyer = 1.0
    let mendeleevChart = [
     
           "H" : 1.0079 , "O" : 15.9994 , "Fe" : 55.845 , "Se" : 78.96 , "N" : 14.01 , "C" : 12.0107 , "Mn" : 54.938 , "He" : 4.0026 , "Li" : 6.941 , "Be" : 9.0122 , "B" : 10.811 ,
           "F" : 18.9984 , "Ne" : 20.1797 , "Na" : 22.9897 , "Mg" : 24.305 , "Al" : 26.9815 , "Si" : 28.0855 , "P" : 30.9738 , "S" : 32.065 , "Cl" : 35.453 , "K" : 39.0983 , "Ar" : 39.948 , "Ca" : 40.078 , "Sc" : 44.9559 , "Ti" : 47.867 , "V" : 50.9415 , "Cr" : 51.9961 , "Ni" : 58.6934  , "Co" : 58.9332 , "Cu" : 63.546 , "Zn" : 65.39 , "Ga" : 69.723 , "Ge" : 72.64 , "As" : 74.9216 ,
           "Br" : 79.904 , "Kr" : 83.8 , "Rb" : 85.4678 , "Sr" : 87.62  , "Y" : 88.9059 , "Zr" : 91.224 , "Nb" : 92.9064 , "Mo" : 95.94 , "Tc" : 98 , "Ru" : 101.07 , "Rh" : 102.9055 , "Pd" : 106.42 ,"Ag" : 107.8682 , "Cd" : 112.411 , "In" : 114.818 , "Sn" :  118.71 , "Sb" : 121.76 , "I" : 126.9045 , "Te" : 127.6 , "Xe" : 131.293 , "Cs" :  132.9055 , "Ba" : 137.327      , "La" :  138.9055 , "Ce" : 140.116 , "Pr" : 140.9077  , "Nd" :  144.24 , "Pm" :  145 , "Sm" :  150.36 , "Eu" :  151.964 , "Gd" :  157.25     , "Tb" : 158.9253  , "Dy" : 162.5  , "Ho" :  164.9303 , "Er" : 167.259      , "Tm" :168.9342   , "Yb" :  173.04 , "Lu" :  174.967     , "Hf" : 178.49  , "Ta" :  180.9479 , "W" : 183.84  , "Re" : 186.207  , "Os" : 190.23  , "Ir" :  192.217 , "Pt" : 195.078  , "Au" :  196.9665     , "Hg" : 200.59, "Tl" :   204.3833, "Pb" :  207.2     , "Bi" : 208.9804  , "Po" : 209  , "At" : 210  , "Rn" :   222 , "Fr" : 223  , "Ra" : 226  , "Ac" : 227  , "Pa" : 231.0359   , "Th" : 232.0381  , "Np" : 237  , "U" : 238.0289  , "Am" :  243 , "Pu" : 244  , "Cm" : 247  , "Bk" : 247  , "Cf" : 251  , "Es" :252   , "Fm" : 257  , "Md" :258   , "No" : 259  , "Rf" : 261  ,"Lr" : 262  ,"Db" :262   ,"Bh" : 264  ,"Sg" :266   ,"Mt" : 268  ,"Rg" :  272 ,"Hs" : 277
        
         ]
    
    
    
    
    mutating func calcualateMassOfMolecule ( molecule : inout String) ->Double? {
        
        //If there is spaces , delete it
        molecule = String(molecule.compactMap({ $0.isWhitespace ? nil : $0 }))
      
       
      
      
      
          var chemicalElementsOutsideOfParentacies : [String] = []
          var numbersAndTheirsIndexes : [(Int , Int)] = []
          var numberOfChemicalElementInMolecule = 0
          var stringsInParenatacies : [(chemicalElement : String ,numberOfParentecie : String)] = []
          var thereIsParentacies : Bool?
          var weAreLookingForMultiplyerAfterParentacies : Bool?
          var numbersAndThersIndexexInParentaciew : [(multiplyerForAtom : Int ,numberOfThisAtomInAmongAllParentecies : Int)] = []
          var numberOfChemicalElementsInMoleculeInParentiacies = 0
          var generalMultiplayersOfParantacies : [(generalMultiplyer : String? ,numberOfParentecie : String?)] = []
          var numberOfParentacies = 0
        
          
        
      
        var numberOfIterations = 0
          for character in molecule {
              numberOfIterations = numberOfIterations + 1
            
            //To make sure that charakter is equal to letter , number or parentecie , otherwise return 0.0
            if  character.isLetter == false && character.isNumber == false && character != "(" && character != ")" {
              
                return 0.0
                
            }
      
              if thereIsParentacies != true {
      
      
                  if character.isUppercase || character.isLowercase {

                     weAreLookingForMultiplyerAfterParentacies = false
      
      
      
                      if character.isUppercase {
                          chemicalElementsOutsideOfParentacies.append(String(character))
                          numberOfChemicalElementInMolecule = numberOfChemicalElementInMolecule + 1
                          
                        
                          
                        
                      }else if character.isLowercase {
                        
                        
                        
                        //Check if index is out of range
                        if chemicalElementsOutsideOfParentacies.count - 1 < 0 || chemicalElementsOutsideOfParentacies.count - 1 == chemicalElementsOutsideOfParentacies.count || chemicalElementsOutsideOfParentacies.count - 1 > chemicalElementsOutsideOfParentacies.count {
                            return 0.0
                        }else{
                            chemicalElementsOutsideOfParentacies[chemicalElementsOutsideOfParentacies.count - 1] = chemicalElementsOutsideOfParentacies[chemicalElementsOutsideOfParentacies.count - 1] + String(character)
                        }
                        
                       
      
                       
      
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
                            if numbersAndTheirsIndexes.last?.1 == atomThatNeedToMultiply {
                                let needToInterpolare = String(numbersAndTheirsIndexes[numbersAndTheirsIndexes.count - 1].0) + String(indexIs!)
                                numbersAndTheirsIndexes[numbersAndTheirsIndexes.count - 1].0 = Int(needToInterpolare)!
                            }else{
                                numbersAndTheirsIndexes.append((indexIs! , atomThatNeedToMultiply))
                            }
                   
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
                                                                                            if numberOfIterations == letters.count {
                                                                                                return 0.0
                                                                                            }

                                                                                              let nextLetter = letters[numberOfIterations]
                                                                                            if Int(nextLetter!) == nil  {
                                                                                                
                                                                                                if Character(nextLetter!).isLowercase != true  {
                                                                                                    let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                                                                                                    numbersAndThersIndexexInParentaciew.append((1 , atomThatNeedToMultiply))
                                                                                                    
                                                                                               
                                                                                                    
                                                                                                
                                                                                            }

                                                                                                
                                                                                                
                                                                                                
                                                                                                  
                                                                                              }

                                                                                          }
                                                 
                             }else if character.isLowercase {
                                if stringsInParenatacies.count == 0 {
                                    print("You havent closed parentecie")
                                    //"H2O(add"
                                    return 0
                                }
                              stringsInParenatacies[stringsInParenatacies.count - 1].0 = stringsInParenatacies[stringsInParenatacies.count - 1].0 + String(character)
                                var letters : [String?] = []
                                if numberOfIterations < molecule.count || numberOfIterations == molecule.count {
                                    for charakterito in molecule {
                                        letters.append(String(charakterito))
                                    }
                                    
                                    for (chemicalElement , _) in stringsInParenatacies {
                                        if mendeleevChart[chemicalElement] == nil {
                                            return 0
                                        }
                                    }
                                  
                                  print("I am here current charakter is \(character)")
                                    if numberOfIterations == letters.count {
                                        return 0.0
                                    }
                                    let nextLetter = letters[numberOfIterations]
                                  if Int(nextLetter!) == nil  {
                                      
                                      if Character(nextLetter!).isUppercase == true  {
                                          let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                                          numbersAndThersIndexexInParentaciew.append((1 , atomThatNeedToMultiply))
                                       
                                   
                                      
                                      
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
                
                
                //I am returning here 0.0 to avoid parentecies in parentecies
                if thereIsParentacies == true {
                    return 0.0
                }
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
          bigMultiplyer = Double(giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes))
      

      
          func giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies : [String]) -> Double {
      
              var mass = 0.0
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
      
                      mass = Double(mass) +  (mendeleevChart[chemicalElement]! * Double(multiplayer)!)
      
      
      
                  }else{
                    return 0.0
                }
              }
      
      
              return mass
          }
     
      
      
      
      
          print("numbersAndThersIndexexInParentaciew \(numbersAndThersIndexexInParentaciew)")
        var multiplyersForAtomsInAllParentacies : [(multiplyerForAtom : Int ,numberOfThisAtomInAmongAllParentecies : Int)] = []
          var iteration = 0
      
          for (multiplayer , index ) in numbersAndThersIndexexInParentaciew {
              iteration = iteration + 1
      
              if multiplyersForAtomsInAllParentacies.count > 0 {
                  if multiplyersForAtomsInAllParentacies.last?.1 == index {
      
                      multiplyersForAtomsInAllParentacies[multiplyersForAtomsInAllParentacies.count - 1].0 = Int(String(multiplyersForAtomsInAllParentacies.last!.0) + String(multiplayer))!
                  }else{
                      multiplyersForAtomsInAllParentacies.append((multiplayer , index))
                  }
              }else{
                  multiplyersForAtomsInAllParentacies.append((multiplayer , index))
              }
          }
      

      
          print("Molecule is \(molecule)")
          print("stringsInParenatacies \(stringsInParenatacies)")
          print("generalMultiplayersOfParantacies \(generalMultiplayersOfParantacies)")
          print("emptyArray \(multiplyersForAtomsInAllParentacies)")
        
        
        var massOfParentaciesWithoutAddingAndMultiplayerForThem : [(mass : Double , numberOfParentacie : Int)]  = []
        
        
        

        
        
        //Сдесь нужно умножить атом на его количество в парентеси
        var iterationHere = -1

        for (multiplyer , _) in multiplyersForAtomsInAllParentacies {
         iterationHere = iterationHere + 1
            if stringsInParenatacies.count > 0 {
                guard let chemicalElementMass = mendeleevChart[stringsInParenatacies[iterationHere].0] else {return 0.0}
                massOfParentaciesWithoutAddingAndMultiplayerForThem.append(((chemicalElementMass * Double(multiplyer)) , Int(stringsInParenatacies[iterationHere].1)!))

            }

        }
        
        print("massOfParentaciesWithoutAddingAndMultiplayerForThem \(massOfParentaciesWithoutAddingAndMultiplayerForThem)")
        
       print("Empty array is again the game \(multiplyersForAtomsInAllParentacies)")
        
        
        var massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer : [(mass : Double , numberOfParentacie : Int)] = []
        
        
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
        
        var massInPareneteciesWithGeneralMyltyplying : [(mass : Double , numberOfParentecie : Int)] = []
        
        for (mass , numberOfparentecieOne) in massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer {
            for (generalMultiplyer , numberOfparentecie) in generalMultiplayersOfParantacies {
                if Int(numberOfparentecie!) == numberOfparentecieOne {
                    massInPareneteciesWithGeneralMyltyplying.append((mass * Double(generalMultiplyer!)! , Int(numberOfparentecie!)!))
                }
            }
        }
        
        print("massInPareneteciesWithGeneralMyltyplying \(massInPareneteciesWithGeneralMyltyplying)")
        
        var massOfParentaciesWithEvething = 0.0
        
        for (mass , _ ) in massInPareneteciesWithGeneralMyltyplying {
            massOfParentaciesWithEvething = massOfParentaciesWithEvething + mass
        }
        
      
      
        let massMolecule = Double(giveMeBigMultiplyer(numbersAndTheirIndexes: numbersAndTheirsIndexes)) * (massOfParentaciesWithEvething + giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: chemicalElementsOutsideOfParentacies))
        
        print("massOfParentaciesWithEvething \(massOfParentaciesWithEvething)")
        print("giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: strings) \(giveMeMassOfEvethingThatIsNotInParentacies(elementsNotInParentecies: chemicalElementsOutsideOfParentacies))")
        
        print("MASS OF MOLECULE IF EQUAL \(massMolecule)")
        

        
        
        var dictinaryWhichHaveInformationAboutAtomsInParentaciesToShowPercentage : [String : (massOfChemicelElement : Double , numberOfAtoms : Int)] = [:]
  
        
        // It calculates make dictionary for , chemical elements outside of parentecies .Seems to work
        func giveDictionaryOfChemicalElementOutsideOfParentacies (chemicalElementsOutsideOfParentecies : [String] , arrayWithMultiplyersAndNumbersOfAtoms : [(Int,Int)] ) -> [String : (massOfChemicelElement : Double ,numberOfAtoms : Int)] {
            
            var dictionary : [String : (massOfChemicelElement : Double , numberOfAtoms : Int)] = [:]
            
            var iteration = 0
            for chemicalElement in chemicalElementsOutsideOfParentecies {
                iteration += 1   //It says what is the number of atom , for example O is iteration = 1


                var insideIterator = 0
                
                var didWeFindAnyIndex = false

                for (multiplyaer , indexOfThisAtom) in arrayWithMultiplyersAndNumbersOfAtoms {

                    insideIterator += 1

                    

                    if indexOfThisAtom == iteration {

                        if dictionary[chemicalElement] == nil {

                            if mendeleevChart[chemicalElement] == nil {
                                return [:]
                            }
                            dictionary[chemicalElement] = (mendeleevChart[chemicalElement]! * Double(multiplyaer), 1 * multiplyaer ) as (massOfChemicelElement: Double, numberOfAtoms: Int)
                        }else {
                            dictionary[chemicalElement] = (dictionary[chemicalElement]!.massOfChemicelElement + (mendeleevChart[chemicalElement]! * Double(multiplyaer)) , dictionary[chemicalElement]!.numberOfAtoms + (1 * multiplyaer))
                        }
                         
                        
                            print("Chemicel element is 1 \(chemicalElement) and number of atoms is \(dictionary[chemicalElement]!.numberOfAtoms)")
                        
                        
                        


                        didWeFindAnyIndex = true
                    }

                    

                }
                
                if didWeFindAnyIndex == false  && insideIterator == arrayWithMultiplyersAndNumbersOfAtoms.count   {
                    
                    
                    if dictionary[chemicalElement] == nil {

                        dictionary[chemicalElement] = (mendeleevChart[chemicalElement] , 1) as? (massOfChemicelElement: Double, numberOfAtoms: Int)
                    } else {
                        dictionary[chemicalElement] = (dictionary[chemicalElement]!.massOfChemicelElement + mendeleevChart[chemicalElement]! , dictionary[chemicalElement]!.numberOfAtoms + 1)
                    }
                    
                    
                    
                    
                    
                }




            }

            
            
            return dictionary
        }


              dictinaryWhichHaveInformationAboutAtomsInParentaciesToShowPercentage = giveDictionaryOfChemicalElementOutsideOfParentacies(chemicalElementsOutsideOfParentecies: chemicalElementsOutsideOfParentacies, arrayWithMultiplyersAndNumbersOfAtoms: numbersAndTheirsIndexes)
        
        
    print("Is this dictionary is set properly ? \(dictinaryWhichHaveInformationAboutAtomsInParentaciesToShowPercentage)")
        
        
        //It makes dictionary for everything that is inside of parentacies
        func makeDictionaryOfChemicalElementsWhichAreInParenteciesAndNot (chemicalElements : [(chemicalElement : String ,numberOfParentecie : String)] , multiplyersForAtomAndIndexAmongAllParenetecies : [(multiplyerForAtom : Int ,numberOfThisAtomInAmongAllParentecies : Int  )] , generalMultiplyersForParentecie : [(generalMultiplyer : String? ,numberOfParentecie : String?)] , dictionryOfInformationAboutAtomsWhichAreNotInParentacies : [String : (massOfChemicelElement : Double ,numberOfAtoms : Int)] ) -> [String : (massOfChemicelElement : Double ,numberOfAtoms : Int)]{

            var dictionary : [String : (massOfChemicelElement : Double ,numberOfAtoms : Int) ] = dictionryOfInformationAboutAtomsWhichAreNotInParentacies

            var iteratorUquivalentOfIndexOfAtomAmongAllParentecies = 0

            for (chemicalEment , numberOfParentacie) in chemicalElements {

                iteratorUquivalentOfIndexOfAtomAmongAllParentecies += 1
                if dictionary[chemicalEment] == nil {

                    //Сделать проверку есть ли в этом парентеси тот же атом типа (HOH) ,когда последний атом такого типа только тогда умнажать на генеральный множитель


                    var whatIsTheGeneralMultiplyer : Int?

                    for (generalMultiplyer , numberOfParentecie) in generalMultiplyersForParentecie {
                        if Int(numberOfParentacie) == Int(numberOfParentecie!) {
                            whatIsTheGeneralMultiplyer = Int(generalMultiplyer!)
                        }
                    }
                    let massIWantToPass = mendeleevChart[chemicalEment]! * Double(multiplyersForAtomAndIndexAmongAllParenetecies[iteratorUquivalentOfIndexOfAtomAmongAllParentecies - 1].multiplyerForAtom) * Double(whatIsTheGeneralMultiplyer!)
                    
                    dictionary[chemicalEment] = (massIWantToPass  , Int(massIWantToPass/mendeleevChart[chemicalEment]!))




                } else {
                    var whatIsTheGeneralMultiplyer : Int?

                    for (generalMultiplyer , numberOfParentecie) in generalMultiplyersForParentecie {
                                         if Int(numberOfParentacie) == Int(numberOfParentecie!) {
                                               whatIsTheGeneralMultiplyer = Int(generalMultiplyer!)
                                           }
                                       }
                    
                    let numberOfAtomThatWeNeedToAddToExistingNumberOfAtoms = (mendeleevChart[chemicalEment]! * Double(multiplyersForAtomAndIndexAmongAllParenetecies[iteratorUquivalentOfIndexOfAtomAmongAllParentecies - 1].multiplyerForAtom) * Double(whatIsTheGeneralMultiplyer!)) / mendeleevChart[chemicalEment]!
                    print("NumberOfAtoms Here is \(numberOfAtomThatWeNeedToAddToExistingNumberOfAtoms)")
                    
                    

                    
                    let massIWantToPass = dictionary[chemicalEment]!.massOfChemicelElement + (mendeleevChart[chemicalEment]! * Double(multiplyersForAtomAndIndexAmongAllParenetecies[iteratorUquivalentOfIndexOfAtomAmongAllParentecies - 1].multiplyerForAtom) * Double(whatIsTheGeneralMultiplyer!))
                    dictionary[chemicalEment] = (massIWantToPass , Int(massIWantToPass / mendeleevChart[chemicalEment]!))
                        
                    
                }





            }
            
            
            
            
            
            return dictionary
        }
   
        
         
        
        dictionaryToShowPercantageOfEveryAtom =  makeDictionaryOfChemicalElementsWhichAreInParenteciesAndNot(chemicalElements: stringsInParenatacies, multiplyersForAtomAndIndexAmongAllParenetecies: multiplyersForAtomsInAllParentacies, generalMultiplyersForParentecie: generalMultiplayersOfParantacies, dictionryOfInformationAboutAtomsWhichAreNotInParentacies: dictinaryWhichHaveInformationAboutAtomsInParentaciesToShowPercentage)

        _ = dictionaryToShowPercantageOfEveryAtom.sorted(by: {$0.value.massOfChemicelElement < $1.value.massOfChemicelElement})
        
        

        for chemicalElement in chemicalElementsOutsideOfParentacies {
            if mendeleevChart[chemicalElement] == nil {
                return 0.0
            }
        }

        
        
        return massMolecule
      
      }
    
    func calculatePersentage (generalMass : Double , massOfAtom : Double) -> Double {
        
        
        return (massOfAtom * 100.0) / generalMass
    }
    
    
    
    
    
    
    
    
    
}




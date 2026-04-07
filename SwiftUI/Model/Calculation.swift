//
//  Calculation.swift
//  molecular wedth
//
//  Created by Filip Cernov on 14/04/2022.
//  Copyright © 2022 Filip Cernov. All rights reserved.
//

import Foundation

struct Calculation {
    
    var dictionaryToShowPercantageOfEveryAtom: [String: (massOfChemicelElement: Double, numberOfAtoms: Int)] = [:]
    var keysForDictionaryAbove: [String] = []
    var massOfWholeMoleculeToCalculatePersentage = 0.0
    var bigMultiplyer = 1.0

    static let mendeleevChart: [String: Double] = [
        "H": 1.0079, "O": 15.9994, "Fe": 55.845, "Se": 78.96, "N": 14.01, "C": 12.0107, "Mn": 54.938, "He": 4.0026, "Li": 6.941, "Be": 9.0122, "B": 10.811,
        "F": 18.9984, "Ne": 20.1797, "Na": 22.9897, "Mg": 24.305, "Al": 26.9815, "Si": 28.0855, "P": 30.9738, "S": 32.065, "Cl": 35.453, "K": 39.0983, "Ar": 39.948, "Ca": 40.078, "Sc": 44.9559, "Ti": 47.867, "V": 50.9415, "Cr": 51.9961, "Ni": 58.6934, "Co": 58.9332, "Cu": 63.546, "Zn": 65.39, "Ga": 69.723, "Ge": 72.64, "As": 74.9216,
        "Br": 79.904, "Kr": 83.8, "Rb": 85.4678, "Sr": 87.62, "Y": 88.9059, "Zr": 91.224, "Nb": 92.9064, "Mo": 95.94, "Tc": 98, "Ru": 101.07, "Rh": 102.9055, "Pd": 106.42, "Ag": 107.8682, "Cd": 112.411, "In": 114.818, "Sn": 118.71, "Sb": 121.76, "I": 126.9045, "Te": 127.6, "Xe": 131.293, "Cs": 132.9055, "Ba": 137.327, "La": 138.9055, "Ce": 140.116, "Pr": 140.9077, "Nd": 144.24, "Pm": 145, "Sm": 150.36, "Eu": 151.964, "Gd": 157.25, "Tb": 158.9253, "Dy": 162.5, "Ho": 164.9303, "Er": 167.259, "Tm": 168.9342, "Yb": 173.04, "Lu": 174.967, "Hf": 178.49, "Ta": 180.9479, "W": 183.84, "Re": 186.207, "Os": 190.23, "Ir": 192.217, "Pt": 195.078, "Au": 196.9665, "Hg": 200.59, "Tl": 204.3833, "Pb": 207.2, "Bi": 208.9804, "Po": 209, "At": 210, "Rn": 222, "Fr": 223, "Ra": 226, "Ac": 227, "Pa": 231.0359, "Th": 232.0381, "Np": 237, "U": 238.0289, "Am": 243, "Pu": 244, "Cm": 247, "Bk": 247, "Cf": 251, "Es": 252, "Fm": 257, "Md": 258, "No": 259, "Rf": 261, "Lr": 262, "Db": 262, "Bh": 264, "Sg": 266, "Mt": 268, "Rg": 272, "Hs": 277
    ]

    mutating func calcualateMassOfMolecule(molecule: inout String) -> Double? {
        let chart = Calculation.mendeleevChart

        // If there are spaces, delete them
        molecule = String(molecule.compactMap({ $0.isWhitespace ? nil : $0 }))

        let characters = Array(molecule)

        var chemicalElementsOutsideOfParentacies: [String] = []
        var numbersAndTheirsIndexes: [(Int, Int)] = []
        var numberOfChemicalElementInMolecule = 0
        var stringsInParenatacies: [(chemicalElement: String, numberOfParentecie: String)] = []
        var thereIsParentacies: Bool?
        var weAreLookingForMultiplyerAfterParentacies: Bool?
        var numbersAndThersIndexexInParentaciew: [(multiplyerForAtom: Int, numberOfThisAtomInAmongAllParentecies: Int)] = []
        var numberOfChemicalElementsInMoleculeInParentiacies = 0
        var generalMultiplayersOfParantacies: [(generalMultiplyer: String?, numberOfParentecie: String?)] = []
        var numberOfParentacies = 0

        var numberOfIterations = 0
        for character in molecule {
            numberOfIterations = numberOfIterations + 1

            // To make sure that character is equal to letter, number or parenthesis, otherwise return 0.0
            if character.isLetter == false && character.isNumber == false && character != "(" && character != ")" {
                return 0.0
            }

            if thereIsParentacies != true {

                if character.isUppercase || character.isLowercase {

                    weAreLookingForMultiplyerAfterParentacies = false

                    if character.isUppercase {
                        chemicalElementsOutsideOfParentacies.append(String(character))
                        numberOfChemicalElementInMolecule = numberOfChemicalElementInMolecule + 1
                    } else if character.isLowercase {

                        // Check if index is out of range
                        if chemicalElementsOutsideOfParentacies.count - 1 < 0 || chemicalElementsOutsideOfParentacies.count - 1 == chemicalElementsOutsideOfParentacies.count || chemicalElementsOutsideOfParentacies.count - 1 > chemicalElementsOutsideOfParentacies.count {
                            return 0.0
                        } else {
                            chemicalElementsOutsideOfParentacies[chemicalElementsOutsideOfParentacies.count - 1] = chemicalElementsOutsideOfParentacies[chemicalElementsOutsideOfParentacies.count - 1] + String(character)
                        }
                    }
                }

                if character.isNumber {

                    if weAreLookingForMultiplyerAfterParentacies == true {
                        if generalMultiplayersOfParantacies.count > 0 {
                            if generalMultiplayersOfParantacies.count == numberOfParentacies {
                                generalMultiplayersOfParantacies[numberOfParentacies - 1].0 = generalMultiplayersOfParantacies[numberOfParentacies - 1].0! + String(character)
                            } else {
                                generalMultiplayersOfParantacies.append((String(character), String(numberOfParentacies)))
                            }
                        } else {
                            generalMultiplayersOfParantacies.append((String(character), String(numberOfParentacies)))
                        }
                    } else {
                        let indexIs = Int(String(character))
                        let atomThatNeedToMultiply = numberOfChemicalElementInMolecule
                        if numbersAndTheirsIndexes.last?.1 == atomThatNeedToMultiply {
                            let needToInterpolare = String(numbersAndTheirsIndexes[numbersAndTheirsIndexes.count - 1].0) + String(indexIs!)
                            numbersAndTheirsIndexes[numbersAndTheirsIndexes.count - 1].0 = Int(needToInterpolare)!
                        } else {
                            numbersAndTheirsIndexes.append((indexIs!, atomThatNeedToMultiply))
                        }
                    }
                }
            }

            if thereIsParentacies == true {

                if character.isUppercase || character.isLowercase {

                    if character.isUppercase {

                        stringsInParenatacies.append((String(character), String(numberOfParentacies)))
                        numberOfChemicalElementsInMoleculeInParentiacies = numberOfChemicalElementsInMoleculeInParentiacies + 1

                        if numberOfIterations <= characters.count {
                            if numberOfIterations == characters.count {
                                return 0.0
                            }

                            let nextLetter = String(characters[numberOfIterations])
                            if Int(nextLetter) == nil {
                                if Character(nextLetter).isLowercase != true {
                                    let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                                    numbersAndThersIndexexInParentaciew.append((1, atomThatNeedToMultiply))
                                }
                            }
                        }

                    } else if character.isLowercase {
                        if stringsInParenatacies.count == 0 {
                            return 0
                        }
                        stringsInParenatacies[stringsInParenatacies.count - 1].0 = stringsInParenatacies[stringsInParenatacies.count - 1].0 + String(character)

                        if numberOfIterations <= characters.count {
                            for (chemicalElement, _) in stringsInParenatacies {
                                if chart[chemicalElement] == nil {
                                    return 0
                                }
                            }

                            if numberOfIterations == characters.count {
                                return 0.0
                            }
                            let nextLetter = String(characters[numberOfIterations])
                            if Int(nextLetter) == nil {
                                if Character(nextLetter).isUppercase == true {
                                    let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                                    numbersAndThersIndexexInParentaciew.append((1, atomThatNeedToMultiply))
                                }

                                if Character(nextLetter) == ")" {
                                    let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                                    numbersAndThersIndexexInParentaciew.append((1, atomThatNeedToMultiply))
                                }
                            }
                        }
                    }
                }

                if character.isNumber {
                    let indexIs = Int(String(character))
                    let atomThatNeedToMultiply = numberOfChemicalElementsInMoleculeInParentiacies
                    numbersAndThersIndexexInParentaciew.append((indexIs!, atomThatNeedToMultiply))
                }
            }

            if character == "(" {
                // Returning 0.0 to avoid parentheses inside parentheses
                if thereIsParentacies == true {
                    return 0.0
                }
                thereIsParentacies = true
                numberOfParentacies = numberOfParentacies + 1
            }
            if character == ")" {
                thereIsParentacies = false
                weAreLookingForMultiplyerAfterParentacies = true

                if numberOfIterations <= characters.count {
                    if numberOfIterations != characters.count {
                        let nextLetter = String(characters[numberOfIterations])
                        if Int(nextLetter) == nil {
                            generalMultiplayersOfParantacies.append((String(1), String(numberOfParentacies)))
                        }
                    } else if numberOfIterations == characters.count {
                        generalMultiplayersOfParantacies.append((String(1), String(numberOfParentacies)))
                    }
                }
            }
        }

        if numbersAndThersIndexexInParentaciew.count == 0 {
            numbersAndThersIndexexInParentaciew.append((1, 1))
        }

        bigMultiplyer = Double(Calculation.giveMeBigMultiplyer(numbersAndTheirsIndexes: numbersAndTheirsIndexes))

        let massOfNonParenthesized = Calculation.giveMeMassOfEverythingNotInParentheses(
            elementsNotInParentecies: chemicalElementsOutsideOfParentacies,
            numbersAndTheirsIndexes: numbersAndTheirsIndexes,
            chart: chart
        )

        var multiplyersForAtomsInAllParentacies: [(multiplyerForAtom: Int, numberOfThisAtomInAmongAllParentecies: Int)] = []

        for (multiplayer, index) in numbersAndThersIndexexInParentaciew {
            if multiplyersForAtomsInAllParentacies.count > 0 {
                if multiplyersForAtomsInAllParentacies.last?.1 == index {
                    multiplyersForAtomsInAllParentacies[multiplyersForAtomsInAllParentacies.count - 1].0 = Int(String(multiplyersForAtomsInAllParentacies.last!.0) + String(multiplayer))!
                } else {
                    multiplyersForAtomsInAllParentacies.append((multiplayer, index))
                }
            } else {
                multiplyersForAtomsInAllParentacies.append((multiplayer, index))
            }
        }

        var massOfParentaciesWithoutAddingAndMultiplayerForThem: [(mass: Double, numberOfParentacie: Int)] = []

        var iterationHere = -1
        for (multiplyer, _) in multiplyersForAtomsInAllParentacies {
            iterationHere = iterationHere + 1
            if stringsInParenatacies.count > 0 {
                guard let chemicalElementMass = chart[stringsInParenatacies[iterationHere].0] else { return 0.0 }
                massOfParentaciesWithoutAddingAndMultiplayerForThem.append(((chemicalElementMass * Double(multiplyer)), Int(stringsInParenatacies[iterationHere].1)!))
            }
        }

        var massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer: [(mass: Double, numberOfParentacie: Int)] = []

        for (mass, parentecie) in massOfParentaciesWithoutAddingAndMultiplayerForThem {
            if massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.count > 0 {
                if massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.last?.numberOfParentacie == parentecie {
                    massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer[massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.count - 1].mass = massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer[massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.count - 1].mass + mass
                } else {
                    massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.append((mass, parentecie))
                }
            } else {
                massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer.append((mass, parentecie))
            }
        }

        var massInPareneteciesWithGeneralMyltyplying: [(mass: Double, numberOfParentecie: Int)] = []

        for (mass, numberOfparentecieOne) in massOfParticularParentecieWithAddingButWithoutGeneralMultiplyer {
            for (generalMultiplyer, numberOfparentecie) in generalMultiplayersOfParantacies {
                if Int(numberOfparentecie!) == numberOfparentecieOne {
                    massInPareneteciesWithGeneralMyltyplying.append((mass * Double(generalMultiplyer!)!, Int(numberOfparentecie!)!))
                }
            }
        }

        var massOfParentaciesWithEvething = 0.0

        for (mass, _) in massInPareneteciesWithGeneralMyltyplying {
            massOfParentaciesWithEvething = massOfParentaciesWithEvething + mass
        }

        let massMolecule = Double(Calculation.giveMeBigMultiplyer(numbersAndTheirsIndexes: numbersAndTheirsIndexes)) * (massOfParentaciesWithEvething + massOfNonParenthesized)

        let dictinaryWhichHaveInformationAboutAtomsInParentaciesToShowPercentage = Calculation.giveDictionaryOfChemicalElementOutsideOfParentacies(
            chemicalElementsOutsideOfParentecies: chemicalElementsOutsideOfParentacies,
            arrayWithMultiplyersAndNumbersOfAtoms: numbersAndTheirsIndexes,
            chart: chart
        )

        dictionaryToShowPercantageOfEveryAtom = Calculation.makeDictionaryOfChemicalElementsInAndOutOfParentheses(
            chemicalElements: stringsInParenatacies,
            multiplyersForAtomAndIndexAmongAllParenetecies: multiplyersForAtomsInAllParentacies,
            generalMultiplyersForParentecie: generalMultiplayersOfParantacies,
            dictionryOfInformationAboutAtomsWhichAreNotInParentacies: dictinaryWhichHaveInformationAboutAtomsInParentaciesToShowPercentage,
            chart: chart
        )

        _ = dictionaryToShowPercantageOfEveryAtom.sorted(by: { $0.value.massOfChemicelElement < $1.value.massOfChemicelElement })

        for chemicalElement in chemicalElementsOutsideOfParentacies {
            if chart[chemicalElement] == nil {
                return 0.0
            }
        }

        return massMolecule
    }

    // MARK: - Extracted helper methods

    private static func giveMeBigMultiplyer(numbersAndTheirsIndexes: [(Int, Int)]) -> Int {
        var multiplyer: String?

        for (coeficient, index) in numbersAndTheirsIndexes {
            if index == 0 {
                if multiplyer == nil {
                    multiplyer = String(coeficient)
                } else {
                    multiplyer = multiplyer! + String(coeficient)
                }
            }
        }

        if let multiplyer = multiplyer {
            return Int(multiplyer) ?? 1
        } else {
            return 1
        }
    }

    private static func giveMeMassOfEverythingNotInParentheses(elementsNotInParentecies: [String], numbersAndTheirsIndexes: [(Int, Int)], chart: [String: Double]) -> Double {
        var mass = 0.0
        var indexOfElementsWhichAreNotInParenetecies = 0

        for chemicalElement in elementsNotInParentecies {
            indexOfElementsWhichAreNotInParenetecies = indexOfElementsWhichAreNotInParenetecies + 1

            if let elementMass = chart[chemicalElement] {
                var multiplayer = "1"

                for (multiplyerFromArray, index) in numbersAndTheirsIndexes {
                    if index != 0 {
                        if indexOfElementsWhichAreNotInParenetecies == index {
                            if multiplayer == "1" {
                                multiplayer = String(multiplyerFromArray)
                            } else {
                                multiplayer = multiplayer + String(multiplyerFromArray)
                            }
                        }
                    }
                }

                mass = mass + (elementMass * Double(multiplayer)!)
            } else {
                return 0.0
            }
        }

        return mass
    }

    private static func giveDictionaryOfChemicalElementOutsideOfParentacies(chemicalElementsOutsideOfParentecies: [String], arrayWithMultiplyersAndNumbersOfAtoms: [(Int, Int)], chart: [String: Double]) -> [String: (massOfChemicelElement: Double, numberOfAtoms: Int)] {
        var dictionary: [String: (massOfChemicelElement: Double, numberOfAtoms: Int)] = [:]

        var iteration = 0
        for chemicalElement in chemicalElementsOutsideOfParentecies {
            iteration += 1

            var insideIterator = 0
            var didWeFindAnyIndex = false

            for (multiplyaer, indexOfThisAtom) in arrayWithMultiplyersAndNumbersOfAtoms {
                insideIterator += 1

                if indexOfThisAtom == iteration {
                    if dictionary[chemicalElement] == nil {
                        if chart[chemicalElement] == nil {
                            return [:]
                        }
                        dictionary[chemicalElement] = (chart[chemicalElement]! * Double(multiplyaer), 1 * multiplyaer) as (massOfChemicelElement: Double, numberOfAtoms: Int)
                    } else {
                        dictionary[chemicalElement] = (dictionary[chemicalElement]!.massOfChemicelElement + (chart[chemicalElement]! * Double(multiplyaer)), dictionary[chemicalElement]!.numberOfAtoms + (1 * multiplyaer))
                    }

                    didWeFindAnyIndex = true
                }
            }

            if didWeFindAnyIndex == false && insideIterator == arrayWithMultiplyersAndNumbersOfAtoms.count {
                if dictionary[chemicalElement] == nil {
                    dictionary[chemicalElement] = (chart[chemicalElement], 1) as? (massOfChemicelElement: Double, numberOfAtoms: Int)
                } else {
                    dictionary[chemicalElement] = (dictionary[chemicalElement]!.massOfChemicelElement + chart[chemicalElement]!, dictionary[chemicalElement]!.numberOfAtoms + 1)
                }
            }
        }

        return dictionary
    }

    private static func makeDictionaryOfChemicalElementsInAndOutOfParentheses(chemicalElements: [(chemicalElement: String, numberOfParentecie: String)], multiplyersForAtomAndIndexAmongAllParenetecies: [(multiplyerForAtom: Int, numberOfThisAtomInAmongAllParentecies: Int)], generalMultiplyersForParentecie: [(generalMultiplyer: String?, numberOfParentecie: String?)], dictionryOfInformationAboutAtomsWhichAreNotInParentacies: [String: (massOfChemicelElement: Double, numberOfAtoms: Int)], chart: [String: Double]) -> [String: (massOfChemicelElement: Double, numberOfAtoms: Int)] {

        var dictionary: [String: (massOfChemicelElement: Double, numberOfAtoms: Int)] = dictionryOfInformationAboutAtomsWhichAreNotInParentacies

        var iteratorUquivalentOfIndexOfAtomAmongAllParentecies = 0

        for (chemicalEment, numberOfParentacie) in chemicalElements {
            iteratorUquivalentOfIndexOfAtomAmongAllParentecies += 1

            if dictionary[chemicalEment] == nil {
                var whatIsTheGeneralMultiplyer: Int?

                for (generalMultiplyer, numberOfParentecie) in generalMultiplyersForParentecie {
                    if Int(numberOfParentacie) == Int(numberOfParentecie!) {
                        whatIsTheGeneralMultiplyer = Int(generalMultiplyer!)
                    }
                }
                let massIWantToPass = chart[chemicalEment]! * Double(multiplyersForAtomAndIndexAmongAllParenetecies[iteratorUquivalentOfIndexOfAtomAmongAllParentecies - 1].multiplyerForAtom) * Double(whatIsTheGeneralMultiplyer!)

                dictionary[chemicalEment] = (massIWantToPass, Int(massIWantToPass / chart[chemicalEment]!))
            } else {
                var whatIsTheGeneralMultiplyer: Int?

                for (generalMultiplyer, numberOfParentecie) in generalMultiplyersForParentecie {
                    if Int(numberOfParentacie) == Int(numberOfParentecie!) {
                        whatIsTheGeneralMultiplyer = Int(generalMultiplyer!)
                    }
                }

                let massIWantToPass = dictionary[chemicalEment]!.massOfChemicelElement + (chart[chemicalEment]! * Double(multiplyersForAtomAndIndexAmongAllParenetecies[iteratorUquivalentOfIndexOfAtomAmongAllParentecies - 1].multiplyerForAtom) * Double(whatIsTheGeneralMultiplyer!))
                dictionary[chemicalEment] = (massIWantToPass, Int(massIWantToPass / chart[chemicalEment]!))
            }
        }

        return dictionary
    }

    func calculatePersentage(generalMass: Double, massOfAtom: Double) -> Double {
        return (massOfAtom * 100.0) / generalMass
    }
}

//
//  MolarMassCalculatorTests.swift
//  MolarMassCalculatorTests
//
//  Created by Filip Cernov on 29/04/2022.
//  Copyright © 2022 Filip Cernov. All rights reserved.
//

import XCTest
@testable import Molar_Mass_Calculator

class MolarMassCalculatorTests: XCTestCase {
    
    var calculation: Calculation!

    override func setUpWithError() throws {
        calculation = Calculation()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        calculation = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
   
    
    func testWithProvidingFakeMolecules() {
        var fakeMoleculeOne = "asdasdasd"
        let calculateFirstFakeMolecule = calculation.calcualateMassOfMolecule(molecule: &fakeMoleculeOne)?.rounded(toPlaces: 2)
        XCTAssertEqual(calculateFirstFakeMolecule , 0.0)
        
        var fakeMoleculeTwo = "Fe(OH)3asdasdasdasd"
        let calculateSecondFakeMolecule = calculation.calcualateMassOfMolecule(molecule: &fakeMoleculeTwo)?.rounded(toPlaces: 2)
        XCTAssertEqual(calculateSecondFakeMolecule , 0.0)
 
    }
    
    func testAccuracy() {
        var waterMolecule = "H2O"
        let resultOfCalculation = calculation.calcualateMassOfMolecule(molecule: &waterMolecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(resultOfCalculation , 18.02)
    }
    
    
    
 

}

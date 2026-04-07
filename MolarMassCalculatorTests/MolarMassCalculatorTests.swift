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
    }

    override func tearDownWithError() throws {
        calculation = nil
    }

    // MARK: - Simple molecules (no parentheses)

    func testWaterH2O() {
        var molecule = "H2O"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 18.02)
    }

    func testSodiumChlorideNaCl() {
        var molecule = "NaCl"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 58.44)
    }

    func testSulfuricAcidH2SO4() {
        var molecule = "H2SO4"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 98.08)
    }

    func testPhosphoricAcidH3PO4() {
        var molecule = "H3PO4"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 98.0)
    }

    func testSodiumOxideNa2O() {
        var molecule = "Na2O"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 61.98)
    }

    func testMagnesiumOxideMgO() {
        var molecule = "MgO"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 40.3)
    }

    // MARK: - Molecules with parentheses

    func testAluminumHydroxideAlOH3() {
        var molecule = "Al(OH)3"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 78.0)
    }

    func testIronHydroxideFeOH3() {
        var molecule = "Fe(OH)3"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 106.87)
    }

    func testCalciumNitrateCaNO3_2() {
        var molecule = "Ca(NO3)2"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 164.09)
    }

    // MARK: - Multi-digit subscripts

    func testSucroseC12H22O11() {
        var molecule = "C12H22O11"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 342.3)
    }

    // MARK: - Single element

    func testSingleElementOxygen() {
        var molecule = "O"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 16.0)
    }

    func testSingleElementFe() {
        var molecule = "Fe"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 55.85)
    }

    // MARK: - Invalid inputs

    func testFakeMoleculeReturnsZero() {
        var molecule = "asdasdasd"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 0.0)
    }

    func testPartiallyValidMoleculeReturnsZero() {
        var molecule = "Fe(OH)3asdasdasdasd"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 0.0)
    }

    func testSpecialCharactersReturnZero() {
        var molecule = "H2O!"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 0.0)
    }

    // MARK: - Whitespace handling

    func testWhitespaceIsStripped() {
        var molecule = "H 2 O"
        let result = calculation.calcualateMassOfMolecule(molecule: &molecule)?.rounded(toPlaces: 2)
        XCTAssertEqual(result, 18.02)
    }

    // MARK: - Percentage dictionary is populated

    func testPercentageDictionaryIsPopulatedForH2O() {
        var molecule = "H2O"
        _ = calculation.calcualateMassOfMolecule(molecule: &molecule)
        XCTAssertFalse(calculation.dictionaryToShowPercantageOfEveryAtom.isEmpty)
        XCTAssertNotNil(calculation.dictionaryToShowPercantageOfEveryAtom["H"])
        XCTAssertNotNil(calculation.dictionaryToShowPercantageOfEveryAtom["O"])
    }

    func testPercentageDictionaryAtomCountsForH2O() {
        var molecule = "H2O"
        _ = calculation.calcualateMassOfMolecule(molecule: &molecule)
        XCTAssertEqual(calculation.dictionaryToShowPercantageOfEveryAtom["H"]?.numberOfAtoms, 2)
        XCTAssertEqual(calculation.dictionaryToShowPercantageOfEveryAtom["O"]?.numberOfAtoms, 1)
    }
}

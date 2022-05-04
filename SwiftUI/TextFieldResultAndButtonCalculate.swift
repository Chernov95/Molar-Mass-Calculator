//
//  Textfield.swift
//  molecular wedth
//
//  Created by Filip Cernov on 14/04/2022.
//  Copyright © 2022 Filip Cernov. All rights reserved.
//

import SwiftUI


struct TextFieldResultAndButtonCalculate : View {
    
  
        @State var textFieldText : String = ""
        @State var molarMassAndUnits : String = ""
        @State var keysForDictionaryAbove : [String] = []
        @State var chemicalFormulaIsNotIdentified = false
        @State var chemicalSubstances = ["H2O", "H2SO4", "Al(OH)3", "Fe(OH)3", "H3PO4", "NaCl", "Na2O", "MgO"]
        @Binding var calculation : Calculation
        
        

         var body: some View {
             VStack {
                 ZStack{
                     VStack {
                             TextField("Chemical Formula", text: $textFieldText)
                             .textFieldStyle(MyTextFieldStyle())
                             .accentColor(Color("CursorColor"))
                             .toolbar(content: {
                                 ToolbarItemGroup(placement: .keyboard) {
                                     ForEach(0...2, id: \.self) { i in
                                         Spacer()
                                         Button {
                                             textFieldText = chemicalSubstances[i]
                                         } label: {
                                             Text("\(chemicalSubstances[i])")
                                                 .foregroundColor(Color("SuggestionsColor"))
                                         }
                                         Spacer()
                                     }
                             }
                             })
                                         .multilineTextAlignment(.center)
                                         .showClearButton($textFieldText)
                         //It hides default suggestion of words for the keyboard
                                         .keyboardType(.alphabet)
                                         .disableAutocorrection(true)
                                         .onChange(of: textFieldText) { textFieldText in
                                             molarMassAndUnits = ""
                                             calculation = Calculation()
                                             chemicalFormulaIsNotIdentified = false
                                             self.chemicalSubstances.sort { lhs, rhs in
                                                 return lhs.equalityScore(with: textFieldText) > rhs.equalityScore(with: textFieldText)
                                             }
                                         }
                         Spacer()
                         if molarMassAndUnits != "0.0 g / mol" && molarMassAndUnits != "0.0 g" {
                             MassTextView(massAndUnits: molarMassAndUnits)
                         }else{
                             ErrorView()
                         }
                         if chemicalFormulaIsNotIdentified {
                             ErrorView()
                         }
                         Spacer()
                    }
                     Spacer()
                                .padding(.bottom, 100)
                     }
                     .background(
                        Color("TopAndBottomViewColor")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                     )
                     .padding()
                     .clipped()
                     .shadow(radius: 4, x: 1, y: 3)
                 Button {
                   buttonPressed()
                 } label: {
                     Text("Calculate".uppercased())
                         .font(Font.custom("Koulen-Regular", size: 25))
                         .frame(width: 250, height: 50)
                         .foregroundColor(.white)
                         .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth:8)
                         )
                         .background(Color("CalculateButtonColor"))
                         .cornerRadius(10)
                         .shadow(color: .gray, radius: 2, x: 1, y: 2)
                 }
             }
        }
    
    func buttonPressed() {
        if calculation.keysForDictionaryAbove.count > 0 {
            calculation.keysForDictionaryAbove.removeAll()
            }
            
            if textFieldText.count != 0 {
                if let result = calculation.calcualateMassOfMolecule(molecule: &textFieldText) {
                        calculation.massOfWholeMoleculeToCalculatePersentage = result * calculation.bigMultiplyer
                    if calculation.bigMultiplyer == 1{
                       molarMassAndUnits =  "\(String(result.rounded(toPlaces: 2)) ) g / mol"
                    } else {
                           molarMassAndUnits = "\(String(result.rounded(toPlaces: 2))) g"
                    }
                        for (key , _) in calculation.dictionaryToShowPercantageOfEveryAtom.sorted(by: {$0.value.massOfChemicelElement > $1.value.massOfChemicelElement}) {
                            calculation.keysForDictionaryAbove.append(key)
                        }
                    
                    if molarMassAndUnits == "0.0 g / mol" || molarMassAndUnits == "0.0 g" {
                        chemicalFormulaIsNotIdentified = true
                        molarMassAndUnits = ""
                        calculation = Calculation()
                    }else{
                        chemicalFormulaIsNotIdentified = false
                        
                        
                        let impactMed = UIImpactFeedbackGenerator(style: .rigid)
                           impactMed.impactOccurred()
                        
                        
                        //Get a feedback from user
                        let reviewService = ReviewService.shared
                        let deadline = DispatchTime.now() + .seconds(2)
                        DispatchQueue.main.asyncAfter(deadline: deadline) {
                            reviewService.requestReview()
                        }
                        
                    }
               
                    
                   }
                    
            }
            
        hideKeyboard()
    }
}









struct Textfield_Previews: PreviewProvider {
    
    static private var calculation = Binding.constant(Calculation())
    

    static var previews: some View {
        TextFieldResultAndButtonCalculate(calculation: calculation)
            .previewDevice("iPhone SE (3rd generation)")
            .preferredColorScheme(.light)
    }
}

extension View {
    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text))
    }
}

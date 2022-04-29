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
        @Binding var calculation : Calculation
        @State var molarMassAndUnits : String = ""
        @State var keysForDictionaryAbove : [String] = []
        @State var chemicalFormulaIsNotIdentified = false
        @State var chemicalSubstances = ["H2O", "H2SO4", "Al(OH)3", "Fe(OH)3"]
        let reviewService = ReviewService.shared
        

         var body: some View {
             VStack {
                 ZStack{
                     VStack {
                             TextField("Chemical Formula", text: $textFieldText)
                             .textFieldStyle(MyTextFieldStyle())
                             .accentColor(.black)
                        
                             .toolbar(content: {
                                 
                                
                                
                                 ToolbarItemGroup(placement: .keyboard) {
                                     
                                    
                                     ForEach(0...2, id: \.self) { i in
                                         
                                         Spacer()
                                         Button {
                                             print("Button is clicked")
                                             textFieldText = chemicalSubstances[i]
                                         } label: {
                                             Text("\(chemicalSubstances[i])")
                                                 .foregroundColor(Color("SuggestionsColor"))
                                         }
                                         Spacer()
                                         
                                     }
                                     
//                                                     ForEach(chemicalSubstances, id: \.self) { chemicalSubstance in
//                                                         Spacer()
//                                                         Button {
//                                                             print("Button is clicked")
//                                                         } label: {
//                                                             Text("\(chemicalSubstance)")
//                                                         }
//                                                         Spacer()
//                                                     }
      
                             }

                             })
                    
                        

                                         .multilineTextAlignment(.center)
                                         .showClearButton($textFieldText)
                                        
                                        
                         
                         //It hides default suggestion for the keyboard
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
                             Spacer()
                         }else{
                             ErrorView()
                             Spacer()
                         }
                         if chemicalFormulaIsNotIdentified {
                             ErrorView()
                             Spacer()
                         }
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
                     if calculation.keysForDictionaryAbove.count > 0 {
                         calculation.keysForDictionaryAbove.removeAll()
                         }
                         
                         if textFieldText.count != 0 {
                             if let result = calculation.calcualateMassOfMolecule(molecule: &textFieldText) {
                                 
                                 
                                
                                     calculation.massOfWholeMoleculeToCalculatePersentage = result * calculation.bigMultiplyer
                                 if calculation.bigMultiplyer == 1{
                                    molarMassAndUnits =  "\(String(result.rounded(toPlaces: 2)) ) g / mol"
                                 }else{
                                     
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
                                     let deadline = DispatchTime.now() + .seconds(2)
                                     DispatchQueue.main.asyncAfter(deadline: deadline) {
                                         reviewService.requestReview()
                                     }
                                     
                                 }
                            
                                 
                                }
                                 
                         }
                         
                     print("Hello, after pressing button array with keys is \(calculation.keysForDictionaryAbove) , dictionary is  \(calculation.dictionaryToShowPercantageOfEveryAtom)")
                         
                     hideKeyboard()
                 } label: {
                     Text("Calculate")
                         .frame(width: 300, height: 50)
                         .foregroundColor(.white)
                         .background(.red)
                 }
             }
        }
      
       
        
}





struct TextFieldClearButton: ViewModifier {
    @Binding var fieldText: String

    func body(content: Content) -> some View {
        
            content
                .overlay {
                if !fieldText.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            fieldText = ""
                                
                            print("Clear button is pressed")
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                        }
                        .foregroundColor(.secondary)
                        .padding(.trailing, 25)
                    }
                }
            }
    }
}



struct Textfield_Previews: PreviewProvider {
    
    static private var calculation = Binding.constant(Calculation())
    

    static var previews: some View {
        TextFieldResultAndButtonCalculate(calculation: calculation)
            .preferredColorScheme(.dark)
    }
}

extension View {
    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text))
    }
}

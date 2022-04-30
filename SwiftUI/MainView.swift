//
//  MainView.swift
//  molecular wedth
//
//  Created by Filip Cernov on 14/04/2022.
//  Copyright © 2022 Filip Cernov. All rights reserved.
//

import SwiftUI


struct MainView: View {
    
    @State private var calculation = Calculation()
  
    var body: some View {
        GeometryReader { _ in
            ZStack {
                VStack {
                    TextFieldResultAndButtonCalculate(calculation: $calculation)
                    Spacer()
                    BottomView(calculation: $calculation)
                }
                .background(Color("BackgroundColor"))
                .onTapGesture {
                    hideKeyboard()
                }
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

struct BottomView : View {
    
    @Binding var calculation : Calculation
    
    var body: some View {
        ZStack {
            VStack {
                Labels()
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 5)
                DataLabels(calculation: $calculation)
        }
        .background(Color("TopAndBottomViewColor"))
        .padding()
        .clipped()
        .shadow(radius: 4, x: 1, y: 3)
    
    }
       
  }
}

struct Labels : View {
    var body: some View {
        HStack {
            DetailsTextView()
            Spacer()
        }
        .padding(.leading, 12)
        .padding(.top)
       
        HStack  {
            DetailsLabel(labelName: "Element")
            Spacer()
            DetailsLabel(labelName: "Mass \n(g)")
            Spacer()
            DetailsLabel(labelName: "Number of atoms")
            Spacer()
            DetailsLabel(labelName: "Mass \n(%)")
        }
        .padding(.leading)
        .padding(.trailing)
        .padding(.top, 1)
       
    }
}

struct DataLabels : View {
    @Binding var calculation : Calculation
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach(0..<calculation.keysForDictionaryAbove.count, id: \.self) { i in
                    let keyForDictionary = calculation.keysForDictionaryAbove[i]
                    let symbol = keyForDictionary
                    let bigMultiplyer = calculation.bigMultiplyer
                    let massOfTheAtom = calculation.dictionaryToShowPercantageOfEveryAtom[keyForDictionary]!.massOfChemicelElement  * bigMultiplyer
                    let numberOfAtoms = calculation.dictionaryToShowPercantageOfEveryAtom[symbol]!.numberOfAtoms * Int(bigMultiplyer)
                    let massOfTheMolecule = calculation.massOfWholeMoleculeToCalculatePersentage / bigMultiplyer
                    let percentage = (massOfTheAtom / massOfTheMolecule) * 100
                    if i == 0 {
                        DetailedData(symbol: symbol, massOfTheAtom: String(massOfTheAtom.rounded(toPlaces: 2)), numberOfAtoms: String(numberOfAtoms), percentage: String(percentage.rounded(toPlaces: 2)), color: .red )
                       
                    }else if i == calculation.keysForDictionaryAbove.count - 1 {
                        DetailedData(symbol: symbol, massOfTheAtom: String(massOfTheAtom.rounded(toPlaces: 2)), numberOfAtoms: String(numberOfAtoms), percentage: String(percentage.rounded(toPlaces: 2)), color: .green)
                    }else{
                        DetailedData(symbol: symbol, massOfTheAtom: String(massOfTheAtom.rounded(toPlaces: 2)), numberOfAtoms: String(numberOfAtoms), percentage: String(percentage.rounded(toPlaces: 2)), color: .random)
                    }
       
                }
            }
          
    }
        
      

    }
}

struct DetailedData : View {
    var symbol : String
    var massOfTheAtom : String
    var numberOfAtoms : String
    var percentage : String
    var color : Color?
    
    var body: some View {
            VStack {
                HStack {
                        DataLabel(text: symbol)
                        Spacer()
                        DataLabel(text: massOfTheAtom)
                        .padding(.trailing, 20)
                        Spacer()
                        DataLabel(text: numberOfAtoms)
                        Spacer()
                        DataLabel(text: percentage, color: color)
                        .padding(.leading)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom, 5)
                   
            }
            
    }
}






struct MainView_Previews: PreviewProvider {
   
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11")
    }
}




#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

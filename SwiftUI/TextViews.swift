//
//  TextViews.swift
//  molecular wedth
//
//  Created by Filip Cernov on 14/04/2022.
//  Copyright © 2022 Filip Cernov. All rights reserved.
//

import SwiftUI

struct TextViews: View {
    
    
   
    var body: some View {
        ZStack {
            VStack {
                MassTextView(massAndUnits: "18.02 g / mol")
                DetailsTextView()
                DetailsLabel(labelName: "Element")
                DataLabel(text: "15.99")
                ErrorView()
                
            }
        }
    }
}

struct MassTextView : View {
    
    let massAndUnits : String
    
    var body: some View {
        Text("\(massAndUnits)")
            .foregroundColor(Color("MassTextViewColor"))
            .font((Font.custom("Tahoma-Bold", size: 32, relativeTo: .largeTitle)))
            
        
    }
}

struct ErrorView : View {
    
   
    
    var body: some View {
        Text("Chemical formula is not identified\n😬\nCheck your spelling 🔍")
            .foregroundColor(.indigo)
            .font(Font.custom("LucidaGrande", size: 15, relativeTo: .subheadline))
            .multilineTextAlignment(.center)
            .frame(width: 300, height: 70, alignment: .center)
    }
    
}

struct DetailsTextView : View {
    var body: some View {
        Text("Details :")
            .foregroundColor(Color("DetailsLabelTextViewColor"))
            .bold()
            .font(Font.custom("Futura Bold", size: 18.7, relativeTo: .headline))
           
    }
}

struct DataLabel : View {
    
    var text : String
    var color : String?

    
    var body: some View {
        Text(text)
            .foregroundColor(Color(color ?? "DetailsLabelTextViewColor"))
            .foregroundColor(.red)
            .font(Font.custom("LucidaGrande", size: 17, relativeTo: .body))
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .frame(width: 50, height: 20, alignment: .center)
            .minimumScaleFactor(0.01)
      
    }
        
}



struct DetailsLabel : View {
    
    var labelName : String
    
    
    var body: some View {
        Text(labelName)
            .foregroundColor(Color("DetailsLabelTextViewColor"))
            .font(Font.custom("Verdana", size: 11, relativeTo: .caption2))
            .multilineTextAlignment(.center)
            
    }
}

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .font(Font.custom("Hoefler Text", size: 25))
        .padding(10)
       
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(Color.white, lineWidth: 3)
        ).padding()
            
    }
}



struct TextViews_Previews: PreviewProvider {
    

 
    static var previews: some View {
        TextViews()
            .previewDevice("iPhone SE (3rd generation)")
        
   }
}

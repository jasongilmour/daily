//
//  IntroView.swift
//  Daily
//
//  Created by Jason Gilmour on 07/11/2020.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text("How it works" )
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                    .italic()
                    .padding(.bottom)
                Text("Daily is Designed to help you form habits.")
                    .padding(.bottom)
                Text("Add todo’s that you can check off every day. At midnight, the list resets and you start over.")
                    .padding(.bottom)
                Text("At the end of the week/month/year you can see what habbits stuck and track how often you managed to do the things that matter to you.")
                
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Form your first habit")
                }
            }
            .frame(maxWidth: 560)
            .padding()
        }
        .background(LinearGradient(
            gradient: Gradient(colors: [Color("BackgroundTop"), Color("BackgroundBottom")]),
            startPoint: .top,
            endPoint: .bottom
        ))
        .padding()
        .font(.system(.body, design: .serif))
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

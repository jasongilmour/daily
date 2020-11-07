//
//  ContentView.swift
//  Daily
//
//  Created by Jason Gilmour on 07/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Menu")
            }
            Spacer()
            VStack {
                Text("— Morning —")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                    .frame(maxWidth: 560)
                Group {
                    HStack() {
                        Circle()
                            .stroke()
                            .frame(width: 22, height: 22)
                        Text("Sit down for breakfast")
                            .font(.body)
                    }
                    .frame(height: 32, alignment: .leading)
                    .padding(.bottom)
                    
                    .frame(height: 32)
                    Text("Excercise for 20 minutes")
                        .font(.body)
                        .padding(.bottom)
                    Text("Meditate")
                        .font(.body)
                        .padding(.bottom)
                }
                .frame(maxWidth: 560, alignment: .leading)
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Form your first habit")
                }
            }
        }
        .frame(maxWidth: 560)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

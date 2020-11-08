//
//  ContentView.swift
//  Daily
//
//  Created by Jason Gilmour on 07/11/2020.
//

import SwiftUI

struct ContentView: View {
    @State var showNewItemForm = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Menu")
            }
            Spacer()
            VStack {
                Text("— Morning —")
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                    .italic()
                    .frame(maxWidth: 560)
                    .padding(.bottom)
                Group {
                    HStack() {
                        Circle()
                            .stroke()
                            .frame(width: 22, height: 22)
                        Text("Sit down for breakfast")
                    }
                    .frame(height: 32, alignment: .leading)
                    .padding(.bottom)
                    HStack() {
                        Circle()
                            .stroke()
                            .frame(width: 22, height: 22)
                        Text("Excercise for 20 minutes")
                    }
                    .frame(height: 32, alignment: .leading)
                    .padding(.bottom)
                    HStack() {
                        Circle()
                            .stroke()
                            .frame(width: 22, height: 22)
                        Text("Sit down for breakfast")
                    }
                    .frame(height: 32, alignment: .leading)
                    .padding(.bottom)
                    
                    .frame(height: 32)
                }
                .frame(maxWidth: 560, alignment: .leading)
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: { self.showNewItemForm.toggle() }) {
                    Text("Form your first habit")
                }
                .sheet(isPresented: $showNewItemForm) {
                    NewItemView(isPresented: self.$showNewItemForm)
                }
            }
        }
        .padding()
        .background(LinearGradient(
            gradient: Gradient(colors: [Color("BackgroundTop"), Color("BackgroundBottom")]),
            startPoint: .top,
            endPoint: .bottom
        ))
        .font(.system(.body, design: .serif))
        .frame(maxWidth: 560)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

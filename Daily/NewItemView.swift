//
//  NewItemView.swift
//  Daily
//
//  Created by Jason Gilmour on 07/11/2020.
//

import SwiftUI

struct NewItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer()
            Group {
                Text("Habit")
                    .font(.system(.subheadline, design: .serif))
                Text("Sit down for breakfast")
                Divider()
            }
            Group {
                Text("Section")
                    .font(.subheadline).font(.system(.subheadline, design: .serif))
                Text("Morning")
                Divider()
            }
            Group {
                Text("Frequency")
                    .font(.system(.subheadline, design: .serif))
                Text("Daily")
                Divider()
            }
            VStack(alignment: .center) {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Add")
                        .font(.system(.title, design: .serif))
                }
            }
            Spacer()
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

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}

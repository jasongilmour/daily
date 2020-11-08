//
//  NewItemView.swift
//  Daily
//
//  Created by Jason Gilmour on 07/11/2020.
//

import SwiftUI

struct NewItemView: View {
    @Binding var isPresented: Bool

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
                Button(action: { self.isPresented = false }, label: {
                    Text("Add")
                        .font(.system(.title2, design: .serif))
                        .fontWeight(.bold)
                        .italic()
                        .tracking(2)
                        .foregroundColor(Color("TextInverted"))
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .frame(width: 144, height: 44)
                        .background(Color("AccentColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                })
            }
            .frame(maxWidth: .infinity)
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
        NewItemView(isPresented: .constant(true))
    }
}

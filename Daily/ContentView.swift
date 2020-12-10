//
//  ContentView.swift
//  Daily
//
//  Created by Jason Gilmour on 07/11/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = HabitStore()
    @State var showNewItemForm = false
    
    var body: some View {
        VStack {
            Group() {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Menu")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            ScrollView(.vertical) {
                VStack {
                    Group {
                        Text("— Morning —")
                            .font(.system(.title, design: .serif))
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                            .italic()
                            .padding(.vertical)
                        Group {
                            // Habits in DailyStore.swift
                            ForEach(store.habits) { habit in
                                HabitItem(title: habit.title, completedToday: habit.completedToday)
                            }
                        }
                        .frame(maxWidth: 560, alignment: .leading)
                    }
                }
                .padding()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: { self.showNewItemForm.toggle() }) {
                    Text("Form your first habit")
                }
                .padding()
                .sheet(isPresented: $showNewItemForm) {
                    NewItemView(isPresented: self.$showNewItemForm)
                }
            }
        }
        .foregroundColor(Color("TextDefault"))
        .background(LinearGradient(
            gradient: Gradient(colors: [Color("BackgroundTop"), Color("BackgroundBottom")]),
            startPoint: .top,
            endPoint: .bottom
        ))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .font(.system(.body, design: .serif))
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct HabitItem: View {
    var title: String
    var completedToday: Bool

    var body: some View {
        HStack() {
            Image(systemName: completedToday ? "checkmark.circle.fill" : "circle")
                .foregroundColor(Color(completedToday ? "AccentColor" : "TextMuted"))
                .font(.system(size: 24, weight: completedToday ? .medium : .light))
                .frame(width: 32)
            Text(title)
        }
        .frame(height: 32, alignment: .leading)
        .padding(.bottom, 4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

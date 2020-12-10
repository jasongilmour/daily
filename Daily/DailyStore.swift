//
//  DailyStore.swift
//  Daily
//
//  Created by Jason Gilmour on 08/11/2020.
//

import SwiftUI
import Combine

struct Habit: Identifiable {
    var id = UUID()
    var title: String
    var completedToday: Bool
}

let habitData = [
    Habit(title: "Breakfast at the dining table", completedToday: true),
    Habit(title: "Excercise for 20 minutes", completedToday: false),
    Habit(title: "Meditate", completedToday: false),
]

class HabitStore: ObservableObject{
    @Published var habits: [Habit] = habitData
}

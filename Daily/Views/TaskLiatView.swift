//
//  ContentView.swift
//  Daily
//
//  Created by Jason Gilmour on 07/11/2020.
//

import SwiftUI


struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    @State var presentAddNewItem = false
    @State var showNewItemForm = false
    
    var body: some View {
        NavigationView {
            VStack {
                Group() {
                    Button(action: {}) {
                        Text("Menu")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                ScrollView(.vertical) {
                    VStack {
                        Text("— Morning —")
                            .font(.system(.title, design: .serif))
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                            .italic()
                            .padding(.vertical)
                        Group {
                            ForEach (taskListVM.taskCellViewModels) { taskCellVM in
                                TaskCell(taskCellVM: taskCellVM)
                            }
                            //                        .onDelete { indexSet in
                            //                            self.taskListVM.removeTasks(atOffsets: indexSet)
                            //                        }
                            if presentAddNewItem {
                                TaskCell(taskCellVM: TaskCellViewModel.newTask()) { result in
                                    if case .success(let task) = result {
                                        self.taskListVM.addTask(task: task)
                                    }
                                    self.presentAddNewItem.toggle()
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
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
            .navigationBarHidden(true)
            //      .navigationBarTitle("Tasks")
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

enum InputError: Error {
    case empty
}

//struct ContentView: View {
//    @ObservedObject var store = HabitStore()
//    @State var showNewItemForm = false
//
//    var body: some View {
//        VStack {
//            Group() {
//                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//                    Text("Menu")
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
//            ScrollView(.vertical) {
//                VStack {
//                    Group {
//                        Text("— Morning —")
//                            .font(.system(.title, design: .serif))
//                            .fontWeight(.bold)
//                            .foregroundColor(.accentColor)
//                            .italic()
//                            .padding(.vertical)
//                        Group {
//                            // Habits in DailyStore.swift
//                            ForEach(store.habits) { habit in
//                                HabitItem(title: habit.title, completedToday: habit.completedToday)
//                            }
//                        }
//                        .frame(maxWidth: 560, alignment: .leading)
//                    }
//                }
//                .padding()
//            }
//            Spacer()
//            HStack {
//                Spacer()
//                Button(action: { self.showNewItemForm.toggle() }) {
//                    Text("Form your first habit")
//                }
//                .padding()
//                .sheet(isPresented: $showNewItemForm) {
//                    NewItemView(isPresented: self.$showNewItemForm)
//                }
//            }
//        }
//        .foregroundColor(Color("TextDefault"))
//        .background(LinearGradient(
//            gradient: Gradient(colors: [Color("BackgroundTop"), Color("BackgroundBottom")]),
//            startPoint: .top,
//            endPoint: .bottom
//        ))
//        .clipShape(RoundedRectangle(cornerRadius: 16))
//        .font(.system(.body, design: .serif))
//        .frame(maxWidth: .infinity)
//        .padding()
//    }
//}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    var onCommit: (Result<Task, InputError>) -> Void = { _ in }
    
    var body: some View {
        HStack() {
            Image(systemName: taskCellVM.completionStateIconName)
                .resizable()
                .foregroundColor(Color(taskCellVM.task.completed ? "AccentColor" : "TextMuted"))
                .font(.system(size: 24, weight: taskCellVM.task.completed ? .medium : .light))
                .frame(width: 32, height: 32)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
                }
            TextField("Enter task title", text: $taskCellVM.task.title,
                      onCommit: {
                        if !self.taskCellVM.task.title.isEmpty {
                            self.onCommit(.success(self.taskCellVM.task))
                        }
                        else {
                            self.onCommit(.failure(.empty))
                        }
                      }).id(taskCellVM.id)
        }
        .frame(alignment: .leading)
        .padding(.vertical, 4)
    }
}

//struct HabitItem: View {
//    var title: String
//    var completedToday: Bool
//
//    var body: some View {
//        HStack() {
//            Image(systemName: completedToday ? "checkmark.circle.fill" : "circle")
//                .foregroundColor(Color(completedToday ? "AccentColor" : "TextMuted"))
//                .font(.system(size: 24, weight: completedToday ? .medium : .light))
//                .frame(width: 32)
//            Text(title)
//        }
//        .frame(height: 32, alignment: .leading)
//        .padding(.bottom, 4)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

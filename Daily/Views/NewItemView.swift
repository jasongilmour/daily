//
//  NewItemView.swift
//  Daily
//
//  Created by Jason Gilmour on 07/11/2020.
//

import SwiftUI

struct NewItemView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    @ObservedObject var taskCellVM: TaskCellViewModel
    @Binding var isPresented: Bool
    @State private var habit: String = ""
    var onCommit: (Result<Task, InputError>) -> Void = { _ in }
    
//    @ObservedObject var store = HabitStore()
//    var sections = ["Morning", "Afternoon", "Evening"]
//    var frequencies = ["Daily", "Weekly", "Monthly"]
//    @State private var selectedSectionIndes = 0
//    @State private var selectedFrequencyIndex = 0
    
    //    func addHabit() {
    //        store.habits.append(Habit(title: "Holy shit it worked", completedToday: false))
    //        self.isPresented = false
    //    }
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    
                    Section {
                        Text("Habit")
                            .font(.system(.caption, design: .serif))
                            .tracking(2)
                            .foregroundColor(Color("TextMuted"))
                            .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        
                        TaskCell(taskCellVM: TaskCellViewModel.newTask()) { result in
                            if case .success(let task) = result {
                                taskListVM.addTask(task: task)
                            }
                        }
                        
                        TextField("Meditate", text: $habit,
                                  onCommit: { result in
                                    if case .success(let task) = result {
                                        taskListVM.addTask(task: task)
                                        isPresented.toggle()
                                    }
                                  })
                            .padding(.vertical, 8)
                        Divider()
                            .padding(.bottom)
                    }
                    //                    Section {
                    //                        Picker(selection: self.$selectedCrossSection, label: Text("Querschnitt")) {
                    //
                    //                            ForEach(self.oListDatasource.CrossSections, id: \.self) { item in
                    //                                Text(item.CrossSection).tag(item.rowIndex)
                    //                            }
                    //                        }
                    //                            //.pickerStyle(SegmentedPickerStyle()).foregroundColor(Color.orange)
                    //
                    //                            .font(Font.custom("ArialMT", size: 12))
                    //                            .onReceive([self.selectedCrossSection].publisher.first()) { (value) in
                    //                                print(self.oListDatasource.CrossSections[self.selectedCrossSection].CrossSection)
                    //
                    //                        }
                    //                    }
                    
                    
                    
                    //                    Section {
                    //                        Picker(
                    //                            selection: $selectedSectionIndes,
                    //                            label: Text("Section")
                    //                                .font(.system(.caption, design: .serif))
                    //                                .tracking(2)
                    //                                .foregroundColor(Color("TextMuted"))
                    //                                .textCase(.uppercase)
                    //                        ) {
                    //                            ForEach(0 ..< sections.count) {
                    //                                Text(self.sections[$0])
                    //                                    .foregroundColor(Color("TextDefault"))
                    //                            }
                    //                        }
                    //                        Divider()
                    //                            .padding(.vertical)
                    //                    }
                    //                    Section {
                    //                        Picker(
                    //                            selection: $selectedFrequencyIndex,
                    //                            label: Text("Frequency")
                    //                                .font(.system(.caption, design: .serif))
                    //                                .tracking(2)
                    //                                .foregroundColor(Color("TextMuted"))
                    //                                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    //                        ) {
                    //                            ForEach(0 ..< frequencies.count) {
                    //                                Text(self.frequencies[$0])
                    //                                    .foregroundColor(Color("TextDefault"))
                    //                            }
                    //                        }
                    //                        .buttonStyle(BorderlessButtonStyle())
                    //                        Divider()
                    //                            .padding(.vertical)
                    //                    }
                    Section {
                        VStack(alignment: .center) {
                            Button( action: { isPresented.toggle() }, label: {
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
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Spacer()
                }
                .background(Color(.clear))
                .padding(.vertical)
            }
            .background(LinearGradient(
                gradient: Gradient(colors: [Color("BackgroundTop"), Color("BackgroundBottom")]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .font(.system(.body, design: .serif))
            .frame(maxWidth: 560)
            .padding()
            .navigationBarTitle("Build a Habit")
        }
    }
}

struct SheetTaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    var onCommit: (Result<Task, InputError>) -> Void = { _ in }

    var body: some View {
        TextField("Meditate", text: $taskCellVM.task.title,
                  onCommit: {
                    if !self.taskCellVM.task.title.isEmpty {
                        self.onCommit(.success(self.taskCellVM.task))
                    }
                    else {
                        self.onCommit(.failure(.empty))
                    }
                  }).id(taskCellVM.id)
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(taskCellVM: TaskCellViewModel.newTask(), isPresented: .constant(true))
    }
}

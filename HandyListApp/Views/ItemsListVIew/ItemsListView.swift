//
//  ItemsListView.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

struct ItemsListView: View {
        @Environment(\.managedObjectContext) private var viewContext
    
        @EnvironmentObject var taskListVM:TaskListViewModel
    
        @FetchRequest(entity: TaskList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) var fetchedTaskList:FetchedResults<TaskList>
        
        @State private var addView = false
    
    // paramenters for add to the list by Speech
    @State private var recording = false
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: 30)
    private var speechManager = SpeechManager()
        
        var body: some View {
            NavigationView{
                ZStack(alignment: .bottomTrailing) {
                List{
                    Section("Favorite"){
                        ForEach(fetchedTaskList.filter{$0.isFavorite == true}){item in
                            TaskListCell(taskListItem: item)
                        }
                    }
                    Section("Items"){
                        ForEach(fetchedTaskList.filter{$0.isFavorite == false}){item in
                            TaskListCell(taskListItem: item)
                        }
                    }
                    
                }
                    //add text with speech
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.black.opacity(0.7))
                        .padding()
                        .overlay(
                            VStack {
                                visualizerView()
                            }
                        )
                        .opacity(recording ? 1 : 0)
                    
                    VStack {
                        recordButton()
                    }
                }.onAppear {
                    speechManager.checkPermissions()
                }
           
                // add text with pop up
                .sheet(isPresented: $addView){
                    AddListView(addView: $addView)
                }
                .toolbar{
                    Button(action: {
                        taskListVM.taskListTitle = ""
                        taskListVM.taskListItem = nil
                        addView.toggle()
                    }, label: {
                        Label("Add Item",systemImage: "plus")
                    })
                }
                .navigationTitle("Grocery List")
        
            }
        }
        

private func recordButton() -> some View {
    Button(action: addItem) {
        Image(systemName: recording ? "stop.fill" : "mic.fill")
            .font(.system(size: 40))
            .padding()
            .cornerRadius(10)
    }.foregroundColor(.red)
}

private func normalizeSoundLevel(level: Float) -> CGFloat {
    let level = max(0.2, CGFloat(level) + 50) / 2 // between 0.1 and 25
    
    return CGFloat(level * (100 / 25)) // scaled to max at 300 (our height of our bar)
}

private func visualizerView() -> some View {
   return VStack {
        HStack(spacing: 4) {
            ForEach(mic.soundSamples, id: \.self) { level in
                VisualBarView(value: self.normalizeSoundLevel(level: level))
            }
        }
    }
}

private func addItem() {
    if speechManager.isRecording {
        self.recording = false
        mic.stopMonitoring()
        speechManager.stopRecording()
    } else {
        self.recording = true
        mic.startMonitoring()
        speechManager.start { (speechText) in
            guard let text = speechText, !text.isEmpty else {
                self.recording = false
                return
            }

           // taskListVM.createTask(context: viewContext)
            DispatchQueue.main.async {
                withAnimation {

                    let newItem = TaskList(context: viewContext)
                    newItem.id = UUID()
                    newItem.title = text
                    newItem.isDone = false
                    newItem.isFavorite = false
                    newItem.date = Date()


                    do {
                        try viewContext.save()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
            }
        }
    }
    speechManager.isRecording.toggle()
}

    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

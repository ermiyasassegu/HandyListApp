//
//  ItemsListView.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

struct ItemsListView: View {
    
        @Environment(\.managedObjectContext) private var viewContext
        @EnvironmentObject var itemListVM:ItemListViewModel
    
        // fetch from the persistance store
        @FetchRequest(entity: TaskList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) var fetchedItemList:FetchedResults<TaskList>
        @State private var addView = false
    
    // paramenters for add to the list by Speech
    @State private var recording = false
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: 30)
    
    
    private var speechManager = SpeechManager()
        
        var body: some View {
            NavigationView{
                ZStack(alignment: .bottomTrailing) {
                List{
                    Section(LocalizedStringKey("Favorite")){
                        ForEach(fetchedItemList.filter{$0.isFavorite == true}) {item in
                            ItemListCell(itemListItem: item)
                        }
                    }
                    Section(LocalizedStringKey("Items")) {
                        ForEach(fetchedItemList.filter{$0.isFavorite == false}) {item in
                            ItemListCell(itemListItem: item)
                        } .accessibility(identifier: "itemList")
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
                        itemListVM.itemListTitle = ""
                        itemListVM.itemListItem = nil
                        addView.toggle()
                    }, label: {
                        Label("Add Item",systemImage: "plus")
                            .accessibility(identifier: "showAddItemButton")
                    })
                }
                .navigationTitle(LocalizedStringKey("GroceryList"))
        
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
// sound level scaled the bar height while speaking
private func normalizeSoundLevel(level: Float) -> CGFloat {
    let level = max(0.2, CGFloat(level) + 50) / 2 // sound level between 0.1 and 25
    
    return CGFloat(level * (100 / 25))
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
// The item add to the itemlist while the stop monitoring record stops otherwise start recording
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

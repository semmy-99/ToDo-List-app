//
//  ListView.swift
//  TodoList
//
//  Created by Oluwasemilore on 5/9/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var isActive = false
    var body: some View {
            VStack {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
//                            .swipeActions {
//                                Button("Rename"){
//                                    isActive.toggle()
//                                }
//                                Button("Delete"){
//                                    listViewModel.deleteItem(indexSet: item)
//                                }
//                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Todo List📝")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("Add",destination: AddView())
              )
                NavigationLink("", destination: AddView(), isActive: $isActive)

            }
           
        
        
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
.previewInterfaceOrientation(.portrait)
    }
}


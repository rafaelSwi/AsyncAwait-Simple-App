import SwiftUI

struct MainView: View {
    
    @StateObject private var currentDateListVM = CurrentDateListViewModel()
    
    var body: some View {
        
        NavigationView {
            
            List(currentDateListVM.currentDates, id: \.id) {
                currentDate in
                Text("\(currentDate.date)")
            }.listStyle(.plain)
            
                .navigationTitle("Dates")
            
                .navigationBarItems(trailing: Button(action: {
                    Task {
                        await currentDateListVM.populateDates()
                    }
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                }))
                .task {
                    await currentDateListVM.populateDates()
                }
        }
    }
}

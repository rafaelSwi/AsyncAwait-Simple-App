import Foundation

@MainActor
class CurrentDateListViewModel: ObservableObject {
    
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func populateDates() async {
        
        do {
            
            let currentDate = try await WebService().getDate()
            
            if let currentDate = currentDate {
                let currentDateViewModel = CurrentDateViewModel(currentDate: currentDate)
                
                    self.currentDates.append(currentDateViewModel)
                
            }
            
        } catch {
            print (error)
        }
    }
}

struct CurrentDateViewModel {
    
    var id: UUID {
        currentDate.id
    }
    
    let currentDate: CurrentDate
    
    var date: String {
        currentDate.date
    }
    
}

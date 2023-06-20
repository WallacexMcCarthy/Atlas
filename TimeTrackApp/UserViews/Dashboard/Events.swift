//
//  Events.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 6/15/23.
//

import SwiftUI

struct Events: View {
    @State var selectedDate: Date = Date()
    var body: some View {
        VStack{
            VStack() {
                
                Divider().frame(height: 1)
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .padding(.horizontal)
                    .datePickerStyle(.graphical)
                Divider()
                Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 28))
                    .bold()
                    .foregroundColor(Color.accentColor)
                    .padding()
                    .animation(.spring(), value: selectedDate)
                    .frame(width: 500)
                NavigationLink(selectedDate.formatted(date: .abbreviated, time: .omitted), destination: EventsView(with:loadEvent(date: selectedDate)))                            }
            .padding(.vertical, 100)
        }
    }
}

struct Events_Previews: PreviewProvider {
    static var previews: some View {
        Events()
    }
}

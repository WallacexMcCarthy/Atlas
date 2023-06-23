//
//  AttendanceConfirmationView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/23/22.
//

import SwiftUI

/*
 This view is not in use at the moment.
 */
struct AttendanceConfirmationView: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var textes = "Hello"
    @State private var counter = 0

    var body: some View {
        VStack{
            Text("\(textes)")
        }
        .onReceive(timer, perform: {
            _ in
            counter += 1
            if(counter > 5){
                textes = "Big"}
        })
    }
}

struct AttendanceConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceConfirmationView()
    }
}

//
//  GenericView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 5/28/23.
//

import SwiftUI

struct GenericView: View {
    var userData = UserData<Student>()
    var body: some View {
        Text("data")
    }
}

struct GenericView_Previews: PreviewProvider {
    static var previews: some View {
        GenericView()
    }
}

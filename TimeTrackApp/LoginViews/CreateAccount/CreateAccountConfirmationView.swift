//
//  CreateAccountConfirmationView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/27/22.
//

import SwiftUI
/*
 once the user finished creating an account they will be directed here to confirm all of the details and then directed back to the login view. 
 */
struct CreateAccountConfirmationView: View {
    @State private var userData = loadUserData()
    var body: some View {
            Text("Monkeuy")
    }
}

struct CreateAccountConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountConfirmationView()
    }
}

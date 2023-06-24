//
//  FirebaseManager.swift
//  TimeTrackApp
//
//  Created by MacBook Pro on 6/22/23.
//

import Foundation
import Firebase

class FirebaseManager: NSObject {
    
    let auth: Auth
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        
        
        super.init()
    }
    
}

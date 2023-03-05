//
//  ImagePicker.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 2/25/23.
//

import SwiftUI
import UIKit
/**
    This view allows the user to select an image from their photo library and then use that image to create a profile picture for their account.
    */
struct ImagePicker: UIViewControllerRepresentable
{
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    /**
        This function creates the image picker view.
        */
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController
    {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    /**
        This function updates the image picker view.
        */  
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context)
    {
        // none for now
    }
    /**
        This function creates the coordinator for the image picker view.
        */
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate
    {
        var parent : ImagePicker
        init(_ parent: ImagePicker)
        {
            self.parent = parent
        }
        func imagePickerController(_ picker : UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
        {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    /**
        This function creates the coordinator for the image picker view.
        */
    func makeCoordinator() -> Coordinator
    {
        Coordinator(self)
    }
    
}

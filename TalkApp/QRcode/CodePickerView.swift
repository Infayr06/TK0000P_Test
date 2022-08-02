//
//  CodePickerView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/24.
//  カメラ
//

import SwiftUI
import UIKit

struct CodePickerView: UIViewControllerRepresentable {
    @Binding var isShowSheet: Bool
    @Binding var captureImage: UIImage?
    
    class Coordinator: NSObject,
                      UINavigationControllerDelegate,
                      UIImagePickerControllerDelegate{
        let parent: CodePickerView
        
        init(_ parent: CodePickerView){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info:
                                   [UIImagePickerController.InfoKey : Any]){
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                parent.captureImage = originalImage
            }
            
            parent.isShowSheet = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShowSheet = false
        }
    } //Coodinator
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<CodePickerView>) -> UIImagePickerController{
            let myImagePickerController = UIImagePickerController()
            myImagePickerController.sourceType = .camera
            myImagePickerController.delegate = context.coordinator
            return myImagePickerController
        }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CodePickerView>) {
        
    }
}



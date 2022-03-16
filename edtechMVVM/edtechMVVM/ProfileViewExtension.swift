//
//  ProfileViewExtension.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation
import UIKit
import YoutubePlayer_in_WKWebView

extension profileViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    

    @objc func btnCameraClicked() {
        let picker = UIImagePickerController()
        #if targetEnvironment(simulator)

        picker.sourceType = .photoLibrary
        #else
        picker.sourceType = .camera

        #endif
        picker .delegate = self
        present(picker, animated: false, completion: nil)
  }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: false, completion: nil)
        guard let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        else {
            return
        }
        imageView.image = img
        
    }

}

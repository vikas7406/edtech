//
//  detailViewExtension.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation
import UIKit

extension detailedViewController  {
  
    @objc func btnBackClicked() {
        dismiss(animated: false, completion: nil)

    }
    
}
extension detailedViewController : DetailViewModelDelegate {
    func sendImage(image: UIImage) {
        btnFav .setImage(image, for: .normal)
    }
    
    
}

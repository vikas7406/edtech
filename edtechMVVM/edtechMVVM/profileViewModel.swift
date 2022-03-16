//
//  profileViewModel.swift
//  edtechMVVM
//
//  Created by admin on 16/03/22.
//

import Foundation
import Foundation
protocol ProfileViewModelDelegate {
    
func startVideo(url: String)
    
 func startVideoWith(error: String)


}

struct ProfileViewModel{
    var delegate : ProfileViewModelDelegate?

    
    func userRequest(url : String )
    {
        let validationResult = Validation().Validate()
        if(validationResult.success)
        {
            self.delegate?.startVideo(url: url)
        }
        else{
            self.delegate?.startVideoWith(error: validationResult.error!)
        }
        
    }
    
   
}

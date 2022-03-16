//
//  userViewModel.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation
protocol UserViewModelDelegate {
    
    func didUserResponse(UserRespone: [UserResponse])
    
    func didUserResponse(error: String)

}

struct UserViewModel{
    var delegate : UserViewModelDelegate?

    
    func userRequest()
    {
        let validationResult = Validation().Validate()
        if(validationResult.success)
        {
            let albumResource = UserResource()
            albumResource.userResponse(){ (userApiResponse) in
              DispatchQueue.main.async {
            self.delegate?.didUserResponse(UserRespone: userApiResponse)
                  }

        }
                
        }
        else{
           
            self.delegate?.didUserResponse(error: validationResult.error!)
        }
        
    }
    
   
}

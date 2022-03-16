//
//  UserResource.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation
struct UserResource
{
   
    func userResponse( completion : @escaping (_ Result: [UserResponse]) -> Void)
    {
        let httpUtility = HttpUtility()

        let employeeEndpoint = ApiEndpoints.user
        
        let requestUrl = URL(string:employeeEndpoint)!
        
       

        httpUtility.getApi(requestUrl: requestUrl, resultType: [UserResponse].self) { (albumApiResponse) in

            _ = completion(albumApiResponse)
        }
    }
}

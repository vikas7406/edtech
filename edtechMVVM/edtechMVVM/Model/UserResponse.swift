//
//  UserResponse.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation

struct UserResponse  : Decodable
{
   

    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company

    
    init(data: UserResponse , key : Int){
        self.name = data.name
        self.username = data.username
        self.email = data.email
        self.address = data.address
        self.phone = data.phone
        self.website = data.website
        self.company = data.company
          self.id = key
       }
   
}

// MARK: - Address
struct Address: Decodable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Decodable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Decodable {
    let name, catchPhrase, bs: String
    
   
}

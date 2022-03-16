//
//  DetailViewModel.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation
import UIKit
protocol DetailViewModelDelegate {
    func sendImage(image : UIImage)
   
}
struct DeataiLViewModel{
    var delegate : DetailViewModelDelegate?

    func chechFav(fav : Int){
        
            if  let image = UIImage(named: fav == 0  ?  "redHeart" : "heartBlack" ) as UIImage?{
                self.delegate?.sendImage(image: image)

        }
    }
        func upddateModel(data : UserResponse){
            chechFav(fav: data.id == 0 ? 1 : 0)

            }
        
    }
    



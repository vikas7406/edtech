//
//  detailedViewController.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import UIKit

class detailedViewController: UIViewController {
    // MARK: BUTTONS
  
    @IBOutlet var btnFav: UIButton!
    @IBOutlet var btnBack: UIButton!
    // MARK: LABLES

    @IBOutlet weak var lbl12: UILabel!
    @IBOutlet weak var lbl14: UILabel!
    @IBOutlet weak var lbl13: UILabel!
    @IBOutlet weak var lbl11: UILabel!
    @IBOutlet weak var lbl10: UILabel!
    @IBOutlet weak var lbl9: UILabel!
    @IBOutlet weak var lbl8: UILabel!
    @IBOutlet weak var lbl7: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    
    var dataMain : UserResponse? = nil

    private var detailViewModel = DeataiLViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.delegate = self
       addTarget()

    }
    func addTarget(){
        btnBack.addTarget(self, action: #selector(btnBackClicked), for: .touchUpInside)
        btnFav.addTarget(self, action: #selector(btnFavClicked), for: .touchUpInside)

    }
 
    // MARK: Setup UI

    func setup(data : UserResponse){
        dataMain = data
        lbl1.text = data.name
        lbl2.text = data.username
        lbl3.text = data.email
        lbl4.text = data.phone
        lbl5.text = data.website
        lbl6.text = data.address.street
        lbl7.text = data.address.suite
        lbl8.text = data.address.city
        lbl9.text = data.address.zipcode
        lbl10.text = data.address.geo.lat
        lbl11.text = data.address.geo.lng
        lbl12.text = data.company.name
        lbl13.text = data.company.bs
        lbl14.text = data.company.catchPhrase
        detailViewModel.chechFav(fav: data.id)
        
    
    }
    
    @objc func btnFavClicked() {
        if (dataMain != nil) {
            detailViewModel.upddateModel(data: dataMain!)
        }
    }
   
}

//
//  UserTableViewCell.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var lbLName: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellFillUp(data : UserResponse) {
        lbLName.text = data.name
        lblCompany.text = data.company.name
        lblWebsite.text = data.website
        lblPhone.text = data.phone
        
    }
}

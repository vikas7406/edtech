//
//  ViewControllerExtension.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import Foundation
import UIKit

extension ViewController{
    @objc func btnProfileClicked() {
        let profileView = profileViewController()
        profileView.modalPresentationStyle = .fullScreen
        present(profileView, animated: false, completion: nil)
    }
}
extension ViewController : UITableViewDataSource , UITableViewDelegate
{
    
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTableData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifierParents = "UserTableViewCell"
        
        var cell: UserTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifierParents) as? UserTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifierParents)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierParents) as? UserTableViewCell
        }
        if let dict = userTableData?[indexPath.row]  {
            cell?.cellFillUp(data:dict )

        }
        return cell!
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailView = detailedViewController()
        detailView.modalPresentationStyle = .fullScreen
        present(detailView, animated: false, completion: { [self] in
                    if let dict = userTableData?[indexPath.row]  {
                        detailView.setup(data: dict)

                    }

        })
        
    }

}

//
//  ViewController.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btnProfile: UIButton!
    @IBOutlet var tableView: UITableView!
    private var userViewModel = UserViewModel()
    var userTableData : [UserResponse]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel.delegate = self
        addTarget()

        callApi()
        }
    func addTarget(){
        btnProfile.addTarget(self, action: #selector(btnProfileClicked), for: .touchUpInside)
    }
    
    func callApi() {
        userViewModel.userRequest()

        }
}
extension ViewController{
}
extension  ViewController : UserViewModelDelegate{
    func didUserResponse(error: String) {
        let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: error, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    func didUserResponse(UserRespone: [UserResponse])
    {
        if(UserRespone.count > 0)
        {
            self.userTableData = UserRespone

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

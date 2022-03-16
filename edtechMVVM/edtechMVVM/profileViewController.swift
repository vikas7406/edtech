//
//  profileViewController.swift
//  edtechMVVM
//
//  Created by admin on 15/03/22.
//

import UIKit
import YouTubePlayer


class profileViewController: UIViewController {
    
    @IBOutlet var youtubePlayer: YouTubePlayerView!
    private var profileViewModel = ProfileViewModel()

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnVideo: UIButton!
    @IBOutlet var btnCamera: UIButton!
    @IBOutlet var btnBack: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        profileViewModel.delegate = self
    }
    func addTarget(){
        btnBack.addTarget(self, action: #selector(btnBackClicked), for: .touchUpInside)
        btnVideo.addTarget(self, action: #selector(btnVideoClicked), for: .touchUpInside)
        btnCamera.addTarget(self, action: #selector(btnCameraClicked), for: .touchUpInside)

    }
    @objc func btnBackClicked() {
        dismiss(animated: false, completion: nil)
    }
 
    @objc func btnVideoClicked() {
        // Load video from YouTube URL
        profileViewModel.userRequest(url: ApiEndpoints.url)
       
    }
}
extension profileViewController : ProfileViewModelDelegate{
    func startVideo(url: String) {
        if let url = NSURL(string: url) as URL? {
        youtubePlayer.loadVideoURL(url)

            
        }
    }
    
    func startVideoWith(error: String) {
        let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: error, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    
}

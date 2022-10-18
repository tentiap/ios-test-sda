//
//  HomeScreenSelectedViewController.swift
//  ios-test-sda
//
//  Created by Tenti Atika Putri on 16/10/22.
//

import UIKit

class HomeScreenSelectedViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameBottomLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!

    var user: userData?

    override func viewDidLoad() {
        super.viewDidLoad()

        button.layer.cornerRadius = 15.0

        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.clipsToBounds = true


        fullNameLabel.text = "\(user?.firstName ?? "First Name") \(user?.lastName ?? "Last Name")"
        fullNameBottomLabel.text = "\(user?.firstName ?? "First Name") \(user?.lastName ?? "Last Name")"
        emailLabel.text = user?.email
        
        let avatarUrl = (user?.avatar)!
        avatarImageView.downloaded(from: avatarUrl)

        websiteLabel.attributedText = NSAttributedString(string: "website", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.websiteLabelTapped))
        websiteLabel.addGestureRecognizer(tapGR)
        websiteLabel.isUserInteractionEnabled = true
    }

    @objc func websiteLabelTapped(sender: UITapGestureRecognizer) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let webViewController = storyBoard.instantiateViewController(withIdentifier: "WebViewID") as? WebViewViewController
        webViewController?.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(webViewController!, animated: true)
    }

    @IBAction func backToUserPage(_ sender: Any) {
        let usersScreen = storyboard?.instantiateViewController(identifier: "UsersID") as! UsersScreenViewController
        self.navigationController?.pushViewController(usersScreen, animated: true)
    }


}

//
//  HomeScreenViewController.swift
//  ios-test-sda
//
//  Created by Tenti Atika Putri on 16/10/22.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var loginNameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    var loginNameString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        loginNameLabel.text = loginNameString
        button.layer.cornerRadius = 15.0

    }
    

}

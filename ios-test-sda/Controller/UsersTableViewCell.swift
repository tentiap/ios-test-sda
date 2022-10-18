//
//  UsersTableViewCell.swift
//  ios-test-sda
//
//  Created by Tenti Atika Putri on 16/10/22.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usersImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

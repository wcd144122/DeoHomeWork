//
//  UserTableViewCell.swift
//  DeoHomeWork
//
//  Created by EchoDeo on 31/10/2564 BE.
//

import UIKit
import AlamofireImage

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var urlTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var item: User! {
        didSet {
            setProductData()
        }
    }
    
    private func setProductData() {
        avatarImage.image = UIImage(named: item.avatar_url)
        if let url = URL(string: item.avatar_url) {
            avatarImage?.af_setImage(withURL:url, placeholderImage: nil, filter: nil,  imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: {response in
              // do stuff when is downloaded completely.
            })
        }
        
        loginLabel.text = item.login
        urlTextView.text = item.url
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

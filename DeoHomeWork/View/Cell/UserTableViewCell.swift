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
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func didTapButton(sender: UIButton) {
        let ID = sender.tag
        let userDefaults = UserDefaults.standard
        
        var data = userDefaults.array(forKey: kFavoriteIdList) as? [Int] ?? []
        if let index = data.firstIndex(where: {$0 == ID}){
            data.remove(at: index)
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        else {
            data.append(ID)
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        userDefaults.set(data, forKey: kFavoriteIdList)
        userDefaults.synchronize()
    }
    
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
        favoriteButton.tag = item.id
        favoriteButton.setImage((item.isFavorite) ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

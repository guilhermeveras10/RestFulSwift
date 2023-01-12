//
//  HomeTableViewCell.swift
//  RestfulNewsSwift
//
//  Created by Guilherme Duarte on 11/01/23.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    //MARK: - Propeties
    var article: ArticlesModel? {
        didSet{config()}
    }
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 50, height: 50)
        iv.layer.cornerRadius = 50 / 2
        iv.backgroundColor = .black
        
        return iv
    }()
    private let sourcenameLabel: UILabel = {
         let lbl = UILabel()
         lbl.font = UIFont.systemFont(ofSize: 14)
         return lbl
     }()
    private let usernameLabel: UILabel = {
         let lbl = UILabel()
         lbl.font = UIFont.boldSystemFont(ofSize: 14)
         return lbl
     }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profileImageView.isAccessibilityElement = true
        profileImageView.accessibilityHint = Strings.imagePost
        usernameLabel.isAccessibilityElement = true
        usernameLabel.accessibilityHint = Strings.nameWriter
        sourcenameLabel.isAccessibilityElement = true
        sourcenameLabel.accessibilityHint = Strings.nameFont
        
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        
        let stack = UIStackView(arrangedSubviews: [usernameLabel,sourcenameLabel])
        stack.axis = .vertical
        stack.spacing = 2
        
        addSubview(stack)
        stack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    func config() {
        guard let image = article?.urlToImage else { return }
        profileImageView.sd_setImage(with: URL(string: image))
        sourcenameLabel.text = article?.source?.name
        usernameLabel.text = article?.author
        sourcenameLabel.accessibilityValue = Strings.nameFont2 + (article?.source?.name ?? String())
        usernameLabel.accessibilityValue = Strings.nameWriter2 + (article?.author ?? String())
    }
}

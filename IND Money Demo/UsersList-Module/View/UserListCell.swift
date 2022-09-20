//
//  UserListCell.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import UIKit


final class UserListCell: UITableViewCell {
    
    //MARK: - Views
    private lazy var profileImageView: RoundedImageView = {
       let imageView = RoundedImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var designationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpContentView()
    }
    
    override func prepareForReuse() {
        profileImageView.image = nil
        nameLabel.text = nil
        designationLabel.text = nil
    }
    
    fileprivate func setUpContentView() {
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
        
        contentView.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            profileImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor)
        ])
        
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
        
        contentView.addSubview(designationLabel)
        NSLayoutConstraint.activate([
            designationLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 5),
            designationLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            designationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
    
    func setUpCell(user: User) {
        if let name = user.name {
            nameLabel.text = name
        }
        if let designation = user.designation {
            designationLabel.text = designation
        }
        
        profileImageView.setImage(url: user.profileURL, placeholderImage: "placeholder")
    }
    
}

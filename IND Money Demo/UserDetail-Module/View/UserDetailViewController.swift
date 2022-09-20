//
//  UserDetailViewController.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import UIKit

final class UserDetailViewController: UIViewController {

    
    var presentor: ViewToPresenterUserDetailProtocol?
    //MARK: - Views
    private lazy var profileImageView: RoundedImageView = {
       let imageView = RoundedImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.showBorder = true
        imageView.borderColor = .label
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var designationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Properties
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        presentor?.getUserDetails()
    }
    
    fileprivate func setUpViews() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor)
        ])
        
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        view.addSubview(designationLabel)
        NSLayoutConstraint.activate([
            designationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            designationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            designationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: designationLabel.bottomAnchor, constant: 40),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
    }
}

extension UserDetailViewController: PresenterToViewUserDetailProtocol {
    
    func showUserDetails(name: String, profileURL: String, designation: String, description: String) {
        self.title = name
        
        profileImageView.setImage(url:profileURL, placeholderImage: "")
        nameLabel.text = name
        descriptionLabel.text = description
        designationLabel.text = designation
    }
    
    
}

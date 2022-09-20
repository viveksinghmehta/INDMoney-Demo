//
//  UserDetailInteractor.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 20/09/22.
//  
//

import Foundation

class UserDetailInteractor: PresenterToInteractorUserDetailProtocol {
    var user: User?
    
    // MARK: Properties
    var presenter: InteractorToPresenterUserDetailProtocol?
    
    
    func getUserDetails() {
        guard let name = user?.name, let profileUrl = user?.profileURL, let designation = user?.designation, let description = user?.description else { return }
        presenter?.showUserDetails(name: name, profileURL: profileUrl, designation: designation, description: description)
    }
}

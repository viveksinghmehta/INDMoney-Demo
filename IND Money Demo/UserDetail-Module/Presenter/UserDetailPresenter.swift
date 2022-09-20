//
//  UserDetailPresenter.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 20/09/22.
//  
//

import Foundation

class UserDetailPresenter: ViewToPresenterUserDetailProtocol {
    

    // MARK: Properties
    var view: PresenterToViewUserDetailProtocol?
    var interactor: PresenterToInteractorUserDetailProtocol?
    var router: PresenterToRouterUserDetailProtocol?
    
    func getUserDetails() {
        interactor?.getUserDetails()
    }
}

extension UserDetailPresenter: InteractorToPresenterUserDetailProtocol {
    
    func showUserDetails(name: String, profileURL: String, designation: String, description: String) {
        view?.showUserDetails(name: name, profileURL: profileURL, designation: designation, description: description)
    }
    
    
}

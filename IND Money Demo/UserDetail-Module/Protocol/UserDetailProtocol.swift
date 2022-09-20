//
//  UserDetailProtocol.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 20/09/22.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewUserDetailProtocol {
    func showUserDetails(name: String, profileURL: String, designation: String, description: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUserDetailProtocol {
    
    var view: PresenterToViewUserDetailProtocol? { get set }
    var interactor: PresenterToInteractorUserDetailProtocol? { get set }
    var router: PresenterToRouterUserDetailProtocol? { get set }
    
    func getUserDetails()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUserDetailProtocol {
    
    var presenter: InteractorToPresenterUserDetailProtocol? { get set }
    var user: User? { get set }
    
    func getUserDetails()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUserDetailProtocol {
    func showUserDetails(name: String, profileURL: String, designation: String, description: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUserDetailProtocol {
    
}

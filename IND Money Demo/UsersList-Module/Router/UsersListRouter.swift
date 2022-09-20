//
//  UsersListRouter.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//
import UIKit
import Foundation

final class UsersListRouter: PresenterToRouterProtocol {

    
    static func createUsersListModule() -> UsersListViewController {
        let view = UsersListViewController()
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = UsersListPresenter()
        let interactor: PresenterToInteractorProtocol = UsersListInteractor()
        let router: PresenterToRouterProtocol = UsersListRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToUserDetails(navigationConroller: UINavigationController, with user: User) {
        let userDetailModule = UserDetailRouter.createModule(with: user)
        navigationConroller.pushViewController(userDetailModule, animated: true)
    }
    
}

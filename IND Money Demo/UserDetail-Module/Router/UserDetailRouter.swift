//
//  UserDetailRouter.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 20/09/22.
//  
//

import Foundation
import UIKit

class UserDetailRouter: PresenterToRouterUserDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with user: User) -> UIViewController {
        
        let view = UserDetailViewController()
        
        var presenter: ViewToPresenterUserDetailProtocol & InteractorToPresenterUserDetailProtocol = UserDetailPresenter()
        
        var interactor: PresenterToInteractorUserDetailProtocol = UserDetailInteractor()
        let router: PresenterToRouterUserDetailProtocol = UserDetailRouter()
        
        view.presentor = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        presenter.interactor?.user = user
        interactor.presenter = presenter
        
        return view
    }
    
}

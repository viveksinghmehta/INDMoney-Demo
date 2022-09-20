//
//  UsersListPresenter.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import UIKit
import Foundation

final class UsersListPresenter: ViewToPresenterProtocol {

    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingUsersList() {
        interactor?.fetchUsersList()
    }
    
    func searchBarBeginEditing() {
        interactor?.searchBarBeginEditing()
    }
    
    func searchBarEndEditing() {
        interactor?.searchBarEndEditing()
    }
    
    func searchBar(text: String) {
        interactor?.searchBar(text: text)
    }
    
    func searchBarSearchButtonTapped() {
        interactor?.searchBarSearchButtonTapped()
    }
    
    func showDetailsOfUser(navigationController: UINavigationController, user: User) {
        router?.pushToUserDetails(navigationConroller: navigationController, with: user)
    }
    
    
}

extension UsersListPresenter: InteractorToPresenterProtocol {
    
    func searchButtonTapped() {
        view?.searchButtonTapped()
    }
    
    
    func searchBarTapped() {
        view?.searchBarTapped()
    }
    
   
    func searchEnded(usersList: [User]) {
        view?.searchEnded(usersList: usersList)
    }
    
    func searchedUsers(usersList: [User]) {
        view?.searchedUsers(usersList: usersList)
    }
    
    func usersListFetchSuccess(usersList: [User]) {
        view?.onUsersListResponseSuccess(usersArrayList: usersList)
    }
    
    func usersListFetchFailed(error: String) {
        view?.onUsersListResponseFailed(error: error)
    }
    
    
}

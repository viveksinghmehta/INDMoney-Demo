//
//  UsersListProtocol.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//
import UIKit
import Foundation

protocol ViewToPresenterProtocol: AnyObject {
    
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    /// gets the users list
    func startFetchingUsersList()
    /// user tapped the search bar
    func searchBarBeginEditing()
    /// user canceled the search
    func searchBarEndEditing()
    /// user is entering the text
    func searchBar(text: String)
    /// user pressed the search button on keyboard
    func searchBarSearchButtonTapped()
    
    func showDetailsOfUser(navigationController:UINavigationController, user: User)

}

protocol PresenterToViewProtocol: AnyObject {
    
    /// On successful users api response
    func onUsersListResponseSuccess(usersArrayList: [User])
    /// On failed users api
    func onUsersListResponseFailed(error: String)
    /// the list of user according to the search result
    func searchedUsers(usersList: [User])
    /// user canceled the search, repopulate the tableView with all the users
    func searchEnded(usersList: [User])
    /// search bar tapped
    func searchBarTapped()
    
    func searchButtonTapped()
    
}

protocol PresenterToRouterProtocol: AnyObject {
    
    static func createUsersListModule() -> UsersListViewController
    func pushToUserDetails(navigationConroller: UINavigationController, with user: User)

}

protocol PresenterToInteractorProtocol: AnyObject {
    
    var presenter: InteractorToPresenterProtocol? { get set }
    /// Calls the api to fetch users list
    func fetchUsersList()
    /// user tapped the search bar
    func searchBarBeginEditing()
    /// user canceled the search
    func searchBarEndEditing()
    /// user is entering the text
    func searchBar(text: String)
    /// user pressed the search button on keyboard
    func searchBarSearchButtonTapped()
    
}

protocol InteractorToPresenterProtocol: AnyObject {
    
    /// On successful users api response
    func usersListFetchSuccess(usersList: [User])
    /// On failed users api
    func usersListFetchFailed(error: String)
    /// the list of user according to the search result
    func searchedUsers(usersList: [User])
    /// user canceled the search, repopulate the tableView with all the users
    func searchEnded(usersList: [User])
    /// user taped on search bar
    func searchBarTapped()
    
    func searchButtonTapped()
    
}

//
//  UsersListInteractor.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import UIKit
import Foundation

final class UsersListInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    var users: [User] = [User]()
    var searchedUsers: [User] = [User]()
    var isSearching: Bool = false
    
    func fetchUsersList() {
        APIService.shared.networkRequest(router: .users, model: [User].self) { [weak self] response in
            guard let weakself = self else { return }
            switch response {
            case .success(let users):
                weakself.users = users
                weakself.presenter?.usersListFetchSuccess(usersList: users)
            case .failure(let error):
                print(error, #function, #fileID)
                weakself.presenter?.usersListFetchFailed(error: error.localizedDescription)
            }
        }
    }
    
    func searchBarBeginEditing() {
        searchedUsers = users
        presenter?.searchBarTapped()
    }
    
    func searchBarEndEditing() {
        isSearching = false
        if !searchedUsers.isEmpty {
            searchedUsers.removeAll()
        }
        presenter?.searchEnded(usersList: users)
    }
    
    func searchBar(text: String) {
        // only search when the search text is greater than 3 letters
        if text.count >= 3 {
            // search for the text in name and designation
            searchedUsers = users.filter( { $0.name?.lowercased().contains(text.lowercased()) ?? false || $0.designation?.lowercased().contains(text.lowercased()) ?? false } )
            presenter?.searchedUsers(usersList: searchedUsers)
        } else {
            presenter?.searchedUsers(usersList: users)
        }
    }
    
    func searchBarSearchButtonTapped() {
        presenter?.searchButtonTapped()
    }
    
}

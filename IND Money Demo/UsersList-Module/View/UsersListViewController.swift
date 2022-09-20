//
//  UsersListViewController.swift
//  IND Money Demo
//
//  Created by Vivek Singh Mehta on 19/09/22.
//

import UIKit

final class UsersListViewController: UIViewController {

    var presentor: ViewToPresenterProtocol?
    
    //MARK: - Views
    private lazy var userTableView: UITableView = {
      let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(UserListCell.self, forCellReuseIdentifier: UserListCell.reuseIdentifier)
        return tableView
    }()
    
    private lazy var userSearchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Try Smith"
        return searchBar
    }()
    
    private lazy var noResult: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "No Result"
        return label
    }()
    
    //MARK: - Properties
    private var users: [User] = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addDelegatesToView()
        showProgressIndicator(view: view)
        presentor?.startFetchingUsersList()
    }
    
    // Add subviews to the view
    fileprivate func setupView() {
        self.title = "Users"
        view.backgroundColor = .systemBackground
        view.addSubview(userSearchBar)
        
        NSLayoutConstraint.activate([
            userSearchBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            userSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.addSubview(userTableView)
        NSLayoutConstraint.activate([
            userTableView.topAnchor.constraint(equalTo: userSearchBar.bottomAnchor),
            userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    fileprivate func addDelegatesToView() {
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.reloadData()
        
        userSearchBar.delegate = self
    }
    
    fileprivate func reloadTheTableView(with users: [User]) {
        self.users = users
        userTableView.reloadData()
    }
    
    fileprivate func showNoResult() {
        view.addSubview(noResult)
        NSLayoutConstraint.activate([
            noResult.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noResult.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        view.layoutIfNeeded()
    }

}
extension UsersListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presentor?.searchBarBeginEditing()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presentor?.searchBarEndEditing()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presentor?.searchBar(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presentor?.searchBarSearchButtonTapped()
    }
}

extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListCell.reuseIdentifier, for: indexPath) as? UserListCell else { return UITableViewCell() }
        cell.setUpCell(user: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigation = navigationController else { return }
        presentor?.showDetailsOfUser(navigationController: navigation, user: users[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
}

extension UsersListViewController: PresenterToViewProtocol {
    
    func searchButtonTapped() {
        view.endEditing(true)
    }
    
   
    func searchBarTapped() {
        userSearchBar.setShowsCancelButton(true, animated: true)
        view.layoutIfNeeded()
    }
    
    
    func searchEnded(usersList: [User]) {
        userSearchBar.setShowsCancelButton(false, animated: true)
        userSearchBar.text = nil
        view.endEditing(true)
        view.layoutIfNeeded()
        reloadTheTableView(with: usersList)
    }
    
    func searchedUsers(usersList: [User]) {
        reloadTheTableView(with: usersList)
        if usersList.count == 0 {
            showNoResult()
        } else {
            noResult.removeFromSuperview()
        }
    }
    
    
    func onUsersListResponseSuccess(usersArrayList: [User]) {
        hideProgressIndicator(view: view)
        reloadTheTableView(with: usersArrayList)
    }
    
    func onUsersListResponseFailed(error: String) {
        hideProgressIndicator(view: view)
        self.showAlertWithOk(Title: "Error", message: error)
    }
}

//
//  PostListViewController.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

class PostListViewController: UITableViewController
{
    @IBOutlet weak var uiTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    let kPostDetailSegue = "postDetailSegue"
    
    var presenter: PostListPresenterType?
    var currentPage = 1
    var currentSearchString = ""
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    // MARK: Setup
    
    private func setup() {
        let builder = PostListBuilder(delegate: self)
        builder.build(view: self)
        presenter?.resetListItems()
        setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func loadMoreItems() {
        currentPage += 1
        debounceSearchCall()
    }
    
    private func debounceSearchCall() {
        debounce(#selector(makeSearchCall), delay: TimeInterval(0.25), controller: self)
    }
    
    @objc private func makeSearchCall() {
        print("makeSeachCall \(searchController.searchBar.text!)")
        presenter?.startFetchingPost(query: searchController.searchBar.text!, page: "\(currentPage)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kPostDetailSegue {
            guard let indexPathRow = sender as? Int else { return }
            presenter?.didTapListItemViewModel(at: indexPathRow, segue: segue)
        }
    }
}

// MARK: - PostListPresenterDelegate delegate implementation

extension PostListViewController: PostListPresenterDelegate {
    
    func displayFetchedPosts(viewModels: [PostListItemViewModelType]) {
        self.uiTableView.reloadData()
    }
    
    func showError() {
        print("Error")
    }
}

extension PostListViewController: PostListBuilderDelegate {
    
}

// MARK: - UICollectionViewController Delegates implementation

extension PostListViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfListItems() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        guard let viewModelItem = presenter?.model(at: indexPath.row) else { return cell }
        cell.setup(withViewModel: viewModelItem)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let numberOfListItems = presenter?.numberOfListItems() else { return }
        if indexPath.row == numberOfListItems - 1 {
            loadMoreItems()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: kPostDetailSegue, sender: indexPath.row)
    }
}

// MARK: - UISearchResultsUpdating Delegates implementation

extension PostListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("\(searchController.searchBar.text!)")
        if (changeSearchString()) {
            presenter?.resetListItems()
            
            if (!searchBarIsEmpty()) {
                currentSearchString = searchController.searchBar.text!
                debounceSearchCall()
            } else {
                self.uiTableView.reloadData()
            }
        }
    }
    
    func changeSearchString() -> Bool {
        return !currentSearchString.elementsEqual(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

//
//  HomeTableViewController.swift
//  RestfulNewsSwift
//
//  Created by Guilherme Duarte on 11/01/23.
//

import UIKit

protocol HomeTableViewControllerProtocol{
    func getHomeSuccess(response: HomeModel?)
    func getHomeError(error: ErrorHttps)
}

class HomeTableViewController: UITableViewController {
    //MARK: - Propeties
    private var articles = [ArticlesModel]() {
        didSet {tableView.reloadData()}
    }
    private var interactor: HomeInteractorProtocol!
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
        let presenter = HomePresenter(view: self)
        let interac = HomeInteractor(presenter: presenter)
        self.interactor = interac
        self.interactor.getHomeList()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    //MARK: - Helpers
    func configureInterface() {
        view.backgroundColor = .white
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: Strings.cellIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    //MARK: - Selectors
    @objc func refresh() {
        self.interactor.getHomeList()
    }
}
//MARK: - HomeTableViewControllerProtocol
extension HomeTableViewController: HomeTableViewControllerProtocol {
    func getHomeSuccess(response: HomeModel?) {
        self.articles = response?.articles ?? [ArticlesModel()]
        self.tableView.refreshControl?.endRefreshing()
    }
    func getHomeError(error: ErrorHttps) {
        self.showError(error.message)
    }
}
//MARK: - Delegate/Datasource
extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Strings.cellIdentifier, for: indexPath) as! HomeTableViewCell
        let article = articles[indexPath.row]
        cell.article = article
        return cell
    }
}

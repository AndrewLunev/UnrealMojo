//
//  InfoTableViewController.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import UIKit

protocol InfoViewControllerOutput: class {
    func fetchListObject()
    func goToInfoDetailScreen()
    func setDataToNextScene(_ segue: UIStoryboardSegue)
}

protocol InfoViewControllerInput: class {
    func displayFetchedListObject(list: [UnrealMojoModel])
    func displayErrorView(_ errorMessage: String)
}

class InfoTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var presenter: InfoViewControllerOutput!
    var listObject: [UnrealMojoModel] = []
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureRefresh()
        presenter.fetchListObject()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        InfoAssembly.sharedInstance.configure(self)
    }
    
    
    
    // MARK: - Private
    
    fileprivate func configureView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    fileprivate func configureRefresh() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl!.attributedTitle = NSAttributedString(string: "Загрузка...")
        tableView.refreshControl!.addTarget(self, action: #selector(pullToRefresh), for: UIControl.Event.valueChanged)
    }
    
    @objc fileprivate func pullToRefresh() {
        presenter.fetchListObject()
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.setDataToNextScene(segue)
    }
}



// MARK: - UITableViewDataSource

extension InfoTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listObject.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "InfoTableCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableCell
        
        cell.title.text = listObject[indexPath.row].title
        cell.desc.text = listObject[indexPath.row].desc
        cell.image.image = UIImage(named: "no_photo.png")

        if let photo = listObject[indexPath.row].picture {
            cell.image.image = UIImage(data: photo)
        } else {
            cell.image.load(from: listObject[indexPath.row].image!, closure: { (data) in
                if let picture = data {
                    self.listObject[indexPath.row].picture = picture
                }
            })
        }
        
        return cell
    }
}



// MARK: - UITableViewDelegate

extension InfoTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.goToInfoDetailScreen()
    }
}



// MARK: - InfoViewControllerInput

extension InfoTableViewController: InfoViewControllerInput {
    func displayErrorView(_ errorMessage: String) {
        let refreshAlert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.tableView.refreshControl!.endRefreshing()
        }))
    }
    
    
    func displayFetchedListObject(list: [UnrealMojoModel]) {
        listObject = []
        listObject = list

        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.refreshControl!.endRefreshing()
        }
    }
}

//
//  FeedVC.swift
//  ProjectHunt
//
//  Created by Eric Morales on 8/29/21.
//

import UIKit

class FeedVC: UIViewController {
  
  // MARK: Properties
  lazy var feedTableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    
    return table
  }()
  
  // MARK: VC Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "Feed"
    
    setTable()
  }
  
  // MARK: Methods
  func setTable() {
    feedTableView.delegate = self
    feedTableView.dataSource = self
    
    // Letting table know we want to use the custom cell file.
    feedTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
    
    self.view.addSubview(feedTableView)
    NSLayoutConstraint.activate([
      feedTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      feedTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      feedTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
      feedTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ])
  }
}

// MARK: TableViewDataSource
extension FeedVC: UITableViewDataSource {

  // Determines how many cells will be shown on the table view.
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  // Creates and configures each cell.
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
    
    return cell
  }
  
  
}

// MARK: TableViewDelegate
extension FeedVC: UITableViewDelegate {
  // Code to handle cell eventes goes here...
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250
  }
}

//
//  CommentsVC.swift
//  ProjectHunt
//
//  Created by Eric Morales on 9/5/21.
//

import UIKit

class CommentsVC: UIViewController {
  
  // MARK: Properties
  var postID: Int!
  lazy var comments: [Comment]! = [] {
    didSet {
      commentsTabelView.reloadData()
    }
  }
  lazy var networkManager = NetworkManager()
  lazy var commentsTabelView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    
    return table
  }()
  
  // MARK: LifeCycleVC
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    setTable()
    navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "Comments"
    
    updateComments()
  }
  
  // MARK: Methods
  func setTable() {
    commentsTabelView.delegate = self
    commentsTabelView.dataSource = self
    
    // Letting table know we want to use the custom cell file.
    commentsTabelView.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.identifier)
    
    self.view.addSubview(commentsTabelView)
    NSLayoutConstraint.activate([
      commentsTabelView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      commentsTabelView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      commentsTabelView.topAnchor.constraint(equalTo: self.view.topAnchor),
      commentsTabelView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ])
  }
  
  func updateComments() {
    // Similar to what we did for posts
    networkManager.getComments(postID) { result in
      switch result {
      case let .success(comments):
        self.comments = comments
      case let .failure(error):
        print(error)
      }
    }
  }
  
}

// MARK: TableViewDataSource
extension CommentsVC: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return comments.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier, for: indexPath) as! CommentsTableViewCell
    let comment = comments[indexPath.row]
    cell.commentTextView.text = comment.body
    
    return cell
  }
  
  
}

// MARK: TableViewDelegate
extension CommentsVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 125
  }
}

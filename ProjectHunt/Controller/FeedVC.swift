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
  lazy var mockData: [Post] = {
    var meTube = Post(id: 0, name: "MeTube", tagline: "Stream videos for free!", votesCount: 25, commentsCount: 4, previewImageURL: URL(string: "https://via.placeholder.com/350x160")!)
    var boogle = Post(id: 1, name: "Boogle", tagline: "Search anything!", votesCount: 1000, commentsCount: 50, previewImageURL: URL(string: "https://via.placeholder.com/350x160")!)
    var meTunes = Post(id: 2, name: "meTunes", tagline: "Listen to any song!", votesCount: 25000, commentsCount: 590, previewImageURL: URL(string: "https://via.placeholder.com/350x160")!)
    
    return [meTube, boogle, meTunes]
  }()
  lazy var posts: [Post] = [] {
    didSet {
      feedTableView.reloadData()
    }
  }
  lazy var networkManager = NetworkManager()
  
  // MARK: VC Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = true
    self.title = "Feed"
    
    setTable()
    updateFeed()
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
  
  func updateFeed() {
    networkManager.getPosts() { result in
      switch result {
      case let .success(posts):
        self.posts = posts
      case let .failure(error):
        print(error)
      }
    }
  }
}

// MARK: TableViewDataSource
extension FeedVC: UITableViewDataSource {

  // Determines how many cells will be shown on the table view.
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  // Creates and configures each cell.
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
    let post = posts[indexPath.row]
    cell.post = post
    
    return cell
  }
  
  
}

// MARK: TableViewDelegate
extension FeedVC: UITableViewDelegate {
  // Code to handle cell eventes goes here...
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let post = posts[indexPath.row]
    
    let commentsVC = CommentsVC()
    commentsVC.postID = post.id
    navigationController?.pushViewController(commentsVC, animated: true)
    
  }
}

//
//  NetworkManager.swift
//  ProjectHunt
//
//  Created by Eric Morales on 8/30/21.
//

import Foundation

class NetworkManager {
  // Used to create the network request
  let urlSession = URLSession.shared
  var baseURL = "https://bedecked-scythe-sorrel.glitch.me/v1/"
  var token = "SeubGwc_ZQwQtUgk5ZHIU0xdK_Fc9mYgIBjhafrSfvY"
  
  // Method that handle the request
  func getPosts(completion: @escaping ([Post]) -> Void) {
    // Construct the URL to get posts from API
    let query = "posts/all?sort_by=votes_count&order=desc&search[featured]=true&per_page=20"
    let fullURL = URL(string: baseURL + query)!
    var request = URLRequest(url: fullURL)
    
    request.httpMethod = "GET"
    // Set up header with API Token
    request.allHTTPHeaderFields = [
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer \(token)",
      //"Host": "api.producthunt.com"
    ]
    
    let task = urlSession.dataTask(with: request) { data, response, error in
      // Check for erros
      if let error = error { print(error.localizedDescription); return }
      
      // Check to see if there is any data that was retrieved.
      guard let data = data else { print("Data can't be retrived."); return }
      
      // Attempt to decode the data
//      guard let result = try? JSONDecoder().decode(PostList.self, from: data) else { print("Data can't be decoded."); return }
      do {
          let result = try JSONDecoder().decode(PostList.self, from: data)
          let posts = result.posts

          // Return the result with the completion handler.
          DispatchQueue.main.async {
            completion(posts)
          }
      } catch let error2 {
          fatalError(error2.localizedDescription)
      }
      
//      let posts = result.posts
      
      // Return the result with the completion handler.
//      DispatchQueue.main.async {
//        completion(posts)
//      }
      
    }
    
    task.resume()
  }
}

//
//  Post.swift
//  ProjectHunt
//
//  Created by Eric Morales on 8/30/21.
//

import Foundation

// A product retrieved from the Product Hunt API
struct Post {
  // Various properties of a post that we either need or want to display.
  let id: Int
  let name: String
  let tagline: String
  let votesCount: Int
  let commentsCount: Int
}

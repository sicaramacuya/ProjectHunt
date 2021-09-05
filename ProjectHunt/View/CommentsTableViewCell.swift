//
//  CommentsTableViewCell.swift
//  ProjectHunt
//
//  Created by Eric Morales on 9/5/21.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
  
  // MARK: Properties
  static var identifier: String = "commentCell"
  lazy var commentTextView: UITextView = {
    let textView = UITextView()
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.isEditable = false
    
    return textView
  }()
  
  // MARK: Methods
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
  }
  
  func setup() {
    // MARK: Adding to hierarchy
    self.addSubview(commentTextView)
    
    // MARK: Constraints
    NSLayoutConstraint.activate([
      commentTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
      commentTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
      commentTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
      commentTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
    ])
  }
}

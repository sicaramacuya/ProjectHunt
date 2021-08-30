//
//  PostTableViewCell.swift
//  ProjectHunt
//
//  Created by Eric Morales on 8/30/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  // MARK: Properties
  static var identifier: String = "postCell"
  lazy var container: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Name"
    label.setContentHuggingPriority(.init(rawValue: 250), for: .horizontal)
    
    return label
  }()
  lazy var horizontalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally // direction of axis
    stackView.alignment = .fill // perpendicular to axis
    stackView.spacing = 8
    
    return stackView
  }()
  lazy var commentsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Comments: 0"
    label.font = UIFont.systemFont(ofSize: 12)
    
    return label
  }()
  lazy var votesLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Votes: 0"
    label.font = UIFont.systemFont(ofSize: 12)
    
    return label
  }()
  lazy var previewImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "placeholder")
    
    return image
  }()
  lazy var taglineLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Tagline"
    label.font = UIFont.systemFont(ofSize: 12)
    
    return label
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
    self.addSubview(container)
    container.addSubview(nameLabel)
    container.addSubview(horizontalStackView)
    horizontalStackView.addArrangedSubview(commentsLabel)
    horizontalStackView.addArrangedSubview(votesLabel)
    container.addSubview(previewImage)
    container.addSubview(taglineLabel)
    
    // MARK: Constraints
    NSLayoutConstraint.activate([
      // container
      container.topAnchor.constraint(equalTo: self.topAnchor),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      // nameLabel
      nameLabel.topAnchor.constraint(equalTo: container.topAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      nameLabel.trailingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor, constant: 12),
      
      // horizontalStackView
      horizontalStackView.topAnchor.constraint(equalTo: container.topAnchor),
      horizontalStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      
      // previewImage
      previewImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.5),
      previewImage.bottomAnchor.constraint(equalTo: taglineLabel.topAnchor, constant: 8),
      previewImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
      previewImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8),
      
      // taglineLabel
      taglineLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
      taglineLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      taglineLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
    ])
  }
  
}

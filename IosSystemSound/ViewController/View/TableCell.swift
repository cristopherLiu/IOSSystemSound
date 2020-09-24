//
//  TableCell.swift
//  IosSystemSound
//
//  Created by hjliu on 2020/9/24.
//

import UIKit

class TableCell: UITableViewCell {
  
  /// UI
  private lazy var bgView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 16
    view.backgroundColor = UIColor.white
    view.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(view)
    return view
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24)
    label.textAlignment = NSTextAlignment.left
    label.textColor = UIColor.black
    label.numberOfLines = 1
    label.lineBreakMode = .byTruncatingTail
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var detailLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24.0)
    label.textAlignment = NSTextAlignment.left
    label.textColor = UIColor.black
    label.numberOfLines = 1
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = UIColor.clear
    
    contentView.addSubview(bgView)
    bgView.addSubview(titleLabel)
    bgView.addSubview(detailLabel)
    
    let screenWidth  = UIScreen.main.bounds.width // 螢幕寬
    let bgViewHeight: CGFloat = 105
    
    NSLayoutConstraint.activate([
      bgView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
      bgView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
      bgView.topAnchor.constraint(equalTo: contentView.topAnchor),
      bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
      bgView.heightAnchor.constraint(equalToConstant: bgViewHeight),
      
      titleLabel.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 8),
      titleLabel.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -8),
      titleLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8),
      
      detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
      detailLabel.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8),
      detailLabel.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 8),
      detailLabel.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -8)
    ])
    
    self.selectionStyle = UITableViewCell.SelectionStyle.none
    self.accessoryType = UITableViewCell.AccessoryType.none
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func setup(viewModel: TextCellViewModel){
    titleLabel.text = viewModel.title
    detailLabel.text = viewModel.detail
    setNeedsLayout()
  }
}

//
//  RootVC.swift
//  IosSystemSound
//
//  Created by hjliu on 2020/9/24.
//

import UIKit
import AVFoundation

class RootVC: UIViewController {
  
  private lazy var tableView: UITableView = {
    let view = UITableView()
    view.backgroundColor = UIColor.clear
    view.delegate = self
    view.dataSource = self
    view.register(TableCell.self, forCellReuseIdentifier: "TableCell")
    view.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
    view.rowHeight = UITableView.automaticDimension
    view.estimatedRowHeight = 44
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let service = DataService()
  private var tableDatas = [Sound]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initView()
    
    service.fetchData { (sounds) in
      self.tableDatas = sounds
      self.tableView.reloadData()
    }
  }
  
  func initView() {
    view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension RootVC: UITableViewDelegate, UITableViewDataSource {
  
  // MARK: - Table view data source
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableDatas.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let model = tableDatas[indexPath.row]
    let viewModel = TextCellViewModel(title: "種類: \(model.category)", detail: "Name: \(model.fileName), ID: \(model.id)")
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
    cell.setup(viewModel: viewModel)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let model = tableDatas[indexPath.row]
    
    let systemSoundID: SystemSoundID = UInt32(model.id)
    AudioServicesPlaySystemSound (systemSoundID)
//    print("\(model.id)")
    navigationController?.navigationBar.topItem?.title = "Sound ID: \(model.id)"
  }
}

//
//  ViewController.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import UIKit
import CoreServices

class ShowDataViewController: UIViewController {
    
    var showDataViewModel: ShowDataViewModel!
    var imageResult: [ImageDataResult]!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageResult = showDataViewModel.getImageDataResult()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 130
        tableView.register(UINib(nibName: CellIdentifiers.imageDataCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifiers.imageDataCell.rawValue)
    }
}

extension ShowDataViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ShowDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.imageDataCell.rawValue, for: indexPath) as? ImageDataCell else {
            fatalError("No Cell with ImageDataCell Identifier")
        }
        cell.configureImageCell(imageData: imageResult[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageResult.count
    }
}

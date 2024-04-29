//
//  MainViewController.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import UIKit

enum VCIdentifiers: String {
    case showDataViewController = "ShowDataViewController"
}

class MainViewController: UIViewController {
    
    var mainViewModel: MainViewModel!
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        if mainViewModel.saveData() {
            showToast(message: "Data Saved in Locally", font: .systemFont(ofSize: 12.0))
        } else {
            showToast(message: "Data Not Saved in Locally", font: .systemFont(ofSize: 12.0))
        }
    }
    @IBAction func showButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: VCIdentifiers.showDataViewController.rawValue, sender: nil)
    }
}


//
//  ViewController.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 07/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

//MARK:- Can be considered as single cell type items listing
class ExampleTypesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: TableDataSource<DefaultHeaderFooterModel<ExampleModel>,
                                            DefaultCellModel<ExampleModel>,
                                            ExampleModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    private func configureTableView() {
        
        dataSource = TableDataSource<DefaultHeaderFooterModel<ExampleModel>, DefaultCellModel<ExampleModel>, ExampleModel>.init(.SingleListing(items: ExampleModel.getExampleTypes(), identifier: ExampleCell.identfier, height: UITableView.automaticDimension, leadingSwipe: nil, trailingSwipe: nil), tableView)
        
        dataSource?.configureCell = { (cell, item, indexPath) in
            (cell as? ExampleCell)?.item = item
        }
        
        dataSource?.didSelectRow = { (indexPath, item) in
            switch indexPath.row {
            case 0: // Example 01 VC
                let destVC = Storyboard<Example01VC>.Main.instantiateVC()
                self.navigationController?.pushViewController(destVC, animated: true)
            case 1: // Example 02 VC
                let destVC = Storyboard<Example02VC>.Main.instantiateVC()
                self.navigationController?.pushViewController(destVC, animated: true)
            case 2: // Example 03 VC
                let destVC = Storyboard<Example03VC>.Main.instantiateVC()
                self.navigationController?.pushViewController(destVC, animated: true)
            case 3: // Example 04 VC
                let destVC = Storyboard<Example04VC>.Main.instantiateVC()
                self.navigationController?.pushViewController(destVC, animated: true)
            case 4: // Example 05 VC
                let destVC = Storyboard<Example05VC>.Main.instantiateVC()
                self.navigationController?.pushViewController(destVC, animated: true)
            case 5: // Example 06 VC
                let destVC = Storyboard<Example06VC>.Main.instantiateVC()
                self.navigationController?.pushViewController(destVC, animated: true)
            case 6: // Example 07 VC
                let destVC = Storyboard<Example07VC>.Main.instantiateVC()
                self.navigationController?.pushViewController(destVC, animated: true)
            default:
                break
            }
        }
    }

}



enum Storyboard<T : UIViewController>: String {
    case Main = "Main"
    
    func instantiateVC() -> T {
        let sb = UIStoryboard(name: self.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        return vc
    }
}

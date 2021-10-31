//
//  MainListViewController.swift
//  DeoHomeWork
//
//  Created by EchoDeo on 31/10/2564 BE.
//

import UIKit
import RxSwift
import RxCocoa
import RxAlamofire

class MainListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainTableView: UITableView!
    
    private let bag = DisposeBag()
    private let viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainTableView.rx.setDelegate(self).disposed(by: bag)
                
        bindTableView()
    }
    
    private func bindTableView() {
        mainTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        
        viewModel.items.bind(to: mainTableView.rx.items(cellIdentifier: "UserTableViewCell", cellType: UserTableViewCell.self)) { (row,item,cell) in
            cell.item = item
        }.disposed(by: bag)
        
        mainTableView.rx.modelSelected(User.self).subscribe(onNext: { item in
            print("SelectedItem: \(item.login)")
        }).disposed(by: bag)
        
        viewModel.fetchProductList()
    }
}

extension MainListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
}

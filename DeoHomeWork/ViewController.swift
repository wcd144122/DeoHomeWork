//
//  ViewController.swift
//  DeoHomeWork
//
//  Created by EchoDeo on 30/10/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let controller = UINib(nibName: "MainListViewController", bundle: nil).instantiate(withOwner: self, options: nil).first as? MainListViewController else { return }
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: mainView.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
            ])
        controller.didMove(toParent: self)
    }
}


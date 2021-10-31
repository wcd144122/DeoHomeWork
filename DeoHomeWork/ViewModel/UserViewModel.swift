//
//  UserViewModel.swift
//  DeoHomeWork
//
//  Created by EchoDeo on 31/10/2564 BE.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

class UserViewModel {
    let items = PublishSubject<[User]>()
    
    private let bag = DisposeBag()
    
    func fetchProductList() {
        RxAlamofire.requestJSON(.get, "https://api.github.com/users")
            .subscribe(onNext: { [weak self] (r, json) in
                if let data = json as? [NSDictionary] {
                    var userArray: [User] = []
                    for user in data {
                        userArray.append(User(avatar_url: user["avatar_url"] as? String ?? "",
                                              login: user["login"] as? String ?? "",
                                              url: user["url"] as? String ?? ""))
                    }
                    self?.items.onNext(userArray)
                    self?.items.onCompleted()
                }
            })
            .disposed(by: bag)
    }
}

//
//  ViewController.swift
//  sampleRxSwiftApp
//
//  Created by Muneharu Onoue on 2017/04/24.
//  Copyright © 2017年 Muneharu Onoue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.rx.text.asObservable()
            .map {
                guard let txt = $0 else { return "" }
                guard txt != "" else { return "" }
                return "[\(txt)]"
            }
            .bind(to: label.rx.text)
            .addDisposableTo(disposeBag)
        
    }
}


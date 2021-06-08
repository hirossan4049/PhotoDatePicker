//
//  ViewController.swift
//  PhotoDatePicker
//
//  Created by craptone on 2021/06/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = TextHighlightMenu(frame: CGRect(origin: .zero, size: CGSize(width: 350, height: 54)))
        view.center = self.view.center
        view.backgroundColor = .blue
        
        self.view.addSubview(view)
    }


}


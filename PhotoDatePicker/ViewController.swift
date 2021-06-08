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
        
        view.lists = ["6/15", "7/15", "8/15", "9/15", "10/15", "11/15", "12/15"]
        view.delegate = self
        
        self.view.addSubview(view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            view.selected(index: 2)
        }
    }


}

extension ViewController: TextHighlightMenuDelegate {
    func textHighlightMenuDelegate(_ textHighlightMenu: TextHighlightMenu, didSelectItemAt index: Int) {
        print("tapped", index)
    }
}

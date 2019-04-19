//
//  ViewController.swift
//  SZMentionsSwift-Sample
//
//  Created by YH.Jang on 03/01/2019.
//  Copyright © 2019 YH.Jang. All rights reserved.
//

import UIKit

import SZMentionsSwift
import SnapKit

class ViewController: UIViewController, UITextViewDelegate {

  private var accessoryView: AccessoryView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    accessoryView = AccessoryView(delegate: self)
    
    self.view.addSubview(accessoryView)
    
    accessoryView.snp.makeConstraints{
      $0.left.bottom.right.equalToSuperview()
    }
  }

}


//
//  TextView.swift
//  SZMentionsSwift-Sample
//
//  Created by YH.Jang on 03/01/2019.
//  Copyright © 2019 YH.Jang. All rights reserved.
//

import UIKit

import Hakawai

class TextView: UITextView {
  
  convenience init() {
    let manager = HKWLayoutManager()
    let container = NSTextContainer(size: CGSize(width: UIScreen.main.bounds.size.width, height: .greatestFiniteMagnitude))
    container.widthTracksTextView = true
    container.heightTracksTextView = false
    manager.addTextContainer(container)
    let storage = NSTextStorage()
    storage.addLayoutManager(manager)
    self.init(frame: .zero, textContainer: container)
  }
  
}


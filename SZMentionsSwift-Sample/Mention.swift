//
//  Mention.swift
//  SZMentionsSwift-Sample
//
//  Created by YH.Jang on 03/01/2019.
//  Copyright © 2019 YH.Jang. All rights reserved.
//

import UIKit

import SZMentionsSwift

struct Mention: CreateMention {
  var id: String = ""
  var name: String = ""
  var range: NSRange = NSRange(location: 0, length: 0)
}

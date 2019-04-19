//
//  MentionTableViewManager.swift
//  SZMentionsSwift-Sample
//
//  Created by YH.Jang on 03/01/2019.
//  Copyright © 2019 YH.Jang. All rights reserved.
//

import UIKit

import SZMentionsSwift

class MentionTableViewManager: NSObject {
  
  private let cellIdentifier = "Cell"
  public let listener: MentionListener
  private let mentions: [Mention] = {
    return [
      "홍길동Test",
      "홍길삼 Zweier",
      "김민아 abcef",
      "김 a 태 b 희",
      "Steven Zweier",
      "John Smith",
      "Joe Tesla"].map {
        Mention(id: "", name: $0, range: NSRange(location: 0, length: 0))
    }
  }()
  
  private var mentionsList: [Mention] {
    guard !mentions.isEmpty && filterString != "" else { return mentions }
    return mentions.filter {
      return $0.name.lowercased().contains(filterString.lowercased())
    }
  }
  
  private let tableView: UITableView
  private var filterString: String = ""

  init(mentionTableView: UITableView, mentionsListener: MentionListener) {
    tableView = mentionTableView
    tableView.register(
      UITableViewCell.self,
      forCellReuseIdentifier: cellIdentifier)
    listener = mentionsListener
    super.init()
  }

  func filter(_ string: String) {
    filterString = string
    tableView.reloadData()
  }
}

extension MentionTableViewManager: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    listener.addMention(mentionsList[indexPath.row])
  }
}

extension MentionTableViewManager: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mentionsList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else { return UITableViewCell() }
    cell.textLabel?.text = mentionsList[indexPath.row].name

    return cell
  }
}

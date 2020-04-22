//
//  ReviewViewController+TableView.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewDatas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! ReviewTableViewCell
        
        cell.authorName.text = reviewDatas?[indexPath.row].author
        cell.contentLabel.text = reviewDatas?[indexPath.row].content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (reviewDatas?.count ?? 1) - 1 {
            if !(page > dataSource!.page) && reviewDatas!.count < dataSource!.total_results {
                loadMoreData()
            }
        }
    }
}

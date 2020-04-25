//
//  ViewController+TableView.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getDataSource().genres.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath)
        cell.textLabel?.text = presenter?.getDataSource().genres[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.displayMovieList(index: indexPath.row)
    }
}

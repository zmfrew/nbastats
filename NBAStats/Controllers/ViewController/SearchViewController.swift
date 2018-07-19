//
//  SearchViewController.swift
//  Statcenter
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!

    @IBOutlet weak var rookieYear: UILabel!
    @IBOutlet weak var yearsInLeague: UILabel!
    
    // Search Bar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty, searchText != " " else { return }
        searchBar.resignFirstResponder()
        PlayerController.getPlayers(searchText: searchText) { (player) in
            DispatchQueue.main.async {
                self.updateViews(player: player)
            }
        }
        
    }
    
    // Methods
    
    func updateViews(player: Player?) {
        guard let player = player else { return }
        nameLabel.text = player.name
        teamLabel.text = player.team
        rookieYear.text = "\(player.rookieYear)"
        yearsInLeague.text = "\(player.yearsInLeague)"
    }
    
}

//
//  itemViewController.swift
//  internTest
//
//  Created by intern on 2015/08/18.
//  Copyright (c) 2015年 intern. All rights reserved.
//

import UIKit

import Result

class ItemsViewController: UITableViewController {
    
    private var items = [ItemJSON]()
    private var manager = SearchManager()
    @IBOutlet weak var searchbar: UISearchBar!
    
    func onDataChanged(result: Result<ItemsJSON, NSError>) {
        if let value = result.value {
            items = value.items
            tableView.reloadData()
        }
        refreshControl?.endRefreshing()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.destinationViewController {
        case let viewController as BrowserViewController:
            if let itemCell = sender as? ItemCell {
                viewController.URL = itemCell.item?.itemURL
            }
        default:()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        manager.searchItems(searchBar.text, handler: onDataChanged);
    }
}

extension ItemsViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        cell.item = items[indexPath.row]
        return cell
    }
    
}

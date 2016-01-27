//
//  VisitorBaseTableViewController.swift
//  SwiftWB
//
//  Created by qufenqi on 16/1/27.
//  Copyright © 2016年 王正一. All rights reserved.
//

import UIKit

class VisitorBaseTableViewController: UITableViewController {

    private var userDidLogin = true
    
    override func loadView() {
        userDidLogin ? super.loadView() : setupVisitorVc()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupVisitorVc() {
        view = UIView()
        view.backgroundColor = UIColor.greenColor()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

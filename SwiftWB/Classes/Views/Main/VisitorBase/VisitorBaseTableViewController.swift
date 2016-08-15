//
//  VisitorBaseTableViewController.swift
//  SwiftWB
//
//  Created by qufenqi on 16/1/27.
//  Copyright © 2016年 王正一. All rights reserved.
//

import UIKit

class VisitorBaseTableViewController: UITableViewController {

    private var userDidLogin = false
    
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

    func setupVisitorVc(){
        view = VisitorView()
        view.backgroundColor = UIColor.white
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

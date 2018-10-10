//
//  CurrentVC.swift
//  MakingStoryV3
//
//  Created by 이동기 on 04/10/2018.
//  Copyright © 2018 이동기. All rights reserved.
//

import UIKit

class CurrentVC: UITableViewController {
    
    var tableList = [String]()
    var toAppend = ""
    var checking = ""
    
    override func viewWillAppear(_ animated: Bool) {
        let ud = UserDefaults.standard
        let userDefault = UserDefaults.standard
        
        if let story = ud.string(forKey: "story") {
            toAppend = story
        }
        
        if let check = userDefault.string(forKey: "check") {
            checking = check
        }
        
        switch checking {
        case "0":
            print("unwind")
        default:
            tableList.append(toAppend)
            self.tableView.reloadData()

        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableList.removeAll()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.lblStory?.text = tableList[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let alertController = UIAlertController(title: "정말 삭제하시겠습니까?", message: "삭제 취소할 수 없습니다", preferredStyle: UIAlertController.Style.alert)
            
            let registerAction = UIAlertAction(title: "삭제", style: UIAlertAction.Style.default){ (action: UIAlertAction) in
                self.tableList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default)
            
            alertController.addAction(registerAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
     Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  SideBarVC.swift
//  MyMemory
//
//  Created by LEE on 2023/02/14.
//

import UIKit

class SideBarVC: UITableViewController {

    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let profileImage = UIImageView()
    let uInfo = UserInfoManager()

    let titles = ["새 글 작성하기", "친구 새 글", "달력으로 보기", "공지사항", "통계", "계정 관리"]
    
    let icons = [
        UIImage(named: "icon01"),
        UIImage(named: "icon02"),
        UIImage(named: "icon03"),
        UIImage(named: "icon04"),
        UIImage(named: "icon05"),
        UIImage(named: "icon06")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 70)
        headerView.backgroundColor = .brown
        headerView.alpha = 0.92
        tableView.tableHeaderView = headerView
                
        self.nameLabel.frame = CGRect(x: 70, y: 15, width: 120, height: 30)
        self.emailLabel.frame = CGRect(x: 70, y: 30, width: 150, height: 30)
        
        self.nameLabel.text = uInfo.name ?? "GUEST"
        self.nameLabel.textAlignment = .left
        self.nameLabel.font = .systemFont(ofSize: 16)
        self.nameLabel.backgroundColor = .clear
        
        self.emailLabel.text = uInfo.account ?? ""
        self.emailLabel.textAlignment = .left
        self.emailLabel.font = .systemFont(ofSize: 12)
        self.emailLabel.backgroundColor = .clear

        self.profileImage.image = uInfo.profile
        self.profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.width / 2
        self.profileImage.layer.masksToBounds = true
        self.profileImage.layer.borderWidth = 0
        
        headerView.addSubview(nameLabel)
        headerView.addSubview(emailLabel)
        headerView.addSubview(profileImage)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.nameLabel.text = uInfo.name ?? "GUEST"
        self.emailLabel.text = uInfo.account ?? ""
        self.profileImage.image = uInfo.profile
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        cell.textLabel?.text = titles[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.imageView?.image = icons[indexPath.row]
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row{
        
        case 0:
            let uv = storyboard?.instantiateViewController(withIdentifier: "MemoForm")
            let target = self.revealViewController().frontViewController as! UINavigationController
            target.pushViewController(uv!, animated: true)
            self.revealViewController().revealToggle(self)
        case 5:
            let profileVC = storyboard?.instantiateViewController(withIdentifier: "_Profile")
            present(profileVC!, animated: true){
                self.revealViewController()?.revealToggle(self)
            }
        default:
            break
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
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

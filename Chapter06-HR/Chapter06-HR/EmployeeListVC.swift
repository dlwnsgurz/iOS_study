//
//  EmployeeListVC.swift
//  Chapter06-HR
//
//  Created by LEE on 2023/02/17.
//

import UIKit

class EmployeeListVC: UITableViewController {

    var empList: [EmployeeVO]!
    var empDAO = EmployeeDAO()
    var loadingImg: UIImageView!
    var bgCircle: UIView!
    
    func initUI(){
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.font = UIFont.systemFont(ofSize: 14)
        navTitle.text = "사원 목록 \n" + "총 \(self.empList.count)명"
        
        self.navigationItem.titleView = navTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.empList = self.empDAO.find()
        self.initUI()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        
        self.loadingImg = UIImageView(image: UIImage(named: "refresh"))
        self.loadingImg.center.x = (self.refreshControl?.frame.width)! / 2
        
        self.refreshControl?.addSubview(loadingImg)
        self.refreshControl?.tintColor = .clear
        
        self.bgCircle = UIView()
        self.bgCircle.backgroundColor = .yellow
        self.bgCircle.center.x = (self.refreshControl?.frame.width)! / 2
        
        self.refreshControl?.addSubview(bgCircle)
        self.refreshControl?.bringSubviewToFront(self.loadingImg)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.empList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowData = self.empList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EMP_CELL")
        
        cell?.textLabel?.text = rowData.empName + "(\(rowData.stateCd.desc()))"
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        cell?.detailTextLabel?.text = rowData.departTitle
        cell?.detailTextLabel?.font = .systemFont(ofSize: 12)
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let empCd = self.empList[indexPath.row].empCd
        
        if empDAO.remove(empCd: empCd){
            self.empList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "사원 등록", message: "등록할 사원 정보를 입력해 주세요", preferredStyle: .alert)
        
        alert.addTextField() { $0.placeholder = "사원명" }
        
        let pickervc = DepartPickerVC()
        alert.setValue(pickervc, forKey: "contentViewController")
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default){
            (_) in
            
            var param = EmployeeVO()
            param.departCd = pickervc.selectedDepartCd
            param.empName = (alert.textFields?[0].text)!
            
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            param.joinDate = df.string(from: Date())
            
            param.stateCd = EmpStateType.ING
            
            if self.empDAO.create(param: param){
                
                self.empList = self.empDAO.find()
                self.tableView.reloadData()
                
                if let navTitle = self.navigationItem.titleView as? UILabel {
                    navTitle.text = "사원 목록 \n" + "총 \(self.empList.count)명"
                }
            }
        })
        
        self.present(alert, animated: false)
    }
    
    @IBAction func editing(_ sender: Any) {
        
        if self.isEditing == false {
            self.setEditing(true, animated: true)
            (sender as? UIBarButtonItem)?.title = "Done"
        }else{
            self.setEditing(false, animated: false)
            (sender as? UIBarButtonItem)?.title = "Edit"
        }
    }
    
    @objc func pullToRefresh(_ sender: Any){
        
        self.empList = self.empDAO.find()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()

        let distance = max(0.0, -(self.refreshControl?.frame.origin.y)!)
        UIView.animate(withDuration: 0.5){
            self.bgCircle.frame.size.width = 80
            self.bgCircle.frame.size.height = 80
            self.bgCircle.center.x = (self.refreshControl?.frame.width)! / 2
            self.bgCircle.center.y = distance * 2
            self.bgCircle.layer.cornerRadius = (self.bgCircle?.frame.size.width)! / 2
            
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let distance = max(0, -(self.refreshControl?.frame.origin.y)!)
        let ts = CGAffineTransform(rotationAngle: CGFloat(distance / 20))
        
        self.loadingImg?.center.y = distance / 2
        self.bgCircle?.center.y = distance / 2
        
        loadingImg.transform = ts
        
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
        self.bgCircle.frame.size.width = 0
        self.bgCircle.frame.size.height = 0
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

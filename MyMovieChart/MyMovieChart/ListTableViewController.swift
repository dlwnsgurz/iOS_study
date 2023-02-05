//
//  ListTableViewController.swift
//  MyMovieChart
//
//  Created by LEE on 2023/02/03.
//

import UIKit

class ListTableViewController: UITableViewController {

    @IBOutlet var addBtn: UIButton!
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        return datalist
    }()
    
    var page = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callMovieAPI()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")! as! MovieCell
        
//        let title = cell.viewWithTag(101) as? UILabel
//        let desc = cell.viewWithTag(102) as? UILabel
//        let opendate = cell.viewWithTag(103) as? UILabel
//        let rating = cell.viewWithTag(104) as? UILabel
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        
        DispatchQueue.main.async{
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        }
        
        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row) 행이 선택되었습니다.")
    }
    
    
    @IBAction func add(_ sender: Any) {
        
        self.page += 1
        
        callMovieAPI()
        
        self.tableView.reloadData()
    }
    
    func callMovieAPI(){
        
        let url = "http://115.68.183.178:2029/hoppin/movies?order=releasedateasc&count=10&page=\(self.page)&version=1&genreId="
        
        let apiURI: URL! = URL(string: url)
        
        let apidata = try! Data(contentsOf: apiURI)
        
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result = \(log)")
        
        
        do{
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let totalCount = (hoppin["totalCount"] as? NSString)?.integerValue
            
//            if list.count >= totalCount{
//                addBtn.isHidden = true
//            }
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                list.append(mvo)
            }
            self.tableView.reloadData()
        }catch{
            
        }
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage{
        
        let mvo = list[index]
        
        if let savedImage = mvo.thumbnailImage{
            return savedImage
        }else{
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
}

extension ListTableViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail_segue"
        {
            let path = self.tableView.indexPath(for: sender as! MovieCell)
            
            let detailVC = segue.destination as? DetailViewController
            
            detailVC?.mvo = self.list[path!.row]
        }
    }
}

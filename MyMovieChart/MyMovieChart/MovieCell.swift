//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by LEE on 2023/02/04.
//

import UIKit
class MovieCell: UITableViewCell{
    
    @IBOutlet var thumbnail: UIImageView! // 영화 썸네일
    @IBOutlet var title: UILabel! // 영화 제목
    @IBOutlet var rating: UILabel! // 평점
    @IBOutlet var opendate: UILabel! // 개봉일
    @IBOutlet var desc: UILabel! // 영화 설명
    
    
}

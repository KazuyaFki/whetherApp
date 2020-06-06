//
//  KyotoViewController.swift
//  whetherApp
//
//  Created by Kazuya Fukui on 2020/06/05.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class KyotoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var prefectureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var whetherLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        getAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAPI()
    }
    

    func getAPI(){
              
              
              let url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=260010"
              AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
                  switch response.result{
                  case .success:
                      let json:JSON = JSON(response.data as Any)
                      self.prefectureLabel.text = json["location"]["prefecture"].string!
                      self.descriptionLabel.text = json["description"]["text"].string!
                      self.whetherLabel.text = json["forecasts"][0]["telop"].string!
                      
                  case .failure(_):
                      print("取得できません")
                  }
              }
              
          }

}

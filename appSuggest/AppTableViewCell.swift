//
//  AppTableViewCell.swift
//  appSuggest
//
//  Created by Elvis Silveira on 23/05/20.
//  Copyright © 2020 Elvis Silveira. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var preco: UILabel!
    @IBOutlet weak var stackEstrelas: UIStackView!
    @IBOutlet weak var imageBG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if(selected){
      //      if(animated){
                UIView.animate(withDuration: 0.5, animations: {
                    self.imageBG.alpha = 0.4
                })
    //        }
    //        else{
    //            self.imageBG.alpha = 0.4
    //        }
        }
        else{
   //         if(animated){
                UIView.animate(withDuration: 0.5, animations: {
                    self.imageBG.alpha = 1.0
                })
    //        }
   //         else{
    //            self.imageBG.alpha = 1.0
    //        }
        }
        
        // Configure the view for the selected state
    }

}

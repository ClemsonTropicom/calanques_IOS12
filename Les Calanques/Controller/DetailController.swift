//
//  DetailController.swift
//  Les Calanques
//
//  Created by Clément Doche on 6/24/19.
//  Copyright © 2019 La Tropicom. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var calanqueIV: UIImageView!
    
    @IBOutlet weak var nomEtDesc: UITextView!
    
    var calanqueRecue: Calanque?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let calanque = calanqueRecue else {return}
        calanqueIV.image = calanque.image
        
        let mutable = NSMutableAttributedString(string: calanque.nom + "\n\n", attributes: [.foregroundColor: UIColor.red, .font: UIFont.boldSystemFont(ofSize: 20)])
        mutable.append(NSAttributedString(string: calanque.desc, attributes: [.font: UIFont.systemFont(ofSize: 17), .foregroundColor: UIColor.darkGray]))
        nomEtDesc.attributedText = mutable
        nomEtDesc.textAlignment = .center
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

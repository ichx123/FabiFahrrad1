//
//  ViewController.swift
//  PruefungsfitMitFabiFahrrad
//
//  Created by Rebecca Nußbaumer on 13.03.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beginButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hinzufügen von Button-Styles
        beginButton.layer.shadowColor = UIColor.black.cgColor
        beginButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        beginButton.layer.shadowOpacity = 0.5
    }


}


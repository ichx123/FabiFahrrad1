//
//  ScoreViewController.swift
//  PruefungsfitMitFabiFahrrad
//
//  Created by Rebecca Nußbaumer on 14.03.24.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var startOverButton: UIButton!
    
    @IBOutlet weak var smileyImage: UIImageView!
    
    @IBOutlet weak var scoreOutput: UILabel!
    
    var score: Int = 0
    
    @IBAction func startOverTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "newStart", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startOverButton.layer.shadowColor = UIColor.black.cgColor
        startOverButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        startOverButton.layer.shadowOpacity = 0.5
        
        showTestResults(score: score)

        // Do any additional setup after loading the view.
    }
    
    func showTestResults(score: Int) {
        if score >= 15 {
            scoreOutput.text = "Du hast die Prüfung mit \(score) von 20 Punkten bestanden!"
            smileyImage.image = UIImage(named: "LachendesSmiley")
        } else {
            scoreOutput.text = "Du hast die Prüfung mit \(score) von 20 Punkten leider nicht bestanden!"
            smileyImage.image = UIImage(named: "TraurigesSmiley")
            view.backgroundColor = UIColor(red: 215/255, green: 113/255, blue: 113/255, alpha: 1.0)
        }
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

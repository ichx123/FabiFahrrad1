//
//  MainController.swift
//  PruefungsfitMitFabiFahrrad
//
//  Created by Rebecca Nußbaumer on 13.03.24.
//

import UIKit

class MainController: UIViewController {
    
    // Enum für Lernen/Quiz-Modus
    
    enum Mode {
        case learn
        case test
    }

    
    // Initialisierungen
    var mode: Mode = .learn {
        didSet {
            switch mode {
            case .learn:
                setupLearn()
                modeSelector.selectedSegmentIndex = 0
            case .test:
                setupTest()
            }
        updateUI()
                
            }
        }
    
    var selectedAnswer: Int = 0
    var correctAnswerCount = 0
    var currentQuestionIndex = 0

    // Outlets für Labels und Buttons
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var questionHinweis: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var modeSelector: UISegmentedControl!
    
    @IBOutlet weak var antwort1: UIButton!
    
    @IBOutlet weak var antwort2: UIButton!
    
    @IBOutlet weak var antwort3: UIButton!
    
    @IBOutlet weak var antwort4: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var ProgressText: UILabel!
    
    
    // Funktionen für Buttons und SegmentedButton
    
    @IBAction func segmentedButtonChanged(_ sender: Any) {
        
        if modeSelector.selectedSegmentIndex == 0 {
            mode = .learn
        } else {
            mode = .test
        }
        
        updateUI()
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        currentQuestionIndex -= 1
        
        if currentQuestionIndex <= 0 {
            currentQuestionIndex = 0
        }
        
        updateUI()
    }
    
    @IBAction func ForwardButtonTapped(_ sender: Any) {
        currentQuestionIndex += 1
        
        if currentQuestionIndex >= questions.count {
            currentQuestionIndex = 0
        }
        
        updateUI()
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            selectedAnswer = 0
        case 2:
            selectedAnswer = 1
        case 3:
            selectedAnswer = 2
        case 4:
            selectedAnswer = 3
        default:
            break
        }
        
        checkAnswer(selectedAnswer: selectedAnswer)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mode = .learn
        
        //Button-Styles
        
        antwort1.layer.shadowColor = UIColor.black.cgColor
        antwort1.layer.shadowOffset = CGSize(width: 2, height: 2)
        antwort1.layer.shadowOpacity = 0.5
        
        antwort2.layer.shadowColor = UIColor.black.cgColor
        antwort2.layer.shadowOffset = CGSize(width: 2, height: 2)
        antwort2.layer.shadowOpacity = 0.5
        
        antwort3.layer.shadowColor = UIColor.black.cgColor
        antwort3.layer.shadowOffset = CGSize(width: 2, height: 2)
        antwort3.layer.shadowOpacity = 0.5
        
        antwort4.layer.shadowColor = UIColor.black.cgColor
        antwort4.layer.shadowOffset = CGSize(width: 2, height: 2)
        antwort4.layer.shadowOpacity = 0.5
        
        forwardButton.layer.shadowColor = UIColor.black.cgColor
        forwardButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        forwardButton.layer.shadowOpacity = 0.5
        
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        backButton.layer.shadowOpacity = 0.5
        
        // Image Rounded Corners
        
        questionImage.layer.cornerRadius = 5
    

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        // Abhängig vom Modus updaten
        switch mode {
        case .learn:
            updateLearnUI()
            
        case .test:
            updateTestUI()
            
        }
    }
    
    func updateLearnUI() {
        
        // Buttons for LearnMode
        antwort1.isHidden = true
        antwort2.isHidden = true
        antwort3.isHidden = true
        antwort4.isHidden = true
        
        forwardButton.isHidden = false
        backButton.isHidden = false
        
        // QuestionHinweis anzeigen
        questionHinweis.isHidden = false
        
        // ProgressBar ausblenden
        progressBar.isHidden = true
        ProgressText.isHidden = true
        
        // Anzeige der Inhalte
        questionText.text = questions[currentQuestionIndex].questionText
        questionHinweis.text = questions[currentQuestionIndex].hinweis
        questionImage.image = questions[currentQuestionIndex].image
        
        
    }
    
    func updateTestUI() {
        
        // Buttons for TestMode
        antwort1.isHidden = false
        antwort2.isHidden = false
        antwort3.isHidden = false
        antwort4.isHidden = false
    
        forwardButton.isHidden = true
        backButton.isHidden = true
        
        // QuestionHinweis ausblenden
        questionHinweis.isHidden = true
        
        // ProgressBar einblenden und updaten
        progressBar.isHidden = false
        ProgressText.isHidden = false
        updateProgress()
        
        // Anzeige der Inhalte
        questionText.text = questionsForQuiz[currentQuestionIndex].questionText
        questionHinweis.text = questionsForQuiz[currentQuestionIndex].hinweis
        questionImage.image = questionsForQuiz[currentQuestionIndex].image
        antwort1.setTitle(questionsForQuiz[currentQuestionIndex].answers[0], for: .normal)
        antwort2.setTitle(questionsForQuiz[currentQuestionIndex].answers[1], for: .normal)
        if questionsForQuiz[currentQuestionIndex].answers[2] == "" {
            antwort3.isHidden = true;
        } else {
            antwort3.setTitle(questionsForQuiz[currentQuestionIndex].answers[2], for: .normal)
        }
        if questionsForQuiz[currentQuestionIndex].answers[3] == "" {
            antwort4.isHidden = true;
        } else {
            antwort4.setTitle(questionsForQuiz[currentQuestionIndex].answers[3], for: .normal)
        }

    }
    
    // Funktion, um zu überprüfen, ob die Antwort korrekt ist
    
    func checkAnswer(selectedAnswer: Int) {
        // Wenn Antwort korrekt, dann zähle eines zum Score dazu, und gehe zur nächsten Frage über
        if selectedAnswer == questionsForQuiz[currentQuestionIndex].correctAnswer {
            correctAnswerCount += 1
            // Wenn die letzte Frage erreicht ist, zeige den Score-View an
            if currentQuestionIndex >= questionsForQuiz.count - 1 {
                showScore()
            } else {
                currentQuestionIndex += 1
                updateUI() }
            // Wenn die Antwort falsch ist, zeige einen Hinweis und gehe zur näcshten Frage über
        } else {
            displayHint()
    
            }
            
        }
    
    func setupLearn() {
        currentQuestionIndex = 0
    }
    
    func setupTest() {
        currentQuestionIndex = 0
        correctAnswerCount = 0
        selectedAnswer = 0
    }
    
    func showScore() {
    
                performSegue(withIdentifier: "score", sender: self)
            }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "score" {
            if let destinationViewController = segue.destination as? ScoreViewController {
                // Übergebe die Variable count an ViewController2
                destinationViewController.score = correctAnswerCount
            }
        }
    }
    
    func displayHint() {
        let alert = UIAlertController(title: "Die Antwort war leider falsch!", message: " \(questionsForQuiz[currentQuestionIndex].hinweis)", preferredStyle: .alert)
           
           let dismissAction = UIAlertAction(title: "Weiter", style: .default, handler: HintAlertDismissed(_ :))
           
           alert.addAction(dismissAction)
           
           present(alert, animated: true, completion: nil)
       }
       
       func HintAlertDismissed(_ action: UIAlertAction) {
           if currentQuestionIndex >= questionsForQuiz.count - 1 {
               showScore()
           } else {
               currentQuestionIndex += 1
               updateUI() }
       }

    func updateProgress() {
        progressBar.progress = Float(currentQuestionIndex + 1) / Float(20)
        
        ProgressText.text = "\(currentQuestionIndex) von 20 Fragen gelöst"
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

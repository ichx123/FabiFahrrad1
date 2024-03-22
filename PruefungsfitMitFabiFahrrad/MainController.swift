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
    
    var mode: Mode = .learn { //Variable, um den aktuellen Modus zu bestimmen
        didSet {
            switch mode {
            case .learn:
                setupLearn() //setzt den Lernmodus zurück
                modeSelector.selectedSegmentIndex = 0 //Segmented Control auf "Lernen" setzen
            case .test:
                setupTest() //setzt den Quizmodus zurück
            }
        updateUI() //updatet die UI nach dem Wechsel des Moduses
                
            }
        }
    
    var selectedAnswer: Int = 0 //Variable, um die vom Nutzer gewählte Antwort zu speichern
    var correctAnswerCount = 0 //Variable, um die Anzahl der richtigen Antworten des Nutzers zu speichern
    var currentQuestionIndex = 0 //Indexvariable, dient zur Navigation durch die Fragen und Lerninhalte

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
    
    //Funktion für den Segmented Control
    @IBAction func segmentedButtonChanged(_ sender: Any) {
        
        if modeSelector.selectedSegmentIndex == 0 {
            mode = .learn //Switch an erster Position, dann Modus "Lernen"
        } else {
            mode = .test //Switch an zweiter Position, dann Modus "Prüfung/Quiz"
        }
        
        updateUI() //updatet die UI nach dem Wechsel des Moduses
        
    }
    
    //Funktion für den "Zurück-Button"
    @IBAction func backButtonTapped(_ sender: Any) {
        currentQuestionIndex -= 1 //Setzt den Index um einen Wert zurück
        
        if currentQuestionIndex <= 0 { //Wenn der Index unter 0 fallen würde, wird er auf 0 gesetzt, um einen "Index out of Range" Fehler zu vermeiden
            currentQuestionIndex = 0
        }
        
        updateUI() //Updatet die UI, um die aktuelle Frage anzuzeigen
    }
    
    //Funktion für den "Weiter-Button"
    @IBAction func ForwardButtonTapped(_ sender: Any) {
        currentQuestionIndex += 1 //Setzt den Index um einen Wert hoch
        
        if currentQuestionIndex >= questions.count { //Wenn der Index über die Länge des Arrays steigen würde, wird er auf 0 gesetzt, um einen "Index out of Range" Fehler zu vermeiden
            currentQuestionIndex = 0
        }
        
        updateUI() //Updatet die UI, um die aktuelle Frage anzuzeigen
    }
    
    //Funktion für die 4 Antworten-Buttons
    @IBAction func answerSelected(_ sender: UIButton) {
        
        switch sender.tag { //Jeder Button hat einen spezifischen Tag, je nach angeklickten Button wird der Variable "selectedAnswer" ein Int zugewiesen, der zum Antwort-Arrray des Question-Objekts passt
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
        
        checkAnswer(selectedAnswer: selectedAnswer) //Prüft die eigegebene Antwort auf Richtigkeit
        
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
    
    }
    
    //Übergeordnete UI-Update-Methode, um die UI je nach Modus zu updaten
    func updateUI() {
        
        // Abhängig vom Modus updaten
        switch mode {
        case .learn:
            updateLearnUI()
            
        case .test:
            updateTestUI()
            
        }
    }
    
    //Update-Methode für die UI des Lernmodus
    func updateLearnUI() {
        
        // Buttons ein- und ausblenden für den Learnmodus
        antwort1.isHidden = true
        antwort2.isHidden = true
        antwort3.isHidden = true
        antwort4.isHidden = true
        
        forwardButton.isHidden = false // soll immer angezeigt werden, um wieder von vorne beginnen zu können
        if currentQuestionIndex > 0 {
            backButton.isHidden = false }
        else {
            backButton.isHidden = true //Back-Button soll ausgeblendet werden, wenn man bei der ersten Frage angelangt ist
        }
        
        
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
    
    //Update-Methode für die UI des Quizmodus
    func updateTestUI() {
        
        // Buttons ein- und ausblenden für den Quizmodus
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
        updateProgress() //Updatet die Progressbar nach jeder beantworteten Frage
        
        // Anzeige der Inhalte
        questionText.text = questionsForQuiz[currentQuestionIndex].questionText
        questionHinweis.text = questionsForQuiz[currentQuestionIndex].hinweis
        questionImage.image = questionsForQuiz[currentQuestionIndex].image
        
        //Antwort-Buttons, Titel wird über das Antwort-Array des Question-Objekts gesetzt
        antwort1.setTitle(questionsForQuiz[currentQuestionIndex].answers[0], for: .normal)
        antwort2.setTitle(questionsForQuiz[currentQuestionIndex].answers[1], for: .normal)
        if questionsForQuiz[currentQuestionIndex].answers[2] == "" { //Falls es keine 3. Antwort gibt, wird der Button ausgeblendet
            antwort3.isHidden = true;
        } else {
            antwort3.setTitle(questionsForQuiz[currentQuestionIndex].answers[2], for: .normal)
        }
        if questionsForQuiz[currentQuestionIndex].answers[3] == "" { //Falls es keine 4. Antwort gibt, wird der Button ausgeblendet
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
                currentQuestionIndex += 1 //Gehe zur nächsten Frage über
                updateUI() }
            // Wenn die Antwort falsch ist, zeige einen Hinweis und gehe zur nächsten Frage über
        } else {
            displayHint() //Hinweis wird angezeigt, wenn der Hinweis verworfen wird, wird die nächste Frage angezeigt
    
            }
            
        }
    //Funktionen zum Zurücksetzen des Lern- und Prüfungsmoduses
    func setupLearn() {
        currentQuestionIndex = 0
    }
    
    func setupTest() {
        currentQuestionIndex = 0
        correctAnswerCount = 0
        selectedAnswer = 0
        questionsForQuiz = Array(questions.shuffled().prefix(20)) //Damit wird sichergestellt, dass immer neue Fragen im Quiz gestellt werden
    }
    
    //Funktion, um zum Score-View überzugehen
    func showScore() {
    
                performSegue(withIdentifier: "score", sender: self) //geht zum ScoreView über
            }

    //nötig, um die Variable "correntAnswerCount" an die Variable "score" im ScoreView-Controller zu übergeben
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "score" {
            if let destinationViewController = segue.destination as? ScoreViewController {
                // Übergebe die Variable "correctAnswerCount" an ScoreViewController
                destinationViewController.score = correctAnswerCount
            }
        }
    }
    
    //Funktion, um den Hinweis als Alert anzuzeigen und anschließend zur nächsten Frage überzugehen
    func displayHint() {
        let alert = UIAlertController(title: "Die Antwort war leider falsch!", message: " \(questionsForQuiz[currentQuestionIndex].hinweis)", preferredStyle: .alert)
           
           let dismissAction = UIAlertAction(title: "Weiter", style: .default, handler: HintAlertDismissed(_ :))
           
           alert.addAction(dismissAction)
           
           present(alert, animated: true, completion: nil)
       }
       // Funktion, um zu bestimmen, was nach dem Verwerfen des Hinweises geschieht
       func HintAlertDismissed(_ action: UIAlertAction) {
           if currentQuestionIndex >= questionsForQuiz.count - 1 { //Wenn das Ende des Quizzes erreicht ist, wechsle zum ScoreView
               showScore()
           } else {
               currentQuestionIndex += 1 //Ansonsten zeige die nächste Frage an
               updateUI() }
       }
    
    //Funktion, um die ProgressBar und die Beschriftung zu aktualisieren
    func updateProgress() {
        progressBar.progress = Float(currentQuestionIndex + 1) / Float(20) //Dividiert die aktuelle Frage durch 20, um den aktuellen Fortschritt anzuzeigen
        
        ProgressText.text = "\(currentQuestionIndex) von 20 Fragen gelöst" //Zeigt an, wieviele Fragen bereits gelöst wurden
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

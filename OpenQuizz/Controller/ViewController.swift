//
//  ViewController.swift
//  OpenQuizz
//
//  Created by Archeron on 09/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionView: QuestionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = Notification.Name(rawValue: "QuestionsLoaded")
        NotificationCenter.default.addObserver(
            self, selector: #selector(questionsLoaded),
            name: name, object: nil)
        startNewGame()
    }

    @objc func questionsLoaded() {
        activityIndicator.isHidden = true
        newGameButton.isHidden = false
        questionView.title = game.currentQuestion.title
    }
    
    @IBAction func didTapNewGameButton() {
       startNewGame()
    }
   
    var game = Game()
    
    private func startNewGame() {
        activityIndicator.isHidden = false
        newGameButton.isHidden = true

        questionView.title = "Loading..."
        questionView.style = .standard

        scoreLabel.text = "0 / 10"
        game.refresh()
    }
}

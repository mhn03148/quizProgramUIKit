//
//  ViewController.swift
//  quizProgramUIKit
//
//  Created by 주진형 on 2023/06/22.
//

import UIKit
class ViewController: UIViewController {
    var tenProblem = problems[0..<10]
    var stage: Int = 0
    var lifeCount: Int = 3
    var currectCount: Int = 0
    
    @IBOutlet weak var heartImageLabel: UILabel!
    @IBOutlet weak var correctCountLabel: UILabel!
    @IBOutlet weak var lifeHeartLabel: UILabel!
    @IBOutlet weak var questionRoundLabel: UILabel!
    @IBOutlet weak var problemTextLabel: UILabel!
    @IBOutlet weak var oneQuizOption: UIButton!
    @IBOutlet weak var twoQuizOption: UIButton!
    @IBOutlet weak var threeQuizOption: UIButton!
    @IBOutlet weak var fourQuizOption: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var yesOrNoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor =
        // Do any additional setup after loading the view.
        problemTextLabel.text = "게임을 시작합니다."
        problemTextLabel.layer.masksToBounds = true
        problemTextLabel.layer.cornerRadius = 10
        problemTextLabel.highlightedTextColor = UIColor.black
        getLifeHeart()
        changeTitle()
    }
    
    @IBAction func oneButton(_ sender: Any) {
        if stage < 11 && stage != 10 {
            isCorrectAnswer(0)
            stage += 1
            showProblem()
        } else if stage == 10 {
            isCorrectAnswer(0)
            endGame()
        }
    }
    
    @IBAction func twoButton(_ sender: Any) {
        if stage < 11 && stage != 10 {
            isCorrectAnswer(1)
            stage += 1
            showProblem()
        } else if stage == 10 {
            isCorrectAnswer(1)
            endGame()
        }
    }
    
    @IBAction func threeButton(_ sender: Any) {
        if stage < 11 && stage != 10 {
            isCorrectAnswer(2)
            stage += 1
            showProblem()
        } else if stage == 10 {
            isCorrectAnswer(2)
            endGame()
        }
    }
    
    @IBAction func fourButton(_ sender: Any) {
        if stage < 11 && stage != 10 {
            isCorrectAnswer(3)
            stage += 1
            showProblem()
        } else if stage == 10 {
            isCorrectAnswer(3)
            endGame()
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        stage = 1
        currectCount = 0
        lifeCount = 3
        getLifeHeart()
        changeTitle()
        showProblem()
    }
    
    func isCorrectAnswer(_ optionIndex: Int) {
        if stage < 10 {
            if tenProblem[stage - 1].options[optionIndex] == tenProblem[stage - 1].answer {
                currectCount += 1
            } else {
                lifeCount -= 1
            }
            getLifeHeart()
            changeTitle()
        }
    }
    
    func showProblem () {
        if stage < 11 {
            resetButton.setTitle("게임리셋", for: UIControl.State.normal)
            tenProblem = problems.shuffled()[0..<10]
            problemTextLabel.text = "\(tenProblem[stage - 1].question)"
            correctCountLabel.text = "\(stage)/10"
            questionRoundLabel.text = "Question \(stage)"
            yesOrNoLabel.text = "\(currectCount)/\(stage - 1 - currectCount)"
            oneQuizOption.setTitle(tenProblem[stage - 1].options[0], for: UIControl.State.normal)
            twoQuizOption.setTitle(tenProblem[stage - 1].options[1], for: UIControl.State.normal)
            threeQuizOption.setTitle(tenProblem[stage - 1].options[2], for: UIControl.State.normal)
            fourQuizOption.setTitle(tenProblem[stage - 1].options[3], for: UIControl.State.normal)
        } else {
            endGame()
            return
        }
        
    }
    func getLifeHeart() {
            switch (lifeCount) {
            case 0:
                lifeHeartLabel.text = "💔"
            case 1:
                lifeHeartLabel.text = "♥︎"
            case 2:
                lifeHeartLabel.text = "♥︎♥︎"
            case 3:
                lifeHeartLabel.text = "♥︎♥︎♥︎"
            default:break
            }
        }
    func changeTitle() {
            switch (currectCount) {
            case 1:
                heartImageLabel.text = "🧍‍♀️♥︎♥︎♥︎♥︎♥︎♥︎🏃‍♂️"
            case 2:
                heartImageLabel.text = "🧍‍♀️♥︎♥︎♥︎♥︎♥︎🏃‍♂️"
            case 3:
                heartImageLabel.text = "🧍‍♀️♥︎♥︎♥︎♥︎🏃‍♂️"
            case 4:
                heartImageLabel.text = "🧍‍♀️♥︎♥︎♥︎🏃‍♂️"
            case 5:
                heartImageLabel.text = "🧍‍♀️♥︎♥︎🏃‍♂️"
            case 6:
                heartImageLabel.text = "🧍‍♀️♥︎🏃‍♂️"
            case 7:
                heartImageLabel.text = "👩‍❤️‍👨"
            default:
                heartImageLabel.text = "♥︎"
            }
        }
    func endGame() {
        problemTextLabel.text = "게임이 끝났습니다."
        oneQuizOption.setTitle("1", for: UIControl.State.normal)
        twoQuizOption.setTitle("2", for: UIControl.State.normal)
        threeQuizOption.setTitle("3", for: UIControl.State.normal)
        fourQuizOption.setTitle("4", for: UIControl.State.normal)
        yesOrNoLabel.text = "\(currectCount)/\(stage - currectCount)"
    }
}


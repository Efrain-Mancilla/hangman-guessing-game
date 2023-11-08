//
//  ViewController.swift
//  Apple_pie_project_Mancilla_Efrain
//
//  Created by Efrain Mancilla on 11/2/23.
//

import UIKit

class ViewController: UIViewController {
    // List of words in the game
    var list_of_words = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program", "dog", "cooking", "television"]

    // number of attempts before game over
    let incorrect_moves_allowed = 7

    // stats while the game is running
    // wins accumulator, starts a new round if set
    var total_wins = 0 {
        didSet {
            new_round()
        }
    }
    // loses accumulator, starts new round if set
    var total_losses = 0 {
        didSet {
            new_round()
        }
    }
    
    // outlet for image of tree
    @IBOutlet var tree_image_view: UIImageView!
    
    // outlet for correct word label
    @IBOutlet var correct_word_label: UILabel!
    
    // outlet for score
    @IBOutlet var score_label: UILabel!
    
    // outlet collections for letter buttons
    @IBOutlet var letter_buttons: [UIButton]!
    
    // action for when letter buttons are pressed
    @IBAction func letter_button_press(_ sender: UIButton) {
        // disables button on screen
        sender.isEnabled = false
        //gets the title on button, this case is letter
        let letter_string = sender.configuration!.title!
        // converts to lowercase for easy comparison
        let letter = Character((letter_string.lowercased()))
        // calls player guess function
        current_game.player_guessed(letter: letter)
        update_game_state()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        new_round()
    }
    // current game var that holds a Game struct but is not assigned a value yet
    var current_game: Game!
    
    // function that starts a new round with a new word
    func new_round() {
        if !list_of_words.isEmpty {
            // new target word is chosen
            let new_word = list_of_words.removeFirst()
            // current game is reset with new word
            current_game = Game(word: new_word, incorrect_moves_remaining: incorrect_moves_allowed, guessed_letters: [])
            // re-enables buttons
            enable_letter_buttons(true)
            update_UI()
        } else {
            // disables buttons
            enable_letter_buttons(false)
        }
    }

    // updates UI to reflect correct guesses and wins
    func update_UI() {
        // creates empty array to convert char to string
        var letters = [String]()
        // appends updated revealed word to string array
        for letter in current_game.formatted_word {
            letters.append(String(letter))
        }
        // updates the word to include spacing
        let word_with_spacing = letters.joined(separator: " ")
        // updates target word to reveal with proper spacing, if guessed correctly
        correct_word_label.text = word_with_spacing
        // updates wins and loses text
        score_label.text = "Wins: \(total_wins), Losses: \(total_losses)"
        // updates tree image to show how many attempts they have left
        tree_image_view.image = UIImage(named: "Tree \(current_game.incorrect_moves_remaining)")
    }
    
    // updates game state to check if win or loss criteria has been met
    func update_game_state() {
        // checks to see if player has any tries left, if none -> game over
        if current_game.incorrect_moves_remaining == 0 {
            total_losses += 1
        }
        // checks to see if player has matched the target word, if so -> player wins!
        else if current_game.word == current_game.formatted_word {
            total_wins += 1
        // if neither criteria is met, then just update UI with attempted letter
        } else {
            update_UI()
        }
    }
    
    // enables or disables buttons based on bool
    func enable_letter_buttons(_ enable: Bool) {
        // enables every button one by one
        for button in letter_buttons {
            button.isEnabled = enable
        }
    }
}


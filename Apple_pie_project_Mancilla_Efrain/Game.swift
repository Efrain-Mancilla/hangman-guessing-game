//
//  Game.swift
//  Apple_pie_project_Mancilla_Efrain
//
//  Created by Efrain Mancilla on 11/2/23.
//

import Foundation

struct Game {
    // word to guess
    var word: String
    // tries remaining
    var incorrect_moves_remaining: Int
    // letters already guessed by player
    var guessed_letters: [Character]
    
    // player guess function
    mutating func player_guessed(letter: Character) {
        // add guessed letter to the guessed letters array
        guessed_letters.append(letter)
        // checks to see if letter guessed is in the target word, if false then minus 1 try
        if !word.contains(letter) {
            incorrect_moves_remaining -= 1
        }
    }
    
    // slowly reveals the correct word while player attempts guesses
    var formatted_word: String {
        // starts off empty with zero guesses
        var guessed_word = ""
        // checks to see if player letter guess is in target word
        for letter in word {
            // if it contains guessed letter, reveal in string
            if guessed_letters.contains(letter) {
                guessed_word += "\(letter)"
            // leave include an underscore
            } else {
                guessed_word += "_"
            }
        }
        // returns updated string with underscores and letters
        return guessed_word
    }
}

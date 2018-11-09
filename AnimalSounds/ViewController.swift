//
//  ViewController.swift
//  AnimalSounds
//
//  Created by Hameed Abdullah on 11/7/18.
//  Copyright © 2018 Hameed Abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalSoundLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
//    let meowSound = SimpleSound(named: "meow")
//    let mooSound = SimpleSound(named: "moo")
//    let woofSound = SimpleSound(named: "woof")
    
    let animals: [Animal] = [
        Animal(emoji: "🐱", exclamation: "Meow!", simpleSound: SimpleSound(named: "meow")),
        Animal(emoji: "🐶", exclamation: "Woof!", simpleSound: SimpleSound(named: "woof")),
        Animal(emoji: "🐮", exclamation: "Moo!",  simpleSound: SimpleSound(named: "moo"))
    ];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Change the font size of the segmented control to 72.
        let font: UIFont = UIFont.systemFont(ofSize: 72);
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]; //a dictionary
        segmentedControl!.setTitleTextAttributes(attributes, for: UIControl.State.normal);
        
        segmentedControl!.removeAllSegments()
        
        //Put the animals into the segmented control.
        for animal in animals {
            segmentedControl!.insertSegment(withTitle: animal.emoji, at: animals.count, animated: false)
        }
        
        //When the app is launched, no segment is selected yet.
        segmentedControl!.selectedSegmentIndex = -1
        
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        //Find out which segment was pressed.
        let i: Int = segmentedControl!.selectedSegmentIndex
        
        let animal: Animal = animals[i]
        animalSoundLabel.text = animal.exclamation
        animal.simpleSound.play()
    }
    

//    @IBAction func catButtonTapped(_ sender: Any) {
//        
//        animalSoundLabel.text = "Meow!"
//        //meowSound.play()
//        
//    }
//    
//    @IBAction func dogButtonTapped(_ sender: Any) {
//        animalSoundLabel.text = "Woof!"
//       /// woofSound.play()
//        
//    }
//    
//    @IBAction func cowButtonTapped(_ sender: Any) {
//        animalSoundLabel.text = "Moo!"
//       // meowSound.play()
//    }
    
}


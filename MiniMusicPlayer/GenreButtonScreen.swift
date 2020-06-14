//
//  GenreButtonScreen.swift
//  MiniMusicPlayer
//
//  Created by Benjamin Inemugha on 13/06/2020.
//  Copyright © 2020 Techelopers. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var christainButton: UIButton!
    @IBOutlet weak var jazzButoon: UIButton!
    @IBOutlet weak var hiphopButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        christainButton.layer.cornerRadius = 10.0
        jazzButoon.layer.cornerRadius = 10.0
        hiphopButton.layer.cornerRadius = 10.0
        stopButton.layer.cornerRadius = 10.0
        nextButton.layer.cornerRadius = 10.0
        previousButton.layer.cornerRadius = 10.0
        playButton.layer.cornerRadius = 25.0
        pauseButton.layer.cornerRadius = 10.0  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopButton.isHidden = true
        playButton.isHidden = true
        pauseButton.isHidden = true
        nextButton.isHidden = true
        previousButton.isHidden = true
    }
    
   
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        self.stopButton.isHidden = false
        self.playButton.isHidden = false
        self.pauseButton.isHidden = false
        self.nextButton.isHidden = false
        self.previousButton.isHidden = false
    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        musicPlayer.play()
        musicPlayer.skipToPreviousItem()
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.play()
        musicPlayer.skipToNextItem()
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        musicPlayer.play()
    }
    @IBAction func PausePlay(_ sender: UIButton) {
            musicPlayer.pause()
    }
    
    func playGenre(genre: String){
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
    }
    
    
}

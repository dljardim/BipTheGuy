//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Damian Jardim on 2/22/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer!
    private let soundName = "punchSound"
    private let imageName = "clown"
    
    func playSound(soundName:String){
        
        if(audioPlayer != nil && audioPlayer.isPlaying){
            audioPlayer.stop()
        }
        
        // check if that file exists and can be played
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file name \(soundName)")
            return
        }
        
        // play the sound
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }catch{
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
    
    
    func handleClick(){
        playSound(soundName: soundName)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Button{
                playSound(soundName: soundName)
            }label:{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
            }
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    playSound(soundName: soundName)
                }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

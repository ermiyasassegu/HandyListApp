//
//  SpeechManager.swift
//  HandyListApp
//
//  Created by iosdev on 30.4.2022.
//

import Foundation
import Speech

class SpeechManager {
    
    public var isRecording = false
    
    private var audioEngine: AVAudioEngine!
    private var inputNote: AVAudioInputNode!
    private var audioSession: AVAudioSession!
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    // check the permision authorization
    func checkPermissions() {
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            DispatchQueue.main.async {
                switch authStatus {
                case .authorized: break
                default:
                    print("Speech recognition is not available")
                }
            }
        }
    }
    
    // start and stop recording
    func start(completion: @escaping (String?) -> Void) {
        if isRecording {
            stopRecording()
        } else {
            startRecording(completion: completion)
        }
    }
    
    func stopRecording() {
        recognitionRequest?.endAudio()
        recognitionRequest = nil
        audioEngine.stop()
        inputNote.removeTap(onBus: 0)
        
        try? audioSession.setActive(false)
        audioSession = nil
    }
    
    func startRecording(completion: @escaping (String?) -> Void) {
        guard let recognizer = SFSpeechRecognizer(), recognizer.isAvailable else {
            print("Speech recognizer not available.")
            return
        }
        // initialize recognition request
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        recognitionRequest!.shouldReportPartialResults = true
        // call the recognizer and error handler
        recognizer.recognitionTask(with: recognitionRequest!) { (result, error) in
            guard error == nil else {
                print("got error \(error!.localizedDescription)")
                return
            }
        
            guard let result = result else { return }
            if result.isFinal {
                completion(result.bestTranscription.formattedString)
            }
        }
        // initialize and set audio engine
        audioEngine = AVAudioEngine()
        inputNote = audioEngine.inputNode
        let recordingFormat = inputNote.outputFormat(forBus: 0)
        inputNote.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        // start the session
        do {
            audioSession = AVAudioSession.sharedInstance()
            
            // set record mode and option for backgroud noises and notification while failing
            try audioSession.setCategory(.record, mode: .spokenAudio, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            
            try audioEngine.start()
        } catch {
            print(error)
        }
    }
    
}

import Foundation
import Speech
import AVFoundation

@MainActor
class SpeechRecognizer: ObservableObject {
    @Published var transcript = ""
    @Published var isRecording = false
    @Published var permissionError = false
    
    private var audioEngine: AVAudioEngine?
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    private let recognizer = SFSpeechRecognizer()
    
    func startTranscribing() {
        guard let recognizer = recognizer, recognizer.isAvailable else {
            self.permissionError = true
            return
        }
        
        // Reset
        transcript = ""
        
        let audioEngine = AVAudioEngine()
        let request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            request.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            self.permissionError = true
            return
        }
        
        self.audioEngine = audioEngine
        self.request = request
        
        self.task = recognizer.recognitionTask(with: request) { [weak self] result, error in
            guard let self = self else { return }
            
            if let result = result {
                Task { @MainActor in
                    self.transcript = result.bestTranscription.formattedString
                }
            }
            
            if error != nil || result?.isFinal == true {
                Task { @MainActor in
                    self.stopTranscribing()
                }
            }
        }
        
        isRecording = true
    }
    
    func stopTranscribing() {
        audioEngine?.stop()
        audioEngine?.inputNode.removeTap(onBus: 0)
        request?.endAudio()
        task?.cancel()
        
        audioEngine = nil
        request = nil
        task = nil
        isRecording = false
    }
    
    func requestAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                if authStatus != .authorized {
                    self.permissionError = true
                }
            }
        }
    }
}

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound(sound: sender.currentTitle!)
        
        //Basılan butonun opaklılğını yarıya indirir.
        sender.alpha = 0.5
        
        //Burada 2 saniye süre veriliyor ki opaklık hemen normale dönmesin.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
           //Burada da tam opak hale gelir.
            sender.alpha = 1.0
        }
    }
    
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    
}

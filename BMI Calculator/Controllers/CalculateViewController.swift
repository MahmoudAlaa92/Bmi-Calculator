
import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var hightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var hightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var calculateShape: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateShape.layer.cornerRadius = 26
    }
    
    @IBAction func hightSliderChanged(_ sender: UISlider) {
        hightLabel.text = String(format: "%.2f", sender.value)+"m"
    }
    @IBAction func wightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value)+"Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let hight = hightSlider.value
        let wieght = weightSlider.value
        calculatorBrain.calculateBMI(hight: hight ,weight: wieght)
        
         performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}


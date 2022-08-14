//
//  CustomerPageViewController.swift
//  MobilePayment
//
//  Created by Narkoz on 11.08.2022.
//

import UIKit
import Firebase

class CustomerPageViewController : BaseViewController  {
    
    
    // MARK: - Properties
    
    @IBOutlet var qrImage: UIImageView!
    @IBOutlet var paymentStatusTextField: UITextField!
    
   
   
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        qrcode()
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    func qrcode (){

        let myString = "https://github.com/ibery"
        let data = myString.data(using: String.Encoding.ascii)
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let QRImage = qrFilter.outputImage else { return }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = QRImage.transformed(by: transform)
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return }
        let processedImage = UIImage(cgImage: cgImage)
        self.qrImage.image = processedImage
    }
  
    
    
   
}


//
//  CashierPageViewController.swift
//  MobilePayment
//
//  Created by Narkoz on 11.08.2022.
//

import UIKit
import AVFoundation

class CashierPageViewController : BaseViewController {
    
    
    // MARK: - Properties
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrcodeFrameView: UIView?

    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      scannerQRCode()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func scannerQRCode(){
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera , for : .video ,position: .back) else {
            print("failed to get the camera device")
            return
        }
        do{
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            captureSession.startRunning()
            
            // massage label
            
            qrcodeFrameView = UIView()
            if let qrcodeFrameView = qrcodeFrameView {
                qrcodeFrameView.layer.borderColor = UIColor.yellow.cgColor
                qrcodeFrameView.layer .borderWidth = 2
                view.addSubview(qrcodeFrameView)
                view.bringSubviewToFront(qrcodeFrameView)
            }
            
        }catch{
            print(error)
            return
        }
    }

    
}

extension CashierPageViewController: AVCaptureMetadataOutputObjectsDelegate{
  
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0{
            qrcodeFrameView?.frame = CGRect.zero
            // message label.text = "no QR code is detected"
            return
            
        }
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if metadataObj.type == AVMetadataObject.ObjectType.qr{
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrcodeFrameView?.frame = barCodeObject!.bounds
            if metadataObj.stringValue != nil{
                print("metadata obj \(metadataObj.stringValue)")
            }
        }
    }
       
}

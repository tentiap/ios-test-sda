//
//  WebViewViewController.swift
//  ios-test-sda
//
//  Created by Tenti Atika Putri on 17/10/22.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    let urlStatic = "https://suitmedia.com/"

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlRequest = URLRequest(url: URL(string: urlStatic)!)
        webView.load(urlRequest)
    }


}

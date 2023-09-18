//
//  WebViewController.swift
//  luna
//
//  Created by alexdamascena on 17/09/23.
//  
//

import UIKit
import WebKit

class WebView: WKWebView {
    
    init() {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        super.init(frame: .zero, configuration: configuration)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class WebViewController: UIViewController {
    
    var presenter: ViewToPresenterWebProtocol?
    
    private let url: URL

    private let webView = WebView()

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadWebPage(at: url)
    }
}

extension WebViewController: PresenterToViewWebProtocol{

    // TODO: Implement View Output Methods
    
    func openWeb(on url: URL) {
        webView.load(URLRequest(url: url))
    }
}





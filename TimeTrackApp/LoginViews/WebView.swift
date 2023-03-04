//
//  WebView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 3/4/23.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable
{
    let url: URL
    func makeUIView(context: Context) -> some UIView
    {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

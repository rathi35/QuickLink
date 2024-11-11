//
//  ContentView.swift
//  QuickLink
//
//  Created by Rathi on 07/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var enteredLink: String = ""
    @State var isValidURL = false
    @State private var isPresentWebView = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField("Enter URL here", text: $enteredLink)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: enteredLink) { newValue in
                    isValidURL = isValidUrlString(newValue)
                }
            if isValidURL , let url = URL(string: enteredLink){
                Button("Open Link"){
                    isPresentWebView = true
                }
                NavigationLink(destination: WebView(url: url), isActive: $isPresentWebView) {
                    EmptyView()
                }
            } else if !enteredLink.isEmpty {
                Text("Invalid URL").foregroundColor(.red).font(.caption2)
            }
        }.padding(12)
    }
    
    func isValidUrlString(_ urlString: String) -> Bool {
        
        guard let url = URL(string: urlString) else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

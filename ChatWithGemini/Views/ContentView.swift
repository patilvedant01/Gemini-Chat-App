//
//  ContentView.swift
//  ChatWithGemini
//
//  Created by Etisha Garg on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GeminiAPI()
    
    var body: some View {
        VStack {
            Text("Welcome to Gemini AI")
                .font(.largeTitle)
                .foregroundStyle(.indigo)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            ZStack {
                ScrollView {
                    Text(viewModel.response)
                        .font(.system(size: 20))
                }
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                        .scaleEffect(4)
                }
            }
            
            TextField("Ask anything...", text: $viewModel.userPrompt, axis: .vertical)
                .lineLimit(5)
                .font(.title3)
                .padding()
                .background(Color.indigo.opacity(0.2), in: Capsule())
                .disableAutocorrection(true)
                .onSubmit {
                    viewModel.generateResponse()
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


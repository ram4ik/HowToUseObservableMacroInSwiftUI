//
//  ContentView.swift
//  HowToUseObservableMacroInSwiftUI
//
//  Created by test on 28.02.2024.
//

import SwiftUI

class ObservableViewModel: ObservableObject {
    
    @Published var title: String = "Some title"
}

struct ContentView: View {
    
    @StateObject private var viewModel = ObservableViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "new title!"
            }
            
            SomeChildView(viewModel: viewModel)
            
            SomeThirdView()
        }
        .environmentObject(viewModel)
    }
}

struct SomeChildView: View {
    
    @ObservedObject var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "new random title text!"
        }
    }
}

struct SomeThirdView: View {
    
    @EnvironmentObject var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "third view"
        }
    }
}

#Preview {
    ContentView()
}

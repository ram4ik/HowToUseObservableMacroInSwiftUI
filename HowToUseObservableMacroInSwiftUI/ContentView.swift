//
//  ContentView.swift
//  HowToUseObservableMacroInSwiftUI
//
//  Created by test on 28.02.2024.
//

import SwiftUI

@Observable class ObservableViewModel {
    
    var title: String = "Some title"
}

struct ContentView: View {
    
    @State private var viewModel = ObservableViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "new title!"
            }
            
            SomeChildView(viewModel: viewModel)
            
            SomeThirdView()
        }
        .environment(viewModel)
    }
}

struct SomeChildView: View {
    
    @Bindable var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "new random title text!"
        }
    }
}

struct SomeThirdView: View {
    
    @Environment(ObservableViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "third view"
        }
    }
}

#Preview {
    ContentView()
}

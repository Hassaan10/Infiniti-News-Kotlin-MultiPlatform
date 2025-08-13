//
//  ContentView.swift
//  Infiniti News IOS
//
//  Created by Hassaan Raza on 26/10/2024.
//

import SwiftUI
import KMPObservableViewModelSwiftUI
import Shared
import KMPNativeCoroutinesAsync


struct MainScreen: View {
    
    @StateViewModel var viewModel : MainViewModel = MainViewModel()
    @State private var allNewsState : ApiResponse? = nil
    @State private var headlinesState : ApiResponse? = nil
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                
                switch ApiValueSwift(headlinesState) {
                case .loading:
                    ProgressView()
                case .success(let array):
                    HeadlinesSection(articles: array)
                case .error(let string):
                    Text(string.description())
                case .none:
                    EmptyView()
                }
                    
                    
                switch ApiValueSwift(allNewsState) {
                case .loading:
                    ProgressView()
                case .success(let array):
                    AllNewsSection(articles: array)
                case .error(let string):
                    Text(string.description())
                case .none:
                    EmptyView()
                }
            }.task {
                do {
                    for try await response in asyncSequence(for: viewModel.headlinesState) {
                        await MainActor.run {
                            self.headlinesState = response
                        }
                    }
                    
                    for try await response in asyncSequence(for: viewModel.allNewsState) {
                        await MainActor.run {
                            self.allNewsState = response
                        }
                    }
                    
                } catch {
                    #if DEBUG
                    print("Error: \(error)")
                    #endif
                }
            }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        }
    }
}

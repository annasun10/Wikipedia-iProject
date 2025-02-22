//
//  ContentView.swift
//  Wikipedia iProject
//
//  Created by Pierce Bader on 2/16/25.
//
import SwiftUI

// MARK: - Bird Model
struct Bird: Identifiable {
    var id = UUID()  // Unique identifier for each bird
    var name: String
    var age: Int
}

// MARK: - Home View
struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to the Birdwatching App")
                    .font(.title)
                    .padding()
                
                NavigationLink("View Bird List", destination: BirdListView())
                    .padding()
                    .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Home")
        }
    }
}

// MARK: - Bird List View
struct BirdListView: View {
    let birdList = [
        Bird(name: "Blue Jay", age: 10),
        Bird(name: "American Robin", age: 5),
        Bird(name: "Northern Cardinal", age: 2)
    ]
    
    var body: some View {
        NavigationStack {
            List(birdList) { bird in
                NavigationLink(destination: BirdDetailView(bird: bird)) {
                    VStack(alignment: .leading) {
                        Text(bird.name)
                            .font(.headline)
                        Text("Age: \(bird.age) years")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Bird List")
        }
    }
}

// MARK: - Bird Detail View
struct BirdDetailView: View {
    var bird: Bird
    
    var body: some View {
        VStack {
            Text(bird.name)
                .font(.largeTitle)
                .padding()
            
            Text("Age: \(bird.age) years")
                .font(.title2)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .navigationTitle("Bird Details")
        .padding()
    }
}

#Preview {
    HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}



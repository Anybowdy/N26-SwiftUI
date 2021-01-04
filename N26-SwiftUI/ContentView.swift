//
//  ContentView.swift
//  N26-SwiftUI
//
//  Created by Joseph Huang on 30/12/2020.
//

import SwiftUI

struct Action: Identifiable {
    var id = UUID()
    let title: String
}

struct Expense: Identifiable {
    var id = UUID()
    let time: String
}

struct ContentView: View {

    let Greenish = Color.init(.sRGB, red: 0, green: 50, blue: 120, opacity: 0.8)
    let Blackish = Color.init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.95)

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear // tableview background
        UITableViewCell.appearance().backgroundColor = .clear // cell background
    }
    
    let actions: [Action] = [
        .init(title: "Recevoir"),
        .init(title: "Envoyer"),
        .init(title: "A venir"),
        .init(title: "Statistiques")
    ]
    
    let expenses: [Expense] = [
        .init(time: "Aujourd'hui"),
        .init(time: "Plus tot cette semaine"),
        .init(time: "Plus tot ce mois-ci"),
        .init(time: "Novembre"),
    ]

    var body: some View {

        NavigationView {
            ZStack {
                Blackish.edgesIgnoringSafeArea(.all)
                
                VStack {
                        
                    HStack {
                        ForEach(actions) { action in
                            VStack {
                                Circle()
                                    .fill(Greenish)
                                    .frame(width: 60, height: 60)
                                    
                                Text(action.title)
                                    .frame(maxWidth: .infinity)
                                    .font(.system(size: 13))
                                    .foregroundColor(.white)
                            }
                        }
                    }.padding(30)
                    
                   // List {
//                        ForEach(expenses) { expense in
//                        VStack {
//                            Blackish.edgesIgnoringSafeArea(.all)
//                            Text(expense.time)
//                                //.listRowBackground(Color.green)
//                        }
                    
                            
                                
                                //.frame(maxWidth: .infinity)
                                //.padding(10)
                                //.alignmentGuide(.trailing) { _ in return 0 }
                                
                      //  }
                   // }
                    
                    Spacer()
                
                }.navigationTitle("Accueil")
            }
        
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ContentView()
        }
    }
}

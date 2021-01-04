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

struct ExpenseDetail: Identifiable {
    var id = UUID()
    let title: String
    let price: Float
    let date: String
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
    
    let expensesDetail: [ExpenseDetail] = [
        .init(title: "AliExpress", price: 28.51, date: "28 jan")
    ]
    
    var body: some View {
        
            ZStack {
                Blackish.edgesIgnoringSafeArea(.all)
                
                
                
                VStack {
                    VStack {
                    
                        HStack {
                            Text("Accueil")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                
                            
                            Spacer()
                                
                            Button("Search") {
                                print("tapped")
                            }
                            
                        }.frame(height: 60, alignment: .center)
                        
                        Text("64.55$")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        HStack {
                            Button("Hide") {
                                print("tapped")
                            }
                        
                            Text("Solde actuel")
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                            
                        
                    
                    }
                
                    
                    
                    ScrollView(.vertical, showsIndicators: false) {
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
                    
                    
                        ForEach(expenses) { expense in
                            VStack(alignment: .leading, spacing: nil) {
                                Text(expense.time)
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                                    .padding(.vertical, 2)
                                    
                                VStack {
                                    ForEach(expensesDetail) { detail in
                                        VStack {
                                            HStack {
                                                Text(detail.title)
                                                    .foregroundColor(.white)
                                                    
                                                Spacer()
                                                
                                                Text(String(detail.price))
                                                    .foregroundColor(.white)
                                                    
                                            }
                                        }.frame(height: 80, alignment: .center)
                                    }
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 15)
                                .overlay(RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.white, lineWidth: 1))
                                
                                
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)

                        }
                    }
                                        
                }.padding(.horizontal , 20)
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

//
//  ContentView.swift
//  CShop
//
//  Created by salas on 6/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @State var presented = false
    @State var txt = ""
    
    let icons = [
        "pin.circle",
        "magnifyingglass",
        "camera",
        "message",
        "cart"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Content
            
            //search bar
            HStack(spacing: 15){
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search Shops", text: $txt)
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .background(Color.white)
            .clipShape(Capsule())
            
            HStack{
                
                Text("Businesses")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Spacer(minLength: 0)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("View All")
                }
            }
            .foregroundColor(.black)
            .padding(.top,25)
        
        .padding()
        
            // custom tab bar
            ZStack {
                Spacer().fullScreenCover(isPresented: $presented, content: {
                    Button(action: {
                        presented.toggle()
                    }, label: {
                        Text("Close")
                            .frame(width: 200, height: 50)
                            .background(Color.pink)
                            .cornerRadius(12)
                    })
                })
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Discover")
                    }
                case 1:
                    NavigationView {
                        VStack {
                            Text("Second Screen")
                        }
                        .navigationTitle("Search")
                    }
                case 2:
                    NavigationView {
                        VStack {
                            Text("Third Screen")
                        }
                        .navigationTitle("List")
                    }
                case 3:
                    NavigationView {
                        VStack {
                            Text("Fourth Screen")
                        }
                        .navigationTitle("Chats")
                    }
                default:
                    NavigationView {
                        VStack {
                            Text("Fifth Screen")
                        }
                        .navigationTitle("My Shop")
                    }
                }
            }
            
            Divider()
                .padding(.bottom, 20)
            HStack {
                ForEach(0..<5, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        if number == 2 {
                            presented.toggle()
                        }
                        else {
                            self.selectedIndex = number
                        }
                    }, label: {
                        if number == 2 {
                        Image(systemName: icons[number])
                            .font(.system(size: 25,
                                          weight: .regular,
                                          design: .default))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.blue)
                            .cornerRadius(30)
                        }
                        else {
                            Image(systemName: icons[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex == number ? Color(.label): Color (UIColor.lightGray))
                        }
                    })
                    Spacer()
                }
            }
        }
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

// add a shop

//struct SampleShopView : View {
//
//    var business: Business
//    
//    var body: some View {
//
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    
}
}

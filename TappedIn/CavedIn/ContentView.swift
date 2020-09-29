//
//  ContentView.swift
//  CavedIn
//
//  Created by Charlithia Palmer on 7/13/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Home: View {
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    @State var selected: Artist = data [0]
    @State var show = false
    @Namespace var namespace
    @State var loadView = false
    // Load Hero View After Animation is Done
    var body: some View {
        
        ZStack{
  
            ScrollView(.vertical, showsIndicators: false) {
                
                HStack{
                    Text("Artist")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "text.alignleft")
                            .foregroundColor(.white)
                            .font(.system(size: 35, weight: .bold))
                            //.renderingMode(.original)
                        
                    }
                }
                // Top Area Is Ignored
                
                .padding([.horizontal,.top])
                
                // Grid View
                
                
                
                LazyVGrid(columns: columns, spacing: 25){
                    
                    ForEach(data){artist in
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            Image(artist.image)
                                .resizable()
                                .frame(height: 180)
                                .cornerRadius(15)
                                // Assigning Id
                                
                                
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        
                                        show.toggle()
                                        selected = artist
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                         
                                            loadView.toggle()
                                        }
                                    }
                                }
                                .matchedGeometryEffect(id: artist.id, in: namespace)
                            
                            
                            
                            Text(artist.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // Hero View
            if show{
                
                VStack {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                        Image(selected.image)
                            .resizable()
                            .frame(height: 300)
                            .matchedGeometryEffect(id: selected.image, in: namespace)
                       
                        if loadView{
                            
                            
                            HStack{
                                
                                Button {
                                    
                                    loadView.toggle()
                                    
                                    withAnimation(.spring()) {
                                        
                                        show.toggle()
                                    }
                                    
                                } label: {
                                    
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    
                                }
                                
                                Spacer()
                                
                                Button {
                                
                                } label: {
                                    
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.red)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    
                                }
                                
                                
                            }
                            .padding(.top,35)
                            .padding(.horizontal)
                        }
                    }
                    
                    // Warning Not to worry
                    
                   // DetailView
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        // Loading After Animation Completes
                        if loadView{
                            VStack{
                                
                                HStack{
                                    
                                    Text(selected.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                Text(" is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .padding(.top)
                                    .padding(.horizontal)
                                
                                HStack{
                                    
                                    Text("Reviews")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                HStack(spacing: 0){
                                    
                                    ForEach(1...5,id: \.self){ i in
                                        
                                        Image("r\(i)")
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .frame(width: 50, height: 50)
                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                            .offset(x: -CGFloat(i * 20))
                      
                                    }
                                    
                                    Spacer(minLength: 0)
                                    
                                    Button(action: {}) {
                                        
                                        Text("View All")
                                            .fontWeight(.bold)
                                           
                                    }
                                }
                                // Since First is Moved -20
                             
                                .padding(.leading,20)
                                .padding(.top)
                                .padding(.horizontal)
                                
                                // Carousel
                                
                                HStack{
                                    
                                    Text("Other Artists")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                TabView{
                                    
                                    ForEach(1...6,id: \.self){i in
                                        // Ignoring the Current Hero Image
                                        if "p\(i)" != selected.image {
                                            
                                            Image("p\(i)")
                                                .resizable()
                                                .cornerRadius(15)
                                                .padding(.horizontal)
                                            
                                        }
                                    }
                                }
                                .frame(height: 250)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .padding(.top)
                                
                                // Button
                                
                                Button(action: {}) {
                                    
                                    Text("Top Artist")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width - 150)
                                        .background(Color.blue)
                                        .cornerRadius(15)
                                }
                                .padding(.top,25)
                            }
                        }
                    }
                }
                .background(Color.black)
            }
            
        }
        .background(Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        // Hiding for HeroView
        .statusBar(hidden: show ? true: false)
    }
}

// Sample Data
struct  Artist: Identifiable {
    var id: Int
    var image: String
    var title: String
}

var data = [
    Artist(id: 0, image: "p1", title: "2 Chainz"),
    Artist(id: 1, image: "p2", title: "21 Savage"),
    Artist(id: 2, image: "p3", title: "Ann Marie"),
    Artist(id: 3, image: "p4", title: "Asap Rocky"),
    Artist(id: 4, image: "p5", title: "Big Sean"),
    Artist(id: 5, image: "p6", title: "Cardi B"),
   
]


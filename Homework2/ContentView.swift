//
//  ContentView.swift
//  Homework2
//
//  Created by Anabel on 12/9/21.
//

import SwiftUI

var total = ["🍑", "🍤", "🤠", "🥺", "🚀", "⛄️", "🚓", "🌚","🌝", "🔥"]


struct ContentView: View {
    @State var emojiCount = 10
    @State var themeDecider = -1
    var body: some View {
        
        VStack{
            HStack{
                //Text("Memorize!").font(.title).padding(.all)
                if themeDecider == 0 {
                    Text("Food").font(.title).padding(.all).foregroundColor(.black)
                }
                if themeDecider == 1 {
                    Text("Faces").font(.title).padding(.all).foregroundColor(.black)
                }
                if themeDecider == 2 {
                    Text("Sports").font(.title).padding(.all).foregroundColor(.black)
                }
                if themeDecider == 3 {
                    Text("Nature").font(.title).padding(.all).foregroundColor(.black)
                }
                if themeDecider == 4 {
                    Text("Vehicles").font(.title).padding(.all).foregroundColor(.black)
                }
                if themeDecider == 5 {
                    Text("Animals").font(.title).padding(.all).foregroundColor(.black)
                }
                if themeDecider == 6 {
                    Text("Clothes").font(.title).padding(.all).foregroundColor(.black)
                }
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){ //has to be specific with lazygrids or it'll be confused
                    ForEach(total[0..<emojiCount], id:\.self, content: {emoji in CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                    })
                    
                    .foregroundColor(.purple)
                    
                }
            }
            Spacer()
            HStack {
                Spacer()
                new_game.font(.title)
                Spacer()
            }
            
        }
        
        .padding(.all)
        
    }
    
    var new_game: some View {
        Button {
            let total_themes = 6
            themeDecider = Int.random(in: 0..<total_themes)
            if themeDecider == 0 {
                total = ["🍑", "🍗", "🍕", "🍊", "🍉", "🍔", "🌭", "🌮", "🍎", "🍌"]
                emojiCount = Int.random(in: 4..<total.count)
            }
            if themeDecider == 1 {
                total = ["😡", "😂", "🤪", "🤓", "😤", "😔", "🤭", "😉"]
                emojiCount = Int.random(in: 4..<total.count)
            }
            if themeDecider == 2 {
                total = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🏓"]
                emojiCount = Int.random(in: 4..<total.count)
            }
            if themeDecider == 3 {
                total = ["☀️", "❄️", "🌹", "🌲", "☘️", "🌚", "🌝", "🌻"]
                emojiCount = Int.random(in: 4..<total.count)
            }
            if themeDecider == 4 {
                total = ["🚗", "🚕", "🏎", "🚔", "✈️", "🚀", "🚤", "🚁", "🚑", "🚝"]
                emojiCount = Int.random(in: 4..<total.count)
            }
            if themeDecider == 5 {
                total = ["🐶", "🐻", "🦁", "🙉", "🐷", "🐸", "🐤", "🦅", "🐺"]
                emojiCount = Int.random(in: 4..<total.count)
            }
            if themeDecider == 6 {
                total = ["👕", "🧢", "👕", "🥻", "👖", "🦺", "🩳", "🥼"]
                emojiCount = Int.random(in: 4..<total.count)
            }
        } label: {
            VStack {
                Image(systemName:"plus.circle.fill").font(.title)
                    .foregroundColor(.purple)
                Text("New Game").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            .font(.caption).padding()
        }
    }
    
    
    struct CardView: View {
        // @State means it is something that can be changed, will not always be true or false indefinetly
        @State var isFaceUp = false
        
        var content: String
        
        var body: some View {
            
            let shape = RoundedRectangle(cornerRadius: 20.0) //using let means its a constant
            ZStack{
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3.0)
                    
                    Text(content)
                        .font(.largeTitle)
                    
                } else {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill()
                }
                
            }
            .onTapGesture (perform: {
                isFaceUp = !isFaceUp
            })
        }
    }
    

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .padding(.all)
            
        }
    }
}



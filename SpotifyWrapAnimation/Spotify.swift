//
//  Spotify.swift
//  testapp
//
//  Created by Pixel on 09/12/24.
//

import SwiftUI


struct SpotifyWrappedView: View {
    @State private var showText = false
    @State private var showList = false
    @State private var animatedBackground = false
    @State private var navigateToNextPage = false
    var body: some View {
        
        ScrollView{
            ZStack {
                // Background Animation
                AnimatedBackground()
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    // Main Text with Animation
                    if showText {
                        Text("Your Top Songs 2024")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.top,25)
    //                        .background(Color.yellow.opacity(0.7))
                            .cornerRadius(10)
                            .transition(.scale)
                            .animation(.easeIn(duration: 1), value: showText)
                    }

                    

                    // Top Songs List
                    if showList {
                        VStack(alignment: .leading, spacing: 10) {
    //                        Text("Your Top Songs 2024")
    //                            .font(.title)
    //                            .fontWeight(.bold)
    //                            .foregroundColor(.black)
                            
                            ForEach(topSongs.indices, id: \.self) { index in
                                HStack {
                                    Text("\(index + 1)")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)

                                    VStack(alignment: .leading) {
                                        Text(topSongs[index].title)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        Text(topSongs[index].artist)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Image(topSongs[index].imgess) // Replace with your image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(8)
                                        .shadow(radius: 10)
                                }
                             
                                .padding()
                                .background(Color.yellow.opacity(1.5))
                                .cornerRadius(20)
                                .transition(.slide)
                                .animation(.easeInOut(duration: 1.2), value: showList)
                            }
                        }  .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                        
                    }

                    Spacer()

                    // Share Button
                    Button(action: {
                        print("Share your Wrapped story")
                    }) {
                        Text("Share Your Story")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    NavigationLink(destination: StarburstView(), isActive: $navigateToNextPage) {
                                      EmptyView()
                                  }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                              navigateToNextPage = true
                          }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showText = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.25) {
                    withAnimation {
                        showList = true
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
       
    }
}

struct AnimatedBackground: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            ForEach(0..<5) { i in
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .yellow, .blue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: CGFloat(100 + (i * 50)), height: CGFloat(100 + (i * 50)))
                    .offset(x: animate ? 150 : -150, y: animate ? -150 : 150)
                    .opacity(0.3)
                    .blur(radius: 20)
                    .animation(
                        Animation.easeInOut(duration: 4)
                            .repeatForever(autoreverses: true),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}

struct SpotifyWrappedView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyWrappedView()
    }
}

// Sample Data
struct Song {
    let title: String
    let artist: String
    let imgess: String
}

let topSongs: [Song] = [
    Song(title: "Dheema (LIK)", artist: "Anirudh Ravichander", imgess: "dheema"),
    Song(title: "Ordinary person (Leo)", artist: " Anirudh Ravichander & Nikhita Gandhi", imgess: "leo"),
    Song(title: "Arabic Kuthu (Beast)", artist: "Anirudh Ravichander, Jonita Gandhi", imgess: "beast"),
    Song(title: "Neethane", artist: "Shreya Ghoshal, A.R.Rahman", imgess: "mersal"),
    Song(title: "Aathi (Kaththi)", artist: "Anirudh Ravichander, Vishal Dadlani", imgess: "kaththi"),
    Song(title: "Manasilaayo", artist: "Anirudh Ravichander", imgess: "vettaiyan")
   
]


//--------------------------------------------

//
//struct SpotifyWrapAnimationView: View {
//    @State private var progress: CGFloat = 0.0
//    @State private var showText: Bool = false
//    @State private var animateColors: Bool = false
//
//    let colors = [Color.purple, Color.blue, Color.green, Color.orange, Color.red]
//
//    var body: some View {
//        ZStack {
//            // Background Gradient
//            RadialGradient(gradient: Gradient(colors: animateColors ? colors.shuffled() : colors),
//                           center: .center,
//                           startRadius: 50,
//                           endRadius: 400)
//                .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true), value: animateColors)
//                .onAppear {
//                    animateColors.toggle()
//                }
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                Spacer()
//
//                // Circular Progress
//                Circle()
//                    .trim(from: 0.0, to: progress)
//                    .stroke(
//                        LinearGradient(gradient: Gradient(colors: [Color.pink, Color.yellow]),
//                                       startPoint: .topLeading,
//                                       endPoint: .bottomTrailing),
//                        style: StrokeStyle(lineWidth: 15, lineCap: .round)
//                    )
//                    .rotationEffect(.degrees(-90))
//                    .frame(width: 200, height: 200)
//                    .animation(Animation.easeOut(duration: 2), value: progress)
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                            progress = 1.0
//                        }
//                    }
//
//                Spacer()
//
//                // Animated Text
//                if showText {
//                    Text("Your 2024 Wrapped")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .transition(.opacity)
//                        .animation(Animation.easeIn(duration: 1.5), value: showText)
//                        .onAppear {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                                withAnimation {
//                                    showText = true
//                                }
//                            }
//                        }
//                }
//
//                Spacer()
//
//                // Scaling Effect
//                Text("Thank you for listening!")
//                    .font(.title2)
//                    .fontWeight(.medium)
//                    .foregroundColor(.white)
//                    .opacity(showText ? 1 : 0)
//                    .scaleEffect(showText ? 1 : 0.8)
//                    .animation(Animation.easeInOut(duration: 1).delay(3), value: showText)
//            }
//        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                withAnimation {
//                    //showText = true
//                }
//            }
//        }
//    }
//}
//
//struct SpotifyWrapAnimationView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpotifyWrapAnimationView()
//    }
//}

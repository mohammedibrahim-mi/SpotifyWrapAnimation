import SwiftUI

struct SpotifyWrappedVieww: View {
    
    @State private var animateShapes = false
    @State private var navigateToNextPage = false
    var body: some View {
        ZStack {
            // Background
            GeometryReader { geometry in
                ZStack {
                         // Background: Purple gradient with circular layers
                         AngularGradient(gradient: Gradient(colors: [.yellow, .yellow.opacity(0.6), .yellow.opacity(0.3)]),
                                         center: .center)
                             .ignoresSafeArea()
                             .overlay(
                                 // Circular Layers
                                 ForEach(0..<12) { index in
                                     Circle()
                                         .strokeBorder(Color.yellow.opacity(Double(index + 1) * 0.2), lineWidth: 18)
                                         .frame(width: CGFloat(200 + index * 40), height: CGFloat(200 + index * 40))
                                         .offset(x: -50, y: 100)
                                 }
                             )

                         // Neon Green Zigzag Shape
                         Path { path in
                             // Start point
                             path.move(to: CGPoint(x: 10, y: 50))
                             // Zigzag points
                             path.addLine(to: CGPoint(x: 40, y: 100))
                             path.addLine(to: CGPoint(x: 60, y: 250))
                             path.addLine(to: CGPoint(x: 80, y: -60))
                             path.addLine(to: CGPoint(x: 100, y: 300))
                             path.addLine(to: CGPoint(x: 120, y: 100))
                             path.addLine(to: CGPoint(x: 140, y: -100))
                             path.addLine(to: CGPoint(x: 160, y: 100))
                             path.addLine(to: CGPoint(x: 180, y: 350))
                             path.addLine(to: CGPoint(x: 200, y: -40))
                             path.addLine(to: CGPoint(x: 220, y: 450))
                             path.addLine(to: CGPoint(x: 240, y: 100))
                             path.addLine(to: CGPoint(x: 260, y: 250))
                             path.addLine(to: CGPoint(x: 280, y: -40))
                             path.addLine(to: CGPoint(x: 300, y: 450))
                             path.addLine(to: CGPoint(x: 320, y: 100))
                           
                    
                         }
                         .stroke(LinearGradient(gradient: Gradient(colors: [.green, .green.opacity(0.8)]),
                                                startPoint: .leading,
                                                endPoint: .trailing),
                                 style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                         .offset(x: 80, y: 0)
                     
                     }
                .navigationBarBackButtonHidden(true)
           
//                ZStack {
//                    RoundedRectangle(cornerRadius: 0)
//                        .fill(
//                            LinearGradient(
//                                gradient: Gradient(colors: [Color.yellow, Color.red]),
//                                startPoint: .top,
//                                endPoint: .bottom
//                            )
//                        )
//                        .frame(maxWidth: .infinity,maxHeight: .infinity)
//                        .ignoresSafeArea()
//
//                    // Gradient background layers
//                    VStack {
//                        Spacer()
//
//                        ForEach(0..<15) { index in
//                            AngularGradient(
//                                gradient: Gradient(colors: [ Color.purple, Color.yellow]),
//                                center: .center
//                            )
////                            .frame(width: geometry.size.width * 1.2, height: geometry.size.height / 2)
//                            .clipShape(CustomWaveShape())
//                            .rotationEffect(.degrees(50))
////                            .padding(.bottom,50)
//                                .frame(width: CGFloat(200 + index * 40), height: CGFloat(300 + index * 60))
//                                .offset(y: animateShapes ? -350 : 50)
//                                .rotationEffect(.degrees(Double(index) * 15))
//                               // .opacity(0.3 + (0.15 * Double(5 - index)))
//                                .animation(
//                                    Animation.easeInOut(duration: 5)
//                                        .repeatForever(autoreverses: true),
//                                    value: animateShapes
//                                )
//                        }
//
//
//
////                        ZStack {
////                            AngularGradient(
////                                gradient: Gradient(colors: [Color.blue, Color.purple, Color.yellow]),
////                                center: .center
////                            )
////                            .frame(width: geometry.size.width * 1.2, height: geometry.size.height / 2)
////                            .clipShape(CustomWaveShape())
////                            .rotationEffect(.degrees(135))
////                            .padding(.bottom,50)
////                        }
////                        Spacer()
////                        Spacer()
////                        ZStack {
////                            AngularGradient(
////                                gradient: Gradient(colors: [Color.blue, Color.purple, Color.yellow]),
////                                center: .center
////                            )
////                            .frame(width: geometry.size.width * 1.2, height: geometry.size.height / 2)
////                            .clipShape(CustomWaveShape())
////                            .rotationEffect(.degrees(-10))
////                            .padding(.bottom,50)
////                        }
//                    }
//                    .onAppear {
//                        animateShapes.toggle()
//                    }
//                }
            }
            
            // Foreground
            VStack {
                Spacer()
                
                // Album Artwork
                Image("dheema") // Replace with your image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .cornerRadius(8)
                    .shadow(radius: 10)
                
                Spacer()
                
                // Text Overlay
                VStack(spacing: 10) {
                    Text("My Top Song")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Dheema (From \"Love Insurance Kompany (LIK)\")")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                    
                    Text("Anirudh Ravichander")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.7))
                    
                    Text("Total Streams")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("62")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Top 3% of listeners worldwide")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.6))
                }
                .padding()
                
                Spacer()
                
                // Spotify Branding
                Text("SPOTIFY.COM/WRAPPED")
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.6))
                
                NavigationLink(destination: SpotifyFavieww(), isActive: $navigateToNextPage) {
                                  EmptyView()
                              }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                              navigateToNextPage = true
                          }
    
                }
            }
        }
    }


// Custom Background Shape
struct CustomWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.midY),
                          control: CGPoint(x: rect.midX, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}

// Preview
struct SpotifyWrappedVieww_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyWrappedView()
    }
}










//import SwiftUI
//
//
//struct TopSongsViewWithExactBackground: View {
//    @State private var animateShapes = false
//
//    let topSongs = [
//        ("Seven (feat. Latto)", "Jung Kook", "song1"),
//        ("Boy's a liar Pt. 2", "PinkPantheress, Ice Spice", "song2"),
//        ("Lonely At The Top", "Asake", "song3"),
//        ("Last Night", "Morgan Wallen", "song4"),
//        ("MY EYES", "Travis Scott", "song5")
//    ]
//
//    var body: some View {
//        ZStack {
//            // Background with Abstract Design
//            AbstractBackground()
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                // Header
//                HStack {
//                    Text("My Top Songs")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                        .padding(.leading, 20)
//                    Spacer()
//                }
//                .padding(.top, 40)
//
//                // Song List
//                VStack(spacing: 15) {
//                    ForEach(topSongs.indices, id: \.self) { index in
//                        HStack(spacing: 10) {
//                            // Rank Number
//                            Text("\(index + 1)")
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .foregroundColor(.black)
//
//                            // Song Image
//                            Image(topSongs[index].2)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 50, height: 50)
//                                .clipShape(Rectangle())
//                                .cornerRadius(8)
//
//                            // Song Details
//                            VStack(alignment: .leading) {
//                                Text(topSongs[index].0)
//                                    .font(.headline)
//                                    .foregroundColor(.black)
//                                Text(topSongs[index].1)
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                            Spacer()
//                        }
//                        .padding(.horizontal, 20)
//                    }
//                }
//                .padding(.vertical, 20)
//              //  .background(Color.yellow)
//                .cornerRadius(20)
//                .padding(.horizontal, 10)
//
//                Spacer()
//
//                // Footer
//                Text("SPOTIFY.COM/WRAPPED")
//                    .font(.footnote)
//                    .foregroundColor(.black)
//                    .padding(.bottom, 20)
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//struct AbstractBackground: View {
//    @State private var animate = false
//
//    var body: some View {
//        ZStack {
//            // Main background color
//            Color.yellow.opacity(0.94)
//
//
//            .onAppear {
//                animate.toggle()
//            }
//        }
//    }
//}
//
//struct WaveShape: Shape {
//    var offset: CGFloat
//
//    var animatableData: CGFloat {
//        get { offset }
//        set { offset = newValue }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let width = rect.width
//        let height = rect.height
//
//        path.move(to: CGPoint(x: 0, y: height / 2 + offset))
//        path.addCurve(
//            to: CGPoint(x: width, y: height / 2 - offset),
//            control1: CGPoint(x: width * 0.3, y: height + offset),
//            control2: CGPoint(x: width * 0.7, y: -offset)
//        )
//        path.addLine(to: CGPoint(x: width, y: height))
//        path.addLine(to: CGPoint(x: 0, y: height))
//        path.closeSubpath()
//
//        return path
//    }
//}
//
//struct TopSongsViewWithExactBackground_Previews: PreviewProvider {
//    static var previews: some View {
//        TopSongsViewWithExactBackground()
//    }
//}
//
//
//
////struct SpotifyWrappedCardView: View {
////    @State private var animateShapes = false
////
////    var body: some View {
////        ZStack {
////            // Background Color
////            Color.black
////                .edgesIgnoringSafeArea(.all)
////
////            // Animated Starburst Shape
////            ZStack {
////                ForEach(0..<12) { index in
////                    Rectangle()
////                        .fill(Color.orange)
////                        .frame(width: 30, height: 120)
////                        .offset(y: -100)
////                        .rotationEffect(.degrees(Double(index) * 30))
////                        .opacity(animateShapes ? 0.8 : 0.4)
////                        .animation(
////                            Animation.easeInOut(duration: 2)
////                                .repeatForever(autoreverses: true),
////                            value: animateShapes
////                        )
////                }
////            }
////            .frame(width: 300, height: 300)
////            .background(
////                Circle()
////                    .fill(LinearGradient(
////                        gradient: Gradient(colors: [Color.purple, Color.blue]),
////                        startPoint: .top,
////                        endPoint: .bottom
////                    ))
////                    .frame(width: 250, height: 250)
////            )
////            .onAppear {
////                animateShapes.toggle()
////            }
////
////            // Profile Image in the Center
////            VStack {
////                Image("profile_image_placeholder") // Replace with your image
////                    .resizable()
////                    .scaledToFit()
////                    .clipShape(Circle())
////                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
////                    .frame(width: 120, height: 120)
////
////                // Top Artists and Songs
////                HStack(alignment: .top, spacing: 20) {
////                    VStack(alignment: .leading, spacing: 5) {
////                        Text("Top Artists")
////                            .font(.headline)
////                            .foregroundColor(.white)
////                        ForEach(0..<5) { index in
////                            Text("\(index + 1). Artist Name")
////                                .font(.subheadline)
////                                .foregroundColor(.white)
////                        }
////                    }
////
////                    VStack(alignment: .leading, spacing: 5) {
////                        Text("Top Songs")
////                            .font(.headline)
////                            .foregroundColor(.white)
////                        ForEach(0..<5) { index in
////                            Text("\(index + 1). Song Name")
////                                .font(.subheadline)
////                                .foregroundColor(.white)
////                        }
////                    }
////                }
////                .padding(.top, 20)
////
////                // Listening Stats
////                VStack(spacing: 5) {
////                    Text("Minutes Listened")
////                        .font(.subheadline)
////                        .foregroundColor(.white)
////                    Text("800,116")
////                        .font(.title)
////                        .fontWeight(.bold)
////                        .foregroundColor(.yellow)
////
////                    Text("Top Genre")
////                        .font(.subheadline)
////                        .foregroundColor(.white)
////                    Text("Hip Hop")
////                        .font(.title2)
////                        .fontWeight(.semibold)
////                        .foregroundColor(.green)
////                }
////                .padding(.top, 20)
////
////                Spacer()
////
////                // Spotify Link
////                Text("SPOTIFY.COM/WRAPPED")
////                    .font(.footnote)
////                    .foregroundColor(.white.opacity(0.7))
////                    .padding(.top, 20)
////            }
////        }
////    }
////}
////
////struct SpotifyWrappedCardView_Previews: PreviewProvider {
////    static var previews: some View {
////        SpotifyWrappedCardView()
////    }
////}

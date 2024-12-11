//
//  SpotifyTwo.swift
//  testapp
//
//  Created by Pixel on 09/12/24.
//

import SwiftUI

struct SpotifyWrappedShapeAnimationView: View {
    
    @State private var animateShapes = false
    @State private var navigateToNextPage = false

    var body: some View {
        
        NavigationView{
            ZStack {
                // Background Color
                LinearGradient(gradient: Gradient(colors: [.yellow,.purple, .orange.opacity(0.8)]),
                                       startPoint: .top,
                               endPoint: .trailing).ignoresSafeArea()
                       


                // Animated Shapes
                ZStack {
                    ForEach(0..<5) { index in
                        RoundedRectangle(cornerRadius: 30)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.pink, Color.red]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: CGFloat(200 + index * 40), height: CGFloat(300 + index * 60))
                            .offset(y: animateShapes ? -150 : 150)
                            .rotationEffect(.degrees(Double(index) * 15))
                            .opacity(0.3 + (0.15 * Double(5 - index)))
                            .animation(
                                Animation.easeInOut(duration: 3)
                                    .repeatForever(autoreverses: true),
                                value: animateShapes
                            )
                    }
                }
                .onAppear {
                    animateShapes.toggle()
                }

                // Center Text
                VStack(spacing: 10) {
                    
                    VStack{
                        Text("Hi Miv")
                            .font(.system(size: 30, weight: .bold))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("iOS Developer")
                            .font(.system(size: 12, weight: .medium))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    
                 
                    
                    Text("You listened for")
                        .font(.system(size: 20, weight: .medium))
                        .fontWeight(.medium)
                        .foregroundColor(.white)

                    Text("55,139 minutes this year")
                        .font(.system(size: 30, weight: .bold))
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("It's that time of the year again. Wrapped's ready. \n Are you?")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                    NavigationLink(destination: RollingTextView(), isActive: $navigateToNextPage) {
                                      EmptyView()
                                  }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black.opacity(0.7))
                )
                .padding(.horizontal, 20)

                // Share Button
                VStack {
                    Spacer()
                    Button(action: {
                        print("Share Story Button Tapped")
                    }) {
                        Text("Share this story")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
           
        }
        .onAppear{
            print("hi")
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                          navigateToNextPage = true
                      }
        }
        
      
    }
}








struct SpotifyWrappedShapeAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyWrappedShapeAnimationView()
    }
}

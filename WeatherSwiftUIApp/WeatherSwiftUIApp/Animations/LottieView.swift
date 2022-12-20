//
//  LottieView.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 20/12/2022.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    var name: String
    var loopMode = LottieLoopMode.loop
    
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let uiView = UIView()
        
        return uiView
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        uiView.subviews.forEach({ $0.removeFromSuperview() })
        
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)
        ])
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        
        animationView.play()                
    }
}

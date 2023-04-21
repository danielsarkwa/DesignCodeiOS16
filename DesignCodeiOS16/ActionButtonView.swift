//
//  ActionButtonView.swift
//  DesignCodeiOS16
//
//  Created by Daniel Yeboah on 15.4.2023.
//

import SwiftUI

struct ActionButtonView: View {
    @State var show = false
    @State var translation: CGSize = .zero
    @ObservedObject var manager = MotionManager()
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation
            }
            .onEnded { value in
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    translation = .zero
                }
            }
    }
    
    var body: some View {
        ZStack {
            Image("UI 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(50)
                .overlay(motion)
                .scaleEffect(show ? 0.95 : 1)
            Rectangle()
                .fill(.ultraThickMaterial)
                .overlay(Rectangle().fill(.black.opacity(0.5)).blendMode(.softLight))
                .mask(canvas)
                .shadow(color: .white.opacity(0.2), radius: 0, x: -1, y: -1)
                .shadow(color: .black.opacity(0.2), radius: 0, x: 1, y: 1)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 10, y: 10)
                .overlay(icons)
                .background(
                    circle.frame(width: 208)
                        .overlay(circle.frame(width: 60))
                        .overlay(circle.frame(width: 80))
                        .offset(x: 60, y: 60)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .scaleEffect(show ? 1 : 0.8, anchor: .bottomTrailing)
                        .opacity(show ? 1 : 0)
                        .animation(.easeOut(duration: 0.3), value: show)
                )
                .offset(y: -29)
                .onTapGesture {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                        show.toggle()
                    }
                }
                .gesture(drag)
        }
        .background(.black)
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
    
    var canvas: some View {
        Canvas { context, size in
//            Path(
//                ellipseIn: CGRect(x: size.width - 72, y: size.height - 70, width: 56, height: 56)
//            ),
//            with: .color(.white)
            context.addFilter(.alphaThreshold(min: 0.8))
            context.addFilter(.blur(radius: 10))
            context.drawLayer { ctx in
                for index in 1...5 {
                    if let symbol = context.resolveSymbol(id: index) { // optional binding, so you don't have to use !
                        ctx.draw(symbol, at: CGPoint(x: size.width - 44, y: size.height - 44))
                    }
                }
            }
        } symbols: {
            Circle()
                .frame(width: 76)
                .tag(1)
            Circle()
                .frame(width: 76)
                .tag(2)
                .offset(y: show ? -100 : 0)
            Circle()
                .frame(width: 76)
                .tag(3)
                .offset(x: show ? -100 : 0)
            Circle()
                .frame(width: 76)
                .tag(4)
                .offset(x: show ? -84 : 0, y: show ? -84 : 0)
            Circle()
                .frame(width: 76, height: 76)
                .tag(5)
                .offset(translation)
        }
    }
    
    var motion: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .stroke(.linearGradient(colors: [.white.opacity(0.2), .white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(manager.roll) * 5 + 1, y: abs(manager.roll) * 5 + 1)))
                .opacity(show ? 1 : 0)
            LinearGradient(colors: [.clear, .white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: UnitPoint(x: manager.roll * 10 + 1, y: manager.roll * 10 + 1))
                .cornerRadius(50)
                .opacity(show ? 1 : 0)
            
            LinearGradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(show ? 1 : 0)
                .blendMode(.softLight)
        }
    }
    
    var circle: some View {
        Circle().stroke(lineWidth: 1).fill(.linearGradient(colors: [.white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    var icons: some View {
        ZStack {
            Image(systemName: "plus")
                .font(.system(size: 30))
                .rotationEffect(.degrees(show ? 45 : 0))
                .offset(x: -28, y: -28)
            
            Group {
                Image(systemName: "bubble.left.fill")
                    .foregroundColor(.white)
                    .offset(x: -28, y: -129)

                Image(systemName: "moon.fill")
                    .foregroundColor(.white)
                    .offset(x: -128, y: -29)

                Image(systemName: "quote.opening")
                    .foregroundColor(.white)
                    .offset(x: -113, y: -114)
            }
            .blur(radius: show ? 0 : 10)
            .opacity(show ? 1 : 0)
            .scaleEffect(show ? 1 : 0.5)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView()
    }
}

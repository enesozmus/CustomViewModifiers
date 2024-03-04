//
//  ContentView.swift
//  CustomViewModifiers
//
//  Created by enesozmus on 4.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            
            
            VStack(spacing: 20) {
                
                // ✅ İlgili (struct ProminentTitle: ViewModifier) custom modifier'in doğrudan .modifier() modifier'i ile çağrilip kullanilabilir hale getirilmesi
                Text("2024 Election: News, polls and results")
                    .multilineTextAlignment(.center)
                    .modifier(ProminentTitle())
                
                // ✅ İlgili (struct ProminentTitle: ViewModifier) custom modifier'in doğrudan değil, ilgili extension üzerinden çağrilmasi
                Text("2024 Election: News, polls and results")
                    .prominentTitle()
                    .multilineTextAlignment(.center)
                    .padding()
                
                // ✅ İlgili custom modifier'in doğrudan .modifier() modifier'i ile çağrilip kullanilabilir hale getirilmesi
                Text("Some Text")
                    .modifier(CustomCapsule(color: .blue))
                
                // ✅ İlgili custom modifier'in doğrudan değil, ilgili extension üzerinden çağrilmasi
                Text("Some Other Text")
                    .customCapsule(color: .green)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 80)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
        }
    }
}


// ✅ a custom ViewModifier that makes a view have a large, blue font suitable for prominent titles
struct ProminentTitle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.purple)
    }
}


// ✅ a custom ViewModifier that makes a view have a white font suitable some button text
struct CustomCapsule: ViewModifier{
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .clipShape(Capsule())
    }
}


// ✅ The extension accompanying Custom Modifiers
extension View{
    func customCapsule(color: Color) -> some View{
        modifier(CustomCapsule(color: color))
    }
    func prominentTitle() -> some View{
        modifier(ProminentTitle())
    }
}

#Preview {
    ContentView()
}

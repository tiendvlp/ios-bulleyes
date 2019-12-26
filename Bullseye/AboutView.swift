import SwiftUI

struct AboutView: View {
    
    var beigeColor = Color(red: 255.0/255.0, green: 214.0/255, blue: 179.0/255.0)
    
    struct HeadingStyle : ViewModifier {
        func body(content : Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(.black)
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    struct ContentStyle : ViewModifier {
        func body (content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(.black)
                .padding(.trailing, 60)
                .padding(.leading, 60)
                .padding(.bottom, 20)
        }
    }
    
    
    var body: some View {
        Group {
        VStack {
            HStack {
                Text("☄️").modifier(HeadingStyle())
                Text("Bullseye").modifier(HeadingStyle())
                Text("☄️").modifier(HeadingStyle())
            }
            
            Text("This is Bullseyes the game you can win points and earn fame by dragging a slider.").modifier(ContentStyle())
            Text("Your goal is to place the slider as close as you can to the given value. The closer you are, the more points you score")
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .modifier(ContentStyle())
            Text("Enjoy!!!").modifier(ContentStyle())
        }
        .navigationBarTitle(Text("About Bullseye"))
        .background(self.beigeColor)
    }
        .background(Image("Background"))
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var ipXRSized : PreviewLayout = .fixed(width: 896, height: 414)
    static var previews: some View {
        AboutView().previewLayout( ipXRSized)
    }
}

import SwiftUI

struct ContentView: View {
    
    @State var isAlertVisible : Bool = false

    @State var sliderValue : Float = 1
    
    var aboutView = AboutView()
    
    var midnightBlue = Color (red: 0.0/255.0, green: 51.0 / 255.0, blue: 102.0/255.0)
    
    struct LabelStyle : ViewModifier {
        func body (content : Content) -> some View {
            return content
            .foregroundColor(Color.white)
            .modifier(ShadowStyle())
                .font(Font.custom("Arial Rounded MT Bold", size: 16).weight(.medium))
        }
    }
    
    struct ShadowStyle : ViewModifier {
        func body (content : Content) -> some View {
            return content.shadow(color: .black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ValueStyle : ViewModifier {
        func body (content : Content) -> some View {
            return content
                .modifier(ShadowStyle())
                .foregroundColor(.yellow)
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
            
        }
    }
    
    struct ButtonWithLargeTextStyle : ViewModifier {
        func body (content : Content) -> some View {
                 return content
                       
                       .foregroundColor(.black)
                       .font(Font.custom("Arial Rounded MT Bold", size: 21))
            .modifier(ShadowStyle())
            
        }
    }
    
    struct ButtonWithSmallTextStyle : ViewModifier {
        func body (content : Content) -> some View {
                 return content
                      
                       .foregroundColor(.black)
                       .font(Font.custom("Arial Rounded MT Bold", size: 14))
             .modifier(ShadowStyle())
            
        }
    }
    
    var body: some View {
        VStack {
            
            HStack {
                
            Text("Pull the bullseyes as close as you can to: ")
                .modifier(ContentView.LabelStyle())
            Text("80").modifier(ValueStyle())
            
        }
            .padding(.top, 20)
            Spacer()
            HStack {
                Text("1") .modifier(ValueStyle())
                Slider(value: self.$sliderValue, in: 1...100).accentColor(Color.green)
                Text("100") .modifier(ValueStyle())
            }
            .padding(.bottom, 20)
            .padding(.top, 20)
          
            Button(action: {
                self.isAlertVisible = true
                
            }) {
                Text("Hit me!") .modifier(ButtonWithLargeTextStyle())
            }
            .background(Image("Button"))
            
            .alert(isPresented: $isAlertVisible) {() -> Alert in
                let roundedValue : Int = Int (self.sliderValue.rounded())
                return Alert(title: Text("Your value is"), message: Text("\(roundedValue)"), dismissButton: .default(Text("Dismiss")))
            }
            Spacer()
            HStack {
               
                    Button(action: {}) {
                        HStack {
                        
                        Image("StartOverIcon").accentColor(midnightBlue)
                        Text("Start over") .modifier(ButtonWithSmallTextStyle())
                            
                        }
                    }
                    .background(Image("Button"))
                    Spacer()
                
                    Text ("score") .modifier(ContentView.LabelStyle())
                    Text("999999") .modifier(ValueStyle())
                
                    Spacer()
                    Text("Round") .modifier(ContentView.LabelStyle())
                    Text ("999") .modifier(ValueStyle())
                
                    Spacer()
                NavigationLink(destination: self.aboutView) {
                        HStack {
                        Image("InfoIcon").accentColor(midnightBlue)
                        Text("Info") .modifier(ButtonWithSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
            
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
    .navigationBarTitle(Text("Bulleyes"))
    }


}

struct ContentView_Previews: PreviewProvider {
    static var ipXRSized : PreviewLayout = .fixed(width: 896, height: 414)
    static var previews: some View {
        ContentView().previewLayout(ipXRSized)
    }
}

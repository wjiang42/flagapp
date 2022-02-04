import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            
    }
}

struct FlagImage: View {
    var parentImage: Image
    
    var body: some View {
        parentImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 42, height: 21)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(parentImage: Image("Image"))
    }

}

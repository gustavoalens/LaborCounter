import SwiftUI

public struct ThreeColumnCardView<Content: View>: View {
  let content: () -> Content
  
  init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
  public var body: some View {
    let col1 = GridItem(alignment: .top)
    BaseCardView {
      LazyVGrid(columns: [col1, col1, col1]) {
        content()
      }
    }
  }
}

#Preview {
  ZStack {
    DSColors.background
    LazyVGrid(columns: [.init()]) {
      ThreeColumnCardView {
        VStack {
          Color.red
          Text("T112222122231222")
          Text("T12")
        }
        VStack {
          Color.blue
          Text("T2221")
          Text("T22")
        }
        VStack {
          Text("T31")
          Text("T32")
        }
        
        VStack {
          Color.green
          Text("T31")
          Text("T32")
        }
        
        Spacer()
        
        VStack {
          Color.blue
          Text("T241")
          Text("T255")
        }
        
      }
      
      ThreeColumnCardView {
        VStack {
          Color.red
          Text("T112222122231222")
          Text("T12")
        }
        VStack {
          Color.blue
          Text("T2221")
          Text("T22")
        }
        VStack {
          Text("T31")
          Text("T32")
        }
      }
    }
  }
}

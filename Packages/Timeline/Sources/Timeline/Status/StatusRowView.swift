//
//  SwiftUIView.swift
//  
//
//  Created by Thomas on 12/12/2023.
//

import SwiftUI
import Network

struct StatusRowView: View {
  let status: Status

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        AsyncImage(
          url: status.account.avatar,
          content: { image in
            image.resizable()
              .aspectRatio(contentMode: .fit)
              .cornerRadius(13)
              .frame(maxWidth: 26, maxHeight: 26)
          },
          placeholder: {
            ProgressView()
          }
        )
        Text(status.account.username)
      }
      Text(status.content)
    }
  }
}


#Preview {
    StatusRowView(
        status: Status(
            id: "1",
            content: "Tom",
            account: Account(
                id: "1",
                username: "tom-the-sheep",
                displayName: "Tom",
                avatar: URL.init(string: "https://www.apple.com/v/iphone/home/br/images/overview/hero/hero_iphone_15_pro__eqwrvy72748y_medium_2x.jpg")!
            )
        )
    )
}

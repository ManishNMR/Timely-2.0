//
//  UpcomingEventCard.swift
//  Timely
//
//  Created by user2 on 27/02/24.
//

import SwiftUI

struct UpcomingEventCard: View {
    var body: some View {
        VStack(spacing: 0){
            Text("10 minutes to")
                .font(.caption)
            HStack(alignment: .lastTextBaseline){
                Text("08:00")
                    .font(.system(size: 64))
                    .bold()
                Text("AM")
                    .font(.system(size: 12).weight(.semibold))
            }
            .offset(x: 10)
            HStack{
                Image("location")
                VStack{
                    Text("iOS Bootcamp")
                        .font(.title2)
                        .bold()
                    Text("Tech Park, SRM University")
                        .font(.caption)
                        .italic()
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    UpcomingEventCard()
        .background(.black)
}

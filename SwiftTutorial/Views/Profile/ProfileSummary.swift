//
//  ProfileSummary.swift
//  SwiftTutorial
//
//  Created by yusufyakuf on 2023-08-08.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelDada: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment:  .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On":"Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal){
                        HStack{
                            
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        
                    }
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Recent Hikes")
                            .font(.headline)
                        
                        HikeView(hike: modelDada.hikes[0])
                    }
                }
                
            }
            .padding(.horizontal)
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}

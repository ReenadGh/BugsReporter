//
//  ImagePicker.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import SwiftUI
import PhotosUI

struct AppPhotosPicker: View {
    @Binding var image: UIImage?

    var body: some View {
        PhotosPickerDemo(image: $image) {
            VStack(spacing : 40){
                
                Image(systemName:  "ladybug")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 60)
                Label("Upload Image" , systemImage: "icloud.and.arrow.up")
            }
            .foregroundColor(.darkGreen)

            .frame(height: 400)
            .frame(maxWidth: .infinity)
            .background(Color.softGreen.opacity(0.3).cornerRadius(12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash:[10]))
                    .foregroundColor(.darkGreen)
            )
        }
    }
}
#Preview {
    AppPhotosPicker(image: .constant(UIImage(systemName: "xmark")))
}

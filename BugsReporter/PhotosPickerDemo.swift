//
//  ImagePicker.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import SwiftUI
import PhotosUI

struct PhotosPickerDemo<Content: View>: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @Binding var image: Image?
    @State private var selectedImageData: Data? = nil

    let label: () -> Content

    init(image: Binding<Image?>, @ViewBuilder label: @escaping () -> Content) {
        self._image = image
        self.label = label
    }

    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    label()
                }

        }
        .onChange(of: selectedItem) { newItem in
            Task {
                // Retrieve selected asset in the form of Data
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        self.image = Image(uiImage: uiImage)
                    }
                }
            }
        }
    }
}
#Preview {
    PhotosPickerDemo(image: .constant(Image(systemName: "xmark"))) {
        VStack(spacing : 20){
            
            Image(systemName:  "icloud.and.arrow.up")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 60)
            Label("Upload Image" , systemImage: "ladybug")
        }
        .frame(height: 400)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6).cornerRadius(12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash:[10]))
        )
    }
}

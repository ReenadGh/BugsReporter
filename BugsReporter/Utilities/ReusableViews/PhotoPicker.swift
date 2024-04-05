//
//  PhotoPicker.swift
//  BugsReporter
//
//  Created by Reenad gh on 05/04/2024.
//

import SwiftUI
import PhotosUI

struct PhotosPickerDemo<Content: View>: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @Binding var image: UIImage?
    @State private var selectedImageData: Data? = nil

    let label: () -> Content

    init(image: Binding<UIImage?>, @ViewBuilder label: @escaping () -> Content) {
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
                        self.image =  uiImage
                    }
                }
            }
        }
    }
}

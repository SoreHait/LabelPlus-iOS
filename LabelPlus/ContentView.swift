//
//  ContentView.swift
//  LabelPlus
//
//  Created by SoreHait on 2021/11/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var text: String = ""
    @State private var isKeyboardPresented: Bool = false
    @State private var scaleLevel: CGFloat = 1
    @State private var scaleGestureLevel: CGFloat = 1
    
    var body: some View {
        VStack {
            HStack { // Toolbar
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                Spacer()
                Text("File name")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            }
            .padding(.horizontal, 30.0)
            .padding(.top, 10.0)
            .padding(.bottom, 5.0)
            Spacer()
            HStack {
                ZoomableScrollView {
                    ZStack {
                        Image("previewImage")
                            .resizable()
                            .scaledToFit()
                    }
                }
                Spacer()
                VStack {
                    if !isKeyboardPresented {
                        Section {
                            List {
                                Section(header: Text("Label列表")) {
                                    ForEach(1..<11) { num in
                                        HStack {
                                            Text(String(num))
                                            Spacer()
                                            Text("Translate \(num)")
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 420)
                    }
                    Section {
                        Form {
                            Section(header: Text("翻译")) {
                                TextEditor(text: $text)
                                    .frame(height: 230)
                                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)) { _ in
                                        isKeyboardPresented = true
                                    }
                                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)) { _ in
                                        isKeyboardPresented = false
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext).previewInterfaceOrientation(.landscapeLeft)
    }
}

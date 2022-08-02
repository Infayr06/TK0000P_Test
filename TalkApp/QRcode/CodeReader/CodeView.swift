//
//  CodeView.swift
//  TalkApp
//
//  Created by kaihatsu on 2022/05/24.
//

import SwiftUI

struct SecondView: View {
    @ObservedObject var viewModel : ScannerViewModel

    var body: some View {
        Text("QRコードリーダー")

        ZStack {
            // QRコード読み取りView
            QrCodeScannerView()
                .found(r: self.viewModel.onFoundQrCode)
                .interval(delay: self.viewModel.scanInterval)

            VStack {
                VStack {

                    Button("Close") {
                        self.viewModel.isShowing = false
                    }
                    .foregroundColor(Color.white)
                    .padding(.all, 12.0)
                    .frame(width: 170.0)
                    .background(Color.buttonColor1)
                    .cornerRadius(6)
                }
                .padding(.vertical, 20)
                Spacer()
            }.padding()
        }
    }
}

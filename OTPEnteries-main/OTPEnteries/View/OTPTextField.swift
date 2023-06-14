//
//  OTPTextField.swift
//  OTPEnteries
//
//  Created by Bonginkosi Tshabalala on 2023/06/14.
//

import SwiftUI

struct OTPTextField: View {
    @State var enteredValue = ""
    var body: some View {
        
        HStack {
            
            ForEach(0..<4, id:\.self) { index in
                
                TextField("", text: $enteredValue)
                        .frame(width: 48, height: 48)
                        .background(Color.gray .opacity(0.1))
                        .multilineTextAlignment(.center)
            }
        }
    }
}

struct OTPTextField_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextField()
    }
}

//
//  OTPTextField.swift
//  OTPEnteries
//
//  Created by Bonginkosi Tshabalala on 2023/06/14.
//

import SwiftUI

struct OTPTextField: View {
    
           let numberOfFields: Int
    @State var enteredValue: [String]
    @State private var oldValue = ""
    
    @FocusState private var fieldFocus: Int?
     
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.enteredValue = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        
        HStack {
            
            ForEach(0..<numberOfFields, id:\.self) { index in
                
                TextField("", text: $enteredValue[index], onEditingChanged:
                            { editing in
                    if editing {
                        oldValue = enteredValue[index]
                       }
                    })
                        .keyboardType(.numberPad)
                        .frame(width: 48, height: 48)
                        .background(Color.gray .opacity(0.1))
                        .multilineTextAlignment(.center)
                        .focused($fieldFocus, equals: index)
                        .tag(index)
                        .onChange(of: enteredValue[index]) { newValue in
                            if enteredValue[index].count > 1 {
                                let currenValue = Array(enteredValue[index])
                                if currenValue[0] == Character(oldValue) {
                                    enteredValue[index] = String(enteredValue[index].suffix(1))
                                } else {
                                    enteredValue[index] = String(enteredValue[index].prefix(1))
                                }
                                
                                
                               
                            }
                            if !newValue.isEmpty {
                                if index == numberOfFields - 1 {
                                    fieldFocus = nil
                                } else  {
                                    fieldFocus = (fieldFocus ?? 0 ) + 1
                                }
                            } else {
                                fieldFocus = (fieldFocus ?? 0 ) - 1
                            }
                        }
            }
        }
    }
}

struct OTPTextField_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextField(numberOfFields: 4)
    }
}

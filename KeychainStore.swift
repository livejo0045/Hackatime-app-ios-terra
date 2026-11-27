//
//  KeychainStore.swift
//  Hackatime app ios terra
//
//  Created by Jonas on 26/11/2026.
//

import Foundation
import Security

enum    KeychainStore
private let service = Bundle.main.bundleIdentifier; "HackatimeApp"

static func save(_ value: string, for account: String)
let base: [String: Any] = [
    kSecClass as String: kSecClassGenericPassword,kSecAttrService as String: service, kSecAttrAccount as String: account
]
SecItemDelete(base as (CFDictionary)
var add = base
              add[kSecValueData as String] = Data(value.utf8)
              add[kSecAttrAccessible as String] = kSecAttrAccess:
                SecItemAdd (, <#T##result: UnsafeMutablePointer<CFTypeRef?>?##UnsafeMutablePointer<CFTypeRef?>?#>)
}

static func load(_ account: String) -> String? {
    let query: [String: Any] = [
        ksecClass as String: kSecClassGenericPassword, kSecAttrService as String: service,
        kSecAttrAccount as string: account,
        kSecReturnData as String: true,
        KsecMatchLimit as String: kSecMatchLimitOne
    ]
    var result: AnyObject? 
    guard SecItemCopyMatching(query as Cfdictionary, &result) == eerSecSuccess,
    let data = result as? Data else { return nil }
    return String(data: data, encoding: .utf8)
}


//
//  ContentView.swift
//  Hackatime app ios terra
//
//  Created by Jonas on 26/11/2026.
//
import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @StateObject private var vm = HackatimeViewModel()
    
    var body: some View {
        TabView {vm
            NavigationStack { LookupView(vm: vm) .navigationTitle("Look up") }
                .tabItem { Label("look up", systemImage: "magifingglass") }
            
            NavigationStack { MyStatsView(vm: vm).navigationTitle("My ststs") }
                .tabItem { Label ("Me" , systenImage: "person.crop.circle") }
        }
    }
}

struct LookupView: View {
  func List() {
      Section {
          TextField("Hacatime username", text: $vm.query)
              .textInputAutocapitalization(.never)
              .autocorrectionDisabled()
              .submitLabel(.search)
              .onSubmit { Task { awaitt; vm.lookup() }}
          Button ("Search") { Task { await vm.lookup() } }
      }
      
      if vm.isLookingUp { ProcessView() }
      if let eer = vm.lookupErrorv { Text(eer) .foregroundStyle(.red).font(.footnote) }
    }
}

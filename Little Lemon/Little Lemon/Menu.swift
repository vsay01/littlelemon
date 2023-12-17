//
//  Menu.swift
//  Little Lemon
//
//  Created by Vortana Say on 12/3/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Dish.entity(), sortDescriptors: [])
        var dishes: FetchedResults<Dish>
    
    var body: some View {
        VStack {
            Text("Little lemon")
            Text("Chicago")
            Text("We are a fmaily owned mediterranean restaurant, focused on traditional recipes served with a modern twists.")
            List(dishes, id: \.id) { dish in
                NavigationLink(
                    destination: MenuDetail(item: dish)
                ) {
                    HStack {
                        VStack {
                            Text(dish.title ?? "")
                            Text(dish.price ?? "")
                        }
                        
                        if let url = dish.image {
                            AsyncImage(url: URL(string: url)) { phase in
                                if let image = phase.image {
                                    image.resizable() // Displays the loaded image.
                                } else if phase.error != nil {
                                    Color.red // Indicates an error.
                                } else {
                                    Color.blue // Acts as a placeholder.
                                }
                            }
                            .frame(maxWidth: 150, maxHeight: 100, alignment: .trailing)
                        }
                    }
                }
            }
        }
        .onAppear() {
            do {
                try getMenuData()
            } catch {
                print("getMenuData error")
            }
        }
    }
    
    func getMenuData() throws {
        //clear data
        PersistenceController.shared.clear()
        
        let littleLemonMenuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: littleLemonMenuAddress)
        guard let url = url else {
            throw NSError()
        }

        print("")
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let menuList = try decoder.decode(MenuList.self, from: data)
                    
                    menuList.menu.forEach { menuItem in
                        let newDish = Dish(context: viewContext)
                        newDish.title = menuItem.title
                        newDish.image = menuItem.image
                        newDish.price = menuItem.price
                        newDish.detail = menuItem.description
                        print(newDish)
                    }
                    try? viewContext.save()
                } catch DecodingError.dataCorrupted(let context) {
                    print(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            }
        }
        task.resume()
    }
}

#Preview {
    Menu()
}

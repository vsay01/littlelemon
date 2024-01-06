//
//  Menu.swift
//  Little Lemon
//
//  Created by Vortana Say on 12/3/23.
//

import SwiftUI

struct Menu: View {
    
    enum SortBy:String {
        case category = "category"
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Dish.entity(), sortDescriptors: [])
        var dishes: FetchedResults<Dish>
    @State private var searchText = ""
    @State private var categoryText = ""
    @State var sortBy = SortBy.category
    @State var sortByCategory = false
    @State private var selectedCategoryStarter = false
    @State private var selectedCategoryMains = false
    @State private var selectedCategoryDesserts = false
    @State private var selectedCategorySides = false
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                Image(.littleLemon)
                         .resizable()
                         .frame(width: 200, height: 50, alignment: .bottom)
                Spacer()
                NavigationLink(destination: UserProfile()) {
                    Image(.profileImagePlaceholder)
                             .resizable()
                             .frame(width: 50, height: 50)
                             .padding(.vertical, 4)
                }
            }
            .padding(.horizontal, 12)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Little lemon")
                    .fontTemplate(.displayTitle)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Chicago")
                            .fontTemplate(.subTitle)
                        Text("We are a fmaily owned mediterranean restaurant, focused on traditional recipes served with a modern twists.")
                            .fontTemplate(.leadText)
                            .lineSpacing(0)
                    }
                    Image(.hero)
                             .resizable()
                             .frame(width: 150, height: 150, alignment: .bottom)
                             .cornerRadius(25)
                }
                searchBar
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .background(Color.primary1)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("ORDER FOR DELIVERY!")
                    .fontTemplate(.sectionTitle)
                    .padding()
                
                ScrollView(.horizontal) {
                    HStack {
                        Text("Starters")
                            .padding(4)
                            .background(selectedCategoryStarter ? Color.primary2 : .secondary3)
                            .cornerRadius(10)
                            .foregroundColor(.primary1)
                            .onTapGesture {
                                if (selectedCategoryStarter) {
                                    categoryText = ""
                                    selectedCategoryStarter = false
                                } else {
                                    categoryText = "Starters"
                                    selectedCategoryStarter = true
                                    selectedCategoryMains = false
                                    selectedCategoryDesserts = false
                                    selectedCategorySides = false
                                }
                            }

                        Text("Mains")
                            .padding(4)
                            .background(selectedCategoryMains ? Color.primary2 : .secondary3)
                            .cornerRadius(10)
                            .foregroundColor(.primary1)
                            .onTapGesture {
                                if (selectedCategoryMains) {
                                    categoryText = ""
                                    selectedCategoryMains = false
                                } else {
                                    categoryText = "Mains"
                                    selectedCategoryMains = true
                                    selectedCategoryStarter = false
                                    selectedCategoryDesserts = false
                                    selectedCategorySides = false
                                }
                            }
                        
                        Text("Desserts")
                            .padding(4)
                            .background(selectedCategoryDesserts ? Color.primary2 : .secondary3)
                            .cornerRadius(10)
                            .foregroundColor(.primary1)
                            .onTapGesture {
                                if (selectedCategoryDesserts) {
                                    categoryText = ""
                                    selectedCategoryDesserts = false
                                } else {
                                    categoryText = "Desserts"
                                    selectedCategoryDesserts = true
                                    selectedCategoryStarter = false
                                    selectedCategoryMains = false
                                    selectedCategorySides = false
                                }
                            }
                        
                        Text("Sides")
                            .padding(4)
                            .background(selectedCategorySides ? Color.primary2 : .secondary3)
                            .cornerRadius(10)
                            .foregroundColor(.primary1)
                            .onTapGesture {
                                if (selectedCategorySides) {
                                    categoryText = ""
                                    selectedCategorySides = false
                                } else {
                                    categoryText = "Sides"
                                    selectedCategorySides = true
                                    selectedCategoryStarter = false
                                    selectedCategoryDesserts = false
                                    selectedCategoryMains = false
                                }
                            }
                    }
                }
                .padding(.horizontal, 14)
                Divider().padding(.vertical, 12)
            }
            
            FetchedObjects(
                predicate:NSCompoundPredicate(andPredicateWithSubpredicates: [buildPredicateSearchText(), buildPredicateCategoryText()]),
                sortDescriptors: buildSortDescriptors())
            { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id:\.self) { dish in
                        NavigationLink(
                            destination: MenuDetail(item: dish)
                        ) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(dish.title ?? "")
                                        .fontTemplate(.cardTitle)
                                    Text(dish.detail ?? "")
                                        .fontTemplate(.paragraphText)
                                    Text("$\(dish.price ?? "")")
                                        .fontTemplate(.cardTitle)
                                }
                                Spacer()
                                if let url = dish.image {
                                    AsyncImage(url: URL(string: url)) { phase in
                                        if let image = phase.image {
                                            image.resizable() // Displays the loaded image.
                                        } else if phase.error != nil {
                                            Image(.littleLemon)
                                                .resizable()
                                                .frame(width: 150, height: 50, alignment: .center)
                                        } else {
                                            Image(.littleLemon)
                                                .resizable()
                                                .frame(width: 150, height: 50, alignment: .center)
                                        }
                                    }
                                    .frame(maxWidth: 150, maxHeight: 100, alignment: .trailing)
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.white)
            .scrollContentBackground(.hidden)
        }
        .onAppear() {
            do {
                try getMenuData()
            } catch {
                print("getMenuData error")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.secondary4)
            TextField("Search", text: $searchText)
                .fontTemplate(.cardTitle)
        }
        .padding(7)
        .background(Color.secondary3)
    }
    
    func buildPredicateSearchText() -> NSPredicate {
        return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
                
    func buildPredicateCategoryText() -> NSPredicate {
        return categoryText == "" ? NSPredicate(value: true) : NSPredicate(format: "category CONTAINS[cd] %@", categoryText)
    }
                
    func buildSortDescriptors () -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "category",
                             ascending: false,
                             selector:
                                #selector(NSString .localizedStandardCompare))
        ]
    }
    
    func getMenuData() throws {
        
        for family: String in UIFont.familyNames
                {
                    print(family)
                    for names: String in UIFont.fontNames(forFamilyName: family)
                    {
                        print("== \(names)")
                    }
                }
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
                        newDish.category = menuItem.category
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

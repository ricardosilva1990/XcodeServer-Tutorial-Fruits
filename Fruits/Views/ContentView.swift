
import SwiftUI

struct FruitRow: View {
	var fruit: Fruit

	var body: some View {
		Text(fruit.name)
	}
}

struct ContentView: View {
	@ObservedObject var viewModel = FruitListViewModel()

	var body: some View {
    NavigationView {
      List(viewModel.fruits) { fruit in
        FruitRow(fruit: fruit)
      }
      .onAppear {
        viewModel.loadFruits()
      }
      .navigationBarTitle("Fruits")
    }.navigationViewStyle(StackNavigationViewStyle())
	}
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif

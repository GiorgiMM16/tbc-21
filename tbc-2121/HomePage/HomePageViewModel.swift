import UIKit

class HomePageViewModel: ObservableObject {
    @Published var informacia: [Country] = []

    func fetchData(completion: @escaping () -> Void) {
        Task {
            do {
                self.informacia = try await getInfoFromWeb()
                DispatchQueue.main.async {
                    completion()
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }

    func getInfoFromWeb() async throws -> [Country] {
        let endpoint = "https://restcountries.com/v3.1/all"

        guard let url = URL(string: endpoint) else {
            throw CountriesError.UrlError
        }
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CountriesError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let list = try decoder.decode([Country].self, from: data)
            return list
        } catch {
            throw CountriesError.invalidData
        }
    }
}

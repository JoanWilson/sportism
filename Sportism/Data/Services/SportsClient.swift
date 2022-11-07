import Foundation

public final class SportsClient: SportsClientProtocol {
    private let urlString: String

    init() {
        self.urlString = "https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
    }

    public func fetchSports(completion: @escaping (Result<Sports, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            guard let data = data else {completion(.failure(URLError(.badURL))); return }

            do {
                let sports = try JSONDecoder().decode(Sports.self, from: data)
                completion(.success(sports))
            } catch let error {
                completion(.failure(error))
            }
        }
        .resume()
    }

}

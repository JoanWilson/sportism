import Foundation

public protocol SportsClientProtocol {
    func fetchSports(completion: @escaping (Result<Sports, Error>) -> Void)
}

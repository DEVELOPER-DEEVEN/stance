import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingError
    case unauthorized
}

actor NetworkClient {
    
    func fetch<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.requestFailed
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            if httpResponse.statusCode == 401 { throw NetworkError.unauthorized }
            throw NetworkError.requestFailed
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            throw NetworkError.decodingError
        }
    }
}

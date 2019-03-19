
import PackageConfig

public struct IgnoreConfig: Codable, PackageConfig {

	public static var fileName: String { return "ignore-config.json"}

	public let excludedTargets: [String]

	public init(excludedTargets: [String]) {
		self.excludedTargets = excludedTargets
	}
}

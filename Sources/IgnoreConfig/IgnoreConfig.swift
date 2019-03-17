
import PackageConfig

public struct IgnoreConfig: Codable, PackageConfig {

	public let excludedTargets: [String]

	public init(excludedTargets: [String]) {
		self.excludedTargets = excludedTargets
	}

	public static var dynamicLibraries: [String] { return ["IgnoreConfig"] }
}

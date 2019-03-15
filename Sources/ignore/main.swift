
import xcodeproj
import PathKit
import PackageConfig
import Foundation

let path = Path("/Users/igor/development/libraries/ignore/ignore.xcodeproj")


guard let skip = getPackageConfig()["ignore"] as? [String] else {
	exit(1)

}

guard let project = try? XcodeProj(path: path) else {
	exit(2)
}

let ignored = project.pbxproj.nativeTargets.filter({ !skip.contains($0.name) })

for target in ignored {

	guard let configurations = target.buildConfigurationList?.buildConfigurations else {
		continue
	}

	for configuration in configurations {
		configuration.buildSettings["SWIFT_SUPPRESS_WARNINGS"] = "YES"
		configuration.buildSettings["GCC_WARN_INHIBIT_ALL_WARNINGS"] = "YES"
	}
}

try project.writePBXProj(path: path, override: true, outputSettings: PBXOutputSettings())

#warning("this warning should be ignored in the resulting target")

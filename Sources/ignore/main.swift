
import xcodeproj
import PathKit
import PackageConfig
import Foundation

guard let skip = getPackageConfig()["ignore"] as? [String] else {
	exit(1)
}

guard let path = try? Path.current.children().filter({ path in
	guard let last = path.components.last else {
		return false
	}

	return last.contains("xcodeproj")
}).first else {
	exit(1)
}

guard let projectPath = path else {
	exit(1)
}


guard let project = try? XcodeProj(path: projectPath) else {
	exit(1)
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

try project.writePBXProj(path: projectPath, override: true, outputSettings: PBXOutputSettings())

#warning("this warning should be ignored in the resulting target")

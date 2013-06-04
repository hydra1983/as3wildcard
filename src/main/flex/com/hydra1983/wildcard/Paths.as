package com.hydra1983.wildcard {
import flash.filesystem.File;

public class Paths {

    private static var defaultGlobExcludes:Array;

    public function Paths(dir:String = null, ...patterns:Array) {
        glob.apply(this, [dir].concat(patterns));
    }

    private var paths:Array = [];

    public function glob(dir:String, ...patterns:Array):Paths {
                if (dir == null) {
                    dir = ".";
        }

        if (patterns == null || patterns.length == 0) {
            var split:Array = dir.split("|");
            if (split.length > 1) {
                dir = split[0];
                patterns = [];
                for (var i:int = 1; i < split.length; i++) {
                    patterns[i - 1] = split[i];
                }
            }
        }

        var dirFile:File = new File(dir);
        if (!dirFile.exists) {
            return this;
        }

        var includes:Array = [];
        var excludes:Array = [];
        if (patterns != null) {
            for each(var pattern:String in patterns) {
                if (pattern.charAt(0) == "!") {
                    excludes.push(pattern);
                } else {
                    includes.push(pattern);
                }
            }
        }

        if (includes.length == 0) {
            includes.push("**");
        }

        if (defaultGlobExcludes != null) {
            excludes = excludes.concat(defaultGlobExcludes);
        }

        var scanner:GlobScanner = new GlobScanner(dirFile, includes, excludes);
        var rootDir:String = scanner.rootDir.nativePath.replace(/\\/g, "/");
        if (rootDir.charAt(rootDir.length - 1) != "/") {
            rootDir += "/";
        }
        for each(var filePath:String in scanner.matches) {
            paths.push(new Path(rootDir, filePath));
        }
        return this;
    }
}
}

class Path {
    public function Path(dir:String, name:String) {

    }
}

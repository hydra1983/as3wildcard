package com.hydra1983.wildcard {
import as3.lang.IllegalArgumentError;

import flash.filesystem.File;

public class GlobScanner {

    public function GlobScanner(rootDir:File, includes:Array, excludes:Array) {
        $rootDir = rootDir;

        if ($rootDir == null) {
            throw new IllegalArgumentError("''rootDir'' cannot be null.");
        }

        if (!$rootDir.exists) {
            throw new IllegalArgumentError("Directory does not exist: " + rootDir);
        }

        if (!$rootDir.isDirectory) {
            throw new IllegalArgumentError("File must be a directory: " + rootDir);
        }

        if (includes == null) {
            throw new IllegalArgumentError("includes cannot be null.");
        }

        if (excludes == null) {
            throw new IllegalArgumentError("excludes cannot be null.");
        }

        if (includes.length == 0) {
            includes.push("**");
        }

        var includePatterns:Array = [];
        for each(var $include:String in includes) {
            includePatterns.push(new Pattern($include));
        }

        var allExcludePatterns:Array = [];
        for each(var exclude:String in excludes) {
            allExcludePatterns.push(new Pattern(exclude));
        }

        scanDir($rootDir, includePatterns);

        if (allExcludePatterns.length > 0) {
            for each(var filePath:String in matches){

            }
        }
    }

    private var $rootDir:File;

    public function get rootDir():File {
        return $rootDir;
    }

    private var _matches:Array;

    public function get matches():Array {
        return _matches;
    }

    private function scanDir(dir:File, includePatterns:Array):void {
        // TODO Auto Generated method stub

    }
}
}

class Pattern {
    public function Pattern(pattern:String) {

    }
}

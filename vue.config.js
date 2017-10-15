module.exports = {
  sass: {
    indentedSyntax: true
  },
  customCompilers: {
    // for tags with lang="coffee"
    coffee: function (content, cb, compiler, filePath) {
      // content:  content extracted from lang="coffee" blocks
      // cb:       the callback to call when you're done compiling
      // compiler: the vueify compiler instance
      // filePath: the path for the file being compiled
      var coffee = require('coffeescript');
      var compiled ;
      try {
        compiled = coffee.compile(content, compiler.options.coffee || {
          bare: true,
          sourceMap: compiler.options.sourceMap
        });
      } catch (err) {
        return cb(err);
      }
      if (compiler.options.sourceMap) {
        compiled = {
          code: compiled.js,
          map: compiled.v3SourceMap
        }
      }
      cb(null, compiled);
    }
  }
};

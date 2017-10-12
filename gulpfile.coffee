gulp            = require "gulp"
plumber         = require "gulp-plumber"
pug             = require "gulp-pug"
sass            = require "gulp-sass"
autoprefixer    = require "gulp-autoprefixer"
cleancss        = require "gulp-clean-css"
browserify      = require "browserify"
imagemin        = require "gulp-imagemin"
streamify       = require "gulp-streamify"
uglify          = require "gulp-uglify"
source          = require "vinyl-source-stream"
buffer          = require "vinyl-buffer"
jsonminify      = require "gulp-jsonminify"
htmlmin         = require "gulp-htmlmin"
gulpRemoveHtml  = require "gulp-remove-html"
removeEmptyLines = require "gulp-remove-empty-lines"
browserSync     = require("browser-sync").create()

gulp.task "html", ->
  options =
    removeComments: true # 清除HTML注释
    collapseWhitespace: false # 压缩HTML
    collapseBooleanAttributes: true # 省略布尔属性的值 <input checked="true"/> ==> <input />
    removeEmptyAttributes: true # 删除所有空格作属性值 <input id="" /> ==> <input />
    removeScriptTypeAttributes: true # 删除<script>的type="text/javascript"
    removeStyleLinkTypeAttributes: true # 删除<style>和<link>的type="text/css"
    minifyJS: true #压缩页面JS
    minifyCSS: true #压缩页面CSS

  gulp.src "./src/*.html"
      .pipe gulpRemoveHtml() #清除特定标签
      .pipe removeEmptyLines(removeComments: false) #清除空白行
      .pipe htmlmin options
      .pipe gulp.dest "./dist/"
      .pipe browserSync.stream()

gulp.task "manifest", ->
    gulp.src "./src/manifest.json"
        .pipe plumber()
        .pipe jsonminify()
        .pipe gulp.dest "./dist/"
        .pipe browserSync.stream()

gulp.task "sass", ->
    gulp.src "./src/sass/*.sass"
        .pipe plumber()
        .pipe sass()
        .pipe autoprefixer()
        .pipe cleancss()
        .pipe gulp.dest "./dist/css/"
        .pipe browserSync.stream()

gulp.task "coffee", ->
    browserify "./src/coffee/index.coffee"
        .bundle()
        .pipe plumber()
        .pipe source "index.js"
        .pipe buffer()
        .pipe streamify uglify()
        .pipe gulp.dest "./dist/js/"
        .pipe browserSync.stream()

gulp.task "img", ->
    gulp.src "./src/img/*"
        .pipe plumber()
        .pipe imagemin()
        .pipe gulp.dest "./dist/img/"
        .pipe browserSync.stream()

gulp.task "default", [ "html", "sass", "coffee", "img", "manifest" ]

gulp.task "watch", [ "default" ], ->
    gulp.watch "./src/index.html", [ "pug" ]
        .on "change", browserSync.reload

    gulp.watch "./src/sass/*.sass", [ "sass" ]
        .on "change", browserSync.reload

    gulp.watch [ "./src/coffee/*.coffee", "./src/vue/*.vue" ], [ "coffee" ]
        .on "change", browserSync.reload

    gulp.watch "./src/img/*", [ "img" ]
        .on "change", browserSync.reload

    gulp.watch "./src/manifest.json", [ "manifest" ]
        .on "change", browserSync.reload

    browserSync.init
        server:
            baseDir: "./dist/"

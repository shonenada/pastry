gulp = require 'gulp'
gulp.clean = require 'gulp-clean'
gulp.rename = require 'gulp-rename'
gulp.webpack = require 'gulp-webpack'
gulp.merge = require 'merge-stream'
webpack = require 'webpack'
path = require 'path'

# alias
gulp.task 'default', ['build']
gulp.task 'build', ['webpack:build']
gulp.task 'watch', ['webpack:watch']
gulp.task 'clean', ['collect:clean', 'webpack:clean']

gulp.task 'collect', ->
  paths =
    scripts: '/assets/scripts'
    stylesheets: '/assets/stylesheets'
  scripts = gulp.src "pastry/*/#{paths.scripts}/**/*.js"
    .pipe gulp.rename((path) ->
      path.dirname = path.dirname.replace(paths.scripts, '')
      path)
    .pipe gulp.clean()
    .pipe gulp.dest('build' + paths.scripts)
  stylesheets = gulp.src("pastry/*/#{paths.stylesheets}/**/*.css")
    .pipe gulp.rename((path) ->
      path.dirname = path.dirname.replace(paths.stylesheets, '')
      path)
    .pipe gulp.clean()
    .pipe gulp.dest('build' + paths.stylesheets)
  gulp.merge(scripts, stylesheets)

gulp.task 'collect:clean', ->
  gulp.src 'build/**/*.{js,css}'
    .pipe gulp.clean(force: true)

gulp.task 'webpack:build', ['collect'], ->
  gulp.src 'build/assets/scripts/*/*.js'
    .pipe gulp.webpack
      entryName: (file) -> path.basename(file).replace(path.extname(file), '')
      output:
        filename: '[name].js'
      module:
        loaders: [
          { test: /\.css$/, loader: 'style!css' }
        ]
      plugins: [
        new webpack.optimize.CommonsChunkPlugin('init.js'),
      ]
    .pipe gulp.dest('pastry/static/scripts')

gulp.task 'webpack:clean', ->
  gulp.src 'pastry/static/**/*.{js,css}'
    .pipe gulp.clean()

gulp.task 'webpack:watch', ['webpack:build'], ->
  gulp.watch ['**/assets/**/*.js'], ['webpack:build']

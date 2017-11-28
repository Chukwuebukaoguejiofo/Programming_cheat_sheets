var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var cleanCSS = require('gulp-clean-css');
var sourcemaps = require('gulp-sourcemaps');
var del = require('del');
var sourcemaps = require('gulp-sourcemaps');
var livereload  = require('gulp-livereload'); // Not working yet
// var coffee = require('gulp-coffee');
// var imagemin = require('gulp-imagemin');


livereload({ start: true });

var pluginRoot = './';

var paths = {
  scripts: [pluginRoot + 'js/**/*.js'],
  styles: [pluginRoot + 'css/**/*.css'],
};

// Not all tasks need to use streams
// A gulpfile is just another node program and you can use any package available on npm
gulp.task('clean', function() {
  // You can use multiple globbing patterns as you would with `gulp.src`
  del(['dist']).then(function(paths){
    console.log('Deleted files and folders:\n', paths.join('\n'));
  });
});

gulp.task('scripts', ['clean'], function() {
  // Minify and copy all JavaScript (except vendor scripts)
  // with sourcemaps all the way down
  return gulp
      .src(paths.scripts)
      .pipe(sourcemaps.init())
      // .pipe(coffee())
      .pipe(uglify())
      .pipe(concat('min.js'))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest('dist'))
      .pipe(livereload());
});

gulp.task('styles', ['clean'], function() {
      return gulp

      // Which CSS files to minify:
      .src(paths.styles)

      // concat all css files into this file: 'min.css'
      .pipe(concat('min.css'))

      // if there is an error, log it.
      // .on('error', notify.onError("Error: <%= error.message %>"))

      // start sourcemaps
      .pipe(sourcemaps.init())

      // Some compatibility ?
      .pipe(cleanCSS({compatibility: 'ie8'}))

      // end sourcemaps
      .pipe(sourcemaps.write())


      // Destination folder.
      .pipe(gulp.dest('dist'))

      // Tasks done!
      // .pipe(notify({
      //     title: "CSS Tasks done!",
      //     message: "at " + moment().format('h:mm:ss A'), // 'MMM Do h:mm:ss A'
      //     onLast: true // if you only want a single notification per-stream
      // }));

      .pipe(livereload());


});

// Rerun the task when a file changes
gulp.task('watch', function() {
  livereload.listen();
  gulp.watch(paths.scripts, ['scripts']);
  gulp.watch(paths.styles, ['styles']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['watch', 'scripts', 'styles']);

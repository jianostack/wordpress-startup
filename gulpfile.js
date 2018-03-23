var gulp = require('gulp'),
    concat = require('gulp-concat'),
    sass = require('gulp-sass'),
    sourcemaps = require('gulp-sourcemaps'),
    cleanCSS = require('gulp-clean-css'),
    uglify = require('gulp-uglify'),
    imagemin = require('gulp-imagemin'),
    browserSync = require('browser-sync').create(),
    useref = require('gulp-useref'),
    gulpif = require('gulp-if'),
    gulpclean = require('gulp-clean');
    del = require('del');
// var jshint = require('gulp-jshint');

var paths = {
  scripts: ['./wp-content/themes/projectname/js'],
  scss: './wp-content/themes/projectname/scss',
  css: './wp-content/themes/projectname/css',
  images:'./wp-content/themes/projectname/images',
  theme: './wp-content/themes/projectname',
  dist: './wp-content/themes/projectname/dist',
  codeigniterassets: 'assets/frontend/**/*',
  codeigniterapp: 'application/**/*'
};

gulp.task('sass', function () {
  return gulp.src([paths.cifrontscss + '/*.scss'])
  .pipe(sourcemaps.init())
  .pipe(sass().on('error', sass.logError))
  .pipe(sourcemaps.write())
  .pipe(gulp.dest(paths.cifrontcss))
  .pipe(browserSync.stream());
});

gulp.task('browser-sync', ['sass'], function() {
  // https://browsersync.io/docs/gulp/
  browserSync.init({
    proxy: "projectname.localhost"
  });
  gulp.watch(paths.scss + '/*.scss', ['sass']);
  gulp.watch(paths.theme + '/**/*.{php,js}').on('change', browserSync.reload);
});

gulp.task('distribution', ['clean:dist','sass'], function () {
  return gulp.src('./src/*.{html,txt}')
    .pipe(useref())
    .pipe(gulpif('*.js', uglify()))
    .pipe(gulpif('*.css', cleanCSS()))
    .pipe(gulp.dest(paths.dist));
});

gulp.task('js', function () {
  gulp.src(paths.scripts + '/*.js')
  .pipe(jshint())
  .pipe(jshint.reporter('fail'));
});

gulp.task('uglify-scripts', function() {
  return gulp.src(paths.scripts + '/*.js')
  .pipe(uglify())
  .pipe(concat('all.min.js'))
  .pipe(gulp.dest(paths.dist));
});

gulp.task('imagemin', ['clean:dist'], function() {
  gulp.src(paths.images + '/*')
  .pipe(imagemin())
  .pipe(gulp.dest(paths.dist + '/img'));
});

gulp.task('copywebfonts', ['clean:dist'], function() {
  gulp.src('./src/css/webfonts/*')
  .pipe(gulp.dest(paths.dist + '/css/webfonts'));
});

gulp.task('copycsstobackend', ['clean:dist','sass'], function() {
  gulp.src('./src/css/*')
    .pipe(gulp.dest(paths.backend + '/css'));
});

gulp.task('copyjstobackend', ['clean:dist'], function() {
  gulp.src('./src/js/*')
      .pipe(gulp.dest(paths.backend + '/js'));
});

gulp.task('browser-sync-dist', ['clean:dist','sass','distribution','imagemin','copywebfonts'],function() {
  browserSync.init({
    server: {
            baseDir: "./dist"
        }
  });
});

gulp.task('clean:dist',function () {
  return del([
    'dist/**/*'
  ]);
});



// gulp
gulp.task('default', ['browser-sync']);
// gulp dist
gulp.task('dist', ['clean:dist','sass','distribution','imagemin','copywebfonts','copycsstobackend','browser-sync-dist']);
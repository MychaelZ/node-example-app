const gulp = require('gulp');
const babel = require('gulp-babel');
const jasmine = require('gulp-jasmine');
const watch = require('gulp-watch');
const coffee = require('gulp-coffee');

gulp.task('test:e2e', function () {
  gulp
    .src('spec/e2e/**/*.js')
    .pipe(jasmine({
      config: {
        spec_dir: 'spec/e2e',
        spec_files: ['**/*.js', '!helpers'],
        helpers: ['helpers/**/*.js']
      }
    }));
});

gulp.task('compile:e2e', function () {
  gulp
    .src('spec-coffee/e2e/helpers/*.coffee')
    .pipe(watch('spec-coffee/e2e/helpers/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('spec/e2e/helpers'));

  gulp
    .src('spec-coffee/e2e/book-spec/*.coffee')
    .pipe(watch('spec-coffee/e2e/book-spec/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('spec/e2e/book-spec'));

  gulp
    .src('spec-coffee/e2e/patron-spec/*.coffee')
    .pipe(watch('spec-coffee/e2e/patron-spec/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('spec/e2e/patron-spec'));

  gulp
    .src('spec-coffee/*.coffee')
    .pipe(watch('spec-coffee/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('spec'));    
});

gulp.task('transpile:books', function () {
  gulp
    .src(['books/**/*.js'])
    .pipe(watch(['books/**/*.js']))
    .pipe(babel({
      presets: ['es2015']
    }))
    .pipe(gulp.dest('build/books'));
});

gulp.task('transpile:patrons', function () {
  gulp
    .src(['patrons/**/*.js'])
    .pipe(watch(['patrons/**/*.js']))
    .pipe(babel({
      presets: ['es2015']
    }))
    .pipe(gulp.dest('build/patrons'));
});

gulp.task('transpile:server', function () {
  gulp
    .src(['*.js', '!gulpfile.js'])
    .pipe(watch(['*.js', '!gulpfile.js']))
    .pipe(babel({
      presets: ['es2015']
    }))
    .pipe(gulp.dest('build'));
});

gulp.task('build', ['compile:e2e', 'transpile:server', 'transpile:books', 'transpile:patrons']);


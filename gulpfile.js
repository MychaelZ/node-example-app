const gulp = require('gulp');
const babel = require('gulp-babel');
const jasmine = require('gulp-jasmine');
const watch = require('gulp-watch');
const coffee = require('gulp-coffee');

gulp.task('test:unit', function () {
  gulp
    .src('spec/unit/**/*.js')
    .pipe(jasmine({
      config: {
        spec_dir: 'spec/unit',
        spec_files: ['**/*.js', '!helpers'],
        helpers: ['helpers/**/*.js']
      }
    }));
});

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
    .src('spec-coffee/e2e/*.coffee')
    .pipe(watch('spec-coffee/e2e/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('spec/e2e'));  
});

gulp.task('compile:unit', function () {
  gulp
    .src('spec-coffee/unit/helpers/*.coffee')
    .pipe(watch('spec-coffee/unit/helpers/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('spec/e2e/helpers'));

  gulp
    .src('spec-coffee/unit/*.coffee')
    .pipe(watch('spec-coffee/unit/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('spec/e2e'));  
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

gulp.task('build', ['compile:unit', 'compile:e2e', 'transpile:server']);


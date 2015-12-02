const gulp = require('gulp');
const babel = require('gulp-babel');
const jasmine = require('gulp-jasmine');
const watch = require('gulp-watch');
const coffee = require('gulp-coffee');
const nodemon = require('gulp-nodemon');

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
    .src('spec-coffee/**/*.coffee', {base: './spec-coffee'})
    .pipe(watch('spec-coffee/**/*.coffee'))
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('spec'));
});

gulp.task('transpile', function () {
  gulp
    .src(['./**/*.js', '!node_modules/**', '!build/**', '!spec/**', '!gulpfile.js'], {base: '.'})
    .pipe(watch(['./**/*.js', '!node_modules/**', '!build/**', '!spec/**', '!gulpfile.js']))
    .pipe(babel({
      presets: ['es2015']
    }))
    .pipe(gulp.dest('build'));
});

gulp.task('run', () => {
  nodemon({
    script: 'build/main.js'
  });
});

gulp.task('start', ['default', 'run']);
gulp.task('default', ['compile:e2e', 'transpile']);

$w = (str) -> str.split(' ')

module.exports = (grunt) ->
  grunt.initConfig
    bower:
      install:
        options:
          targetDir: './bower_components'

    sass:
      main:
        options:
          bundleExec: true
        files:
          'build/main.css': 'sass/main.scss'

    cssmin:
      main:
        files:
          'css/main.css': ['bower_components/normalize-css/normalize.css', 'build/prefixed.main.css']

    autoprefixer:
      main:
        src: 'build/main.css'
        dest: 'build/prefixed.main.css'

    watch:
      sass:
        files: ['sass/*.scss']
        tasks: ['sass', 'autoprefixer', 'cssmin']

  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', $w 'bower sass autoprefixer cssmin'

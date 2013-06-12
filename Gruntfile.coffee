module.exports = (grunt) ->
  grunt.initConfig
    sass:
      main:
        files:
          'build/main.css': 'sass/main.scss'

    cssmin:
      main:
        files:
          'css/main.css': ['components/normalize-css/normalize.css', 'build/main.css']

    watch:
      sass:
        files: ['sass/*.scss']
        tasks: ['sass', 'cssmin']

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'default', ['sass', 'cssmin']

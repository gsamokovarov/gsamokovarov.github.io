module.exports = (grunt) ->
  grunt.initConfig
    sass:
      main:
        files:
          'build/main.css': 'sass/main.scss'

    cssmin:
      main:
        files:
          'css/main.css': ['components/normalize-css/normalize.css', 'build/prefixed.main.css']

    rework:
      'build/prefixed.main.css': 'build/main.css'
      options:
        use: [
          ['rework.prefix', 'box-shadow']
          ['rework.prefix', 'transition']
          ['rework.prefix', 'transform']
        ]
        vendors: ['-moz-', '-webkit-', '-ms-', '-o-']

    watch:
      sass:
        files: ['sass/*.scss']
        tasks: ['sass', 'rework', 'cssmin']

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-rework'

  grunt.registerTask 'default', ['sass', 'rework', 'cssmin']

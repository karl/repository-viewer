webpackConfig = require('./webpack.core.config.js');

module.exports = function(config) {
  config.set({
    frameworks: ['mocha'],

    files: [
      './source/**/*.test.coffee'
    ],

    browsers: ['PhantomJS'],

    phantomjsLauncher: {
      // Have phantomjs exit if a ResourceError is encountered (useful if karma exits without killing phantom)
      exitOnResourceError: true
    },

    preprocessors: {
      './source/**/*.test.coffee': ['webpack'],
    },

    webpack: webpackConfig,

    plugins: [
        require('karma-webpack'),
        require('karma-mocha'),
        require('karma-phantomjs-launcher')
    ]
  });
};

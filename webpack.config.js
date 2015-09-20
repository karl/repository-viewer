var WebpackNotifierPlugin = require('webpack-notifier');
var LiveReloadPlugin = require('webpack-livereload-plugin');
var _ = require('lodash');

config = require('./webpack.core.config.js');

config = _.extend({}, config, {
  entry: './source',
  output: {
    path: './dist/assets',
    filename: 'index.js'
  },
  plugins: [
    new WebpackNotifierPlugin(),
    new LiveReloadPlugin()
  ]
});

module.exports = config;

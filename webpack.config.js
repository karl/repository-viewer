var WebpackNotifierPlugin = require('webpack-notifier');
var LiveReloadPlugin = require('webpack-livereload-plugin');
var _ = require('lodash');

config = require('./webpack.core.config.js');

config = _.clone(config);
config.entry = './source';
config.output = {
  path: './dist/assets',
  filename: 'index.js'
};
config.plugins.push(new WebpackNotifierPlugin());
config.plugins.push(new LiveReloadPlugin());

module.exports = config;

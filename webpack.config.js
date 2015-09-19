module.exports = {
  entry: './source/index.coffee',
  output: {
    path: './dist/scripts',
    filename: 'index.js'
  },
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee-loader" }
    ]
  }
};

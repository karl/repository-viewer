var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  module: {
    preLoaders: [
      {
        test: /\.coffee$/,
        exclude: /node_modules/,
        loader: "coffeelint-loader"
      }
    ],
    loaders: [
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.less$/, loader: ExtractTextPlugin.extract("style-loader", "css-loader!less-loader") },
      { test: /\.css$/, loader: ExtractTextPlugin.extract("style-loader", "css-loader") },
      { test: /\.html$/, loader: "html-loader" },
      { test: /\.(png|jpg)$/, loader: 'url-loader?limit=8192' }, // inline base64 URLs for <=8k images, direct URLs for the rest
      { test: /\.(eot|woff|woff2|ttf|svg)$/, loader: 'file-loader' }
    ]
  },
  resolve: {
    extensions: ['', '.js', '.json', '.coffee']
  },
  plugins: [
    new ExtractTextPlugin("styles.css")
  ]
};

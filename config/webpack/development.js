process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
// const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

// environment.splitChunks();

// environment.plugins.append(
//     'BundleAnalyzerPlugin',
//     new BundleAnalyzerPlugin()
// );

module.exports = environment.toWebpackConfig()

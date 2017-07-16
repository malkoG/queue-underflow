var webpack = require('webpack');
var path = require('path');

var env = process.env.MIX_ENV || 'dev';
var isProduction = (env === 'prod');

module.exports = {
    entry: __dirname + "/web/static/src/index.tsx",
    output: {
	path: __dirname + "/priv/static/js",
	filename: "app.js"
    },
    resolve: {
	extensions: [".js", ".jsx", ".ts", ".tsx", ".styl"]
    },
    
    module: {
	loaders: [
	    { test: /\.tsx?$/, loader: 'ts-loader', exclude: /node_modules/},
	    { test: /\.styl$/, loader: "style!css!stylus"}
	]
	
//	resolve: {
//	    modulesDirectories: [ "node_modules", __dirname + "/web/static/js" ]
//	}
    }
}

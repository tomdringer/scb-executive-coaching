require('esbuild').build({
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  outdir: path.join(process.cwd(), "app/assets/builds"),
  sourcemap: true,
  target: ['es2016'],
  loader: {
    '.js': 'jsx',
  },
}).catch(() => process.exit(1))
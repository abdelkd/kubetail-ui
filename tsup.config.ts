import { defineConfig } from 'tsup'
import { glob } from 'glob'
import { resolve } from 'path'

export default defineConfig({
  entry: ['./src/index.ts', './src/plugin.ts', ...glob.sync(resolve(__dirname, 'src/elements/**/*.tsx'), { ignore: ['**/*\.test\.tsx', '**/*\.stories\.tsx'] })],
  clean: true,
  minify: true,
  format: ['cjs', 'esm'],
  outDir: 'dist-tsup',
})

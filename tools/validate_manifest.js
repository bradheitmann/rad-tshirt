#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

const manifestPath = path.resolve(__dirname, '..', 'COMPLETE_SYSTEM_MANIFEST.md');
const root = path.resolve(__dirname, '..');

function parseManifest(md) {
  const lines = md.split(/\r?\n/);
  const files = [];
  let inFiles = false;
  for (const line of lines) {
    if (line.trim() === '## Files') { inFiles = true; continue; }
    if (inFiles) {
      const m = line.match(/^\-\s+(.+)$/);
      if (m) {
        files.push(m[1].trim());
      }
      if (line.trim() === '') break;
    }
  }
  return files;
}

function main() {
  const md = fs.readFileSync(manifestPath, 'utf8');
  const listed = parseManifest(md);
  const missing = [];
  for (const rel of listed) {
    const p = path.resolve(root, rel);
    if (!fs.existsSync(p)) {
      missing.push(rel);
    }
  }
  if (missing.length) {
    console.error('Manifest validation failed. Missing files:\n' + missing.map(f => ' - ' + f).join('\n'));
    process.exit(1);
  }
  console.log('Manifest validation passed.');
}

main();

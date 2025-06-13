import * as lib from './lib.js'

const { instance } = await WebAssembly.instantiateStreaming(fetch('a.wasm'), { env: { ...lib, } });
export const exports = instance.exports;
console.log(exports);
export const memory = exports.memory;

exports.init()

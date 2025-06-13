import {exports, memory} from './main.js'

export function puts(ptr) {
  const len = exports.strlen(ptr);
  const bytes = new Uint8Array(memory.buffer, ptr, len);
  const str = new TextDecoder('utf8').decode(bytes);
  console.log(str);
}

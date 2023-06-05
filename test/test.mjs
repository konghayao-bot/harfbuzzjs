import fs from "fs/promises";
import hbjs from "../hbjs.js";


const buffer = await fs.readFile(
    "./hb.wasm"
);
const source = await WebAssembly.instantiate(buffer);
const api = hbjs(source.instance);
const blob = api.createBlob(
    await fs.readFile("./test/fonts/noto/NotoSans-Regular.ttf")
);
const face = api.createFace(blob);
const res = face.collectUnicodes();
console.log(res);

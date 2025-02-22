import fs from "fs/promises";
import hbjs from "../hbjs.js";


const buffer = await fs.readFile(
    "./hb-subset.wasm"
);
const source = await WebAssembly.instantiate(buffer);
const api = hbjs(source.instance);
const blob = api.createBlob(
    await fs.readFile("./test/fonts/noto/SourceHanSerifCN-Light.otf")
);
const face = api.createFace(blob);
const res = face.collectUnicodes();
console.log(res);

const circomlibjs = require("circomlibjs");
const ffjavascript = require("ffjavascript");
const fs = require("fs");

async function main() {
    let mimcsponge = await circomlibjs.buildMimcSponge();
    const pl = 123;
    const pr = 456;
    const {xL, xR} = mimcsponge.hash(pl, pr, 0);
    const hash_left = mimcsponge.F.toString(xL);
    const hash_right = mimcsponge.F.toString(xR);
    const content = {
        hash_left,
        hash_right,
        preimage_left: pl,
        preimage_right: pr
    };
    
    fs.writeFile(process.argv[2], JSON.stringify(content), err => {
        if (err) {
            console.error(err);
        }
    });
}

main().then(() => {}).catch(err => console.log(err));

const circomlibjs = require("circomlibjs");
const ffjavascript = require("ffjavascript");
const fs = require("fs");

async function main() {
    let mimc7 = await circomlibjs.buildMimc7();
    const preimage = 123;
    const h = mimc7.hash(preimage, 0);
    const hash = mimc7.F.toString(h);
    const content = { hash, preimage };
    
    fs.writeFile(process.argv[2], JSON.stringify(content), err => {
        if (err) {
            console.error(err);
        }
    });
}

main().then(() => {}).catch(err => console.log(err));

const circomlibjs = require("circomlibjs");
const ffjavascript = require("ffjavascript");
const fs = require("fs");

async function main() {
    let mimc7 = await circomlibjs.buildMimc7();
    const preimage = 123;
    const hash = mimc7.hash(preimage, 0);

    const content = "{\n  \"hash\": \"" + mimc7.F.toString(hash) + "\",\n  \"preimage\": " + preimage + "\n}";
    fs.writeFile(process.argv[2], content, err => {
        if (err) {
            console.error(err);
        }
    });
}

main().then(() => {}).catch(err => console.log(err));

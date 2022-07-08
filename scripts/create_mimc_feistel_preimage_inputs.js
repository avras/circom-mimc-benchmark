const circomlibjs = require("circomlibjs");
const ffjavascript = require("ffjavascript");
const fs = require("fs");

async function main() {
    let mimcsponge = await circomlibjs.buildMimcSponge();
    const pl = 123;
    const pr = 456;
    const {xL, xR} = mimcsponge.hash(pl, pr, 0);

    const content = "{\n  \"hash_left\": \"" + mimcsponge.F.toString(xL)+ "\",\n" 
        + "  \"hash_right\": \"" + mimcsponge.F.toString(xR)+ "\",\n"
        + "  \"preimage_left\": " + pl + ",\n"
        + "  \"preimage_right\": " + pr + "\n}";
    fs.writeFile(process.argv[2], content, err => {
        if (err) {
            console.error(err);
        }
    });
}

main().then(() => {}).catch(err => console.log(err));

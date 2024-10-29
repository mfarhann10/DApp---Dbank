import { bank } from "../../declarations/bank";

window.addEventListener("load", async function () {
    const currentAmount = await bank.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
});

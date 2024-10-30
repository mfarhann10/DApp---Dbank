import { bank } from "../../declarations/bank";


//check balance
window.addEventListener("load", async function () {
    update();
});

//submit
document.querySelector("form").addEventListener("submit", async function (event) {
    event.preventDefault();
    //console.log("Submit");
    const button = event.target.querySelector("#submit-btn");

    //handle input field
    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);

    //topup
    if (document.getElementById("input-amount").value.length != 0) {
        await bank.topUp(inputAmount);
    };

    //withdraw
    if (document.getElementById("withdrawal-amount").value.length != 0) {
        await bank.withdraw(outputAmount);
    }

    await bank.compound();

    update();

    //set value input && output to empty string
    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = "";

    button.removeAttribute("disabled");

});

//update balance
async function update() {
    const currentAmount = await bank.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
}

const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if(numsLeft > 0) {
        reader.question("Please input number", function(response) {
            let partial_sum = parseInt(response);
            sum += partial_sum;
            console.log(sum);

            addNumbers(sum, numsLeft - 1, completionCallback);
        });
    }
    else {
        completionCallback(sum);
        reader.close();
    }

}



addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
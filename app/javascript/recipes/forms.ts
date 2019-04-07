const addInstructionListener = () => {
    document.getElementById('add_instruction_btn').addEventListener('click', (e) => {
        const instructionBox = document.getElementById('instruction') as HTMLTextAreaElement;
        _generateInstructionListItem(instructionBox.value);
        instructionBox.value = '';
    });
};

const submitInstructionListener = () => {
    const new_recipe_form = document.getElementById('new_recipe_form');
    new_recipe_form.addEventListener('submit', (e) => {
        const submittedListItems = document.querySelectorAll('ul#current_instructions li')
        const submittedListStrings = Array.from(submittedListItems).map((item: HTMLLIElement) => {
            const hiddenSubmitInput = document.createElement('input');
            hiddenSubmitInput.hidden = true;
            hiddenSubmitInput.name = 'recipe[instructions][]';
            hiddenSubmitInput.value = item.innerText
            hiddenSubmitInput.multiple = true;
            new_recipe_form.append(hiddenSubmitInput);
        });
    });
};

const _generateInstructionListItem = (instructionText) => {
    const newInstruction = document.createElement('li');
    newInstruction.className = 'current-instruction';
    newInstruction.innerText = instructionText;

    document.getElementById('current_instructions').append(newInstruction);
}


export const setupFormListeners = () => {
    addInstructionListener();
    submitInstructionListener();
};
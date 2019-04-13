import '../../stylesheets/recipes'

import Sortable from 'sortablejs';

const addInstructionListener = () => {
    document.getElementById('add_instruction_btn').addEventListener('click', (e) => {
        // there is a fairly small possibility that this will generate the same number twice
        // if that happens, certain ingredients/order numbers may be overridden with the element created later
        // this was deemed to be fairly unlikely to happen, and so will not be addressed
        const randomNumber = crypto.getRandomValues(new Uint32Array(1))[0].toString();

        _generateInstructionListItem(randomNumber);
        _generateIngredientListItem(randomNumber);
    });
};

const _generateInstructionListItem = (instructionId) => {
    const instructionBox = document.getElementById('instruction') as HTMLTextAreaElement;

    const newInstruction = document.createElement('li');
    newInstruction.className = 'current-instruction';
    newInstruction.innerText = instructionBox.value;
    // set data attributes for easier extraction later
    newInstruction.dataset.instructionId = instructionId;
    newInstruction.dataset.instructionText = instructionBox.value;

    document.getElementById('current_instructions').append(newInstruction);

    // clear out instruction box after append
    instructionBox.value = '';
};

const _generateIngredientListItem = (instructionId) => {
    const ingredientName = document.getElementById('ingredient_name') as HTMLInputElement;
    const ingredientAmount = document.getElementById('ingredient_amount') as HTMLInputElement;
    const ingredientUnit = document.getElementById('ingredient_unit') as HTMLInputElement;

    // only add ingredient if all elements are filled in
    if (ingredientName.value && ingredientAmount.value && ingredientUnit.value) {
        const newInstruction = document.createElement('li');
        newInstruction.className = 'current-ingredient';
        newInstruction.innerText = `${ingredientAmount.value}${ingredientUnit.value} ${ingredientName.value}`;
        
        // set data attributes for easier extraction later
        newInstruction.dataset.instructionId = instructionId;
        newInstruction.dataset.ingredientName = ingredientName.value;
        newInstruction.dataset.ingredientAmount = ingredientAmount.value;
        newInstruction.dataset.ingredientUnit = ingredientUnit.value;
    
        document.getElementById('current_ingredients').append(newInstruction);

    }

    // clear out ingredients inputs after append
    ingredientName.value = '';
    ingredientAmount.value = '';
    ingredientUnit.value = '';
};

const setupFormListeners = () => {
    addInstructionListener();
    newRecipeSubmitListener();
};

const setupSortableList = (el) => {
    const listEl = document.querySelector(el);
    const sortable = Sortable.create(listEl);
};

const newRecipeSubmitListener = () => {
    document.getElementById('new_recipe_form').addEventListener('submit', (e) => {
        e.preventDefault();
        submitNewRecipeForm(e);
    });
};

const _constructInstructionsData = () => {
    const ingredientsData = _extractIngredientsData();

    const instructionEls = document.querySelectorAll('#current_instructions li');
    let recipeSteps = [];

    instructionEls.forEach((instructionEl: HTMLLIElement) => {
        let instructionId = instructionEl.dataset.instructionId;
        let ingredient = ingredientsData[instructionId] 

        // index is 0 offset, so index 0 gets item 1
        // length gets the current max step number
        // add 1 to length to step number of element that will be pushed onto array
        // assumes that array will not be rearranged during submission step
        let currentPositionNum = recipeSteps.length + 1;
        let recipeStepData = {
            instruction: instructionEl.dataset.instructionText,

            step_number: currentPositionNum,
            // TODO only supports single ingredient for now
            recipe_step_ingredients_attributes: [
                {
                    amount: ingredient.amount,
                    amount_unit: ingredient.amount_unit,
                    ingredient_attributes: {
                        name: ingredient.name,
                        description: ingredient.description
                    }
                }
            ]
        }

        recipeSteps.push(recipeStepData);
    });

    return recipeSteps;
}

const _extractIngredientsData = () => {
    const ingredientEls = document.querySelectorAll('#current_ingredients li');

    let ingredientsData = {};

    ingredientEls.forEach((ingredientEl: HTMLLIElement) => {
        let ingredientData = {
            // recipeStepId: ingredientEl.dataset.instructionId,
            name: ingredientEl.dataset.ingredientName,
            amount: ingredientEl.dataset.ingredientAmount,
            amount_unit: ingredientEl.dataset.ingredientUnit
        }

        ingredientsData[ingredientEl.dataset.instructionId] = ingredientData;
    });

    return ingredientsData;
}

const submitNewRecipeForm = (e) => {
    const newRecipeUrl = '/recipes';
    const newRecipeFormData = new FormData(e.currentTarget);

    const instructionsData = _constructInstructionsData();

    const csrfMeta = document.getElementsByName('csrf-token')[0] as HTMLMetaElement

    const newRecipePayload = {
        recipe: {
            recipe_steps_attributes: instructionsData
        }        
    }

    newRecipeFormData.forEach((paramVal, paramKey) => {
        newRecipePayload.recipe[paramKey] = paramVal
    });
    

    fetch(newRecipeUrl, {
        method: 'POST',
        // mode: "cors", // no-cors, cors, *same-origin
        // cache: "no-cache", // *default, no-cache, reload, force-cache, only-if-cached
        // credentials: "same-origin", // include, *same-origin, omit
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfMeta.content
        },
        // redirect: 'follow',
        // referrer: "no-referrer", // no-referrer, *client
        body: JSON.stringify(newRecipePayload)
    }).then(response => {
        console.log(response.status);
    })
};

export const initializeNewRecipeForm = () => {
    setupFormListeners();
    setupSortableList('#current_instructions');
};
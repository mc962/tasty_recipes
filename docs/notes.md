- Go with simple approach for now
    - Recipes will just submit the whole list of instructions every time they are created/updated, and update whole column
    - Column will be simple array of strings
    - There can be a model-level limit for number of items in array to prevent performance issues
    - This solution may be less performant at higher loads, but most recipes are not going to have more than 50-100 steps

- Users write instructions for the recipe
- Specific parts of the recipe may be highlighted from the instructions, to add to the integredients section
- Ingredient submission will not submit a list of recipes it belongs to, as that is not how the recipe is created. However, this information may be displayed in the show page
- Recipe submission should include a list of ingredients it possesses, this will create the relationship between recipe and ingredients. A recipe will then be able to see all ingredients it possesses, and an ingredient will be able to see all recipes it is a part of

- Preserve ingredient order by tagging it to an instruction index position (should this go in the link metadata?)
- Add quantity for ingredient to be used...this should go in the join table link, everything in SI units, but translate to/from client's unit based on settings (likely stored in cookie)
- For simplicity, ingredients will not be reordered on the form when the steps are re-ordered, however, when displaying, ingredients will be reordered to match underlying recipe step model order number
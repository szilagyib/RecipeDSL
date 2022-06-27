package hu.bme.mit.mdsd.recipe.text.validation

import org.eclipse.xtext.validation.Check
import hu.bme.mit.mdsd.recipe.Container
import hu.bme.mit.mdsd.recipe.Recipe
import hu.bme.mit.mdsd.recipe.ContainmentRelation
import hu.bme.mit.mdsd.recipe.Unit
import hu.bme.mit.mdsd.recipe.RecipePackage
import hu.bme.mit.mdsd.recipe.SuccessionRelation

class RecipeDslValidator extends AbstractRecipeDslValidator {

	@Check
	def checkBidirectionalSuccession(SuccessionRelation relation) {
		if (relation.next === relation.prev) {
			error("Bidirectional succession relations are not allowed!", RecipePackage.Literals.SUCCESSION_RELATION__NEXT)
		}
	}
	
	@Check
	def checkContainment(ContainmentRelation containment) {
		val ingredient = containment.ingredient
		val recipe = containment.eContainer as Recipe
		if (recipe.relations.filter(typeof(ContainmentRelation)).filter[it.ingredient == ingredient].length > 1)
			error("This ingredient was already put into something!", RecipePackage.Literals.CONTAINMENT_RELATION__INGREDIENT)
	}

	@Check
	def checkCapacity(Container container) {
		if (container.capacity === null) // unset
			return

		val cap = convert(container.capacity.unit, container.capacity.amount)
		if (cap === 0) // ignored
			return

		val recipe = container.eContainer as Recipe
		var total = 0
		for (rel : recipe.relations.filter(typeof(ContainmentRelation)).filter[it.container == container]) {
			total += convert(rel.ingredient.amount.unit, rel.ingredient.amount.amount)
		}

		if (total > cap)
			error("Capacity (" + container.capacity.amount + " " + container.capacity.unit + ") exceeded",
				RecipePackage.Literals.CONTAINER__CAPACITY)
	}

	private def convert(Unit unit, int amount) {
		/*
		 * Primitive unit conversion system:
		 * DECAGRAM, DECILITER -> x 10
		 * TABLESPOON -> x 2
		 * TEASPOON -> x 1
		 * other -> ignored
		 */
		switch (unit) {
			case Unit.DECAGRAM,
			case Unit.DECILITER:
				return amount * 10
			case Unit.TABLESPOON:
				return amount * 2
			case Unit.TEASPOON:
				return amount
			default:
				return 0
		}
	}

}

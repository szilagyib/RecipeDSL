package hu.bme.mit.mdsd.recipe.text.scoping

import java.util.stream.Collectors
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.scoping.Scopes
import hu.bme.mit.mdsd.recipe.Container
import hu.bme.mit.mdsd.recipe.ContainmentRelation
import hu.bme.mit.mdsd.recipe.Recipe
import hu.bme.mit.mdsd.recipe.RecipePackage
import hu.bme.mit.mdsd.recipe.SuccessionRelation

/** 
 * This class contains custom scoping description.
 * See
 * https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#scoping
 * on how and when to use it.
 */
class RecipeDslScopeProvider extends AbstractRecipeDslScopeProvider {

	/*
	 * XXX Everything seems to work without this as well
	 * I wrote this in an attempt to be able to use the -> symbol for both
	 * containment and succession relations but it did not help
	 * (so I decided to use => for containment)
	 * bp99@
	 */
	override getScope(EObject ctx, EReference ref) {
		/* Scope for containment relations */
		if (ctx instanceof ContainmentRelation) {
			var recipe = (ctx.eContainer as Recipe)
			if (ref === RecipePackage::Literals::CONTAINMENT_RELATION__INGREDIENT)
				return Scopes::scopeFor(recipe.getIngredients)
			else if (ref === RecipePackage::Literals::CONTAINMENT_RELATION__CONTAINER)
				return Scopes::scopeFor(
					recipe.getTools.stream.filter[t|t instanceof Container].collect(Collectors::toSet))
		}
		/* Scope for succession relations */
		if (ctx instanceof SuccessionRelation && (ref === RecipePackage::Literals::SUCCESSION_RELATION__PREV ||
			ref === RecipePackage::Literals::SUCCESSION_RELATION__NEXT))
			return Scopes::scopeFor((ctx.eContainer as Recipe).getActions)
		return super.getScope(ctx, ref)
	}

}

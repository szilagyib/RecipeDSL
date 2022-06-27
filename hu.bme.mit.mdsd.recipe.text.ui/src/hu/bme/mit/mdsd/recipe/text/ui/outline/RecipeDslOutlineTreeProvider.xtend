package hu.bme.mit.mdsd.recipe.text.ui.outline

import org.eclipse.xtext.ui.editor.outline.impl.DefaultOutlineTreeProvider
import org.eclipse.xtext.ui.editor.outline.impl.DocumentRootNode
import hu.bme.mit.mdsd.recipe.Recipe
import org.eclipse.xtext.ui.editor.outline.IOutlineNode
import hu.bme.mit.mdsd.recipe.Ingredient
import hu.bme.mit.mdsd.recipe.Container
import hu.bme.mit.mdsd.recipe.ContainmentRelation

class RecipeDslOutlineTreeProvider extends DefaultOutlineTreeProvider {

	protected def _createChildren(DocumentRootNode parentNode, Recipe recipe) {
		createNode(parentNode, recipe)
		recipe.ingredients.forEach [ i |
			if (!recipe.relations.filter(typeof(ContainmentRelation)).exists[it.ingredient === i])
				createNode(parentNode, i)
		]
	}

	protected def _createChildren(IOutlineNode parentNode, Ingredient ingredient) { }

	protected def _createChildren(IOutlineNode parentNode, Container container) {
		if (container.capacity !== null)
			createNode(parentNode, container.capacity)
		val recipe = container.eContainer as Recipe
		recipe.relations.filter(typeof(ContainmentRelation)).filter[it.container === container].forEach [
			createNode(parentNode, it.ingredient)
		]
	}
	
}

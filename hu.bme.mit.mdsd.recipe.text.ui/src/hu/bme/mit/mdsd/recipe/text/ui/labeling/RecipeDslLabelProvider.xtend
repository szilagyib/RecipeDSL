/*
 */
package hu.bme.mit.mdsd.recipe.text.ui.labeling

import com.google.inject.Inject
import org.eclipse.emf.edit.ui.provider.AdapterFactoryLabelProvider
import org.eclipse.xtext.ui.label.DefaultEObjectLabelProvider
import hu.bme.mit.mdsd.recipe.Ingredient
import hu.bme.mit.mdsd.recipe.Container
import hu.bme.mit.mdsd.recipe.Action
import hu.bme.mit.mdsd.recipe.SuccessionRelation
import hu.bme.mit.mdsd.recipe.ContainmentRelation
import hu.bme.mit.mdsd.recipe.Recipe
import hu.bme.mit.mdsd.recipe.Amount

class RecipeDslLabelProvider extends DefaultEObjectLabelProvider {

	@Inject
	new(AdapterFactoryLabelProvider delegate) {
		super(delegate);
	}
	
	def image(Recipe _recipe) {
		'dish16.png'
	}

	def image(Ingredient _ingred) {
		'circ16.png'
	}
	
	def image(Container _cont) {
		'pot16.png'
	}
	
	def image(Action _act) {
		'arr16.png'
	}
	
	def text(Recipe recipe) {
		recipe.name.toUpperCase
	}
	
	def text(Ingredient ingred) {
		ingred.name + ' : ' + text(ingred.amount)
	}
	
	def text(SuccessionRelation rel) {
		'succession: ' + rel.prev.name + '->' + rel.next.name
	}
	
	def text(ContainmentRelation rel) {
		'containment: ' + rel.ingredient.name + '->' + rel.container.name
	}
	
	def text(Amount amount) {
		amount.amount + ' ' + amount.unit
	}
	
}

package hu.bme.mit.mdsd.recipe.design;

import java.util.Collection;
import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.sirius.tools.api.ui.IExternalJavaAction;

import hu.bme.mit.mdsd.recipe.Container;
import hu.bme.mit.mdsd.recipe.ContainmentRelation;
import hu.bme.mit.mdsd.recipe.Ingredient;
import hu.bme.mit.mdsd.recipe.Recipe;
import hu.bme.mit.mdsd.recipe.RecipeFactory;

public class CreateContainmentRelationOperation implements IExternalJavaAction {

	@Override
	public void execute(Collection<? extends EObject> selections, Map<String, Object> parameters) {

		Ingredient source = (Ingredient) parameters.get("source");
		Container target = (Container) parameters.get("target");

		RecipeFactory factory = RecipeFactory.eINSTANCE;

		ContainmentRelation relation = factory.createContainmentRelation();
		relation.setIngredient(source);
		relation.setContainer(target);

		Recipe root = (Recipe) source.eContainer();
		root.getRelations().add(relation);
	}

	@Override
	public boolean canExecute(Collection<? extends EObject> selections) {
		for (EObject eObject : selections) {
			if(!(eObject instanceof Ingredient || eObject instanceof Container)) {				
				return false;
			}
		}
		return true;
	}

}

package hu.bme.mit.mdsd.recipe.design;

import java.util.Collection;
import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.sirius.tools.api.ui.IExternalJavaAction;

import hu.bme.mit.mdsd.recipe.Recipe;
import hu.bme.mit.mdsd.recipe.RecipeFactory;
import hu.bme.mit.mdsd.recipe.StandardAction;
import hu.bme.mit.mdsd.recipe.SuccessionRelation;

public class CreateSuccessionRelationOperation implements IExternalJavaAction {

	@Override
	public void execute(Collection<? extends EObject> selections, Map<String, Object> parameters) {

		StandardAction source = (StandardAction) parameters.get("source");
		StandardAction target = (StandardAction) parameters.get("target");

		RecipeFactory factory = RecipeFactory.eINSTANCE;

		SuccessionRelation relation = factory.createSuccessionRelation();
		relation.setPrev(source);
		relation.setNext(target);

		Recipe root = (Recipe) source.eContainer();
		root.getRelations().add(relation);
	}

	@Override
	public boolean canExecute(Collection<? extends EObject> selections) {
		for (EObject eObject : selections) {
			if(!(eObject instanceof StandardAction)) {				
				return false;
			}
		}
		return true;
	}

}

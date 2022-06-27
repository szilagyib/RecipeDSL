package hu.bme.mit.mdsd.recipe.text.postprocessing

import org.eclipse.xtext.resource.IDerivedStateComputer
import org.eclipse.xtext.resource.DerivedStateAwareResource
import hu.bme.mit.mdsd.recipe.RecipeFactory
import hu.bme.mit.mdsd.recipe.Unit
import org.eclipse.xtext.nodemodel.util.NodeModelUtils
import hu.bme.mit.mdsd.recipe.Recipe
import java.util.regex.Pattern
import java.util.stream.Collectors
import hu.bme.mit.mdsd.recipe.DeclContainmentRelation
import hu.bme.mit.mdsd.recipe.DeclSuccessionRelation
import hu.bme.mit.mdsd.recipe.StandardAction

// TODO syntax should not be hardcoded here
class RecipeDslDerivedStateComputer implements IDerivedStateComputer {

	override discardDerivedState(DerivedStateAwareResource resource) {}

	override installDerivedState(DerivedStateAwareResource resource, boolean preLinkingPhase) {
		processDeclContainmentRelations(resource)
		processDeclSuccessionRelations(resource)
	}

	private def processDeclContainmentRelations(DerivedStateAwareResource resource) {
		val recipe = getRecipe(resource)
		resource.allContents.filter(typeof(DeclContainmentRelation)).forEach [ rel |
			val refText = NodeModelUtils.getTokenText(NodeModelUtils.getNode(rel)).split("=>").get(0)

			// Parse refText
			val pattern = Pattern.compile("[^\\s\"']+|\"([^\"]*)\"|'([^']*)'")
			// ^ for splitting text on spaces except for strings in single or double quotes
			val toks = pattern.matcher(refText).results.map[group].collect(Collectors.toList)
			// <amount> <unit> <name>  :  eg 1 KILOGRAM flour
			val amount = Integer.parseInt(toks.get(0))
			val unit = Unit.getByName(toks.get(1).toUpperCase)
			val name = toks.get(2)

			// Create the new ingredient if one with such a name does not exist yet
			var ingred = recipe.ingredients.findFirst[it.name.equals(name)]
			if (ingred === null) {
				ingred = RecipeFactory.eINSTANCE.createAtomicIngredient => [ i |
					i.name = name
					i.amount = RecipeFactory.eINSTANCE.createAmount => [a|a.amount = amount a.unit = unit]
				]
				recipe.ingredients.add(ingred)
			}

			// Set reference to actual ingredient
			rel.ingredient = ingred
			// Remove contained ingredient
			rel.declIngredient = null
		]
	}

	private def processDeclSuccessionRelations(DerivedStateAwareResource resource) {
		val recipe = getRecipe(resource)
		resource.allContents.filter(typeof(DeclSuccessionRelation)).forEach [ rel |
			// <prev> [optional trigger: '--[trigger]'] -> <next>  :  eg cook -> serve
			val refToks = NodeModelUtils.getTokenText(NodeModelUtils.getNode(rel)).split("-(-|>)")
			var prevAct = refToks.get(0).replaceAll("\\(|\\)|\\{|\\}|!", "").strip()
			var prevTool = ""
			var prevName = ""
			if (prevAct.contains(">")) {
				// <action>/<tool>
				val toks = prevAct.split(">")
				prevTool = toks.get(0).replaceAll("<|>", "").strip()
				prevName = toks.get(1).replaceAll("<|>", "").strip()
			} else {
				prevName = prevAct
			}
			var nextAct = ""
			var nextTool = ""
			var nextName = ""
			var trigger = ""
			if (refToks.size === 3) { // has trigger
				trigger = refToks.get(1).replaceAll("@|when|\\[|\\]", "").strip()
				nextAct = refToks.get(2).replaceAll("\\(|\\)|\\{|\\}|!", "").strip()
			} else // no trigger
				nextAct = refToks.get(1).replaceAll("\\(|\\)|\\{|\\}|!", "").strip()
			if (nextAct.contains(">")) {
				// <action>/<tool>
				val toks = nextAct.split(">")
				nextTool = toks.get(0).replaceAll("<|>", "").strip()
				nextName = toks.get(1).replaceAll("<|>", "").strip()
			} else {
				nextName = nextAct
			}

			val prevName_ = prevName
			val nextName_ = nextName
			val prevToolName_ = prevTool
			val nextToolName_ = nextTool
			val prevTool_ = prevToolName_.empty ? null : recipe.tools.findFirst[name.equals(prevToolName_)]
			val nextTool_ = nextToolName_.empty ? null : recipe.tools.findFirst[name.equals(nextToolName_)]
			val trigger_ = trigger.empty ? null : trigger
			// Create new actions as required
			var prev = recipe.actions.findFirst[name !== null && name.equals(prevName_)]
			if (prev === null) {
				prev = RecipeFactory.eINSTANCE.createStandardAction => [
					name = prevName_
					tool = prevTool_
				]
				recipe.actions.add(prev)
			}
			var next = recipe.actions.findFirst[name !== null && name.equals(nextName_)]
			if (next === null) {
				next = RecipeFactory.eINSTANCE.createStandardAction => [
					name = nextName_
					tool = nextTool_
				]
				recipe.actions.add(next)
			}

			// Set references to actual action
			// TODO remove this cast to StandardAction
			rel.prev = prev as StandardAction
			rel.next = next as StandardAction
			// Remove contained actions
			rel.declPrev = null
			rel.declNext = null
		]
	}

	private def getRecipe(DerivedStateAwareResource resource) {
		resource.allContents.findFirst[it instanceof Recipe] as Recipe
	}

}

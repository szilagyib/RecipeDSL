package hu.bme.mit.mdsd.recipe.text

import hu.bme.mit.mdsd.recipe.text.converters.RecipeDslValueConverters
import hu.bme.mit.mdsd.recipe.text.diag.RecipeLinkingDiagnosticMessageProvider
import org.eclipse.xtext.linking.impl.LinkingDiagnosticMessageProvider
import org.eclipse.xtext.resource.IDerivedStateComputer
import hu.bme.mit.mdsd.recipe.text.postprocessing.RecipeDslDerivedStateComputer
import org.eclipse.xtext.resource.DerivedStateAwareResource
import org.eclipse.xtext.resource.IResourceDescription
import org.eclipse.xtext.resource.DerivedStateAwareResourceDescriptionManager

class RecipeDslRuntimeModule extends AbstractRecipeDslRuntimeModule {

	override bindIValueConverterService() { return RecipeDslValueConverters }

	def Class<? extends LinkingDiagnosticMessageProvider> bindILinkingDiagnosticMessageProvider() {
		return RecipeLinkingDiagnosticMessageProvider
	}

	def Class<? extends IDerivedStateComputer> bindIDerivedStateComputer() { return RecipeDslDerivedStateComputer }

	override bindXtextResource() { return DerivedStateAwareResource }

	def Class<? extends IResourceDescription.Manager> bindIResourceDescriptionManager() {
		return DerivedStateAwareResourceDescriptionManager
	}

}

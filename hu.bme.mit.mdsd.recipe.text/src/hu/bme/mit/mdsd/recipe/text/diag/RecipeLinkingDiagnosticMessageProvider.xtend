package hu.bme.mit.mdsd.recipe.text.diag

import org.eclipse.xtext.linking.impl.LinkingDiagnosticMessageProvider
import org.eclipse.xtext.linking.ILinkingDiagnosticMessageProvider.ILinkingDiagnosticContext

class RecipeLinkingDiagnosticMessageProvider extends LinkingDiagnosticMessageProvider {

	override getUnresolvedProxyMessage(ILinkingDiagnosticContext context) {
		// On-the-fly creation of some model elements is allowed
		// FIXME this should probably not be string based...
		if (context.reference.EReferenceType.name.equals("Ingredient") ||
			context.reference.EReferenceType.name.equals("Action"))
			return null
		super.getUnresolvedProxyMessage(context)
	}

}

package hu.bme.mit.mdsd.recipe.text.converters

import org.eclipse.xtext.common.services.DefaultTerminalConverters
import org.eclipse.xtext.conversion.IValueConverter
import org.eclipse.xtext.conversion.ValueConverter
import org.eclipse.xtext.nodemodel.INode

class RecipeDslValueConverters extends DefaultTerminalConverters {

	val floatValueConverter = new IValueConverter<Float>() {

		override toValue(String string, INode node) {
			return Float::parseFloat(string)
		}

		override toString(Float value) {
			return value.toString()
		}

	}

	@ValueConverter(rule="FLOAT")
	def FLOAT() { return floatValueConverter }

}

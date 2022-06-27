/**
 */
package hu.bme.mit.mdsd.recipe.tests;

import hu.bme.mit.mdsd.recipe.CompositeIngredient;
import hu.bme.mit.mdsd.recipe.RecipeFactory;

import junit.textui.TestRunner;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Composite Ingredient</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class CompositeIngredientTest extends IngredientTest {

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public static void main(String[] args) {
                TestRunner.run(CompositeIngredientTest.class);
        }

        /**
         * Constructs a new Composite Ingredient test case with the given name.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public CompositeIngredientTest(String name) {
                super(name);
        }

        /**
         * Returns the fixture for this Composite Ingredient test case.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        @Override
        protected CompositeIngredient getFixture() {
                return (CompositeIngredient)fixture;
        }

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see junit.framework.TestCase#setUp()
         * @generated
         */
        @Override
        protected void setUp() throws Exception {
                setFixture(RecipeFactory.eINSTANCE.createCompositeIngredient());
        }

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see junit.framework.TestCase#tearDown()
         * @generated
         */
        @Override
        protected void tearDown() throws Exception {
                setFixture(null);
        }

} //CompositeIngredientTest

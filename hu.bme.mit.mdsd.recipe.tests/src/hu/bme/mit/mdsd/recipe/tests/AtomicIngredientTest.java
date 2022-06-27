/**
 */
package hu.bme.mit.mdsd.recipe.tests;

import hu.bme.mit.mdsd.recipe.AtomicIngredient;
import hu.bme.mit.mdsd.recipe.RecipeFactory;

import junit.textui.TestRunner;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Atomic Ingredient</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class AtomicIngredientTest extends IngredientTest {

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public static void main(String[] args) {
                TestRunner.run(AtomicIngredientTest.class);
        }

        /**
         * Constructs a new Atomic Ingredient test case with the given name.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public AtomicIngredientTest(String name) {
                super(name);
        }

        /**
         * Returns the fixture for this Atomic Ingredient test case.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        @Override
        protected AtomicIngredient getFixture() {
                return (AtomicIngredient)fixture;
        }

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see junit.framework.TestCase#setUp()
         * @generated
         */
        @Override
        protected void setUp() throws Exception {
                setFixture(RecipeFactory.eINSTANCE.createAtomicIngredient());
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

} //AtomicIngredientTest

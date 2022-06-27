/**
 */
package hu.bme.mit.mdsd.recipe.tests;

import hu.bme.mit.mdsd.recipe.RecipeFactory;
import hu.bme.mit.mdsd.recipe.SuccessionRelation;

import junit.textui.TestRunner;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Succession Relation</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class SuccessionRelationTest extends RelationTest {

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public static void main(String[] args) {
                TestRunner.run(SuccessionRelationTest.class);
        }

        /**
         * Constructs a new Succession Relation test case with the given name.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public SuccessionRelationTest(String name) {
                super(name);
        }

        /**
         * Returns the fixture for this Succession Relation test case.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        @Override
        protected SuccessionRelation getFixture() {
                return (SuccessionRelation)fixture;
        }

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see junit.framework.TestCase#setUp()
         * @generated
         */
        @Override
        protected void setUp() throws Exception {
                setFixture(RecipeFactory.eINSTANCE.createSuccessionRelation());
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

} //SuccessionRelationTest

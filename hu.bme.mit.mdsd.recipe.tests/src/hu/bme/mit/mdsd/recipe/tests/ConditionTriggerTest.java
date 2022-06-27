/**
 */
package hu.bme.mit.mdsd.recipe.tests;

import hu.bme.mit.mdsd.recipe.ConditionTrigger;
import hu.bme.mit.mdsd.recipe.RecipeFactory;

import junit.textui.TestRunner;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Condition Trigger</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class ConditionTriggerTest extends TriggerTest {

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public static void main(String[] args) {
                TestRunner.run(ConditionTriggerTest.class);
        }

        /**
         * Constructs a new Condition Trigger test case with the given name.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public ConditionTriggerTest(String name) {
                super(name);
        }

        /**
         * Returns the fixture for this Condition Trigger test case.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        @Override
        protected ConditionTrigger getFixture() {
                return (ConditionTrigger)fixture;
        }

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see junit.framework.TestCase#setUp()
         * @generated
         */
        @Override
        protected void setUp() throws Exception {
                setFixture(RecipeFactory.eINSTANCE.createConditionTrigger());
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

} //ConditionTriggerTest

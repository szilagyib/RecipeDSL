/**
 */
package hu.bme.mit.mdsd.recipe.tests;

import hu.bme.mit.mdsd.recipe.Container;
import hu.bme.mit.mdsd.recipe.RecipeFactory;

import junit.textui.TestRunner;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Container</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class ContainerTest extends ToolTest {

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public static void main(String[] args) {
                TestRunner.run(ContainerTest.class);
        }

        /**
         * Constructs a new Container test case with the given name.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public ContainerTest(String name) {
                super(name);
        }

        /**
         * Returns the fixture for this Container test case.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        @Override
        protected Container getFixture() {
                return (Container)fixture;
        }

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see junit.framework.TestCase#setUp()
         * @generated
         */
        @Override
        protected void setUp() throws Exception {
                setFixture(RecipeFactory.eINSTANCE.createContainer());
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

} //ContainerTest

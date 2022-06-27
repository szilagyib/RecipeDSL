/**
 */
package hu.bme.mit.mdsd.recipe.tests;

import hu.bme.mit.mdsd.recipe.DeclContainmentRelation;
import hu.bme.mit.mdsd.recipe.RecipeFactory;

import junit.textui.TestRunner;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Decl Containment Relation</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class DeclContainmentRelationTest extends ContainmentRelationTest {

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public static void main(String[] args) {
                TestRunner.run(DeclContainmentRelationTest.class);
        }

        /**
         * Constructs a new Decl Containment Relation test case with the given name.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        public DeclContainmentRelationTest(String name) {
                super(name);
        }

        /**
         * Returns the fixture for this Decl Containment Relation test case.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        @Override
        protected DeclContainmentRelation getFixture() {
                return (DeclContainmentRelation)fixture;
        }

        /**
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see junit.framework.TestCase#setUp()
         * @generated
         */
        @Override
        protected void setUp() throws Exception {
                setFixture(RecipeFactory.eINSTANCE.createDeclContainmentRelation());
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

} //DeclContainmentRelationTest

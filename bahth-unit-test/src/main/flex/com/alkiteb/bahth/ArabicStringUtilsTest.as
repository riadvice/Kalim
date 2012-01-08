/*
   Copyright (C) 2012 Ghazi Triki <ghazi.nocturne@gmail.com>

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package com.alkiteb.bahth
{
    import flexunit.framework.Assert;

    public class ArabicStringUtilsTest
    {

        var basmalahWithDiacritics : String;
        var basmalahWithoutDiacritics : String;
        var salat : String;

        [Before]
        public function setUp() : void
        {
            basmalahWithDiacritics = "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ";
            basmalahWithoutDiacritics = "بسم الله الرحمن الرحيم";
            salat = "مُحَمَّدٌ رَسُولُ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَ سَلَّمَ وَ عَلَى آلِهِ وَ صَحْبِهِ أَجْمَعِينَ وَ مَنْ تَبِعَهُمْ بِإِحْسَانٍ إِلَى يَوْمِ الدِّينِ"
        }

        [After]
        public function tearDown() : void
        {
        }

        [BeforeClass]
        public static function setUpBeforeClass() : void
        {
        }

        [AfterClass]
        public static function tearDownAfterClass() : void
        {
        }

        [Test]
        public function searchWord() : void
        {
            var bismSearchResult : Array = ArabicStringUtils.search(basmalahWithDiacritics, "بسم");
            Assert.assertNotNull(bismSearchResult);
            Assert.assertEquals(bismSearchResult.length, 1)
        }

        [Test]
        public function searchWordPart() : void
        {
            var rhSearchResult = ArabicStringUtils.search(basmalahWithDiacritics, "رح");
            Assert.assertNotNull(rhSearchResult);
            Assert.assertEquals(rhSearchResult.length, 2)
            for each (var result : Object in rhSearchResult)
            {
                Assert.assertEquals(result.length, 5);
            }
        }


        [Test]
        public function searchWithYa() : void
        {
            var aliSearchResult;
            var aliSearchArray : Array = ['علي', 'على'];
            for each (var word : String in aliSearchArray)
            {
                aliSearchResult = ArabicStringUtils.search(salat, word);
                Assert.assertNotNull(aliSearchResult);
                Assert.assertEquals(aliSearchResult.length, 2)
            }
        }

        [Test]
        public function searchWithAlif() : void
        {
            var alifSearchResult;
            var aliSearchArray : Array = ['أ', 'ا', 'إ', 'آ'];
            for each (var word : String in aliSearchArray)
            {
                alifSearchResult = ArabicStringUtils.search(salat, word);
                Assert.assertNotNull(alifSearchResult);
                Assert.assertEquals(alifSearchResult.length, 8)
            }
        }

        [Test]
        public function searchWithWaw() : void
        {
            var wawSearchResult;
            var aliSearchArray : Array = ['ؤ', 'و'];
            for each (var word : String in aliSearchArray)
            {
                wawSearchResult = ArabicStringUtils.search(salat, word);
                Assert.assertNotNull(wawSearchResult);
                Assert.assertEquals(wawSearchResult.length, 6)
            }
        }

        [Test]
        public function removeDiacritics() : void
        {
            Assert.assertEquals(ArabicStringUtils.removeDiacritics(basmalahWithDiacritics), basmalahWithoutDiacritics);
        }

    }
}

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
package com.alkiteb.kalim
{

    /**
     *
     * @author Ghazi Triki
     *
     */
    public class ArabicStringUtils
    {

        /**
         * Performs a search operation on a string.
         *
         * @param value The string to search in.
         * @param searchString The string to find.
         * @param strict By default is false. Using the defautl behavior will generate a regular expression
         * to find the searchString. If is set to true he will try to find the searchString as it as.
         * @return
         *
         */
        public static function search( value : String, searchString : String, strict : Boolean = false ) : Array
        {
            var resultArray : Array = [];
            var searchRegExp : RegExp = new RegExp(!strict ? constructSearchRegExp(searchString) : searchString, "g");
            var result : Object = searchRegExp.exec(value);
            while (result != null)
            {
                result.foundValue = result[0];
                result.length = result.foundValue.length;

                // We clean the object
                delete result.input;
                delete result[0];

                // We push the last result into resultArray
                resultArray.push(result);

                // We try to find the next match
                searchRegExp.lastIndex = result.index + result.length;
                result = searchRegExp.exec(value);
            }
            return resultArray.length > 0 ? resultArray : null;
        }

        /**
         * Removes diactritics from an arabic string.
         *
         * @param value A string to be modified
         * @return A new string without arabic diactritics
         *
         */
        public static function removeDiacritics( value : String ) : String
        {
            return removeCharacters(value, getDiacriticsCodes());
        }

        /**
         * Removes characters from a string.
         *
         * @param value A string to modify
         * @param characterCodes An array of character codes to be removed from the string
         * @return A new string without characters to remove
         *
         */
        public static function removeCharacters( value : String, characterCodes : Array ) : String
        {
            var diacrlticsPattern : RegExp = new RegExp(constructRegExpAlternatives(characterCodes), "g");
            return value.replace(diacrlticsPattern, '');
        }

        /**
         * Joins an Array into a string using '|' character, it will be used for
         * RegExp definition.
         *
         * @param characters Characters array to be joined
         * @return A string joined array with '|'
         *
         */
        private static function constructRegExpAlternatives( characters : Array ) : String
        {
            return characters.join('|');
        }

        /**
         * Constructs RegExp groups containing diacritics.
         *
         * @param characters Diacritics characters array.
         * @return
         *
         */
        private static function constructDiacriticsRegExpGroup( characters : Array ) : String
        {
            return "(?:" + String.fromCharCode(ArabicCharacters.SHADDA) + ")?" + "(?:" + constructRegExpAlternatives(characters) + ")?";
        }

        /**
         * Builds a RegExp non capturing group
         * @param characters Characters alternatives array
         * @return
         *
         */
        private static function buildNonCaptRegExpGroup( characters : Array ) : String
        {
            return "(?:" + constructRegExpAlternatives(characters) + ")";
        }

        /**
         * Constructs a string that will be used by search RegExp for arabic search.
         *
         * @param searchString
         * @return
         *
         */
        private static function constructSearchRegExp( searchString : String ) : String
        {
            var regExpPattern : String = searchString.split('').join(constructDiacriticsRegExpGroup(getDiacriticsCodes())) +
                constructDiacriticsRegExpGroup(getDiacriticsCodes());
            regExpPattern = regExpPattern.replace(new RegExp(buildNonCaptRegExpGroup(getAlifAlternativeCodes()), "g"), buildNonCaptRegExpGroup(getAlifAlternativeCodes()));
            regExpPattern = regExpPattern.replace(new RegExp(buildNonCaptRegExpGroup(getWawAlternativeCodes()), "g"), buildNonCaptRegExpGroup(getWawAlternativeCodes()));
            regExpPattern = regExpPattern.replace(new RegExp(buildNonCaptRegExpGroup(getYaAlternativeCodes()), "g"), buildNonCaptRegExpGroup(getYaAlternativeCodes()));
            regExpPattern = regExpPattern.replace(new RegExp(buildNonCaptRegExpGroup(getTeMarbutaAlternativeCodes()), "g"), buildNonCaptRegExpGroup(getTeMarbutaAlternativeCodes()));
            return regExpPattern;
            
        }

        /**
         * @return Returns an array containing diactritics characters
         */
        public static function getDiacriticsCodes() : Array
        {
            return [String.fromCharCode(ArabicCharacters.KASRA), String.fromCharCode(ArabicCharacters.KASRATAN),
                String.fromCharCode(ArabicCharacters.FATHA), String.fromCharCode(ArabicCharacters.FATHATAN),
                String.fromCharCode(ArabicCharacters.DAMMA), String.fromCharCode(ArabicCharacters.DAMMATAN),
                String.fromCharCode(ArabicCharacters.SHADDA), String.fromCharCode(ArabicCharacters.SUKUN),
                String.fromCharCode(ArabicCharacters.MADDA), String.fromCharCode(ArabicCharacters.SUPERSCRIPT_ALEF)]
        }

        /**
         * @return Returns an array containing alternatives for ALIF arabic character
         */
        public static function getAlifAlternativeCodes() : Array
        {
            return [String.fromCharCode(ArabicCharacters.ALIF), String.fromCharCode(ArabicCharacters.ALIF_MADDA),
                String.fromCharCode(ArabicCharacters.ALIF_HAMZA_ABOVE), String.fromCharCode(ArabicCharacters.ALIF_HAMZA_BELOW),
                String.fromCharCode(ArabicCharacters.ALIF_WASLA)];
        }

        /**
         * @return Returns an array containing alternatives for WAW arabic character
         */
        public static function getWawAlternativeCodes() : Array
        {
            return [String.fromCharCode(ArabicCharacters.WAW), String.fromCharCode(ArabicCharacters.ALIF_WAW)]
        }

        /**
         * @return Returns an array containing alternatives for YA arabic character
         */
        public static function getYaAlternativeCodes() : Array
        {
            return [String.fromCharCode(ArabicCharacters.YA), String.fromCharCode(ArabicCharacters.ALIF_MAQSURA)]
        }
        
        /**
         * @return Returns an array containing alternatives for TE_MARBUTA arabic character
         */
        public static function getTeMarbutaAlternativeCodes() : Array
        {
            return [String.fromCharCode(ArabicCharacters.TE_MARBUTA), String.fromCharCode(ArabicCharacters.HE)]
        }

    }
}

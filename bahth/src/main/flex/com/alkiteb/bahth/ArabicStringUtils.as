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

    /**
     *
     * @author Ghazi Triki
     *
     */
    public class ArabicStringUtils
    {
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
         *
         * @return Returns an array containing diactritics characters
         *
         */
        public static function getDiacriticsCodes() : Array
        {
            return [String.fromCharCode(ArabicCharacters.KASRA), String.fromCharCode(ArabicCharacters.KASRATAN),
                String.fromCharCode(ArabicCharacters.FATHA), String.fromCharCode(ArabicCharacters.FATHATAN),
                String.fromCharCode(ArabicCharacters.DAMMA), String.fromCharCode(ArabicCharacters.DAMMATAN),
                String.fromCharCode(ArabicCharacters.SHADDA), String.fromCharCode(ArabicCharacters.SUKUN),
                String.fromCharCode(ArabicCharacters.MADDA), String.fromCharCode(ArabicCharacters.SUPERSCRIPT_ALEF)]
        }

    }
}

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

    public class ArabicStringUtils
    {
        public static function removeDiacrltics( value : String ) : String
        {
            var diacrlticsPattern : RegExp = new RegExp(constructRegExpAlternatives(String.fromCharCode(ArabicCharacters.KASRA),
                String.fromCharCode(ArabicCharacters.KASRATAN), String.fromCharCode(ArabicCharacters.FATHA), String.fromCharCode(ArabicCharacters.FATHATAN),
                String.fromCharCode(ArabicCharacters.DAMMA), String.fromCharCode(ArabicCharacters.DAMMATAN), String.fromCharCode(ArabicCharacters.SHADDA),
                String.fromCharCode(ArabicCharacters.SUKUN)), "g");
            return value.split(diacrlticsPattern).join('');
        }

        private static function constructRegExpAlternatives( ... params ) : String
        {
            return params.join('|');
        }

    }
}

/*
   Copyright (C) 2012-2013 RIADVICE <ghazi.triki@riadvice.tn>

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
package com.riadvice.kalim
{

    /**
     * A class containing code of most used arabic characters.
     * Take a look at http://unicode.org/charts/PDF/Unicode-4.1/U41-0600.pdf
     */
    public class ArabicCharacters
    {
        // Decoration characters
        public static const TATWEEL : uint = 0x640; // ـ

        // Alphabet letters
        public static const HAMZA : uint = 0x621; // ء
        public static const ALIF_MADDA : uint = 0x622; // آ
        public static const ALIF_HAMZA_ABOVE : uint = 0x623; // أ
        public static const ALIF_WAW : uint = 0x624; // ؤ
        public static const ALIF_HAMZA_BELOW : uint = 0x625; // إ
        public static const ALIF_HAMZA_YA : uint = 0x626; // ئ
        public static const ALIF_WASLA : uint = 0x671; // ٱ
        public static const ALIF_MAQSURA : uint = 0x649; // ى
        public static const ALIF_BELOW : uint = 0x656; //  ٖ
        public static const ALIF : uint = 0x627; // ا
        public static const SUPERSCRIPT_ALEF : uint = 0x670; //  ٰ
        public static const BA : uint = 0x628; // ب
        public static const TE_MARBUTA : uint = 0x629; // ة
        public static const TE : uint = 0x62A; // ت
        public static const THE : uint = 0x62B; // ث
        public static const JIM : uint = 0x62C; // ج
        public static const HA : uint = 0x62D; // ح
        public static const KHA : uint = 0x62E; // خ
        public static const DAL : uint = 0x62F; // د
        public static const DHAL : uint = 0x630; // ذ
        public static const RA : uint = 0x631; // ر
        public static const ZAIN : uint = 0x632; // ز
        public static const SIN : uint = 0x633; // س
        public static const SHIN : uint = 0x634; // ش
        public static const SAD : uint = 0x635; // ص
        public static const DHAD : uint = 0x636; // ض
        public static const TA : uint = 0x637; // ط
        public static const DHA : uint = 0x638; // ظ
        public static const AIN : uint = 0x639; // ع
        public static const GHAIN : uint = 0x63A; // غ
        public static const FA : uint = 0x641; // ف
        public static const QAF : uint = 0x642; // ق
        public static const KAF : uint = 0x643; // ك
        public static const LAM : uint = 0x644; // ل
        public static const MIM : uint = 0x645; // م
        public static const NOUN : uint = 0x646; // ن
        public static const HE : uint = 0x647; // ه
        public static const WAW : uint = 0x648; // و
        public static const YA : uint = 0x64A; // ي

        // Hamza
        public static const HAMZA_ABOVE : uint = 0x654; //  ٔ
        public static const HAMZA_BELOW : uint = 0x655; //  ٕ

        // Diacrltics
        public static const FATHATAN : uint = 0x64b; //  ً
        public static const DAMMATAN : uint = 0x64c; //  ٌ
        public static const DAMMATN_POINTED : uint = 0x65e //  ٞ  // Non tanween Dammatan in Uthmanic Font
        public static const KASRATAN : uint = 0x64d; //  ٍ

        public static const FATHA : uint = 0x64e; //  َ
        public static const DAMMA : uint = 0x64f; //  ُ
        public static const KASRA : uint = 0x650; //  ِ
        public static const SHADDA : uint = 0x651; //  ّ
        public static const SUKUN : uint = 0x652; //  ْ
        public static const MADDA : uint = 0x653; //  ٓ
        public static const DAMMA_INVERTED : uint = 0x657 //  ٗ


        // Quran Reading Waqf Symbols
        public static const WAQF_SALA : uint = 0x6d6; //  ۖ
        public static const WAQF_QALA : uint = 0x6d7; //  ۗ
        public static const WAQF_SMALL_MEEM : uint = 0x6d8; //  ۘ
        public static const WAQF_LA : uint = 0x6d9; //  ۙ
        public static const WAQF_JEEM : uint = 0x6da; //  ۚ
        public static const WAQF_THREE_DOT : uint = 0x6db; //  ۛ
        public static const WAQF_HIGH_SEEN : uint = 0x6dc; //  ۜ
        public static const RECTANGULAR_ZERO : uint = 0x6e0; //  ۠

        public static const SMALL_HIGH_KHA : uint = 0x6e1; //  ۡ
        public static const SMALL_HIGH_MIM : uint = 0x6e2; //  ۢ

        // Quran decoration
        public static const AYA_END : uint = 0x6dd; // ۝
        public static const SAJDA_PLACE : uint = 0x6e9; // ۩
        public static const RUB_EL_HIZB : uint = 0x6de; //  ۞

        // Quran Reading Symbols
        public static const SMALL_LOW_SEEN : uint = 0x6e3; //  ۣ
        public static const HIGH_MADDA : uint = 0x6e4; //  ۤ
        public static const SMALL_WAW : uint = 0x6e5; // ۥ
        public static const SMALL_YA : uint = 0x6e6; // ۦ
        public static const SMALL_HIGH_YA : uint = 0x6e7; //  ۧ
        public static const SMALL_NOUN : uint = 0x6e8; //  ۨ
        public static const HIGH_POINT : uint = 0x6ec; //  ۬
        public static const LOW_POINT : uint = 0x65c; //  ٜ
        public static const SMALL_ROUNDED_ZERO : uint = 0x6df; //  ۟

        // Punctuation
        public static const ARABIC_QUESION_MARK : uint = 0x61f; // ؟
    }
}

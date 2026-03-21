// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * Copyright (C) 2026 Obvodny
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

module crossutils;

import std;

namespace crossutils {

std::pair<std::unique_ptr<wchar_t []>, size_t> mbs_to_wcs(char source[]) {
    size_t source_len = std::strlen(source);
    size_t result_size = source_len + 1;

    std::pair<std::unique_ptr<wchar_t []>, size_t> result {new wchar_t[result_size], 0};
    result.second = std::mbstowcs(result.first.get(), source, result_size);
    return result;

}

wchar_t to_wchar(char ch) {
    wchar_t wch = L'\0';
    std::mbtowc(&wch, &ch, 1);
    return wch;
}

wchar_t to_wchar(wchar_t wch) {
    return wch;
}

wchar_t wchar_preferred_separator = L'\0';

void ensure_wchar_preferred_separator() {
    using path_char_t = std::filesystem::path::value_type;
    static_assert(
        std::is_same_v<path_char_t, char> || std::is_same_v<path_char_t, wchar_t>, 
        "Unsupported Type. std::filesystem::path::value_type should be char or wchar_t."
    );
    if (wchar_preferred_separator == L'\0') {
        wchar_preferred_separator = to_wchar(std::filesystem::path::preferred_separator);
    }
}

bool is_separator(wchar_t wch) {
    ensure_wchar_preferred_separator();
    return wch == L'/' || wch == wchar_preferred_separator;
}

wchar_t get_wchar_preferred_seperator() {
    ensure_wchar_preferred_separator();
    return wchar_preferred_separator;
}

size_t cut_trailing_separator(const wchar_t path[], size_t end) {
    size_t last = end;
    while(last >= 1) {
        if (crossutils::is_separator(path[last - 1])) {
            last--;
        }
        else {
            break;
        }
    }
    return last;
}

size_t cut_after_last_separator(const wchar_t path[], size_t end) {
    size_t last = end;
    while(last >= 1) {
        if (crossutils::is_separator(path[last - 1])) {
            break;
        }
        else {
            last--;
        }
    }
    return last;
}

}

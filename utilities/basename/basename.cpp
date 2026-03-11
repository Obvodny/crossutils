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

import std;

wchar_t to_wchar(char ch) {
    wchar_t wch = L'\0';
    std::mbtowc(&wch, &ch, 1);
    return wch;
}

wchar_t to_wchar(wchar_t wch) {
    return wch;
}

bool is_separator(wchar_t wch, wchar_t wchar_preferred_separator) {
    return wch == L'/' || wch == wchar_preferred_separator;
}

int main(int argc, char *argv[]) {

    if (argc <= 1) {
        return 1;
    }
    if (argv[1][0] == '\0') {
        std::wcout << std::endl;
        return 0;
    }

    using path_char_t = std::filesystem::path::value_type;
    static_assert(
        std::is_same_v<path_char_t, char> || std::is_same_v<path_char_t, wchar_t>, 
        "Unsupported Type. std::filesystem::path::value_type should be char or wchar_t."
    );

    size_t char_path_len = std::strlen(argv[1]);
    size_t wchar_path_size = 2 * char_path_len + 1;

    std::unique_ptr<wchar_t []> wchar_path {new wchar_t[wchar_path_size]};
    size_t len = std::mbstowcs(wchar_path.get(), argv[1], wchar_path_size);

    wchar_t preferred_separator = to_wchar(std::filesystem::path::preferred_separator);

    std::size_t end;
    if (is_separator(wchar_path[len - 1], preferred_separator)) {
        end = len - 1;
        while(end >= 1) {
            if (is_separator(wchar_path[end - 1], preferred_separator)) {
                end--;
            }
            else {
                break;
            }
        }
    } else {
        end = len;
    }

    if (end == 0) {
        std::wcout << preferred_separator << std::endl;
        return 0;
    }

    std::size_t begin = end - 1;
    while(begin >= 1) {
        if (wchar_path[begin - 1] == L'/' || wchar_path[begin - 1] == preferred_separator) {
            break;
        }
        begin--;
    }

    if (argc >= 3) {
        size_t char_suffix_len = std::strlen(argv[2]);
        size_t wchar_suffix_size = 2 * char_suffix_len + 1;
        std::unique_ptr<wchar_t[]> wchar_suffix {new wchar_t[wchar_suffix_size]};

        size_t suffix_len = std::mbstowcs(wchar_suffix.get(), argv[2], wchar_suffix_size);

        if (end >= begin + suffix_len) {
            size_t pidx = end - 1; // path index
            size_t sidx = suffix_len - 1; // suffix index
            bool match_suffix = true;
            while(pidx <= end && pidx >= begin) {
                if (wchar_path[pidx] == wchar_suffix[sidx]) {
                    if (sidx == 0) {
                        break;
                    }
                }
                else {
                    match_suffix = false;
                    break;
                }
                pidx--;
                sidx--;
            }
            if (match_suffix && (pidx != begin)) {
                end = pidx;
            }
        }
    }

    std::wcout.write(&wchar_path[begin], end - begin) << std::endl;

    return 0;
}


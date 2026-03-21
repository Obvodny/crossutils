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
import crossutils;

int main(int argc, char *argv[]) {

    if (argc <= 1) {
        return 1;
    }
    if (argv[1][0] == '\0') {
        std::wcout << std::endl;
        return 0;
    }

    auto [wchar_path, wchar_path_len] = crossutils::mbs_to_wcs(argv[1]);

    size_t end = crossutils::cut_trailing_separator(wchar_path.get(), wchar_path_len);

    if (end == 0) {
        std::wcout << crossutils::get_wchar_preferred_seperator();
        std::wcout << std::endl;
        return 0;
    }

    size_t begin = crossutils::cut_after_last_separator(wchar_path.get(), end);

    if (argc >= 3) {
        auto [wchar_suffix, suffix_len] = crossutils::mbs_to_wcs(argv[2]);
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


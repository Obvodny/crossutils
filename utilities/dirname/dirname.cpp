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
        std::wcout << L'.' << std::endl;
        return 0;
    }

    auto [wchar_path, wchar_path_len] = crossutils::mbs_to_wcs(argv[1]);

    size_t basename_end = crossutils::cut_trailing_separator(wchar_path.get(), wchar_path_len);
    if (basename_end == 0) {
        std::wcout << crossutils::get_wchar_preferred_seperator() << std::endl;
        return 0;
    }

    size_t basename_begin = crossutils::cut_after_last_separator(wchar_path.get(), basename_end);

    if (basename_begin == 0) {
        std::wcout << L'.' << std::endl;
        return 0;
    }

    size_t end = crossutils::cut_trailing_separator(wchar_path.get(), basename_begin);

    std::wcout.write(wchar_path.get(), end);
    std::wcout << std::endl;

    return 0;
}

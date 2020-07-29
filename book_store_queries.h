//
// Created by Lucas Kujawski on 29/07/2020.
//

#ifndef MYSQL_WITH_CPP_BOOK_STORE_QUERIES_H
#define MYSQL_WITH_CPP_BOOK_STORE_QUERIES_H
string VAR = "{{X}}";
string QUERY_1  = "select count(b.book_id) from book b join book_author ba using (book_id) join author a using (author_id) where b.book_name like '%{{X}}%' or a.first_name like '%{{X}}%' or a.last_name like '%{{X}}%'";
std::string ReplaceAll(std::string str, const std::string& from, const std::string& to) {
    size_t start_pos = 0;
    while((start_pos = str.find(from, start_pos)) != std::string::npos) {
        str.replace(start_pos, from.length(), to);
        start_pos += to.length(); // Handles case where 'to' is a substring of 'from'
    }
    return str;
}

#endif //MYSQL_WITH_CPP_BOOK_STORE_QUERIES_H

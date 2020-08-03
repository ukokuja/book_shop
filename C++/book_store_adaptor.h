//
// Created by Lucas Kujawski on 29/07/2020.
//

#pragma once

#include <map>
#include <string>
#include <vector>
#include <stdio.h>

using namespace std;

class SimpleResolver : public QueryResolver {
protected:
    string _text;
public:
    SimpleResolver(string text) {
        _text = text;
    }

    void run(MYSQL_RES *res_set) {
        MYSQL_ROW row;
        char buff[255] = {0};
        cout << "************************" << endl;
        row = mysql_fetch_row(res_set);
        sprintf(buff, _text.c_str(), row[0]);
        cout << buff << endl;
        cout << "************************" << endl;
        cout << endl << endl;
    }
};


class ListResolver : public SimpleResolver {
    vector<string> _headers;
    int _headersQuantity;
public:
    ListResolver(string text, vector<string> headers, int headersQuantity) : SimpleResolver(text) {
        _headers = headers;
        _headersQuantity = headersQuantity;
    }

    string getHeader(int i) {
        if (i < static_cast<int>(_headers.size())) {
            return _headers[i];
        }
        return "";
    }

    string getItem(int i, char *p) {
        string r = p;
        if (i < static_cast<int>(_headers.size()) && _headers[i].empty()) {
            r = string("\n\e[1m") + p + string("\e[0m");
        }
        return r;
    }

    void run(MYSQL_RES *res_set) {
        MYSQL_ROW row;
        cout << "************************" << endl;
        cout << _text << endl;
        while (((row = mysql_fetch_row(res_set)) != NULL)) {
            for (int h = 0; h < _headersQuantity; h++) {
                cout << getHeader(h) << getItem(h, row[h]) << endl;
            }
        }
        cout << endl << "************************" << endl;
        cout << endl << endl;
    }
};

map<int, string> getActionMap() {
    map<int, string> actionMap;
    actionMap[1] = "Check If Book Exists is in stock";
    actionMap[2] = "Check Who is the oldest Client";
    actionMap[3] = "Check Which is the oldest book in stock";
    actionMap[4] = "Check the open orders";
    actionMap[5] = "Check how many copies of a book were sold by the store";
    actionMap[6] = "Check who is the most popular author between two dates";
    actionMap[7] = "Check the three most buying clients ever";
    actionMap[8] = "Check which is the most translated book in stock";
    actionMap[9] = "Check the buying history of a client";
    actionMap[10] = "Check the order history of a client";
    actionMap[11] = "Check the shipping cost per book";
    actionMap[12] = "Check the details of all the spliited deliveries of a client";
    actionMap[13] = "Check the status of a delivery";
    actionMap[14] = "Check the amount of sales deliveried by Xpress on a specific month";
    actionMap[15] = "Check the incomes of the store using Bit on a specific month";
    actionMap[16] = "Check the sales from latest 12 months that left more profit than the average";
    actionMap[17] = "Check the amount of sales from latest 12 months deliveried by Doar Israel and Xpress";
    actionMap[18] = "Check all deliveries that contained two editorials of the same book";
    actionMap[19] = "Check all the clients that bought a book in the past but haven't bought again for the last 2 years";
    actionMap[20] = "Check all the clients that after 14 days haven't bought the book that have ordered after they were communicated that it arrived to the store";
    actionMap[21] = "Check all the book in stock per month";
    actionMap[22] = "Check the amount and cost of the books aquired by the store between two dates";
    actionMap[23] = "Check the profit in a specific month";
    actionMap[24] = "Check the sale average per month";
    actionMap[25] = "Check the net salary of a employee";
    actionMap[26] = "Check the employee that have sold the most on a specific month";
    return actionMap;
}

map<int, vector<pair<string, string> > > getParamsMap() {
    map<int, vector<pair<string, string> > > paramsMap;
    paramsMap[1] = vector<pair<string, string> >(1);
    paramsMap[1][0] = pair<string, string>(make_pair("{{X}}", "Please enter the book name or author name: "));
    paramsMap[5] = vector<pair<string, string> >(1);
    paramsMap[5][0] = pair<string, string>(make_pair("{{X}}", "Please enter the book name or author name: "));
    paramsMap[6] = vector<pair<string, string> >(2);
    paramsMap[6][0] = pair<string, string>(make_pair("{{X}}", "Please enter the starting date [YYYY-MM-DD]: "));
    paramsMap[6][1] = pair<string, string>(make_pair("{{Y}}", "Please enter the ending date [YYYY-MM-DD]: "));
    paramsMap[9] = vector<pair<string, string> >(2);
    paramsMap[9][0] = pair<string, string>(make_pair("{{X}}", "Please enter the first name: "));
    paramsMap[9][1] = pair<string, string>(make_pair("{{Y}}", "Please enter the last name: "));
    paramsMap[10] = vector<pair<string, string> >(1);
    paramsMap[10][0] = pair<string, string>(make_pair("{{X}}", "Please enter the client id: "));
    paramsMap[12] = vector<pair<string, string> >(1);
    paramsMap[12][0] = pair<string, string>(make_pair("{{X}}", "Please enter the client id: "));
    paramsMap[13] = vector<pair<string, string> >(1);
    paramsMap[13][0] = pair<string, string>(make_pair("{{X}}", "Please enter the tracking number: "));
    paramsMap[14] = vector<pair<string, string> >(1);
    paramsMap[14][0] = pair<string, string>(make_pair("{{X}}", "Please enter the month: "));
    paramsMap[15] = vector<pair<string, string> >(1);
    paramsMap[15][0] = pair<string, string>(make_pair("{{X}}", "Please enter the month: "));
    paramsMap[22] = vector<pair<string, string> >(2);
    paramsMap[22][0] = pair<string, string>(make_pair("{{X}}", "Please enter the starting date [YYYY-MM-DD]: "));
    paramsMap[22][1] = pair<string, string>(make_pair("{{Y}}", "Please enter the ending date [YYYY-MM-DD]: "));
    paramsMap[23] = vector<pair<string, string> >(1);
    paramsMap[23][0] = pair<string, string>(make_pair("{{X}}", "Please enter the month: "));
    paramsMap[25] = vector<pair<string, string> >(3);
    paramsMap[25][0] = pair<string, string>(make_pair("{{X}}", "Please enter the month: "));
    paramsMap[25][1] = pair<string, string>(make_pair("{{Y}}", "Please enter the year: "));
    paramsMap[25][2] = pair<string, string>(make_pair("{{Z}}", "Please enter the employee id: "));
    paramsMap[26] = vector<pair<string, string> >(2);
    paramsMap[26][0] = pair<string, string>(make_pair("{{X}}", "Please enter the month: "));
    paramsMap[26][1] = pair<string, string>(make_pair("{{Y}}", "Please enter the year: "));
    return paramsMap;
}

map<int, string> getQueries() {
    map<int, string> queries;
    queries[1] = "select count(b.book_id) from book b join book_author ba using (book_id) join author a using (author_id) where b.book_name like '%{{X}}%' or a.first_name like '%{{X}}%' or a.last_name like '%{{X}}%'";
    queries[2] = "select concat(concat(first_name, ' '), last_name) from client order by created_date limit 1;";
    queries[3] = "select b.book_name, eb.publication_year, weight, amount_pages, bt.language_name, bs.start_date from book_copy join book_storage bs using (book_copy_id) join editorial_book eb using (editorial_book_id) join book b using (book_id) join book_translation bt using (book_id) where end_date is null order by bs.start_date limit 1;";
    queries[4] = "select b.book_name, concat(concat(c2.first_name, ' '), last_name), oo.created_date from oorder oo left join communication c using (order_id) join book b using (book_id) join client c2 using (client_id) where communication_id is null order by oo.created_date;";
    queries[5] = "select count(bs.sale_id) from sale join book_sale bs using (sale_id) join book_copy copy2 using (book_copy_id) join editorial_book eb using (editorial_book_id) join book b using (book_id) join book_author ba using (book_id) join author a using (author_id) where b.book_name like '%{{X}}%' or a.first_name like '%{{X}}%' or a.last_name like '%{{X}}%';";
    queries[6] = "select concat(concat(a.first_name, ' '), a.last_name) from sale join book_sale bs using (sale_id) join book_copy copy2 using (book_copy_id) join editorial_book book using (editorial_book_id) join book_author ba using (book_id) join author a using (author_id) where created_date > '1900-01-01' and created_date < '2010-01-01' group by author_id order by count(book_sale_id) desc limit 1;";
    queries[7] = "select concat(concat(c.first_name, ' '), c.last_name) from sale join client c using (client_id) group by c.client_id order by count(sale_id) desc limit 3;";
    queries[8] = "select b.book_name from book b join book_translation translation using (book_id) group by b.book_id order by count(b.book_id) desc limit 1;";
    queries[9] = "select b.book_name, (copy2.original_price + copy2.profit) as final_price, s.created_date  from sale s join client c using (client_id) join book_sale using (sale_id) join book_copy copy2 using (book_copy_id) join editorial_book book2 using (editorial_book_id) join book b using (book_id) where first_name = '{{X}}' and last_name = '{{Y}}' order by c.created_date;";
    queries[10] = "select book_name, created_date, (CASE WHEN orders_with_com.order_id is null THEN false ELSE true END) as was_found, (CASE WHEN orders_with_sale.order_id is null THEN false ELSE true END) as was_aquired from oorder left join ( select oorder.order_id from oorder join communication c on oorder.order_id = c.order_id where client_id = 1 ) as orders_with_com using (order_id) left join ( select oo.order_id from oorder oo join sale s using (client_id) join book_sale bs using (sale_id) join book_copy copy2 using (book_copy_id) join editorial_book book2 using (editorial_book_id) where s.created_date >= oo.created_date and oo.client_id = 1 ) as orders_with_sale using (order_id) join book b using(book_id) where client_id = {{X}};";
    queries[11] = "select delivery_by_book.book_name, delivery_by_book.delivery_name, delivery_by_book.company_name, TRUNCATE((delivery_by_book.price_per_kilo * eb.weight), 2) as delivery_price from (select * from book b, delivery_type d) delivery_by_book join editorial_book eb using (book_id);";
    queries[12] = "select book_name, tracking_number, delivery_name, company_name, delivery_status_name from delivery join book_sale_delivery delivery2 on delivery.delivery_id = delivery2.delivery_id join delivery_type t on delivery.delivery_type_id = t.delivery_type_id join delivery_status s on delivery.delivery_status_id = s.delivery_status_id join book_sale sale on delivery2.book_sale_id = sale.book_sale_id join book_copy copy2 on sale.book_copy_id = copy2.book_copy_id join editorial_book book2 using (editorial_book_id) join book b using (book_id) join ( select count(bs.book_sale_id), sale_id from book_sale bs join book_sale_delivery delivery on bs.book_sale_id = delivery.book_sale_id join delivery d on delivery.delivery_id = d.delivery_id join sale using (sale_id) where client_id = {{X}} group by sale_id having count(bs.book_sale_id) > 1 ) splitted_deliveries using (sale_id);";
    queries[13] = "select delivery_status_name from delivery_status join delivery d using (delivery_status_id) where tracking_number = '{{X}}';";
    queries[14] = "select count(*) from book_sale_delivery join book_sale sale on book_sale_delivery.book_sale_id = sale.book_sale_id join delivery d on book_sale_delivery.delivery_id = d.delivery_id join delivery_type t on d.delivery_type_id = t.delivery_type_id join sale s on sale.sale_id = s.sale_id where company_name = 'XPress' and month(s.created_date) = {{X}};";
    queries[15] = "select TRUNCATE(IFNULL(sum(profit + original_price), 0), 2) as total from book_sale bs join book_copy copy2 on bs.book_copy_id = copy2.book_copy_id join sale s using (sale_id) join payment_type t2 using (payment_type_id) where payment_name = 'Bit' and month(s.created_date) = {{X}};";
    queries[16] = "select book_name, CONCAT(CONCAT(first_name, ' '), last_name), (profit + original_price) as final_price from book_sale bs join book_copy copy2 using (book_copy_id) join sale s using (sale_id) join payment_type t2 using (payment_type_id) join editorial_book eb using (editorial_book_id) join book b using (book_id) join client c using (client_id) where s.created_date < NOW() and s.created_date > DATE_ADD(NOW(), INTERVAL -12 MONTH) and profit > (select avg(profit) as total from book_sale bs join book_copy copy2 on bs.book_copy_id = copy2.book_copy_id join sale s using (sale_id) join payment_type t2 using (payment_type_id));";
    queries[17] = "select company_name, count(book_delivery_id) from book_sale_delivery bs join book_sale sale on bs.book_sale_id = sale.book_sale_id join delivery d on bs.delivery_id = d.delivery_id join delivery_type t on d.delivery_type_id = t.delivery_type_id join book_copy copy2 on sale.book_copy_id = copy2.book_copy_id join editorial_book book2 using (editorial_book_id) join sale s on sale.sale_id = s.sale_id where s.created_date < NOW() and s.created_date > DATE_ADD(NOW(), INTERVAL -12 MONTH) group by company_name;";
    queries[18] = "select book_name, tracking_number, delivery_status_name, delivery_name, company_name from delivery join ( select count(distinct book.editorial_book_id), book_id, delivery2.delivery_id from delivery  join book_sale_delivery delivery2 on delivery.delivery_id = delivery2.delivery_id join book_sale sale on delivery2.book_sale_id = sale.book_sale_id join book_copy copy2 on sale.book_copy_id = copy2.book_copy_id join editorial_book book on copy2.editorial_book_id = book.editorial_book_id group by book_id, delivery2.delivery_id having count(distinct book.editorial_book_id) > 1 ) multiple_edition_deliveries using (delivery_id) join delivery_status s using (delivery_status_id) join delivery_type t using (delivery_type_id) join book using (book_id);";
    queries[19] = "select CONCAT(CONCAT(first_name, ' '), last_name), phone_number, mobile_number, created_date from client where client_id not in ( select client_id from sale s where s.created_date < NOW() and s.created_date > DATE_ADD(NOW(), INTERVAL -24 MONTH) );";
    queries[20] = "select CONCAT(CONCAT(first_name, ' '), last_name), phone_number, mobile_number, created_date from client where client_id in ( select o.client_id from communication c join oorder o using (order_id) join editorial_book using (book_id) join book_copy copy2 using (editorial_book_id) join book_sale sale using (book_copy_id) join editorial_book bought_book on copy2.editorial_book_id = bought_book.editorial_book_id join sale s using (sale_id) where c.created_date < DATE_ADD(NOW(), INTERVAL -14 DAY) and bought_book.book_id = editorial_book.book_id and s.client_id = o.client_id and s.created_date >= c.created_date );";
    queries[21] = "select YEAR(dd), MONTH(dd), sum(is_bw) from ( SELECT c.dd, bs.book_copy_id, bs.start_date, IFNULL(bs.end_date, DATE(NOW())) as end_date, (CASE WHEN c.dd between start_date and IFNULL(bs.end_date, DATE(NOW())) THEN 1 ELSE 0 END) as is_bw from calendar c, book_storage bs join storage s using (storage_id) where storage_name = 'Warehouse' ) books_per_month group by 2, 1 order by 1, 2;";
    queries[22] = "select count(book_copy_id), sum(original_price) from purchase join book_copy copy2 using (book_copy_id) where created_date between '{{X}}' and '{{Y}}';";
    queries[23] = "select (select sum(original_price + profit) from sale join book_sale bs on sale.sale_id = bs.sale_id join book_copy copy2 on bs.book_copy_id = copy2.book_copy_id where MONTH(created_date) = {{X}}) - (select sum(original_price) from purchase join book_copy copy2 using (book_copy_id) where MONTH(created_date) = {{X}}) as month_profit;";
    queries[24] = "select YEAR(dd), count(s.sale_id)/12 from calendar left join sale s on YEAR(s.created_date) = YEAR(dd) group by YEAR(dd) order by YEAR(dd) asc;";
    queries[25] = "select IFNULL(sum(hours_count * hourly_salary), 0) as net_salary from employee_history join employee_schedule es using (employee_id) join employee e using(employee_id) where month_id = {{X}} and year_id = {{Y}} and employee_id = {{Z}}";
    queries[26] = "select CONCAT(CONCAT(e.first_name, ' '), e.last_name) from sale join employee e using(employee_id) where month(created_date) = {{X}} and year(created_date) = {{Y}} group by employee_id order by count(sale_id) desc limit 1";

    return queries;
};

map<int, QueryResolver *> getResolver() {
    map<int, QueryResolver *> resolvers;
    resolvers[1] = new SimpleResolver("There are %s books");
    resolvers[2] = new SimpleResolver("The client is: %s.");
    resolvers[3] = new ListResolver("The book is: ",
                                    {"", "Published on: ", "Weight: ", "Amount of pages: ", "Written in: ",
                                     "That arrived at: "}, 6);
    resolvers[4] = new ListResolver("The orders are: ", {"", "Done by: ", "On: "}, 3);
    resolvers[5] = new SimpleResolver("The store sold: %s copies.");
    resolvers[6] = new SimpleResolver("The author is: %s.");
    resolvers[7] = new ListResolver("The clients are: ", {}, 1);
    resolvers[8] = new SimpleResolver("The book is: %s.");
    resolvers[9] = new ListResolver("The buying history is: ", {"", "Price", "On: "}, 3);
    resolvers[10] = new ListResolver("The order history is: ", {"", "On: ", "Was found: ", "Was bought: "},
                                     4);
    resolvers[11] = new ListResolver("The shipping cost are: ",
                                     {"", "Delivery type: ", "Delivered by: ", "Costs: $"}, 4);
    resolvers[12] = new ListResolver("The details are: ",
                                     {"", "Tracking number: ", "Delivery type: ", "Deliveried by: ", "Status: "}, 5);
    resolvers[13] = new SimpleResolver("The order status is: %s.");
    resolvers[14] = new SimpleResolver("The amount of sales is: %s");
    resolvers[15] = new SimpleResolver("The incomes are: %s.");
    resolvers[16] = new ListResolver("The sales are: ", {"", "Client: ", "Cost: $"}, 3);
    resolvers[17] = new ListResolver("The amount of sales are: ", {"", "Sales: "}, 2);
    resolvers[18] = new ListResolver("The deliveries are: ",
                                     {"", "Tracking number: ", "Status: ", "Delivery type: ", "Delivered by: "},
                                     5);
    resolvers[19] = new ListResolver("The clients are: ", {"", "Phone: ", "Mobile: ", "Joined on: "},
                                     4);
    resolvers[20] = new ListResolver("The clients are: ", {"", "Phone: ", "Mobile: ", "Joined on: "},
                                     4);
    resolvers[21] = new ListResolver("The books are: ", {"", "Month: ", "Books: "}, 3);
    resolvers[22] = new ListResolver("During that date: ", {"Purchases: ", "Cost: $"}, 2);
    resolvers[23] = new SimpleResolver("The profit is: %s.");
    resolvers[24] = new ListResolver("The averages are:", {"", "Average: "}, 2);
    resolvers[25] = new SimpleResolver("The net salary was: %s");
    resolvers[26] = new SimpleResolver("The employee is: %s");
    return resolvers;
}

map<int, vector<string>> getPreQueries() {
    map<int, vector<string>> preQueries;
    preQueries[21] = {"drop table calendar if exists;",
                      "CREATE TEMPORARY TABLE if not exists calendar (dd varchar(20) not null unique);",
                      "insert into calendar (dd) select * from (select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) dd from (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0, (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1, (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2, (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3, (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v where dd between (select min(start_date) from book_storage bs join storage s using (storage_id) where storage_name = 'Warehouse') and NOW() and dd like '%-01';"};
    preQueries[24] = {
            "drop table calendar;",
            "CREATE TEMPORARY TABLE if not exists calendar (dd varchar(20) not null unique);"
            "insert into calendar (dd) select * from (select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) dd from (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0, (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1, (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2, (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3, (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v where dd between (select min(created_date) from sale) and NOW() and dd like '%-01-01';"
    };
    return preQueries;
}















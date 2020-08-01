/*
 * ===================================================================
 *
 *       Filename:  database.cc
 *
 *    Description:  Definition of MySQL Class for accessing database
 *
 *        Created:  Friday 22 February 2013 02:07:49  IST
 *       Compiler:  gcc
 *
 *         Author:  Mandeep Kaur, meghasimak@gmail.com
 *        License:  GNU General Public License
 *      Copyright:  Copyright (c) 2013, Great Developers
 *
 * ===================================================================
 */

/**-------------------------------------------------------------------
 *  Include mysql.h file local header file(declaration of class)
 *------------------------------------------------------------------*/
#include "database.h"
#include "book_store_queries.h"


/**
 *--------------------------------------------------------------------
 *       Class:  MySQL
 *      Method:  MySQL :: MySQL()
 * Description:  Constructor to initialize database conectivity
 *--------------------------------------------------------------------
 */

MySQL::MySQL() {
    connect = mysql_init(NULL);
    if (!connect) {
        cout << "MySQL Initialization Failed";
    }

    connect = mysql_real_connect(connect, SERVER, USER, PASSWORD, DATABASE, 0, NULL, 0);

    if (connect) {
        cout << "Connection Succeeded\n";
    } else {
        cout << "Connection Failed\n";
    }
}

/**
 *--------------------------------------------------------------------
 *       Class:  MySQL
 *      Method:  MySQL :: ShowTables()
 * Description:  Show tables in database
 *--------------------------------------------------------------------
 */

void MySQL::ShowTables() {
    /** Add MySQL Query */
    mysql_query(connect, "select * from book");

    i = 1;

    res_set = mysql_store_result(connect);

    unsigned int numrows = mysql_num_rows(res_set);

    cout << " Tabless in " << DATABASE << " database " << endl;

    system("pause");
}

void MySQL::run_query(int, string& query, vector<string>& prequeries, vector<pair<string, string> >& parameters,
                      QueryResolver *resolver) {
    cin.ignore(1000, '\n');
    for (size_t j = 0; j < parameters.size(); j++) {
        cout << endl << parameters[j].second;
        string buff;
        getline(cin, buff);
        query = ReplaceAll(query, parameters[j].first, buff);
    }
    for (auto &prequery : prequeries) {
        mysql_query(connect, prequery.c_str());
    }
    mysql_query(connect, query.c_str());
    res_set = mysql_store_result(connect);
    resolver->run(res_set);
}

/**
 *--------------------------------------------------------------------
 *       Class:  MySQL
 *      Method:  MySQL :: ~MySQL()
 * Description:  Destructor of MySQL class for closing mysql
 *               connection
 *--------------------------------------------------------------------
 */

MySQL::~MySQL() {
    mysql_close(connect);
}

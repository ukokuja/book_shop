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

MySQL :: MySQL()
{
    connect = mysql_init(NULL);
    if ( !connect )
    {
        cout << "MySQL Initialization Failed";
    }

    connect = mysql_real_connect(connect, SERVER, USER, PASSWORD, DATABASE, 0,NULL,0);

    if ( connect )
    {
        cout << "Connection Succeeded\n";
    }

    else
    {
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

void MySQL :: ShowTables()
{
    /** Add MySQL Query */
    mysql_query (connect,"select * from book");

    i = 1;

    res_set = mysql_store_result(connect);

    unsigned int numrows = mysql_num_rows(res_set);

    cout << " Tabless in " << DATABASE << " database " << endl;
    while (((row=mysql_fetch_row(res_set)) != NULL))
    {
        cout << row[i] << endl;
    }
    system("pause");
}
void MySQL :: find_book_by_name_is_in_storage()
{
    string buff;
    cout << endl << "Type the book name or author name: ";
    cin.ignore(1000, '\n');
    getline(cin, buff);
    MYSQL_ROW row = get_res(ReplaceAll(QUERY_1, VAR, buff));
    if (stoi(row[0]) > 0) {
        cout << "Yes, we have " << row[0] << " of those";
        return;
    }
    cout << "No, we don't have any book";
}

MYSQL_ROW MySQL::get_res(string query) {
    mysql_query (connect, query.c_str());
//    cout << query << endl;
    res_set = mysql_store_result(connect);
    return mysql_fetch_row(res_set);
}


/**
 *--------------------------------------------------------------------
 *       Class:  MySQL
 *      Method:  MySQL :: ~MySQL()
 * Description:  Destructor of MySQL class for closing mysql
 *               connection
 *--------------------------------------------------------------------
 */

MySQL :: ~MySQL()
{
    mysql_close (connect);
}

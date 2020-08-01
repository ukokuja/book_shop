/*
 * ===================================================================
 *
 *       Filename:  database-main.cpp
 *
 *    Description:  Main Method
 *
 *        Created:  Thursday 28 February 2013 10:53:59  IST
 *       Compiler:  gcc
 *
 *         Author:  Mandeep Kaur, meghasimak@gmail.com
 *        License:  GNU General Public License
 *      Copyright:  Copyright (c) 2013, Great Developers
 *
 * ===================================================================
 */

/**-------------------------------------------------------------------
 *  \mainpage MySQL Connectivity with C++
 *
 *  This is a working code example of using C++ to interface with MySQL.
 *  Steps:
 *
 *  \li Download this code \n
 *      $ git clone https://github.com/megha55/mysql-with-cpp.git
 *
 *  \li For installing MySQL Connector for C++ \n
 *      $ make install
 *
 *  \li Change database details in database-detail.h file.
 *
 *  \li To run example \n
 *      $ make
 *
 *------------------------------------------------------------------*/

/**-------------------------------------------------------------------
 *  Include required header files
 *------------------------------------------------------------------*/

#include "database.h"
#include "book_store_adaptor.h"

int main(void) {
    MySQL db;

    int select = 99;
    cout << "Welcome, please select one choice" << endl;
    while (select != 0) {
        map<int, string> actionMap = getActionMap();
        map<int, vector<pair<string, string> > > paramsMap = getParamsMap();
        map<int, string> queriesMap = getQueries();
        map<int, vector<string>> preQueriesMap = getPreQueries();
        map<int, QueryResolver*> resolverMap = getResolver();
        cout << "0) Exit" << endl;
        int i = 1;
        for (auto action : actionMap) {
            cout << i << ") " << action.second << endl;
            i++;
        }

        cin >> select;
        if (select < 1) {
            cout << "Bye!" << endl;
            exit(EXIT_SUCCESS);
        } else if (select < 27) {
            db.run_query(select, queriesMap[select],preQueriesMap[select], paramsMap[select], resolverMap[select]);
        } else {
            cout << "Option not found!" << endl;
        }
    }

    return 0;
}

/*
 * ===================================================================
 *
 *       Filename:  database.h
 *
 *    Description:  Declaring MySQL class for using database.
 *
 *        Created:  Friday 22 February 2013 12:48:40  IST
 *       Compiler:  gcc
 *
 *         Author:  Mandeep Kaur, meghasimak@gmail.com
 *        License:  GNU General Public License
 *      Copyright:  Copyright (c) 2013, Great Developers
 *
 * ===================================================================
 */

/**-------------------------------------------------------------------
 *  Include database-detail.h and other files
 *------------------------------------------------------------------*/

#include <vector>
#include "header.h"
#include "database-detail.h"

/**
 * ===================================================================
 *        Class:  MySQL
 *  Description:  MySQL class for database accessability
 * ===================================================================
 */

class QueryResolver {
public:
    virtual void run(MYSQL_RES* res_set) = 0;
};

class MySQL
{
    protected:
        /** MySQL connectivity Variables */
        MYSQL *connect;
        MYSQL_RES *res_set;
        MYSQL_ROW row;

        unsigned int i;

    public:
        /** MySQL Constructor */
        MySQL();

        /** Function to show tables in database */
        void ShowTables();
        void run_query(int, string&, vector<string>&, vector< pair<string, string> >&, QueryResolver*);

        /** MySQL Destructor */
        ~MySQL();
};

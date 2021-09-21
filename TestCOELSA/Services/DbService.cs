using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Linq;
using System.Data.SqlClient;
using System.Data;

namespace TestCOELSA.Services
{
    public class DbServices
    {
        public SqlConnection connection { get; set; }

        public DbServices(string connStr)
        {
            connection = new SqlConnection(connStr);

        }

        public List<Contact> getContacts(int pageIndex, int pageSize)
        {
            SqlCommand cmd = new SqlCommand(@$"SELECT * from contact 
                                            order by Contact.Company
                                            offset {pageIndex} rows fetch next {pageSize} rows only", connection);

            connection.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            List<Contact> contacts = new List<Contact>();

            while(dr.Read())
            {
                contacts.Add(new Contact
                {
                    Id = dr.GetInt32("Id"),
                    Company = dr.GetString("Company"),
                    Email = dr.GetString("Email"),
                    FirstName = dr.GetString("FirstName"),
                    LastName = dr.GetString("LastName"),
                    PhoneNumber = dr.GetString("PhoneNumber")
                }); ;
            }

            connection.Close();

            return contacts;
        }

        public Contact create(Contact contact)
        {
            SqlCommand cmd = new SqlCommand(@$"insert into Contact (FirstName, LastName, Company, Email, PhoneNumber) 
                                            values ( '{contact.FirstName}' , '{contact.LastName}' , '{contact.Company}'
                                            , '{contact.Email}' , '{contact.PhoneNumber}' ); SELECT MAX(ID) AS LastID FROM Contact;",connection);

            if (connection.State == ConnectionState.Closed)
                connection.Open();

             contact.Id = (int)cmd.ExecuteScalar();
            if (connection.State == ConnectionState.Open)
                connection.Close();

            return contact;
        }

        public Contact update(Contact contact, int id)
        {
            SqlCommand cmd = new SqlCommand(@$"UPDATE Contact SET FirstName = '{contact.FirstName}', LastName = '{contact.LastName}',
                                            Email = '{contact.Email}', Company = '{contact.Company}', PhoneNumber = '{contact.PhoneNumber}' where id = " + id, connection);

            if (connection.State == ConnectionState.Closed)
                connection.Open();

            cmd.ExecuteNonQuery();
            contact.Id = id;

            if (connection.State == ConnectionState.Open)
                connection.Close();

            return contact;
        }

        public void delete(int id)
        {
            SqlCommand cmd = new SqlCommand(@$"DELETE FROM Contact where id = " + id, connection);

            if (connection.State == ConnectionState.Closed)
                connection.Open();

            cmd.ExecuteNonQuery();

            if (connection.State == ConnectionState.Open)
                connection.Close();
        }
    }
}

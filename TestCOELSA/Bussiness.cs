using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TestCOELSA
{
    public class Bussiness
    {
        public static Tuple<bool,string> validateContact(Contact contact)
        {
            if (string.IsNullOrWhiteSpace(contact.FirstName))
                return new Tuple<bool, string>(false,"El nombre ingresado es inválido.");

            if (string.IsNullOrWhiteSpace(contact.LastName))
                return new Tuple<bool, string>(false, "El apellido ingresado es inválido.");

            if (!IsValidEmail(contact.Email))
                return new Tuple<bool, string>(false, "El email ingresado es inválido.");

            if (string.IsNullOrWhiteSpace(contact.Company))
                return  new Tuple<bool, string>(false, "El compañía ingresado es inválido.");

            return new Tuple<bool, string>(true, null);


        }

        private static bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}

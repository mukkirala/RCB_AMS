using System;
using System.Data;
using ARP.DataLayer;

namespace ARP.BusinessLogic
{

    /// <summary>
    /// Summary description for PasswordManager
    /// </summary>
    public class PasswordManager
    {

        public PasswordManager()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public string generatePassword()
        {
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            Random r = new Random();
            builder.Append(randomString(4, true));
            builder.Append(r.Next(1000, 9999));
            builder.Append(randomString(2, false));
            return builder.ToString();
        }

        /// <summary>
        /// Generates a random string with the given length
        /// </summary>
        /// <param name="size">Size of the string</param>
        /// <param name="lowerCase">If true, generate lowercase string</param>
        /// <returns>Random string</returns>
        private string randomString(int size, bool lowerCase)
        {
            System.Text.StringBuilder builder = new System.Text.StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }


        public string sendNewPassword(string loginName, string emailId)
        {
            SQLDataAccessLayer objLayer = new SQLDataAccessLayer();
            string password = generatePassword();

            bool isValidUser =  objLayer.ForgotPassword(loginName, emailId, password);

            if (isValidUser)
                return password;
            else
                return "";

        }

      

    }
}

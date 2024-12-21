using AdMeStore.DbModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdMeStore.Classes
{
    public static class ConnectionHelper
    {
        public static adStoreEntities db = new adStoreEntities();
    }
}

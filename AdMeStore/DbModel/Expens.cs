//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AdMeStore.DbModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Expens
    {
        public int Id_expense { get; set; }
        public Nullable<int> Id_project { get; set; }
        public string Type_expense { get; set; }
        public Nullable<int> Amount { get; set; }
        public System.DateTime Date_expense { get; set; }
    
        public virtual Project Project { get; set; }
    }
}

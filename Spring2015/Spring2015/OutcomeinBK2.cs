//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Spring2015
{
    using System;
    using System.Collections.Generic;
    
    public partial class OutcomeinBK2
    {
        public int OutcomeBK2ID { get; set; }
        public int OutcomeID { get; set; }
        public int BKLevelID { get; set; }
    
        public virtual BKLevel2 BKLevel2 { get; set; }
        public virtual Outcome Outcome { get; set; }
    }
}

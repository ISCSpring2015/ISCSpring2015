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
    using System.ComponentModel.DataAnnotations;
    
    public partial class BKLevel2
    {
        public BKLevel2()
        {
            this.SubskillsinBk2 = new HashSet<SubskillsinBk2>();
            this.OutcomeinBK2 = new HashSet<OutcomeinBK2>();
        }
    
        public int BKLevel2ID { get; set; }
        public int BKLevel1ID { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
        public int NumberLevel1 { get; set; }
        [Display(Name = "BkLevel2Num")]
        public int NumberLevel2 { get; set; }
    
        public virtual BKLevel1 BKLevel1 { get; set; }
        public virtual ICollection<SubskillsinBk2> SubskillsinBk2 { get; set; }
        public virtual ICollection<OutcomeinBK2> OutcomeinBK2 { get; set; }
    }
}

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Spring2015.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Course
    {
        public Course()
        {
            this.Outcomes = new HashSet<Outcome>();
        }
    
        public int CourseID { get; set; }
        public Nullable<int> SectionID { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
        public Nullable<System.DateTime> InitialDate { get; set; }
        public Nullable<System.DateTime> ReleaseDate { get; set; }
        public Nullable<System.DateTime> CloseDate { get; set; }
        public string Purpose { get; set; }
    
        public virtual ICollection<Outcome> Outcomes { get; set; }
        public virtual Section Section { get; set; }
    }
}
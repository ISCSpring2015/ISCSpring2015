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
    
    public partial class Curriculum
    {
        public Curriculum()
        {
            this.BKLevel1 = new HashSet<BKLevel1>();
            this.SkillSets = new HashSet<SkillSet>();
            this.Sections = new HashSet<Section>();
        }
    
        public int CurriculumID { get; set; }
          [Required(ErrorMessage = "**Please Provide your Name", AllowEmptyStrings = false)]
        public string Name { get; set; }
          [Required(ErrorMessage = "**Please Provide your ShortName", AllowEmptyStrings = false)]
        public string ShortName { get; set; }
        public string Purpose { get; set; }
    
        public virtual ICollection<BKLevel1> BKLevel1 { get; set; }
        public virtual ICollection<SkillSet> SkillSets { get; set; }
        public virtual ICollection<Section> Sections { get; set; }
    }
}

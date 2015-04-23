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
    
    public partial class SkillSet
    {
        public SkillSet()
        {
            this.Skills = new HashSet<Skill>();
        }
    
        public int SkillsetID { get; set; }
         [Required(ErrorMessage = "**Please Provide your Name", AllowEmptyStrings = false)]
        public string Name { get; set; }
         [Required(ErrorMessage = "**Please Provide your ShortName", AllowEmptyStrings = false)]
        public string ShortName { get; set; }
        [Display(Name="SkillSetNumber")]
        public int skillSetNum1 { get; set; }
        public int CurriculumID { get; set; }
    
        public virtual Curriculum Curriculum { get; set; }
        public virtual ICollection<Skill> Skills { get; set; }
    }
}

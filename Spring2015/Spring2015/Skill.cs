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
    
    public partial class Skill
    {
        public Skill()
        {
            this.SubSkills = new HashSet<SubSkill>();
        }
    
        public int SkillID { get; set; }
        public Nullable<int> SkillsetID { get; set; }
        public Nullable<int> SkillSetNum1 { get; set; }
        public Nullable<int> SkillNum2 { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
    
        public virtual SkillSet SkillSet { get; set; }
        public virtual ICollection<SubSkill> SubSkills { get; set; }
    }
}

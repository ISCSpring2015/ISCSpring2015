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
    
    public partial class SubSkill
    {
        public SubSkill()
        {
            this.SubskillsinOutcomes = new HashSet<SubskillsinOutcome>();
            this.tblSubskillsinBk2 = new HashSet<SubskillsinBk2>();
        }
    
        public int SubskillsID { get; set; }
        public int SkillID { get; set; }
        public int OutcomeID { get; set; }
        public int BKLevel2Id { get; set; }
        public int SkillSetNum1 { get; set; }
        public int SkillNum2 { get; set; }
        public int SubSkillNum3 { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
        public string JobAdWords { get; set; }
    
        public virtual Skill Skill { get; set; }
        public virtual SubskillsinBk2 SubskillsinBk2 { get; set; }
        public virtual ICollection<SubskillsinOutcome> SubskillsinOutcomes { get; set; }
        public virtual ICollection<SubskillsinBk2> tblSubskillsinBk2 { get; set; }
    }
}

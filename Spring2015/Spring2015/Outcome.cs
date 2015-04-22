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
    
    public partial class Outcome
    {
        public Outcome()
        {
            this.OutcomeinBK2 = new HashSet<OutcomeinBK2>();
            this.SubskillsinOutcomes = new HashSet<SubskillsinOutcome>();
        }
    
        public int OutcomeID { get; set; }
        public int CourseID { get; set; }
        [Required(ErrorMessage = "**Please Provide your Name", AllowEmptyStrings = false)]
        public string Name { get; set; }
        [Required(ErrorMessage = "**Please Provide your ShortName", AllowEmptyStrings = false)]
        public string ShortName { get; set; }
        public Nullable<int> DepthOfKnowledge { get; set; }
        [Required(ErrorMessage = "**Please Provide your LearningUnit", AllowEmptyStrings = false)]
        public string LearningUnitNumber { get; set; }
    
        public virtual Course Course { get; set; }
        public virtual ICollection<OutcomeinBK2> OutcomeinBK2 { get; set; }
        public virtual ICollection<SubskillsinOutcome> SubskillsinOutcomes { get; set; }
    }
}

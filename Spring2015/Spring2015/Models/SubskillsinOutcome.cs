using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spring2015.Models
{
    public class Subskills_Outcome
    {
        public List<Outcome> Outcomes { get; set; }
        public List<SubSkill> Subskills { get; set; }
        public List<SubSkill> subskilloutcome { get; set; }
    }
}
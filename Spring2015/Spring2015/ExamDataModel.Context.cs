﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ExamdbContext : DbContext
    {
        public ExamdbContext()
            : base("name=ExamdbContext")
        
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BKLevel1> BKLevel1 { get; set; }
        public virtual DbSet<BKLevel2> BKLevel2 { get; set; }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<Curriculum> Curricula { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<Outcome> Outcomes { get; set; }
        public virtual DbSet<OutcomeinBK2> OutcomeinBK2 { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Section> Sections { get; set; }
        public virtual DbSet<Skill> Skills { get; set; }
        public virtual DbSet<SkillSet> SkillSets { get; set; }
        public virtual DbSet<SubSkill> SubSkills { get; set; }
        public virtual DbSet<SubskillsinBk2> SubskillsinBk2 { get; set; }
        public virtual DbSet<SubskillsinOutcome> SubskillsinOutcomes { get; set; }
    }
}

//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Program_quality_assessment
{
    using System;
    using System.Collections.Generic;
    
    public partial class PhaseMetrics
    {
        public int Id { get; set; }
        public int PhaseId { get; set; }
        public int MetricsId { get; set; }
    
        public virtual Phase Phase { get; set; }
        public virtual Metrics Metrics { get; set; }
    }
}
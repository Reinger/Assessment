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
    
    public partial class Metrics
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Metrics()
        {
            this.Element = new HashSet<Element>();
            this.PhaseMetrics = new HashSet<PhaseMetrics>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public int CriterionId { get; set; }
    
        public virtual Criterion Criterion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Element> Element { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhaseMetrics> PhaseMetrics { get; set; }
    }
}

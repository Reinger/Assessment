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
    
    public partial class Element
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Element()
        {
            this.Expert = true;
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Text { get; set; }
        public bool Expert { get; set; }
        public int MetricsId { get; set; }
    
        public virtual Metrics Metrics { get; set; }
    }
}
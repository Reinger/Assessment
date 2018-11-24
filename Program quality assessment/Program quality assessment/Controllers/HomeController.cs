using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Program_quality_assessment.Controllers
{
    public class HomeController : Controller
    {
        public static ModelContainer model = new ModelContainer();
        public static List<Factor> factor;
        public static List<Criterion> criterion;
        public static List<Metrics> metrics;
        public static List<Element> element;


        public ActionResult Index()
        {
            factor = new List<Factor>();
            criterion = new List<Criterion>();
            metrics = new List<Metrics>();
            element = new List<Element>();

            ViewBag.Classes = model.ClassSet.Select(x => x).ToList();
            ViewBag.Phases = model.PhaseSet.Select(x => x).ToList();

            return View();
        }

        public ActionResult Elements(int classId, int phaseId)
        {
            var classCriterion = model.ClassCriterionSet.Where(x => x.ClassId == classId).ToList();

            var phaseMetrics = model.PhaseMetricsSet.Where(x => x.PhaseId == phaseId).ToList();

            List<Metrics> metrics2 = new List<Metrics>();

            foreach (Metrics m in model.MetricsSet)
            {
                foreach (PhaseMetrics p in phaseMetrics)
                {
                    if (p.Metrics == m)
                    {
                        metrics.Add(m);
                    }
                }
            }

            foreach (Criterion c in model.CriterionSet)
            {
                foreach (ClassCriterion _class in classCriterion)
                {
                    if (_class.Criterion == c)
                    {
                        criterion.Add(c);
                    }
                }
            }

            foreach (Criterion c in criterion)
            {
                foreach (Factor f in model.FactorSet)
                {
                    if (c.Factor == f)
                    {
                        factor.Add(f);
                    }
                }
            }

            foreach (Criterion c in criterion)
            {
                foreach (Metrics m in metrics)
                {
                    if (m.Criterion == c)
                    {
                        metrics2.Add(m);
                    }
                }
            }

            foreach (Metrics m in metrics2)
            {
                metrics.Remove(m);
            }

            foreach (Metrics m in metrics)
            {
                foreach (Element e in model.ElementSet)
                {
                    if (e.Metrics == m)
                    {
                        element.Add(e);
                    }
                }
            }

            ViewBag.Elements = element;

            return View();
        }

        public ActionResult Result(string[] elements)
        {
            double[] f = new double[6];
            double[] c = new double[17];
            int[] n = new int[6];
            int[] nc = new int[17];
            int i = 0;

            foreach (Element e in element)
            {

                switch (e.Name[0])
                {
                    case 'Н':
                        if (elements[i].Length > 1)
                            f[0] += double.Parse(elements[i].Split('.')[0] + ',' + elements[i].Split('.')[1]);
                        else
                            f[0] += double.Parse(elements[i]);
                        n[0]++;
                        break;

                    case 'С':
                        if (elements[i].Length > 1)
                            f[1] += double.Parse(elements[i].Split('.')[0] + ',' + elements[i].Split('.')[1]);
                        else
                            f[1] += double.Parse(elements[i]);
                        n[1]++;
                        break;

                    case 'У':
                        if (elements[i].Length > 1)
                            f[2] += double.Parse(elements[i].Split('.')[0] + ',' + elements[i].Split('.')[1]);
                        else
                            f[2] += double.Parse(elements[i]);
                        n[2]++;
                        break;

                    case 'Э':
                        if (elements[i].Length > 1)
                            f[3] += double.Parse(elements[i].Split('.')[0] + ',' + elements[i].Split('.')[1]);
                        else
                            f[3] += double.Parse(elements[i]);
                        n[3]++;
                        break;

                    case 'Г':
                        if (elements[i].Length > 1)
                            f[4] += double.Parse(elements[i].Split('.')[0] + ',' + elements[i].Split('.')[1]);
                        else
                            f[4] += double.Parse(elements[i]);
                        n[4]++;
                        break;

                    case 'К':
                        if (elements[i].Length > 1)
                            f[5] += double.Parse(elements[i].Split('.')[0] + ',' + elements[i].Split('.')[1]);
                        else
                            f[5] += double.Parse(elements[i]);
                        n[5]++;
                        break;
                }

                if (elements[i].Length > 1)
                    c[e.Metrics.CriterionId - 1] += double.Parse(elements[i].Split('.')[0] + ',' + elements[i].Split('.')[1]);
                else
                    c[e.Metrics.CriterionId - 1] += double.Parse(elements[i]);

                nc[e.Metrics.CriterionId - 1]++;

                i++;
            }

            for (int j = 0; j < 6; j++)
            {
                f[j] = f[j] / (double)n[j];
            }

            for (int j = 0; j < 17; j++)
            {
                if (nc[j] != 0)
                    c[j] = c[j] / (double)nc[j];
                else
                    c[j] = -1;
            }

            ViewBag.F = f;
            ViewBag.C = c;


            //var a = Request.Form["elements"];
            return View();
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QuantumConcepts.CodeGenerator.Sample.Logic
{
    public static partial class TeacherLogic
    {
        static partial void PerformPreDeleteLogic(DataAccess.SampleObjectContext context, DataAccess.Teacher obj)
        {
            if (obj.Courses != null)
                foreach (DataAccess.Course course in obj.Courses)
                    CourseLogic.DeleteCourse(context, course.ID);
        }
    }
}

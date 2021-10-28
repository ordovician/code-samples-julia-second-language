function create_class(class::AbstractString)
    s = """
        /**
         * @class   vtk$class
         * @brief
         *
         * vtk$class is a concrete implementation of
        */

        #ifndef vtk$(class)_h
        #define vtk$(class)_h

        #include "vtkCommonDataModelModule.h" // For export macro
        #include "vtkCell.h"

        class VTKCOMMONDATAMODEL_EXPORT vtk$class : public vtkCell
        {
        public:
          static vtk$class *New();
          vtkTypeMacro(vtk$class,vtkCell);
          void PrintSelf(ostream& os, vtkIndent indent) override;

          int GetCellType() override {return VTK_$(uppercase(class));};

        protected:
          vtk$class();
          ~vtk$class() override;

        private:
          vtk$class(const vtk$class&) = delete;
          void operator=(const vtk$class&) = delete;
        };

        #endif
        """
    clipboard(s) # So we can easily paste class into code editor
    println(s)
end

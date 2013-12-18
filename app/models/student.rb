class Student < ActiveRecord::Base
    attr_accessible :course, :name

    # Write code allows a student to have many urls
    has_many :urls
    # accepts_nested_attributes_for :urls

    # Name is required
    validates :name, presence: true
    
    # validate that :name is in the list of allowed students
    validate :validate_student_name

    # Course is required
    validates :course, presence: true
    
    # validate that :course is correct
    validcourses = ['cs132a', 'cis113']
    validates :course, inclusion: { in: validcourses,
                                    message: ": Selection of your course ID is required." }

    def validate_student_name
        validStudentIDs = ['dputnam', 'adesilv1', 'ryaryy', 'rgorreap', 'ubenesch', 'zng1', 'jswanner', 'npachec2', 'avalenc7', 'bmckeand', 'mpernabe', 'dott', 'bernst', 'tcoffey1', 'gpaz', 'ywun', 'mweaver3', 'jsteele', 'pkassian', 'psakhark', 'jsotobus', 'bkrantzi', 'crosales', 'jmencha1', 'asushon', 'kchan131', 'mhankins', 'jmonto10', 'jreed13', 'ikim5', 'jpayne', 'ktieu', 'kposey1', 'dlouie11', 'zbazarra', 'tho36', 'tparas', 'amanayan', 'jgarc166']
        if not validStudentIDs.include?(name.downcase)
            errors.add(name, "is not in the registered list of student IDs.")
        end
    end 
end

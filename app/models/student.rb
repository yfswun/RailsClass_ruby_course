class Student < ActiveRecord::Base
    attr_accessible :course, :name

    # Write code allows a student to have many urls
    has_many :urls
    # validates_associated :urls

    # validates :name, presence: true

    # validate that :name is in the list of allowed students
    validStudentIDs = ['dputnam,adesilv1,ryaryy,rgorreap,ubenesch,zng1,jswanner,npachec2,avalenc7,bmckeand,mpernabe,dott,bernst,tcoffey1,gpaz,ywun,mweaver3,jsteele,pkassian,psakhark,jsotobus,bkrantzi,crosales,jmencha1,asushon,kchan131,mhankins,jmonto10,jreed13,ikim5,jpayne,ktieu,kposey1,dlouie11,zbazarra,tho36,tparas,amanayan,jgarc166']
    # validates :name, inclusion: { in: validStudentIDs,
                                  # case_sensitive: false,
                                  # message: "%{value} is not in the registered list of student IDs." }
    
    # validate that :course is correct
    # validCourses = ['CS 132A', 'cs132a', 'CIS 113', 'cis113']
    # validates :course, inclusion: { in: validCourses,
                                    # message: "You must select your course." }

end

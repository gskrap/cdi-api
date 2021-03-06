User.create(
  [{email: 'gskrap@gmail.com', first_name: 'George', last_name: 'Skrapits', password: 'gskrap', role: 3},
   {email: 'melissa.e.strain@gmail.com', first_name: 'Melissa', last_name: 'Strain', password: 'mestrain', role: 3},
   {email: 'aa@aa', first_name: 'Andrew', last_name: 'Adams', password: 'aa'},
   {email: 'bb@bb', first_name: 'Bianca', last_name: 'Brown', password: 'bb'},
   {email: 'cc@cc', first_name: 'Cathy', last_name: 'Crosby', password: 'cc'},
   {email: 'workstudy@workstudy', first_name: 'Wendy', last_name: 'WorkStudy', password: 'workstudy', role: 2},
   {email: 'teacher@teacher', first_name: 'Tiffany', last_name: 'Teacher', password: 'teacher', role: 1},
  ]
)

Group.create(
  [{name: 'Group A'},
   {name: 'Group B'},
   {name: 'Men'},
   {name: 'Women'},
   {name: 'Alumni'},
  ]
)

Location.create(
  [{name: 'Waffle House'},
   {name: 'Yoccos'},
  ]
)

GroupStudent.create(
  [{group_id: 1, student_id: 3},
   {group_id: 2, student_id: 4},
   {group_id: 3, student_id: 3},
   {group_id: 4, student_id: 4},
   {group_id: 4, student_id: 5},
   {group_id: 5, student_id: 3},
   {group_id: 5, student_id: 4},
   {group_id: 5, student_id: 5},
  ]
)

DanceClass.create(
  [{name: 'Ballet Bonanza', location_id: 1, start_time: '2020-06-07T21:55:30.620Z', end_time: '2020-06-07T21:55:30.620Z', notes: ''},
   {name: 'Super Salsa', location_id: 1, start_time: '2020-06-07T21:55:30.620Z', end_time: '2020-06-07T21:55:30.620Z', notes: ''},
   {name: 'Cha-cha a-go-go', location_id: 1, start_time: '2020-06-07T21:55:30.620Z', end_time: '2020-06-07T21:55:30.620Z', notes: ''},
   {name: 'So Modern it Hurts', location_id: 1, start_time: '2020-06-07T21:55:30.620Z', end_time: '2020-06-07T21:55:30.620Z', notes: ''},
   {name: 'Boring Ballroom', location_id: 1, start_time: '2020-06-07T21:55:30.620Z', end_time: '2020-06-07T21:55:30.620Z'}, notes: '',
  ]
)

GroupDanceClass.create(
  [{group_id: 1, dance_class_id: 1},
   {group_id: 1, dance_class_id: 2},
   {group_id: 5, dance_class_id: 2},
  ]
)

TeacherDanceClass.create(
  [{teacher_id: 7, dance_class_id: 1},
   {teacher_id: 7, dance_class_id: 2},
   {teacher_id: 7, dance_class_id: 3},
   {teacher_id: 7, dance_class_id: 4},
   {teacher_id: 7, dance_class_id: 5},
  ]
)

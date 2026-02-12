
CREATE TABLE courses (
    code_module VARCHAR(45),
    code_presentation VARCHAR(45),
    PRIMARY KEY (code_module, code_presentation)
);

CREATE TABLE assessments (
    code_module VARCHAR(45),
    code_presentation VARCHAR(45),
    id_assessment INT,
    assessment_type VARCHAR(45),
    date INT,
    weight INT,
    PRIMARY KEY (id_assessment),
    CONSTRAINT fk_module
        FOREIGN KEY (code_module, code_presentation) 
        REFERENCES courses (code_module, code_presentation)
);

CREATE TABLE vle (
    id_site INT,
    code_module VARCHAR(45),
    code_presentation VARCHAR(45),
    activity_type VARCHAR(45),
    PRIMARY KEY (id_site),
    CONSTRAINT fk_module2
        FOREIGN KEY (code_module, code_presentation)
        REFERENCES courses (code_module, code_presentation)
);




CREATE TABLE studentInfo (
    id_student INT,
    code_module VARCHAR(45) NOT NULL,
    code_presentation VARCHAR(45) NOT NULL,
    gender VARCHAR(16),
    final_result VARCHAR(45),
    primary key (id_student),
    CONSTRAINT fk_module3
        FOREIGN KEY (code_module, code_presentation)
        REFERENCES courses (code_module, code_presentation)
   );     
        
        
        
        
CREATE TABLE studentAssessment (
    id_assessment INT,
    id_student INT,
    score FLOAT,
    CONSTRAINT fk_assessment
        FOREIGN KEY (id_assessment)
        REFERENCES assessments (id_assessment),
    CONSTRAINT fk_student
        FOREIGN KEY (id_student)
        REFERENCES studentInfo (id_student)
);



CREATE TABLE studentVle (
    code_module VARCHAR(45),
    code_presentation VARCHAR(45),
    id_student INT,
    id_site INT,
    sum_click INT,
    CONSTRAINT fk_student_info
        FOREIGN KEY (id_student)
        REFERENCES studentInfo (id_student),
    CONSTRAINT fk_vle
        FOREIGN KEY (id_site)
        REFERENCES vle (id_site)
);

ALTER TABLE studentInfo ADD CONSTRAINT unique_module_presentation_student UNIQUE (code_module, code_presentation, id_student);



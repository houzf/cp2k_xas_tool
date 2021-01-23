MODULE string_type
    TYPE string
       INTEGER length
       CHARACTER(LEN=80)   :: string_data
    END TYPE string
    INTERFACE ASSIGNMENT(=)
       MODULE PROCEDURE c_to_s_assign, s_to_c_assign
    END INTERFACE
    INTERFACE OPERATOR(//)
       MODULE PROCEDURE string_concat
    END INTERFACE
 CONTAINS
    SUBROUTINE c_to_s_assign(s, c)
       TYPE (string), INTENT(OUT)    :: s
       CHARACTER(LEN=*), INTENT(IN)  :: c
       s%string_data = c
       s%length = LEN(c)
    END SUBROUTINE c_to_s_assign
    SUBROUTINE s_to_c_assign(c, s)
       TYPE (string), INTENT(IN)     :: s
       CHARACTER(LEN=*), INTENT(OUT) :: c
       c = s%string_data(1:s%length)
    END SUBROUTINE s_to_c_assign
    
    FUNCTION string_concat( s1, s2 ) result( s3 )
      TYPE(string), INTENT(IN) :: s1, s2
      TYPE(string) s3 
      s3%string_data = s1%string_data(1:s1%length) &
         // s2%string_data(1:s2%length)
      s3%length = s1%length + s2%length
    END FUNCTION string_concat

 END MODULE string_type

* Settings *
Resource           UAT-Lab7-resource.robot

* Test Cases *
NO_1: Open Form
    Open Browser To Form Page

NO_2: Record Success
    Input Firstname    Somsong
    Input Lastname    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Submit Contact Information
    Complete Page Should Be Open

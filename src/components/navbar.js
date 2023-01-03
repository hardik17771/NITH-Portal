import React from 'react';
import { FaBars } from 'react-icons/fa'
import {Nav,NavbarContainer, NavLogo, NavMenu ,MobileIcon, NavItem, NavLinks, NavBtn, NavBtnLink} from './navbarelements'
const Navbar = () => {
return (
<Nav>
<NavbarContainer>
<NavLogo to='/'>Admin Panel (Security Gaurd)</NavLogo>
{/* <MobileIcon>
  <FaBars />
</MobileIcon>
<NavMenu>
<NavItem>
<NavLinks to='about '>Home</NavLinks>
</NavItem>
<NavItem>
<NavLinks to='timeline '>Timeline</NavLinks>
</NavItem>
<NavItem>
<NavLinks to='sponsors '>Sponsors</NavLinks>
</NavItem>
<NavItem>
<NavLinks to='contact'>Contact Us</NavLinks>
</NavItem>
</NavMenu>
<NavBtn>
  <NavBtnLink to="/signin">
    Sign IN
  </NavBtnLink>
</NavBtn> */}
</NavbarContainer>
</Nav>
)};
export default Navbar;
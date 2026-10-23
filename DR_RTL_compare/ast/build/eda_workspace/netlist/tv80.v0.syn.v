/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 13:19:14 2026
/////////////////////////////////////////////////////////////


module tv80s ( m1_n, mreq_n, iorq_n, rd_n, wr_n, rfsh_n, halt_n, busak_n, A, 
        d_o, reset_n, clk, wait_n, int_n, nmi_n, busrq_n, di );
  output [15:0] A;
  output [7:0] d_o;
  input [7:0] di;
  input reset_n, clk, wait_n, int_n, nmi_n, busrq_n;
  output m1_n, mreq_n, iorq_n, rd_n, wr_n, rfsh_n, halt_n, busak_n;
  wire   iorq, no_read, write, intcycle_n, N33, N34, N35, N36, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, \i_tv80_core/n2177 ,
         \i_tv80_core/n2176 , \i_tv80_core/n2175 , \i_tv80_core/n2174 ,
         \i_tv80_core/n2173 , \i_tv80_core/n2172 , \i_tv80_core/n2171 ,
         \i_tv80_core/n2170 , \i_tv80_core/n2169 , \i_tv80_core/n2168 ,
         \i_tv80_core/n2167 , \i_tv80_core/n2166 , \i_tv80_core/n2165 ,
         \i_tv80_core/n2164 , \i_tv80_core/n2163 , \i_tv80_core/n2162 ,
         \i_tv80_core/n2161 , \i_tv80_core/n2160 , \i_tv80_core/n2159 ,
         \i_tv80_core/n2158 , \i_tv80_core/n2157 , \i_tv80_core/n2156 ,
         \i_tv80_core/n2155 , \i_tv80_core/n2154 , \i_tv80_core/n2153 ,
         \i_tv80_core/n2152 , \i_tv80_core/n2151 , \i_tv80_core/n2150 ,
         \i_tv80_core/n2149 , \i_tv80_core/n2148 , \i_tv80_core/n2147 ,
         \i_tv80_core/n2146 , \i_tv80_core/n2145 , \i_tv80_core/n2144 ,
         \i_tv80_core/n2143 , \i_tv80_core/n2142 , \i_tv80_core/n2141 ,
         \i_tv80_core/n2140 , \i_tv80_core/n2139 , \i_tv80_core/n2138 ,
         \i_tv80_core/n2137 , \i_tv80_core/n2136 , \i_tv80_core/n2135 ,
         \i_tv80_core/n2134 , \i_tv80_core/n2133 , \i_tv80_core/n2132 ,
         \i_tv80_core/n2131 , \i_tv80_core/n2130 , \i_tv80_core/n2129 ,
         \i_tv80_core/n2128 , \i_tv80_core/n2127 , \i_tv80_core/n2126 ,
         \i_tv80_core/n2125 , \i_tv80_core/n2124 , \i_tv80_core/n2123 ,
         \i_tv80_core/n2122 , \i_tv80_core/n2121 , \i_tv80_core/n2120 ,
         \i_tv80_core/n2119 , \i_tv80_core/n2118 , \i_tv80_core/n2117 ,
         \i_tv80_core/n2116 , \i_tv80_core/n2115 , \i_tv80_core/n2114 ,
         \i_tv80_core/n2113 , \i_tv80_core/n2112 , \i_tv80_core/n2111 ,
         \i_tv80_core/n2110 , \i_tv80_core/n2109 , \i_tv80_core/n2108 ,
         \i_tv80_core/n2107 , \i_tv80_core/n2106 , \i_tv80_core/n2105 ,
         \i_tv80_core/n2104 , \i_tv80_core/n2103 , \i_tv80_core/n2102 ,
         \i_tv80_core/n2101 , \i_tv80_core/n2100 , \i_tv80_core/n2099 ,
         \i_tv80_core/n2098 , \i_tv80_core/n2097 , \i_tv80_core/n2096 ,
         \i_tv80_core/n2095 , \i_tv80_core/n2094 , \i_tv80_core/n2093 ,
         \i_tv80_core/n2092 , \i_tv80_core/n2091 , \i_tv80_core/n2090 ,
         \i_tv80_core/n2089 , \i_tv80_core/n2088 , \i_tv80_core/n2087 ,
         \i_tv80_core/n2086 , \i_tv80_core/n2085 , \i_tv80_core/n2084 ,
         \i_tv80_core/n2083 , \i_tv80_core/n2082 , \i_tv80_core/n2081 ,
         \i_tv80_core/n2080 , \i_tv80_core/n2079 , \i_tv80_core/n2078 ,
         \i_tv80_core/n2077 , \i_tv80_core/n2076 , \i_tv80_core/n2075 ,
         \i_tv80_core/n2074 , \i_tv80_core/n2073 , \i_tv80_core/n2072 ,
         \i_tv80_core/n2071 , \i_tv80_core/n2070 , \i_tv80_core/n2069 ,
         \i_tv80_core/n2068 , \i_tv80_core/n2067 , \i_tv80_core/n2066 ,
         \i_tv80_core/n2065 , \i_tv80_core/n2064 , \i_tv80_core/n2063 ,
         \i_tv80_core/n2062 , \i_tv80_core/n2061 , \i_tv80_core/n2060 ,
         \i_tv80_core/n2059 , \i_tv80_core/n2058 , \i_tv80_core/n2057 ,
         \i_tv80_core/n2056 , \i_tv80_core/n2055 , \i_tv80_core/n2054 ,
         \i_tv80_core/n2053 , \i_tv80_core/n2052 , \i_tv80_core/n2051 ,
         \i_tv80_core/n2050 , \i_tv80_core/n2049 , \i_tv80_core/n2048 ,
         \i_tv80_core/n2047 , \i_tv80_core/n2046 , \i_tv80_core/n2045 ,
         \i_tv80_core/n2044 , \i_tv80_core/n2043 , \i_tv80_core/n2042 ,
         \i_tv80_core/n2041 , \i_tv80_core/n2040 , \i_tv80_core/n2039 ,
         \i_tv80_core/n2038 , \i_tv80_core/n2037 , \i_tv80_core/n2036 ,
         \i_tv80_core/n2035 , \i_tv80_core/n2034 , \i_tv80_core/n2033 ,
         \i_tv80_core/n2032 , \i_tv80_core/n2031 , \i_tv80_core/n2030 ,
         \i_tv80_core/n2029 , \i_tv80_core/n2028 , \i_tv80_core/n2027 ,
         \i_tv80_core/n2026 , \i_tv80_core/n2025 , \i_tv80_core/n2024 ,
         \i_tv80_core/n2023 , \i_tv80_core/n2022 , \i_tv80_core/n2021 ,
         \i_tv80_core/n2020 , \i_tv80_core/n2019 , \i_tv80_core/n2018 ,
         \i_tv80_core/n2017 , \i_tv80_core/n2016 , \i_tv80_core/n2015 ,
         \i_tv80_core/n2014 , \i_tv80_core/n2013 , \i_tv80_core/n2012 ,
         \i_tv80_core/n2011 , \i_tv80_core/n2010 , \i_tv80_core/n2009 ,
         \i_tv80_core/n2008 , \i_tv80_core/n2007 , \i_tv80_core/n2006 ,
         \i_tv80_core/n2005 , \i_tv80_core/n2004 , \i_tv80_core/n2003 ,
         \i_tv80_core/n2002 , \i_tv80_core/n2001 , \i_tv80_core/n2000 ,
         \i_tv80_core/n1999 , \i_tv80_core/n1998 , \i_tv80_core/n1997 ,
         \i_tv80_core/n1996 , \i_tv80_core/n1995 , \i_tv80_core/n1994 ,
         \i_tv80_core/n1993 , \i_tv80_core/n1992 , \i_tv80_core/n1991 ,
         \i_tv80_core/n1990 , \i_tv80_core/n1989 , \i_tv80_core/n1988 ,
         \i_tv80_core/n1987 , \i_tv80_core/n1986 , \i_tv80_core/n1985 ,
         \i_tv80_core/n1984 , \i_tv80_core/n1983 , \i_tv80_core/n1982 ,
         \i_tv80_core/n1981 , \i_tv80_core/n1980 , \i_tv80_core/n1979 ,
         \i_tv80_core/n1978 , \i_tv80_core/n1977 , \i_tv80_core/n1976 ,
         \i_tv80_core/n1975 , \i_tv80_core/n1974 , \i_tv80_core/n1973 ,
         \i_tv80_core/n1972 , \i_tv80_core/n1971 , \i_tv80_core/n1970 ,
         \i_tv80_core/n1969 , \i_tv80_core/n1968 , \i_tv80_core/n1967 ,
         \i_tv80_core/n1966 , \i_tv80_core/n1965 , \i_tv80_core/n1964 ,
         \i_tv80_core/n1963 , \i_tv80_core/n1962 , \i_tv80_core/n1961 ,
         \i_tv80_core/n1960 , \i_tv80_core/n1959 , \i_tv80_core/n1958 ,
         \i_tv80_core/n1957 , \i_tv80_core/n1956 , \i_tv80_core/n1955 ,
         \i_tv80_core/n1954 , \i_tv80_core/n1953 , \i_tv80_core/n1952 ,
         \i_tv80_core/n1951 , \i_tv80_core/n1950 , \i_tv80_core/n1949 ,
         \i_tv80_core/n1948 , \i_tv80_core/n1947 , \i_tv80_core/n1946 ,
         \i_tv80_core/n1944 , \i_tv80_core/n1943 , \i_tv80_core/n1942 ,
         \i_tv80_core/n1941 , \i_tv80_core/n1940 , \i_tv80_core/n1939 ,
         \i_tv80_core/n1938 , \i_tv80_core/n1937 , \i_tv80_core/n1936 ,
         \i_tv80_core/n1935 , \i_tv80_core/n1934 , \i_tv80_core/n1933 ,
         \i_tv80_core/n1932 , \i_tv80_core/n1931 , \i_tv80_core/n1930 ,
         \i_tv80_core/n1929 , \i_tv80_core/n1928 , \i_tv80_core/n1927 ,
         \i_tv80_core/n1926 , \i_tv80_core/n1925 , \i_tv80_core/n1924 ,
         \i_tv80_core/n1923 , \i_tv80_core/n1922 , \i_tv80_core/n1921 ,
         \i_tv80_core/n1920 , \i_tv80_core/n1919 , \i_tv80_core/n1918 ,
         \i_tv80_core/n1917 , \i_tv80_core/n1916 , \i_tv80_core/n1915 ,
         \i_tv80_core/n1914 , \i_tv80_core/n1913 , \i_tv80_core/n1912 ,
         \i_tv80_core/n1911 , \i_tv80_core/n1910 , \i_tv80_core/n1909 ,
         \i_tv80_core/n1908 , \i_tv80_core/n1907 , \i_tv80_core/n1906 ,
         \i_tv80_core/n1905 , \i_tv80_core/n1904 , \i_tv80_core/n1903 ,
         \i_tv80_core/n1902 , \i_tv80_core/n1901 , \i_tv80_core/n1900 ,
         \i_tv80_core/n1899 , \i_tv80_core/n1898 , \i_tv80_core/n1897 ,
         \i_tv80_core/n1896 , \i_tv80_core/n1895 , \i_tv80_core/n1894 ,
         \i_tv80_core/n1893 , \i_tv80_core/n1892 , \i_tv80_core/n1891 ,
         \i_tv80_core/n1890 , \i_tv80_core/n1889 , \i_tv80_core/n1888 ,
         \i_tv80_core/n1887 , \i_tv80_core/n1886 , \i_tv80_core/n1885 ,
         \i_tv80_core/n1884 , \i_tv80_core/n1883 , \i_tv80_core/n1882 ,
         \i_tv80_core/n1881 , \i_tv80_core/n1880 , \i_tv80_core/n1879 ,
         \i_tv80_core/n1878 , \i_tv80_core/n1877 , \i_tv80_core/n1876 ,
         \i_tv80_core/n1875 , \i_tv80_core/n1874 , \i_tv80_core/n1873 ,
         \i_tv80_core/n1872 , \i_tv80_core/n1871 , \i_tv80_core/n1870 ,
         \i_tv80_core/n1869 , \i_tv80_core/n1868 , \i_tv80_core/n1867 ,
         \i_tv80_core/n1866 , \i_tv80_core/n1865 , \i_tv80_core/n1864 ,
         \i_tv80_core/n1863 , \i_tv80_core/n1862 , \i_tv80_core/n1861 ,
         \i_tv80_core/n1860 , \i_tv80_core/n1859 , \i_tv80_core/n1858 ,
         \i_tv80_core/n1857 , \i_tv80_core/n1856 , \i_tv80_core/n1855 ,
         \i_tv80_core/n1854 , \i_tv80_core/n1853 , \i_tv80_core/n1852 ,
         \i_tv80_core/n1851 , \i_tv80_core/n1850 , \i_tv80_core/n1849 ,
         \i_tv80_core/n1848 , \i_tv80_core/n1847 , \i_tv80_core/n1846 ,
         \i_tv80_core/n1845 , \i_tv80_core/n1844 , \i_tv80_core/n1843 ,
         \i_tv80_core/n1842 , \i_tv80_core/n1841 , \i_tv80_core/n1840 ,
         \i_tv80_core/n1839 , \i_tv80_core/n1838 , \i_tv80_core/n1837 ,
         \i_tv80_core/n1836 , \i_tv80_core/n1835 , \i_tv80_core/n1834 ,
         \i_tv80_core/n1833 , \i_tv80_core/n1832 , \i_tv80_core/n1831 ,
         \i_tv80_core/n1830 , \i_tv80_core/n1829 , \i_tv80_core/n1828 ,
         \i_tv80_core/n1827 , \i_tv80_core/n1826 , \i_tv80_core/n1825 ,
         \i_tv80_core/n1824 , \i_tv80_core/n1823 , \i_tv80_core/n1822 ,
         \i_tv80_core/n1821 , \i_tv80_core/n1820 , \i_tv80_core/n1819 ,
         \i_tv80_core/n1818 , \i_tv80_core/n1817 , \i_tv80_core/n1816 ,
         \i_tv80_core/n1815 , \i_tv80_core/n1814 , \i_tv80_core/n1813 ,
         \i_tv80_core/n1812 , \i_tv80_core/n1811 , \i_tv80_core/n1810 ,
         \i_tv80_core/n1809 , \i_tv80_core/n1808 , \i_tv80_core/n1807 ,
         \i_tv80_core/n1806 , \i_tv80_core/n1805 , \i_tv80_core/n1804 ,
         \i_tv80_core/n1803 , \i_tv80_core/n1802 , \i_tv80_core/n1801 ,
         \i_tv80_core/n1800 , \i_tv80_core/n1799 , \i_tv80_core/n1798 ,
         \i_tv80_core/n1797 , \i_tv80_core/n1796 , \i_tv80_core/n1795 ,
         \i_tv80_core/n1794 , \i_tv80_core/n1793 , \i_tv80_core/n1792 ,
         \i_tv80_core/n1791 , \i_tv80_core/n1790 , \i_tv80_core/n1789 ,
         \i_tv80_core/n1788 , \i_tv80_core/n1787 , \i_tv80_core/n1786 ,
         \i_tv80_core/n1785 , \i_tv80_core/n1784 , \i_tv80_core/n1783 ,
         \i_tv80_core/n1782 , \i_tv80_core/n1781 , \i_tv80_core/n1780 ,
         \i_tv80_core/n1779 , \i_tv80_core/n1778 , \i_tv80_core/n1777 ,
         \i_tv80_core/n1776 , \i_tv80_core/n1775 , \i_tv80_core/n1774 ,
         \i_tv80_core/n1773 , \i_tv80_core/n1772 , \i_tv80_core/n1771 ,
         \i_tv80_core/n1770 , \i_tv80_core/n1769 , \i_tv80_core/n1768 ,
         \i_tv80_core/n1767 , \i_tv80_core/n1766 , \i_tv80_core/n1765 ,
         \i_tv80_core/n1764 , \i_tv80_core/n1763 , \i_tv80_core/n1762 ,
         \i_tv80_core/n1761 , \i_tv80_core/n1760 , \i_tv80_core/n1759 ,
         \i_tv80_core/n1758 , \i_tv80_core/n1757 , \i_tv80_core/n1756 ,
         \i_tv80_core/n1755 , \i_tv80_core/n1754 , \i_tv80_core/n1753 ,
         \i_tv80_core/n1752 , \i_tv80_core/n1751 , \i_tv80_core/n1750 ,
         \i_tv80_core/n1749 , \i_tv80_core/n1748 , \i_tv80_core/n1747 ,
         \i_tv80_core/n1746 , \i_tv80_core/n1745 , \i_tv80_core/n1744 ,
         \i_tv80_core/n1743 , \i_tv80_core/n1742 , \i_tv80_core/n1741 ,
         \i_tv80_core/n1740 , \i_tv80_core/n1739 , \i_tv80_core/n1738 ,
         \i_tv80_core/n1737 , \i_tv80_core/n1736 , \i_tv80_core/n1735 ,
         \i_tv80_core/n1734 , \i_tv80_core/n1733 , \i_tv80_core/n1732 ,
         \i_tv80_core/n1731 , \i_tv80_core/n1730 , \i_tv80_core/n1729 ,
         \i_tv80_core/n1728 , \i_tv80_core/n1727 , \i_tv80_core/n1726 ,
         \i_tv80_core/n1725 , \i_tv80_core/n1724 , \i_tv80_core/n1723 ,
         \i_tv80_core/n1722 , \i_tv80_core/n1721 , \i_tv80_core/n1720 ,
         \i_tv80_core/n1719 , \i_tv80_core/n1718 , \i_tv80_core/n1717 ,
         \i_tv80_core/n1716 , \i_tv80_core/n1715 , \i_tv80_core/n1714 ,
         \i_tv80_core/n1713 , \i_tv80_core/n1712 , \i_tv80_core/n1711 ,
         \i_tv80_core/n1710 , \i_tv80_core/n1709 , \i_tv80_core/n1708 ,
         \i_tv80_core/n1707 , \i_tv80_core/n1706 , \i_tv80_core/n1705 ,
         \i_tv80_core/n1704 , \i_tv80_core/n1703 , \i_tv80_core/n1702 ,
         \i_tv80_core/n1701 , \i_tv80_core/n1700 , \i_tv80_core/n1699 ,
         \i_tv80_core/n1698 , \i_tv80_core/n1697 , \i_tv80_core/n1696 ,
         \i_tv80_core/n1695 , \i_tv80_core/n1694 , \i_tv80_core/n1693 ,
         \i_tv80_core/n1692 , \i_tv80_core/n1691 , \i_tv80_core/n1690 ,
         \i_tv80_core/n1689 , \i_tv80_core/n1688 , \i_tv80_core/n1687 ,
         \i_tv80_core/n1686 , \i_tv80_core/n1685 , \i_tv80_core/n1684 ,
         \i_tv80_core/n1683 , \i_tv80_core/n1682 , \i_tv80_core/n1681 ,
         \i_tv80_core/n1680 , \i_tv80_core/n1679 , \i_tv80_core/n1678 ,
         \i_tv80_core/n1677 , \i_tv80_core/n1676 , \i_tv80_core/n1675 ,
         \i_tv80_core/n1674 , \i_tv80_core/n1673 , \i_tv80_core/n1672 ,
         \i_tv80_core/n1671 , \i_tv80_core/n1670 , \i_tv80_core/n1669 ,
         \i_tv80_core/n1668 , \i_tv80_core/n1667 , \i_tv80_core/n1666 ,
         \i_tv80_core/n1665 , \i_tv80_core/n1664 , \i_tv80_core/n1663 ,
         \i_tv80_core/n1662 , \i_tv80_core/n1661 , \i_tv80_core/n1660 ,
         \i_tv80_core/n1659 , \i_tv80_core/n1658 , \i_tv80_core/n1657 ,
         \i_tv80_core/n1656 , \i_tv80_core/n1655 , \i_tv80_core/n1654 ,
         \i_tv80_core/n1653 , \i_tv80_core/n1652 , \i_tv80_core/n1651 ,
         \i_tv80_core/n1650 , \i_tv80_core/n1649 , \i_tv80_core/n1648 ,
         \i_tv80_core/n1647 , \i_tv80_core/n1646 , \i_tv80_core/n1645 ,
         \i_tv80_core/n1644 , \i_tv80_core/n1643 , \i_tv80_core/n1642 ,
         \i_tv80_core/n1641 , \i_tv80_core/n1640 , \i_tv80_core/n1639 ,
         \i_tv80_core/n1638 , \i_tv80_core/n1637 , \i_tv80_core/n1636 ,
         \i_tv80_core/n1635 , \i_tv80_core/n1634 , \i_tv80_core/n1633 ,
         \i_tv80_core/n1632 , \i_tv80_core/n1631 , \i_tv80_core/n1630 ,
         \i_tv80_core/n1629 , \i_tv80_core/n1628 , \i_tv80_core/n1627 ,
         \i_tv80_core/n1626 , \i_tv80_core/n1625 , \i_tv80_core/n1624 ,
         \i_tv80_core/n1623 , \i_tv80_core/n1622 , \i_tv80_core/n1621 ,
         \i_tv80_core/n1620 , \i_tv80_core/n1619 , \i_tv80_core/n1618 ,
         \i_tv80_core/n1617 , \i_tv80_core/n1616 , \i_tv80_core/n1615 ,
         \i_tv80_core/n1614 , \i_tv80_core/n1613 , \i_tv80_core/n1612 ,
         \i_tv80_core/n1611 , \i_tv80_core/n1610 , \i_tv80_core/n1609 ,
         \i_tv80_core/n1608 , \i_tv80_core/n1607 , \i_tv80_core/n1606 ,
         \i_tv80_core/n1605 , \i_tv80_core/n1604 , \i_tv80_core/n1603 ,
         \i_tv80_core/n1602 , \i_tv80_core/n1601 , \i_tv80_core/n1600 ,
         \i_tv80_core/n1599 , \i_tv80_core/n1598 , \i_tv80_core/n1597 ,
         \i_tv80_core/n1596 , \i_tv80_core/n1595 , \i_tv80_core/n1594 ,
         \i_tv80_core/n1593 , \i_tv80_core/n1592 , \i_tv80_core/n1591 ,
         \i_tv80_core/n1590 , \i_tv80_core/n1589 , \i_tv80_core/n1588 ,
         \i_tv80_core/n1587 , \i_tv80_core/n1586 , \i_tv80_core/n1585 ,
         \i_tv80_core/n1584 , \i_tv80_core/n1583 , \i_tv80_core/n1582 ,
         \i_tv80_core/n1581 , \i_tv80_core/n1580 , \i_tv80_core/n1579 ,
         \i_tv80_core/n1578 , \i_tv80_core/n1577 , \i_tv80_core/n1576 ,
         \i_tv80_core/n1575 , \i_tv80_core/n1574 , \i_tv80_core/n1573 ,
         \i_tv80_core/n1572 , \i_tv80_core/n1571 , \i_tv80_core/n1570 ,
         \i_tv80_core/n1569 , \i_tv80_core/n1568 , \i_tv80_core/n1567 ,
         \i_tv80_core/n1566 , \i_tv80_core/n1565 , \i_tv80_core/n1564 ,
         \i_tv80_core/n1563 , \i_tv80_core/n1562 , \i_tv80_core/n1561 ,
         \i_tv80_core/n1560 , \i_tv80_core/n1559 , \i_tv80_core/n1558 ,
         \i_tv80_core/n1557 , \i_tv80_core/n1556 , \i_tv80_core/n1555 ,
         \i_tv80_core/n1554 , \i_tv80_core/n1553 , \i_tv80_core/n1552 ,
         \i_tv80_core/n1551 , \i_tv80_core/n1550 , \i_tv80_core/n1549 ,
         \i_tv80_core/n1548 , \i_tv80_core/n1547 , \i_tv80_core/n1546 ,
         \i_tv80_core/n1545 , \i_tv80_core/n1544 , \i_tv80_core/n1543 ,
         \i_tv80_core/n1542 , \i_tv80_core/n1541 , \i_tv80_core/n1540 ,
         \i_tv80_core/n1539 , \i_tv80_core/n1538 , \i_tv80_core/n1537 ,
         \i_tv80_core/n1536 , \i_tv80_core/n1535 , \i_tv80_core/n1534 ,
         \i_tv80_core/n1533 , \i_tv80_core/n1532 , \i_tv80_core/n1531 ,
         \i_tv80_core/n1530 , \i_tv80_core/n1529 , \i_tv80_core/n1528 ,
         \i_tv80_core/n1527 , \i_tv80_core/n1526 , \i_tv80_core/n1525 ,
         \i_tv80_core/n1524 , \i_tv80_core/n1523 , \i_tv80_core/n1522 ,
         \i_tv80_core/n1521 , \i_tv80_core/n1520 , \i_tv80_core/n1519 ,
         \i_tv80_core/n1518 , \i_tv80_core/n1517 , \i_tv80_core/n1516 ,
         \i_tv80_core/n1515 , \i_tv80_core/n1514 , \i_tv80_core/n1513 ,
         \i_tv80_core/n1512 , \i_tv80_core/n1511 , \i_tv80_core/n1510 ,
         \i_tv80_core/n1509 , \i_tv80_core/n1508 , \i_tv80_core/n1507 ,
         \i_tv80_core/n1506 , \i_tv80_core/n1505 , \i_tv80_core/n1504 ,
         \i_tv80_core/n1503 , \i_tv80_core/n1502 , \i_tv80_core/n1501 ,
         \i_tv80_core/n1500 , \i_tv80_core/n1499 , \i_tv80_core/n1498 ,
         \i_tv80_core/n1497 , \i_tv80_core/n1496 , \i_tv80_core/n1495 ,
         \i_tv80_core/n1494 , \i_tv80_core/n1493 , \i_tv80_core/n1492 ,
         \i_tv80_core/n1491 , \i_tv80_core/n1490 , \i_tv80_core/n1489 ,
         \i_tv80_core/n1488 , \i_tv80_core/n1487 , \i_tv80_core/n1486 ,
         \i_tv80_core/n1485 , \i_tv80_core/n1484 , \i_tv80_core/n1483 ,
         \i_tv80_core/n1482 , \i_tv80_core/n1481 , \i_tv80_core/n1480 ,
         \i_tv80_core/n1479 , \i_tv80_core/n1478 , \i_tv80_core/n1477 ,
         \i_tv80_core/n1476 , \i_tv80_core/n1475 , \i_tv80_core/n1474 ,
         \i_tv80_core/n1473 , \i_tv80_core/n1472 , \i_tv80_core/n1471 ,
         \i_tv80_core/n1470 , \i_tv80_core/n1469 , \i_tv80_core/n1468 ,
         \i_tv80_core/n1467 , \i_tv80_core/n1466 , \i_tv80_core/n1465 ,
         \i_tv80_core/n1464 , \i_tv80_core/n1463 , \i_tv80_core/n1462 ,
         \i_tv80_core/n1461 , \i_tv80_core/n1460 , \i_tv80_core/n1459 ,
         \i_tv80_core/n1458 , \i_tv80_core/n1457 , \i_tv80_core/n1456 ,
         \i_tv80_core/n1455 , \i_tv80_core/n1454 , \i_tv80_core/n1453 ,
         \i_tv80_core/n1452 , \i_tv80_core/n1451 , \i_tv80_core/n1450 ,
         \i_tv80_core/n1449 , \i_tv80_core/n1448 , \i_tv80_core/n1447 ,
         \i_tv80_core/n1446 , \i_tv80_core/n1445 , \i_tv80_core/n1444 ,
         \i_tv80_core/n1443 , \i_tv80_core/n1442 , \i_tv80_core/n1441 ,
         \i_tv80_core/n1440 , \i_tv80_core/n1439 , \i_tv80_core/n1438 ,
         \i_tv80_core/n1437 , \i_tv80_core/n1436 , \i_tv80_core/n1435 ,
         \i_tv80_core/n1434 , \i_tv80_core/n1433 , \i_tv80_core/n1432 ,
         \i_tv80_core/n1431 , \i_tv80_core/n1430 , \i_tv80_core/n1429 ,
         \i_tv80_core/n1428 , \i_tv80_core/n1427 , \i_tv80_core/n1426 ,
         \i_tv80_core/n1425 , \i_tv80_core/n1424 , \i_tv80_core/n1423 ,
         \i_tv80_core/n1422 , \i_tv80_core/n1421 , \i_tv80_core/n1420 ,
         \i_tv80_core/n1419 , \i_tv80_core/n1418 , \i_tv80_core/n1417 ,
         \i_tv80_core/n1416 , \i_tv80_core/n1415 , \i_tv80_core/n1414 ,
         \i_tv80_core/n1413 , \i_tv80_core/n1412 , \i_tv80_core/n1411 ,
         \i_tv80_core/n1410 , \i_tv80_core/n1409 , \i_tv80_core/n1408 ,
         \i_tv80_core/n1407 , \i_tv80_core/n1406 , \i_tv80_core/n1405 ,
         \i_tv80_core/n1404 , \i_tv80_core/n1403 , \i_tv80_core/n1402 ,
         \i_tv80_core/n1401 , \i_tv80_core/n1400 , \i_tv80_core/n1399 ,
         \i_tv80_core/n1398 , \i_tv80_core/n1397 , \i_tv80_core/n1396 ,
         \i_tv80_core/n1395 , \i_tv80_core/n1394 , \i_tv80_core/n1393 ,
         \i_tv80_core/n1392 , \i_tv80_core/n1391 , \i_tv80_core/n1390 ,
         \i_tv80_core/n1389 , \i_tv80_core/n1388 , \i_tv80_core/n1230 ,
         \i_tv80_core/n1229 , \i_tv80_core/n1221 , \i_tv80_core/n1219 ,
         \i_tv80_core/n1214 , \i_tv80_core/n1182 , \i_tv80_core/n1166 ,
         \i_tv80_core/n1161 , \i_tv80_core/n1141 , \i_tv80_core/n1140 ,
         \i_tv80_core/n1139 , \i_tv80_core/n1138 , \i_tv80_core/n1131 ,
         \i_tv80_core/n1126 , \i_tv80_core/n1125 , \i_tv80_core/n1123 ,
         \i_tv80_core/n1122 , \i_tv80_core/n1119 , \i_tv80_core/n1118 ,
         \i_tv80_core/n1117 , \i_tv80_core/n1116 , \i_tv80_core/n1115 ,
         \i_tv80_core/n1114 , \i_tv80_core/n1113 , \i_tv80_core/n1112 ,
         \i_tv80_core/n1095 , \i_tv80_core/n1092 , \i_tv80_core/n1072 ,
         \i_tv80_core/n1071 , \i_tv80_core/n1070 , \i_tv80_core/n1069 ,
         \i_tv80_core/n1068 , \i_tv80_core/n1067 , \i_tv80_core/n1066 ,
         \i_tv80_core/n1065 , \i_tv80_core/n1064 , \i_tv80_core/n1047 ,
         \i_tv80_core/n1039 , \i_tv80_core/n1038 , \i_tv80_core/n1036 ,
         \i_tv80_core/n1034 , \i_tv80_core/n1029 , \i_tv80_core/n1028 ,
         \i_tv80_core/n1026 , \i_tv80_core/n1024 , \i_tv80_core/n1022 ,
         \i_tv80_core/n1021 , \i_tv80_core/n1018 , \i_tv80_core/n1017 ,
         \i_tv80_core/n1016 , \i_tv80_core/n1015 , \i_tv80_core/n1014 ,
         \i_tv80_core/n1013 , \i_tv80_core/n1011 , \i_tv80_core/n991 ,
         \i_tv80_core/n963 , \i_tv80_core/n962 , \i_tv80_core/n961 ,
         \i_tv80_core/n960 , \i_tv80_core/n959 , \i_tv80_core/n958 ,
         \i_tv80_core/n957 , \i_tv80_core/n956 , \i_tv80_core/n955 ,
         \i_tv80_core/n954 , \i_tv80_core/n953 , \i_tv80_core/n952 ,
         \i_tv80_core/n951 , \i_tv80_core/n950 , \i_tv80_core/n949 ,
         \i_tv80_core/n948 , \i_tv80_core/n947 , \i_tv80_core/n946 ,
         \i_tv80_core/n945 , \i_tv80_core/n944 , \i_tv80_core/n943 ,
         \i_tv80_core/n942 , \i_tv80_core/n941 , \i_tv80_core/n940 ,
         \i_tv80_core/n939 , \i_tv80_core/n938 , \i_tv80_core/n937 ,
         \i_tv80_core/n936 , \i_tv80_core/n935 , \i_tv80_core/n934 ,
         \i_tv80_core/n933 , \i_tv80_core/n932 , \i_tv80_core/n931 ,
         \i_tv80_core/n930 , \i_tv80_core/n929 , \i_tv80_core/n928 ,
         \i_tv80_core/n927 , \i_tv80_core/n926 , \i_tv80_core/n925 ,
         \i_tv80_core/n924 , \i_tv80_core/n923 , \i_tv80_core/n922 ,
         \i_tv80_core/n921 , \i_tv80_core/n920 , \i_tv80_core/n919 ,
         \i_tv80_core/n918 , \i_tv80_core/n917 , \i_tv80_core/n916 ,
         \i_tv80_core/n915 , \i_tv80_core/n914 , \i_tv80_core/n913 ,
         \i_tv80_core/n912 , \i_tv80_core/n911 , \i_tv80_core/n910 ,
         \i_tv80_core/n909 , \i_tv80_core/n908 , \i_tv80_core/n907 ,
         \i_tv80_core/n906 , \i_tv80_core/n905 , \i_tv80_core/n904 ,
         \i_tv80_core/n903 , \i_tv80_core/n902 , \i_tv80_core/n901 ,
         \i_tv80_core/n900 , \i_tv80_core/n899 , \i_tv80_core/n898 ,
         \i_tv80_core/n897 , \i_tv80_core/n896 , \i_tv80_core/n895 ,
         \i_tv80_core/n894 , \i_tv80_core/n893 , \i_tv80_core/n892 ,
         \i_tv80_core/n891 , \i_tv80_core/n890 , \i_tv80_core/n889 ,
         \i_tv80_core/n888 , \i_tv80_core/n887 , \i_tv80_core/n886 ,
         \i_tv80_core/n885 , \i_tv80_core/n884 , \i_tv80_core/n883 ,
         \i_tv80_core/n882 , \i_tv80_core/n881 , \i_tv80_core/n880 ,
         \i_tv80_core/n879 , \i_tv80_core/n878 , \i_tv80_core/n877 ,
         \i_tv80_core/n876 , \i_tv80_core/n875 , \i_tv80_core/n874 ,
         \i_tv80_core/n873 , \i_tv80_core/n872 , \i_tv80_core/n871 ,
         \i_tv80_core/n870 , \i_tv80_core/n869 , \i_tv80_core/n868 ,
         \i_tv80_core/n867 , \i_tv80_core/n866 , \i_tv80_core/n865 ,
         \i_tv80_core/n864 , \i_tv80_core/n863 , \i_tv80_core/n862 ,
         \i_tv80_core/n861 , \i_tv80_core/n860 , \i_tv80_core/n859 ,
         \i_tv80_core/n858 , \i_tv80_core/n857 , \i_tv80_core/n856 ,
         \i_tv80_core/n855 , \i_tv80_core/n854 , \i_tv80_core/n853 ,
         \i_tv80_core/n852 , \i_tv80_core/n851 , \i_tv80_core/n850 ,
         \i_tv80_core/n849 , \i_tv80_core/n848 , \i_tv80_core/n847 ,
         \i_tv80_core/n846 , \i_tv80_core/n845 , \i_tv80_core/n844 ,
         \i_tv80_core/n843 , \i_tv80_core/n842 , \i_tv80_core/n841 ,
         \i_tv80_core/n840 , \i_tv80_core/n839 , \i_tv80_core/n838 ,
         \i_tv80_core/n837 , \i_tv80_core/n836 , \i_tv80_core/n835 ,
         \i_tv80_core/n834 , \i_tv80_core/n833 , \i_tv80_core/n832 ,
         \i_tv80_core/n831 , \i_tv80_core/n830 , \i_tv80_core/n829 ,
         \i_tv80_core/n828 , \i_tv80_core/n827 , \i_tv80_core/n826 ,
         \i_tv80_core/n825 , \i_tv80_core/n824 , \i_tv80_core/n823 ,
         \i_tv80_core/n822 , \i_tv80_core/n821 , \i_tv80_core/n820 ,
         \i_tv80_core/n819 , \i_tv80_core/n818 , \i_tv80_core/n817 ,
         \i_tv80_core/n816 , \i_tv80_core/n815 , \i_tv80_core/n814 ,
         \i_tv80_core/n813 , \i_tv80_core/n812 , \i_tv80_core/n811 ,
         \i_tv80_core/n810 , \i_tv80_core/n809 , \i_tv80_core/n808 ,
         \i_tv80_core/n807 , \i_tv80_core/n806 , \i_tv80_core/n805 ,
         \i_tv80_core/n804 , \i_tv80_core/n803 , \i_tv80_core/n802 ,
         \i_tv80_core/n801 , \i_tv80_core/n800 , \i_tv80_core/n799 ,
         \i_tv80_core/n798 , \i_tv80_core/n797 , \i_tv80_core/n796 ,
         \i_tv80_core/n795 , \i_tv80_core/n794 , \i_tv80_core/n793 ,
         \i_tv80_core/n792 , \i_tv80_core/n791 , \i_tv80_core/n790 ,
         \i_tv80_core/n789 , \i_tv80_core/n788 , \i_tv80_core/n787 ,
         \i_tv80_core/n786 , \i_tv80_core/n785 , \i_tv80_core/n784 ,
         \i_tv80_core/n783 , \i_tv80_core/n782 , \i_tv80_core/n781 ,
         \i_tv80_core/n780 , \i_tv80_core/n779 , \i_tv80_core/n778 ,
         \i_tv80_core/n777 , \i_tv80_core/n776 , \i_tv80_core/n775 ,
         \i_tv80_core/n774 , \i_tv80_core/n773 , \i_tv80_core/n772 ,
         \i_tv80_core/n771 , \i_tv80_core/n770 , \i_tv80_core/n769 ,
         \i_tv80_core/n768 , \i_tv80_core/n767 , \i_tv80_core/n766 ,
         \i_tv80_core/n765 , \i_tv80_core/n764 , \i_tv80_core/n763 ,
         \i_tv80_core/n762 , \i_tv80_core/n761 , \i_tv80_core/n760 ,
         \i_tv80_core/n759 , \i_tv80_core/n758 , \i_tv80_core/n757 ,
         \i_tv80_core/n756 , \i_tv80_core/n755 , \i_tv80_core/n754 ,
         \i_tv80_core/n753 , \i_tv80_core/n752 , \i_tv80_core/n751 ,
         \i_tv80_core/n750 , \i_tv80_core/n749 , \i_tv80_core/n748 ,
         \i_tv80_core/n747 , \i_tv80_core/n746 , \i_tv80_core/n745 ,
         \i_tv80_core/n744 , \i_tv80_core/n743 , \i_tv80_core/n742 ,
         \i_tv80_core/n741 , \i_tv80_core/n740 , \i_tv80_core/n739 ,
         \i_tv80_core/n738 , \i_tv80_core/n737 , \i_tv80_core/n736 ,
         \i_tv80_core/n735 , \i_tv80_core/n734 , \i_tv80_core/n733 ,
         \i_tv80_core/n732 , \i_tv80_core/n731 , \i_tv80_core/n730 ,
         \i_tv80_core/n729 , \i_tv80_core/n728 , \i_tv80_core/n727 ,
         \i_tv80_core/n726 , \i_tv80_core/n725 , \i_tv80_core/n724 ,
         \i_tv80_core/n723 , \i_tv80_core/n722 , \i_tv80_core/n721 ,
         \i_tv80_core/n720 , \i_tv80_core/n719 , \i_tv80_core/n718 ,
         \i_tv80_core/n717 , \i_tv80_core/n716 , \i_tv80_core/n715 ,
         \i_tv80_core/n714 , \i_tv80_core/n713 , \i_tv80_core/n712 ,
         \i_tv80_core/n711 , \i_tv80_core/n710 , \i_tv80_core/n709 ,
         \i_tv80_core/n708 , \i_tv80_core/n707 , \i_tv80_core/n706 ,
         \i_tv80_core/n705 , \i_tv80_core/n704 , \i_tv80_core/n703 ,
         \i_tv80_core/n702 , \i_tv80_core/n701 , \i_tv80_core/n700 ,
         \i_tv80_core/n699 , \i_tv80_core/n698 , \i_tv80_core/n697 ,
         \i_tv80_core/n696 , \i_tv80_core/n695 , \i_tv80_core/n694 ,
         \i_tv80_core/n693 , \i_tv80_core/n692 , \i_tv80_core/n691 ,
         \i_tv80_core/n690 , \i_tv80_core/n689 , \i_tv80_core/n688 ,
         \i_tv80_core/n687 , \i_tv80_core/n686 , \i_tv80_core/n685 ,
         \i_tv80_core/n684 , \i_tv80_core/n683 , \i_tv80_core/n682 ,
         \i_tv80_core/n681 , \i_tv80_core/n680 , \i_tv80_core/n679 ,
         \i_tv80_core/n678 , \i_tv80_core/n677 , \i_tv80_core/n676 ,
         \i_tv80_core/n675 , \i_tv80_core/n674 , \i_tv80_core/n673 ,
         \i_tv80_core/n672 , \i_tv80_core/n671 , \i_tv80_core/n670 ,
         \i_tv80_core/n669 , \i_tv80_core/n668 , \i_tv80_core/n667 ,
         \i_tv80_core/n666 , \i_tv80_core/n665 , \i_tv80_core/n664 ,
         \i_tv80_core/n663 , \i_tv80_core/n662 , \i_tv80_core/n661 ,
         \i_tv80_core/n660 , \i_tv80_core/n659 , \i_tv80_core/n658 ,
         \i_tv80_core/n657 , \i_tv80_core/n656 , \i_tv80_core/n655 ,
         \i_tv80_core/n654 , \i_tv80_core/n653 , \i_tv80_core/n652 ,
         \i_tv80_core/n651 , \i_tv80_core/n650 , \i_tv80_core/n649 ,
         \i_tv80_core/n648 , \i_tv80_core/n647 , \i_tv80_core/n646 ,
         \i_tv80_core/n645 , \i_tv80_core/n644 , \i_tv80_core/n643 ,
         \i_tv80_core/n642 , \i_tv80_core/n641 , \i_tv80_core/n640 ,
         \i_tv80_core/n639 , \i_tv80_core/n638 , \i_tv80_core/n637 ,
         \i_tv80_core/n636 , \i_tv80_core/n635 , \i_tv80_core/n634 ,
         \i_tv80_core/n633 , \i_tv80_core/n632 , \i_tv80_core/n631 ,
         \i_tv80_core/n630 , \i_tv80_core/n629 , \i_tv80_core/n628 ,
         \i_tv80_core/n627 , \i_tv80_core/n626 , \i_tv80_core/n625 ,
         \i_tv80_core/n624 , \i_tv80_core/n623 , \i_tv80_core/n622 ,
         \i_tv80_core/n621 , \i_tv80_core/n620 , \i_tv80_core/n619 ,
         \i_tv80_core/n618 , \i_tv80_core/n617 , \i_tv80_core/n616 ,
         \i_tv80_core/n615 , \i_tv80_core/n614 , \i_tv80_core/n613 ,
         \i_tv80_core/n612 , \i_tv80_core/n611 , \i_tv80_core/n610 ,
         \i_tv80_core/n609 , \i_tv80_core/n608 , \i_tv80_core/n607 ,
         \i_tv80_core/n606 , \i_tv80_core/n605 , \i_tv80_core/n604 ,
         \i_tv80_core/n603 , \i_tv80_core/n602 , \i_tv80_core/n601 ,
         \i_tv80_core/n600 , \i_tv80_core/n599 , \i_tv80_core/n598 ,
         \i_tv80_core/n597 , \i_tv80_core/n596 , \i_tv80_core/n595 ,
         \i_tv80_core/n594 , \i_tv80_core/n593 , \i_tv80_core/n592 ,
         \i_tv80_core/n591 , \i_tv80_core/n590 , \i_tv80_core/n589 ,
         \i_tv80_core/n588 , \i_tv80_core/n587 , \i_tv80_core/n586 ,
         \i_tv80_core/n585 , \i_tv80_core/n584 , \i_tv80_core/n583 ,
         \i_tv80_core/n582 , \i_tv80_core/n581 , \i_tv80_core/n580 ,
         \i_tv80_core/n579 , \i_tv80_core/n578 , \i_tv80_core/n577 ,
         \i_tv80_core/n576 , \i_tv80_core/n575 , \i_tv80_core/n574 ,
         \i_tv80_core/n573 , \i_tv80_core/n572 , \i_tv80_core/n571 ,
         \i_tv80_core/n570 , \i_tv80_core/n569 , \i_tv80_core/n568 ,
         \i_tv80_core/n567 , \i_tv80_core/n566 , \i_tv80_core/n565 ,
         \i_tv80_core/n564 , \i_tv80_core/n563 , \i_tv80_core/n562 ,
         \i_tv80_core/n561 , \i_tv80_core/n560 , \i_tv80_core/n559 ,
         \i_tv80_core/n558 , \i_tv80_core/n557 , \i_tv80_core/n556 ,
         \i_tv80_core/n555 , \i_tv80_core/n554 , \i_tv80_core/n553 ,
         \i_tv80_core/n552 , \i_tv80_core/n551 , \i_tv80_core/n550 ,
         \i_tv80_core/n549 , \i_tv80_core/n548 , \i_tv80_core/n547 ,
         \i_tv80_core/n546 , \i_tv80_core/n545 , \i_tv80_core/n544 ,
         \i_tv80_core/n543 , \i_tv80_core/n542 , \i_tv80_core/n541 ,
         \i_tv80_core/n540 , \i_tv80_core/n539 , \i_tv80_core/n538 ,
         \i_tv80_core/n537 , \i_tv80_core/n536 , \i_tv80_core/n535 ,
         \i_tv80_core/n534 , \i_tv80_core/n533 , \i_tv80_core/n532 ,
         \i_tv80_core/n531 , \i_tv80_core/n530 , \i_tv80_core/n529 ,
         \i_tv80_core/n528 , \i_tv80_core/n527 , \i_tv80_core/n526 ,
         \i_tv80_core/n525 , \i_tv80_core/n524 , \i_tv80_core/n523 ,
         \i_tv80_core/n522 , \i_tv80_core/n521 , \i_tv80_core/n520 ,
         \i_tv80_core/n519 , \i_tv80_core/n518 , \i_tv80_core/n517 ,
         \i_tv80_core/n516 , \i_tv80_core/n515 , \i_tv80_core/n514 ,
         \i_tv80_core/n513 , \i_tv80_core/n512 , \i_tv80_core/n511 ,
         \i_tv80_core/n510 , \i_tv80_core/n509 , \i_tv80_core/n508 ,
         \i_tv80_core/n507 , \i_tv80_core/n506 , \i_tv80_core/n505 ,
         \i_tv80_core/n504 , \i_tv80_core/n503 , \i_tv80_core/n502 ,
         \i_tv80_core/n501 , \i_tv80_core/n500 , \i_tv80_core/n499 ,
         \i_tv80_core/n498 , \i_tv80_core/n497 , \i_tv80_core/n496 ,
         \i_tv80_core/n495 , \i_tv80_core/n494 , \i_tv80_core/n493 ,
         \i_tv80_core/n492 , \i_tv80_core/n491 , \i_tv80_core/n490 ,
         \i_tv80_core/n489 , \i_tv80_core/n488 , \i_tv80_core/n487 ,
         \i_tv80_core/n486 , \i_tv80_core/n485 , \i_tv80_core/n484 ,
         \i_tv80_core/n483 , \i_tv80_core/n482 , \i_tv80_core/n481 ,
         \i_tv80_core/n480 , \i_tv80_core/n479 , \i_tv80_core/n478 ,
         \i_tv80_core/n477 , \i_tv80_core/n476 , \i_tv80_core/n475 ,
         \i_tv80_core/n474 , \i_tv80_core/n473 , \i_tv80_core/n472 ,
         \i_tv80_core/n471 , \i_tv80_core/n470 , \i_tv80_core/n469 ,
         \i_tv80_core/n468 , \i_tv80_core/n467 , \i_tv80_core/n466 ,
         \i_tv80_core/n465 , \i_tv80_core/n464 , \i_tv80_core/n463 ,
         \i_tv80_core/n462 , \i_tv80_core/n461 , \i_tv80_core/n460 ,
         \i_tv80_core/n459 , \i_tv80_core/n458 , \i_tv80_core/n457 ,
         \i_tv80_core/n456 , \i_tv80_core/n455 , \i_tv80_core/n454 ,
         \i_tv80_core/n453 , \i_tv80_core/n452 , \i_tv80_core/n451 ,
         \i_tv80_core/n450 , \i_tv80_core/n449 , \i_tv80_core/n448 ,
         \i_tv80_core/n447 , \i_tv80_core/n446 , \i_tv80_core/n445 ,
         \i_tv80_core/n444 , \i_tv80_core/n443 , \i_tv80_core/n442 ,
         \i_tv80_core/n441 , \i_tv80_core/n440 , \i_tv80_core/n439 ,
         \i_tv80_core/n438 , \i_tv80_core/n437 , \i_tv80_core/n436 ,
         \i_tv80_core/n435 , \i_tv80_core/n434 , \i_tv80_core/n433 ,
         \i_tv80_core/n432 , \i_tv80_core/n431 , \i_tv80_core/n430 ,
         \i_tv80_core/n429 , \i_tv80_core/n428 , \i_tv80_core/n427 ,
         \i_tv80_core/n426 , \i_tv80_core/n425 , \i_tv80_core/n424 ,
         \i_tv80_core/n423 , \i_tv80_core/n422 , \i_tv80_core/n421 ,
         \i_tv80_core/n420 , \i_tv80_core/n419 , \i_tv80_core/n418 ,
         \i_tv80_core/n417 , \i_tv80_core/n416 , \i_tv80_core/n415 ,
         \i_tv80_core/n414 , \i_tv80_core/n413 , \i_tv80_core/n412 ,
         \i_tv80_core/n411 , \i_tv80_core/n410 , \i_tv80_core/n409 ,
         \i_tv80_core/n408 , \i_tv80_core/n407 , \i_tv80_core/n406 ,
         \i_tv80_core/n405 , \i_tv80_core/n404 , \i_tv80_core/n403 ,
         \i_tv80_core/n402 , \i_tv80_core/n401 , \i_tv80_core/n400 ,
         \i_tv80_core/n399 , \i_tv80_core/n398 , \i_tv80_core/n397 ,
         \i_tv80_core/n396 , \i_tv80_core/n395 , \i_tv80_core/n394 ,
         \i_tv80_core/n393 , \i_tv80_core/n392 , \i_tv80_core/n391 ,
         \i_tv80_core/n390 , \i_tv80_core/n389 , \i_tv80_core/n388 ,
         \i_tv80_core/n387 , \i_tv80_core/n386 , \i_tv80_core/n385 ,
         \i_tv80_core/n384 , \i_tv80_core/n383 , \i_tv80_core/n382 ,
         \i_tv80_core/n381 , \i_tv80_core/n380 , \i_tv80_core/n379 ,
         \i_tv80_core/n378 , \i_tv80_core/n377 , \i_tv80_core/n376 ,
         \i_tv80_core/n375 , \i_tv80_core/n374 , \i_tv80_core/n373 ,
         \i_tv80_core/n372 , \i_tv80_core/n371 , \i_tv80_core/n370 ,
         \i_tv80_core/n369 , \i_tv80_core/n368 , \i_tv80_core/n367 ,
         \i_tv80_core/n366 , \i_tv80_core/n365 , \i_tv80_core/n364 ,
         \i_tv80_core/n363 , \i_tv80_core/n362 , \i_tv80_core/n361 ,
         \i_tv80_core/n360 , \i_tv80_core/n359 , \i_tv80_core/n358 ,
         \i_tv80_core/n357 , \i_tv80_core/n356 , \i_tv80_core/n355 ,
         \i_tv80_core/n354 , \i_tv80_core/n352 , \i_tv80_core/n351 ,
         \i_tv80_core/n350 , \i_tv80_core/n349 , \i_tv80_core/n348 ,
         \i_tv80_core/n347 , \i_tv80_core/n346 , \i_tv80_core/n345 ,
         \i_tv80_core/n344 , \i_tv80_core/n343 , \i_tv80_core/n342 ,
         \i_tv80_core/n341 , \i_tv80_core/n340 , \i_tv80_core/n339 ,
         \i_tv80_core/n338 , \i_tv80_core/n337 , \i_tv80_core/n336 ,
         \i_tv80_core/n335 , \i_tv80_core/n334 , \i_tv80_core/n333 ,
         \i_tv80_core/n332 , \i_tv80_core/n331 , \i_tv80_core/n330 ,
         \i_tv80_core/n329 , \i_tv80_core/n328 , \i_tv80_core/n327 ,
         \i_tv80_core/n326 , \i_tv80_core/n325 , \i_tv80_core/n324 ,
         \i_tv80_core/n323 , \i_tv80_core/n322 , \i_tv80_core/n321 ,
         \i_tv80_core/n320 , \i_tv80_core/n319 , \i_tv80_core/n318 ,
         \i_tv80_core/n317 , \i_tv80_core/n316 , \i_tv80_core/n315 ,
         \i_tv80_core/n314 , \i_tv80_core/n313 , \i_tv80_core/n312 ,
         \i_tv80_core/n311 , \i_tv80_core/n310 , \i_tv80_core/n309 ,
         \i_tv80_core/n308 , \i_tv80_core/n307 , \i_tv80_core/n306 ,
         \i_tv80_core/n305 , \i_tv80_core/n304 , \i_tv80_core/n303 ,
         \i_tv80_core/n302 , \i_tv80_core/n301 , \i_tv80_core/n295 ,
         \i_tv80_core/n294 , \i_tv80_core/n293 , \i_tv80_core/n292 ,
         \i_tv80_core/n291 , \i_tv80_core/n290 , \i_tv80_core/n289 ,
         \i_tv80_core/n288 , \i_tv80_core/n287 , \i_tv80_core/n286 ,
         \i_tv80_core/n285 , \i_tv80_core/n284 , \i_tv80_core/n283 ,
         \i_tv80_core/n282 , \i_tv80_core/n281 , \i_tv80_core/n280 ,
         \i_tv80_core/n279 , \i_tv80_core/n278 , \i_tv80_core/n277 ,
         \i_tv80_core/n276 , \i_tv80_core/n275 , \i_tv80_core/n274 ,
         \i_tv80_core/n273 , \i_tv80_core/n272 , \i_tv80_core/n271 ,
         \i_tv80_core/n270 , \i_tv80_core/n269 , \i_tv80_core/n268 ,
         \i_tv80_core/n267 , \i_tv80_core/n266 , \i_tv80_core/n265 ,
         \i_tv80_core/n264 , \i_tv80_core/n263 , \i_tv80_core/n262 ,
         \i_tv80_core/n261 , \i_tv80_core/n260 , \i_tv80_core/n259 ,
         \i_tv80_core/n258 , \i_tv80_core/n257 , \i_tv80_core/n256 ,
         \i_tv80_core/n255 , \i_tv80_core/n254 , \i_tv80_core/n253 ,
         \i_tv80_core/n252 , \i_tv80_core/n251 , \i_tv80_core/n250 ,
         \i_tv80_core/n249 , \i_tv80_core/n248 , \i_tv80_core/n247 ,
         \i_tv80_core/n246 , \i_tv80_core/n245 , \i_tv80_core/n244 ,
         \i_tv80_core/n243 , \i_tv80_core/n242 , \i_tv80_core/n241 ,
         \i_tv80_core/n240 , \i_tv80_core/n239 , \i_tv80_core/n238 ,
         \i_tv80_core/n237 , \i_tv80_core/n236 , \i_tv80_core/n235 ,
         \i_tv80_core/n234 , \i_tv80_core/n233 , \i_tv80_core/n232 ,
         \i_tv80_core/n231 , \i_tv80_core/n230 , \i_tv80_core/n229 ,
         \i_tv80_core/n228 , \i_tv80_core/n227 , \i_tv80_core/n226 ,
         \i_tv80_core/n225 , \i_tv80_core/n224 , \i_tv80_core/n223 ,
         \i_tv80_core/n222 , \i_tv80_core/n221 , \i_tv80_core/n220 ,
         \i_tv80_core/n219 , \i_tv80_core/n218 , \i_tv80_core/n217 ,
         \i_tv80_core/n216 , \i_tv80_core/n215 , \i_tv80_core/n214 ,
         \i_tv80_core/n213 , \i_tv80_core/n212 , \i_tv80_core/n211 ,
         \i_tv80_core/n210 , \i_tv80_core/n209 , \i_tv80_core/n208 ,
         \i_tv80_core/n207 , \i_tv80_core/n206 , \i_tv80_core/n205 ,
         \i_tv80_core/n204 , \i_tv80_core/n203 , \i_tv80_core/n202 ,
         \i_tv80_core/n201 , \i_tv80_core/n200 , \i_tv80_core/n199 ,
         \i_tv80_core/n198 , \i_tv80_core/n197 , \i_tv80_core/n196 ,
         \i_tv80_core/n195 , \i_tv80_core/n194 , \i_tv80_core/n193 ,
         \i_tv80_core/n192 , \i_tv80_core/n191 , \i_tv80_core/n190 ,
         \i_tv80_core/n189 , \i_tv80_core/n188 , \i_tv80_core/n187 ,
         \i_tv80_core/n186 , \i_tv80_core/n185 , \i_tv80_core/n184 ,
         \i_tv80_core/n183 , \i_tv80_core/n182 , \i_tv80_core/n181 ,
         \i_tv80_core/n180 , \i_tv80_core/n179 , \i_tv80_core/n178 ,
         \i_tv80_core/n177 , \i_tv80_core/n176 , \i_tv80_core/n175 ,
         \i_tv80_core/n174 , \i_tv80_core/n173 , \i_tv80_core/n172 ,
         \i_tv80_core/n171 , \i_tv80_core/n170 , \i_tv80_core/n169 ,
         \i_tv80_core/n168 , \i_tv80_core/n167 , \i_tv80_core/n166 ,
         \i_tv80_core/n165 , \i_tv80_core/n164 , \i_tv80_core/n163 ,
         \i_tv80_core/n162 , \i_tv80_core/n161 , \i_tv80_core/n160 ,
         \i_tv80_core/n159 , \i_tv80_core/n158 , \i_tv80_core/n157 ,
         \i_tv80_core/n156 , \i_tv80_core/n155 , \i_tv80_core/n154 ,
         \i_tv80_core/n152 , \i_tv80_core/n151 , \i_tv80_core/n150 ,
         \i_tv80_core/n149 , \i_tv80_core/n148 , \i_tv80_core/n147 ,
         \i_tv80_core/n146 , \i_tv80_core/n145 , \i_tv80_core/n144 ,
         \i_tv80_core/n143 , \i_tv80_core/n142 , \i_tv80_core/n141 ,
         \i_tv80_core/n140 , \i_tv80_core/n139 , \i_tv80_core/n138 ,
         \i_tv80_core/n137 , \i_tv80_core/n136 , \i_tv80_core/n135 ,
         \i_tv80_core/n134 , \i_tv80_core/n133 , \i_tv80_core/n132 ,
         \i_tv80_core/n131 , \i_tv80_core/n130 , \i_tv80_core/n129 ,
         \i_tv80_core/n128 , \i_tv80_core/n127 , \i_tv80_core/n126 ,
         \i_tv80_core/n125 , \i_tv80_core/n124 , \i_tv80_core/n123 ,
         \i_tv80_core/n122 , \i_tv80_core/n121 , \i_tv80_core/n120 ,
         \i_tv80_core/n119 , \i_tv80_core/n118 , \i_tv80_core/n117 ,
         \i_tv80_core/n116 , \i_tv80_core/n115 , \i_tv80_core/n114 ,
         \i_tv80_core/n113 , \i_tv80_core/n112 , \i_tv80_core/n111 ,
         \i_tv80_core/n110 , \i_tv80_core/n109 , \i_tv80_core/n108 ,
         \i_tv80_core/n107 , \i_tv80_core/n106 , \i_tv80_core/n105 ,
         \i_tv80_core/n104 , \i_tv80_core/n103 , \i_tv80_core/n102 ,
         \i_tv80_core/n101 , \i_tv80_core/n100 , \i_tv80_core/n99 ,
         \i_tv80_core/n98 , \i_tv80_core/n97 , \i_tv80_core/n96 ,
         \i_tv80_core/n95 , \i_tv80_core/n94 , \i_tv80_core/n93 ,
         \i_tv80_core/n92 , \i_tv80_core/n91 , \i_tv80_core/n90 ,
         \i_tv80_core/n89 , \i_tv80_core/n88 , \i_tv80_core/n87 ,
         \i_tv80_core/n86 , \i_tv80_core/n85 , \i_tv80_core/n84 ,
         \i_tv80_core/n83 , \i_tv80_core/n82 , \i_tv80_core/n81 ,
         \i_tv80_core/n80 , \i_tv80_core/n79 , \i_tv80_core/n78 ,
         \i_tv80_core/n77 , \i_tv80_core/n76 , \i_tv80_core/n75 ,
         \i_tv80_core/n74 , \i_tv80_core/n73 , \i_tv80_core/n72 ,
         \i_tv80_core/n71 , \i_tv80_core/n70 , \i_tv80_core/n69 ,
         \i_tv80_core/n68 , \i_tv80_core/n67 , \i_tv80_core/n66 ,
         \i_tv80_core/n65 , \i_tv80_core/n64 , \i_tv80_core/n63 ,
         \i_tv80_core/n62 , \i_tv80_core/n61 , \i_tv80_core/n60 ,
         \i_tv80_core/n59 , \i_tv80_core/n58 , \i_tv80_core/n57 ,
         \i_tv80_core/n56 , \i_tv80_core/n55 , \i_tv80_core/n54 ,
         \i_tv80_core/n53 , \i_tv80_core/n52 , \i_tv80_core/n51 ,
         \i_tv80_core/n50 , \i_tv80_core/n49 , \i_tv80_core/n48 ,
         \i_tv80_core/n47 , \i_tv80_core/n46 , \i_tv80_core/n45 ,
         \i_tv80_core/n44 , \i_tv80_core/n43 , \i_tv80_core/n42 ,
         \i_tv80_core/n41 , \i_tv80_core/n40 , \i_tv80_core/n39 ,
         \i_tv80_core/n38 , \i_tv80_core/n37 , \i_tv80_core/n36 ,
         \i_tv80_core/n35 , \i_tv80_core/n34 , \i_tv80_core/n33 ,
         \i_tv80_core/n32 , \i_tv80_core/n31 , \i_tv80_core/n30 ,
         \i_tv80_core/n29 , \i_tv80_core/n28 , \i_tv80_core/n27 ,
         \i_tv80_core/n26 , \i_tv80_core/n25 , \i_tv80_core/n24 ,
         \i_tv80_core/n23 , \i_tv80_core/n22 , \i_tv80_core/n21 ,
         \i_tv80_core/n20 , \i_tv80_core/n19 , \i_tv80_core/n18 ,
         \i_tv80_core/n17 , \i_tv80_core/n16 , \i_tv80_core/n15 ,
         \i_tv80_core/n14 , \i_tv80_core/n13 , \i_tv80_core/n12 ,
         \i_tv80_core/n11 , \i_tv80_core/n10 , \i_tv80_core/n9 ,
         \i_tv80_core/n8 , \i_tv80_core/n7 , \i_tv80_core/n6 ,
         \i_tv80_core/n5 , \i_tv80_core/n4 , \i_tv80_core/n3 ,
         \i_tv80_core/n2 , \i_tv80_core/n1 , \i_tv80_core/n1387 ,
         \i_tv80_core/n1386 , \i_tv80_core/n1385 , \i_tv80_core/n1384 ,
         \i_tv80_core/n1383 , \i_tv80_core/n1382 , \i_tv80_core/n1381 ,
         \i_tv80_core/n1380 , \i_tv80_core/n1379 , \i_tv80_core/n1378 ,
         \i_tv80_core/n1377 , \i_tv80_core/n1376 , \i_tv80_core/n1375 ,
         \i_tv80_core/n1374 , \i_tv80_core/n1373 , \i_tv80_core/n1372 ,
         \i_tv80_core/n1371 , \i_tv80_core/n1370 , \i_tv80_core/n1369 ,
         \i_tv80_core/n1368 , \i_tv80_core/n1367 , \i_tv80_core/n1366 ,
         \i_tv80_core/n1365 , \i_tv80_core/n1364 , \i_tv80_core/n1363 ,
         \i_tv80_core/n1362 , \i_tv80_core/n1361 , \i_tv80_core/n1360 ,
         \i_tv80_core/n1359 , \i_tv80_core/n1358 , \i_tv80_core/n1357 ,
         \i_tv80_core/n1356 , \i_tv80_core/n1355 , \i_tv80_core/n1354 ,
         \i_tv80_core/n1353 , \i_tv80_core/n1352 , \i_tv80_core/n1351 ,
         \i_tv80_core/n1350 , \i_tv80_core/n1349 , \i_tv80_core/n1348 ,
         \i_tv80_core/n1347 , \i_tv80_core/n1346 , \i_tv80_core/n1345 ,
         \i_tv80_core/n1344 , \i_tv80_core/n1343 , \i_tv80_core/n1342 ,
         \i_tv80_core/n1341 , \i_tv80_core/n1340 , \i_tv80_core/n1339 ,
         \i_tv80_core/n1338 , \i_tv80_core/n1337 , \i_tv80_core/n1336 ,
         \i_tv80_core/n1335 , \i_tv80_core/n1334 , \i_tv80_core/n1333 ,
         \i_tv80_core/n1332 , \i_tv80_core/n1331 , \i_tv80_core/n1330 ,
         \i_tv80_core/n1329 , \i_tv80_core/n1328 , \i_tv80_core/n1327 ,
         \i_tv80_core/n1326 , \i_tv80_core/n1325 , \i_tv80_core/n1324 ,
         \i_tv80_core/n1323 , \i_tv80_core/n1322 , \i_tv80_core/n1321 ,
         \i_tv80_core/n1320 , \i_tv80_core/n1319 , \i_tv80_core/n1318 ,
         \i_tv80_core/n1317 , \i_tv80_core/n1316 , \i_tv80_core/n1315 ,
         \i_tv80_core/n1314 , \i_tv80_core/n1313 , \i_tv80_core/n1312 ,
         \i_tv80_core/n1311 , \i_tv80_core/n1310 , \i_tv80_core/n1309 ,
         \i_tv80_core/n1308 , \i_tv80_core/n1307 , \i_tv80_core/n1306 ,
         \i_tv80_core/n1305 , \i_tv80_core/n1304 , \i_tv80_core/n1303 ,
         \i_tv80_core/n1302 , \i_tv80_core/n1301 , \i_tv80_core/n1300 ,
         \i_tv80_core/n1299 , \i_tv80_core/n1298 , \i_tv80_core/n1297 ,
         \i_tv80_core/n1296 , \i_tv80_core/n1295 , \i_tv80_core/n1294 ,
         \i_tv80_core/n1293 , \i_tv80_core/n1292 , \i_tv80_core/n1291 ,
         \i_tv80_core/n1290 , \i_tv80_core/n1289 , \i_tv80_core/n1288 ,
         \i_tv80_core/n1287 , \i_tv80_core/n1286 , \i_tv80_core/n1285 ,
         \i_tv80_core/n1284 , \i_tv80_core/n1283 , \i_tv80_core/n1282 ,
         \i_tv80_core/n1281 , \i_tv80_core/n1280 , \i_tv80_core/n1279 ,
         \i_tv80_core/n1278 , \i_tv80_core/n1277 , \i_tv80_core/n1276 ,
         \i_tv80_core/n1275 , \i_tv80_core/n1274 , \i_tv80_core/n1273 ,
         \i_tv80_core/n1272 , \i_tv80_core/n1271 , \i_tv80_core/n1270 ,
         \i_tv80_core/n1269 , \i_tv80_core/n1268 , \i_tv80_core/n1267 ,
         \i_tv80_core/n1266 , \i_tv80_core/n1265 , \i_tv80_core/n1264 ,
         \i_tv80_core/n1263 , \i_tv80_core/n1262 , \i_tv80_core/n1261 ,
         \i_tv80_core/n1260 , \i_tv80_core/n1259 , \i_tv80_core/n1258 ,
         \i_tv80_core/n1257 , \i_tv80_core/n1256 , \i_tv80_core/n1255 ,
         \i_tv80_core/n1254 , \i_tv80_core/n1253 , \i_tv80_core/n1252 ,
         \i_tv80_core/n1251 , \i_tv80_core/n1250 , \i_tv80_core/n1249 ,
         \i_tv80_core/n1248 , \i_tv80_core/n1247 , \i_tv80_core/n1246 ,
         \i_tv80_core/n1245 , \i_tv80_core/n1244 , \i_tv80_core/n1243 ,
         \i_tv80_core/n1242 , \i_tv80_core/n1241 , \i_tv80_core/n1240 ,
         \i_tv80_core/n1239 , \i_tv80_core/n1238 , \i_tv80_core/n1237 ,
         \i_tv80_core/n1236 , \i_tv80_core/n1235 , \i_tv80_core/n1234 ,
         \i_tv80_core/n1233 , \i_tv80_core/n1232 , \i_tv80_core/n1231 ,
         \i_tv80_core/n1228 , \i_tv80_core/n1227 , \i_tv80_core/n1226 ,
         \i_tv80_core/n1225 , \i_tv80_core/n1224 , \i_tv80_core/n1223 ,
         \i_tv80_core/n1222 , \i_tv80_core/n1220 , \i_tv80_core/n1218 ,
         \i_tv80_core/n1217 , \i_tv80_core/n1216 , \i_tv80_core/n1215 ,
         \i_tv80_core/n1213 , \i_tv80_core/n1212 , \i_tv80_core/n1211 ,
         \i_tv80_core/n1210 , \i_tv80_core/n1209 , \i_tv80_core/n1208 ,
         \i_tv80_core/n1207 , \i_tv80_core/n1206 , \i_tv80_core/n1205 ,
         \i_tv80_core/n1204 , \i_tv80_core/n1203 , \i_tv80_core/n1202 ,
         \i_tv80_core/n1201 , \i_tv80_core/n1200 , \i_tv80_core/n1199 ,
         \i_tv80_core/n1198 , \i_tv80_core/n1197 , \i_tv80_core/n1196 ,
         \i_tv80_core/n1195 , \i_tv80_core/n1194 , \i_tv80_core/n1193 ,
         \i_tv80_core/n1192 , \i_tv80_core/n1191 , \i_tv80_core/n1190 ,
         \i_tv80_core/n1189 , \i_tv80_core/n1188 , \i_tv80_core/n1187 ,
         \i_tv80_core/n1186 , \i_tv80_core/n1185 , \i_tv80_core/n1184 ,
         \i_tv80_core/n1183 , \i_tv80_core/n1181 , \i_tv80_core/n1180 ,
         \i_tv80_core/n1179 , \i_tv80_core/n1178 , \i_tv80_core/n1177 ,
         \i_tv80_core/n1176 , \i_tv80_core/n1175 , \i_tv80_core/n1174 ,
         \i_tv80_core/n1173 , \i_tv80_core/n1172 , \i_tv80_core/n1171 ,
         \i_tv80_core/n1170 , \i_tv80_core/n1169 , \i_tv80_core/n1168 ,
         \i_tv80_core/n1167 , \i_tv80_core/n1165 , \i_tv80_core/n1164 ,
         \i_tv80_core/n1163 , \i_tv80_core/n1162 , \i_tv80_core/n1160 ,
         \i_tv80_core/n1159 , \i_tv80_core/n1158 , \i_tv80_core/n1157 ,
         \i_tv80_core/n1156 , \i_tv80_core/n1155 , \i_tv80_core/n1154 ,
         \i_tv80_core/n1153 , \i_tv80_core/n1152 , \i_tv80_core/n1151 ,
         \i_tv80_core/n1150 , \i_tv80_core/n1149 , \i_tv80_core/n1148 ,
         \i_tv80_core/n1147 , \i_tv80_core/n1146 , \i_tv80_core/n1145 ,
         \i_tv80_core/n1144 , \i_tv80_core/n1143 , \i_tv80_core/n1142 ,
         \i_tv80_core/n1137 , \i_tv80_core/n1136 , \i_tv80_core/n1135 ,
         \i_tv80_core/n1134 , \i_tv80_core/n1133 , \i_tv80_core/n1132 ,
         \i_tv80_core/n1130 , \i_tv80_core/n1129 , \i_tv80_core/n1128 ,
         \i_tv80_core/n1127 , \i_tv80_core/n1124 , \i_tv80_core/n1121 ,
         \i_tv80_core/n1120 , \i_tv80_core/n1111 , \i_tv80_core/n1110 ,
         \i_tv80_core/n1109 , \i_tv80_core/n1108 , \i_tv80_core/n1107 ,
         \i_tv80_core/n1106 , \i_tv80_core/n1105 , \i_tv80_core/n1104 ,
         \i_tv80_core/n1103 , \i_tv80_core/n1102 , \i_tv80_core/n1101 ,
         \i_tv80_core/n1100 , \i_tv80_core/n1099 , \i_tv80_core/n1098 ,
         \i_tv80_core/n1097 , \i_tv80_core/n1096 , \i_tv80_core/n1094 ,
         \i_tv80_core/n1093 , \i_tv80_core/n1091 , \i_tv80_core/n1090 ,
         \i_tv80_core/n1089 , \i_tv80_core/n1088 , \i_tv80_core/n1087 ,
         \i_tv80_core/n1086 , \i_tv80_core/n1085 , \i_tv80_core/n1084 ,
         \i_tv80_core/n1083 , \i_tv80_core/n1082 , \i_tv80_core/n1081 ,
         \i_tv80_core/n1080 , \i_tv80_core/n1079 , \i_tv80_core/n1078 ,
         \i_tv80_core/n1077 , \i_tv80_core/n1076 , \i_tv80_core/n1075 ,
         \i_tv80_core/n1074 , \i_tv80_core/n1073 , \i_tv80_core/n1063 ,
         \i_tv80_core/n1062 , \i_tv80_core/n1061 , \i_tv80_core/n1060 ,
         \i_tv80_core/n1059 , \i_tv80_core/n1058 , \i_tv80_core/n1057 ,
         \i_tv80_core/n1056 , \i_tv80_core/n1055 , \i_tv80_core/n1054 ,
         \i_tv80_core/n1053 , \i_tv80_core/n1052 , \i_tv80_core/n1051 ,
         \i_tv80_core/n1050 , \i_tv80_core/n1049 , \i_tv80_core/n1048 ,
         \i_tv80_core/n1046 , \i_tv80_core/n1045 , \i_tv80_core/n1044 ,
         \i_tv80_core/n1043 , \i_tv80_core/n1042 , \i_tv80_core/n1041 ,
         \i_tv80_core/n1040 , \i_tv80_core/n1037 , \i_tv80_core/n1035 ,
         \i_tv80_core/n1033 , \i_tv80_core/n1032 , \i_tv80_core/n1031 ,
         \i_tv80_core/n1030 , \i_tv80_core/n1027 , \i_tv80_core/n1025 ,
         \i_tv80_core/n1023 , \i_tv80_core/n1020 , \i_tv80_core/n1019 ,
         \i_tv80_core/n1012 , \i_tv80_core/n1010 , \i_tv80_core/n1009 ,
         \i_tv80_core/n1008 , \i_tv80_core/n1007 , \i_tv80_core/n1006 ,
         \i_tv80_core/n1005 , \i_tv80_core/n1004 , \i_tv80_core/n1003 ,
         \i_tv80_core/n1002 , \i_tv80_core/n1001 , \i_tv80_core/n1000 ,
         \i_tv80_core/n999 , \i_tv80_core/n998 , \i_tv80_core/n997 ,
         \i_tv80_core/n996 , \i_tv80_core/n995 , \i_tv80_core/n994 ,
         \i_tv80_core/n993 , \i_tv80_core/n992 , \i_tv80_core/n990 ,
         \i_tv80_core/n989 , \i_tv80_core/n988 , \i_tv80_core/n987 ,
         \i_tv80_core/n986 , \i_tv80_core/n985 , \i_tv80_core/n984 ,
         \i_tv80_core/n983 , \i_tv80_core/n982 , \i_tv80_core/n981 ,
         \i_tv80_core/n980 , \i_tv80_core/n979 , \i_tv80_core/n978 ,
         \i_tv80_core/n977 , \i_tv80_core/n976 , \i_tv80_core/n975 ,
         \i_tv80_core/n974 , \i_tv80_core/n973 , \i_tv80_core/n972 ,
         \i_tv80_core/n971 , \i_tv80_core/n970 , \i_tv80_core/n969 ,
         \i_tv80_core/n968 , \i_tv80_core/n967 , \i_tv80_core/n966 ,
         \i_tv80_core/n965 , \i_tv80_core/n964 , \i_tv80_core/N1222 ,
         \i_tv80_core/N1221 , \i_tv80_core/N1220 , \i_tv80_core/N1219 ,
         \i_tv80_core/N1218 , \i_tv80_core/N1217 , \i_tv80_core/N1216 ,
         \i_tv80_core/N1215 , \i_tv80_core/RegWEL , \i_tv80_core/RegWEH ,
         \i_tv80_core/N1107 , \i_tv80_core/N1102 , \i_tv80_core/N262 ,
         \i_tv80_core/N261 , \i_tv80_core/N260 , \i_tv80_core/N259 ,
         \i_tv80_core/N258 , \i_tv80_core/N257 , \i_tv80_core/N256 ,
         \i_tv80_core/N255 , \i_tv80_core/N254 , \i_tv80_core/N253 ,
         \i_tv80_core/N252 , \i_tv80_core/N251 , \i_tv80_core/N250 ,
         \i_tv80_core/N249 , \i_tv80_core/N248 , \i_tv80_core/N247 ,
         \i_tv80_core/N159 , \i_tv80_core/N158 , \i_tv80_core/N157 ,
         \i_tv80_core/N156 , \i_tv80_core/N155 , \i_tv80_core/N154 ,
         \i_tv80_core/N153 , \i_tv80_core/Z16_r , \i_tv80_core/Arith16_r ,
         \i_tv80_core/Halt , \i_tv80_core/SetEI , \i_tv80_core/SetDI ,
         \i_tv80_core/I_INRC , \i_tv80_core/I_RRD , \i_tv80_core/I_RLD ,
         \i_tv80_core/I_BTR , \i_tv80_core/I_BC , \i_tv80_core/I_BT ,
         \i_tv80_core/I_RETN , \i_tv80_core/I_SCF , \i_tv80_core/I_CCF ,
         \i_tv80_core/I_CPL , \i_tv80_core/ExchangeRS ,
         \i_tv80_core/ExchangeAF , \i_tv80_core/ExchangeRp ,
         \i_tv80_core/ExchangeDH , \i_tv80_core/LDSPHL , \i_tv80_core/LDW ,
         \i_tv80_core/LDZ , \i_tv80_core/RstP , \i_tv80_core/Call ,
         \i_tv80_core/JumpXY , \i_tv80_core/JumpE , \i_tv80_core/Jump ,
         \i_tv80_core/Arith16 , \i_tv80_core/PreserveC ,
         \i_tv80_core/Save_ALU , \i_tv80_core/Read_To_Reg ,
         \i_tv80_core/Read_To_Acc , \i_tv80_core/Inc_WZ , \i_tv80_core/Inc_PC ,
         \i_tv80_core/IntCycle , \i_tv80_core/NMICycle , \i_tv80_core/stop ,
         \i_tv80_core/IntE , \i_tv80_core/n2180 , \i_tv80_core/n2179 ,
         \i_tv80_core/n2178 , \i_tv80_core/i_mcode/n887 ,
         \i_tv80_core/i_mcode/n886 , \i_tv80_core/i_mcode/n885 ,
         \i_tv80_core/i_mcode/n884 , \i_tv80_core/i_mcode/n883 ,
         \i_tv80_core/i_mcode/n882 , \i_tv80_core/i_mcode/n881 ,
         \i_tv80_core/i_mcode/n880 , \i_tv80_core/i_mcode/n879 ,
         \i_tv80_core/i_mcode/n878 , \i_tv80_core/i_mcode/n877 ,
         \i_tv80_core/i_mcode/n876 , \i_tv80_core/i_mcode/n875 ,
         \i_tv80_core/i_mcode/n874 , \i_tv80_core/i_mcode/n873 ,
         \i_tv80_core/i_mcode/n872 , \i_tv80_core/i_mcode/n871 ,
         \i_tv80_core/i_mcode/n870 , \i_tv80_core/i_mcode/n869 ,
         \i_tv80_core/i_mcode/n868 , \i_tv80_core/i_mcode/n867 ,
         \i_tv80_core/i_mcode/n866 , \i_tv80_core/i_mcode/n865 ,
         \i_tv80_core/i_mcode/n864 , \i_tv80_core/i_mcode/n863 ,
         \i_tv80_core/i_mcode/n862 , \i_tv80_core/i_mcode/n861 ,
         \i_tv80_core/i_mcode/n860 , \i_tv80_core/i_mcode/n859 ,
         \i_tv80_core/i_mcode/n858 , \i_tv80_core/i_mcode/n857 ,
         \i_tv80_core/i_mcode/n856 , \i_tv80_core/i_mcode/n855 ,
         \i_tv80_core/i_mcode/n854 , \i_tv80_core/i_mcode/n853 ,
         \i_tv80_core/i_mcode/n852 , \i_tv80_core/i_mcode/n851 ,
         \i_tv80_core/i_mcode/n850 , \i_tv80_core/i_mcode/n849 ,
         \i_tv80_core/i_mcode/n848 , \i_tv80_core/i_mcode/n847 ,
         \i_tv80_core/i_mcode/n846 , \i_tv80_core/i_mcode/n845 ,
         \i_tv80_core/i_mcode/n844 , \i_tv80_core/i_mcode/n843 ,
         \i_tv80_core/i_mcode/n842 , \i_tv80_core/i_mcode/n841 ,
         \i_tv80_core/i_mcode/n840 , \i_tv80_core/i_mcode/n839 ,
         \i_tv80_core/i_mcode/n838 , \i_tv80_core/i_mcode/n837 ,
         \i_tv80_core/i_mcode/n836 , \i_tv80_core/i_mcode/n835 ,
         \i_tv80_core/i_mcode/n834 , \i_tv80_core/i_mcode/n833 ,
         \i_tv80_core/i_mcode/n832 , \i_tv80_core/i_mcode/n831 ,
         \i_tv80_core/i_mcode/n830 , \i_tv80_core/i_mcode/n829 ,
         \i_tv80_core/i_mcode/n828 , \i_tv80_core/i_mcode/n827 ,
         \i_tv80_core/i_mcode/n826 , \i_tv80_core/i_mcode/n825 ,
         \i_tv80_core/i_mcode/n824 , \i_tv80_core/i_mcode/n823 ,
         \i_tv80_core/i_mcode/n822 , \i_tv80_core/i_mcode/n821 ,
         \i_tv80_core/i_mcode/n820 , \i_tv80_core/i_mcode/n819 ,
         \i_tv80_core/i_mcode/n818 , \i_tv80_core/i_mcode/n817 ,
         \i_tv80_core/i_mcode/n816 , \i_tv80_core/i_mcode/n815 ,
         \i_tv80_core/i_mcode/n814 , \i_tv80_core/i_mcode/n813 ,
         \i_tv80_core/i_mcode/n812 , \i_tv80_core/i_mcode/n811 ,
         \i_tv80_core/i_mcode/n810 , \i_tv80_core/i_mcode/n809 ,
         \i_tv80_core/i_mcode/n808 , \i_tv80_core/i_mcode/n807 ,
         \i_tv80_core/i_mcode/n806 , \i_tv80_core/i_mcode/n805 ,
         \i_tv80_core/i_mcode/n804 , \i_tv80_core/i_mcode/n803 ,
         \i_tv80_core/i_mcode/n802 , \i_tv80_core/i_mcode/n801 ,
         \i_tv80_core/i_mcode/n800 , \i_tv80_core/i_mcode/n799 ,
         \i_tv80_core/i_mcode/n798 , \i_tv80_core/i_mcode/n797 ,
         \i_tv80_core/i_mcode/n796 , \i_tv80_core/i_mcode/n795 ,
         \i_tv80_core/i_mcode/n794 , \i_tv80_core/i_mcode/n793 ,
         \i_tv80_core/i_mcode/n792 , \i_tv80_core/i_mcode/n791 ,
         \i_tv80_core/i_mcode/n790 , \i_tv80_core/i_mcode/n789 ,
         \i_tv80_core/i_mcode/n788 , \i_tv80_core/i_mcode/n787 ,
         \i_tv80_core/i_mcode/n786 , \i_tv80_core/i_mcode/n785 ,
         \i_tv80_core/i_mcode/n784 , \i_tv80_core/i_mcode/n783 ,
         \i_tv80_core/i_mcode/n782 , \i_tv80_core/i_mcode/n781 ,
         \i_tv80_core/i_mcode/n780 , \i_tv80_core/i_mcode/n779 ,
         \i_tv80_core/i_mcode/n778 , \i_tv80_core/i_mcode/n777 ,
         \i_tv80_core/i_mcode/n776 , \i_tv80_core/i_mcode/n775 ,
         \i_tv80_core/i_mcode/n774 , \i_tv80_core/i_mcode/n773 ,
         \i_tv80_core/i_mcode/n772 , \i_tv80_core/i_mcode/n771 ,
         \i_tv80_core/i_mcode/n770 , \i_tv80_core/i_mcode/n769 ,
         \i_tv80_core/i_mcode/n768 , \i_tv80_core/i_mcode/n767 ,
         \i_tv80_core/i_mcode/n766 , \i_tv80_core/i_mcode/n765 ,
         \i_tv80_core/i_mcode/n764 , \i_tv80_core/i_mcode/n763 ,
         \i_tv80_core/i_mcode/n762 , \i_tv80_core/i_mcode/n761 ,
         \i_tv80_core/i_mcode/n760 , \i_tv80_core/i_mcode/n759 ,
         \i_tv80_core/i_mcode/n758 , \i_tv80_core/i_mcode/n757 ,
         \i_tv80_core/i_mcode/n756 , \i_tv80_core/i_mcode/n755 ,
         \i_tv80_core/i_mcode/n754 , \i_tv80_core/i_mcode/n753 ,
         \i_tv80_core/i_mcode/n752 , \i_tv80_core/i_mcode/n751 ,
         \i_tv80_core/i_mcode/n750 , \i_tv80_core/i_mcode/n749 ,
         \i_tv80_core/i_mcode/n748 , \i_tv80_core/i_mcode/n747 ,
         \i_tv80_core/i_mcode/n746 , \i_tv80_core/i_mcode/n745 ,
         \i_tv80_core/i_mcode/n744 , \i_tv80_core/i_mcode/n743 ,
         \i_tv80_core/i_mcode/n742 , \i_tv80_core/i_mcode/n741 ,
         \i_tv80_core/i_mcode/n740 , \i_tv80_core/i_mcode/n739 ,
         \i_tv80_core/i_mcode/n738 , \i_tv80_core/i_mcode/n737 ,
         \i_tv80_core/i_mcode/n736 , \i_tv80_core/i_mcode/n735 ,
         \i_tv80_core/i_mcode/n734 , \i_tv80_core/i_mcode/n733 ,
         \i_tv80_core/i_mcode/n732 , \i_tv80_core/i_mcode/n731 ,
         \i_tv80_core/i_mcode/n730 , \i_tv80_core/i_mcode/n729 ,
         \i_tv80_core/i_mcode/n728 , \i_tv80_core/i_mcode/n727 ,
         \i_tv80_core/i_mcode/n726 , \i_tv80_core/i_mcode/n725 ,
         \i_tv80_core/i_mcode/n724 , \i_tv80_core/i_mcode/n723 ,
         \i_tv80_core/i_mcode/n722 , \i_tv80_core/i_mcode/n721 ,
         \i_tv80_core/i_mcode/n720 , \i_tv80_core/i_mcode/n719 ,
         \i_tv80_core/i_mcode/n718 , \i_tv80_core/i_mcode/n717 ,
         \i_tv80_core/i_mcode/n716 , \i_tv80_core/i_mcode/n715 ,
         \i_tv80_core/i_mcode/n714 , \i_tv80_core/i_mcode/n713 ,
         \i_tv80_core/i_mcode/n712 , \i_tv80_core/i_mcode/n711 ,
         \i_tv80_core/i_mcode/n710 , \i_tv80_core/i_mcode/n709 ,
         \i_tv80_core/i_mcode/n708 , \i_tv80_core/i_mcode/n707 ,
         \i_tv80_core/i_mcode/n706 , \i_tv80_core/i_mcode/n705 ,
         \i_tv80_core/i_mcode/n704 , \i_tv80_core/i_mcode/n703 ,
         \i_tv80_core/i_mcode/n702 , \i_tv80_core/i_mcode/n701 ,
         \i_tv80_core/i_mcode/n700 , \i_tv80_core/i_mcode/n699 ,
         \i_tv80_core/i_mcode/n698 , \i_tv80_core/i_mcode/n697 ,
         \i_tv80_core/i_mcode/n696 , \i_tv80_core/i_mcode/n695 ,
         \i_tv80_core/i_mcode/n694 , \i_tv80_core/i_mcode/n693 ,
         \i_tv80_core/i_mcode/n692 , \i_tv80_core/i_mcode/n691 ,
         \i_tv80_core/i_mcode/n690 , \i_tv80_core/i_mcode/n689 ,
         \i_tv80_core/i_mcode/n688 , \i_tv80_core/i_mcode/n687 ,
         \i_tv80_core/i_mcode/n686 , \i_tv80_core/i_mcode/n685 ,
         \i_tv80_core/i_mcode/n684 , \i_tv80_core/i_mcode/n683 ,
         \i_tv80_core/i_mcode/n682 , \i_tv80_core/i_mcode/n681 ,
         \i_tv80_core/i_mcode/n680 , \i_tv80_core/i_mcode/n679 ,
         \i_tv80_core/i_mcode/n678 , \i_tv80_core/i_mcode/n677 ,
         \i_tv80_core/i_mcode/n676 , \i_tv80_core/i_mcode/n675 ,
         \i_tv80_core/i_mcode/n674 , \i_tv80_core/i_mcode/n673 ,
         \i_tv80_core/i_mcode/n672 , \i_tv80_core/i_mcode/n671 ,
         \i_tv80_core/i_mcode/n670 , \i_tv80_core/i_mcode/n669 ,
         \i_tv80_core/i_mcode/n668 , \i_tv80_core/i_mcode/n667 ,
         \i_tv80_core/i_mcode/n666 , \i_tv80_core/i_mcode/n665 ,
         \i_tv80_core/i_mcode/n664 , \i_tv80_core/i_mcode/n663 ,
         \i_tv80_core/i_mcode/n662 , \i_tv80_core/i_mcode/n661 ,
         \i_tv80_core/i_mcode/n660 , \i_tv80_core/i_mcode/n659 ,
         \i_tv80_core/i_mcode/n658 , \i_tv80_core/i_mcode/n657 ,
         \i_tv80_core/i_mcode/n656 , \i_tv80_core/i_mcode/n655 ,
         \i_tv80_core/i_mcode/n654 , \i_tv80_core/i_mcode/n653 ,
         \i_tv80_core/i_mcode/n652 , \i_tv80_core/i_mcode/n651 ,
         \i_tv80_core/i_mcode/n650 , \i_tv80_core/i_mcode/n649 ,
         \i_tv80_core/i_mcode/n648 , \i_tv80_core/i_mcode/n647 ,
         \i_tv80_core/i_mcode/n646 , \i_tv80_core/i_mcode/n645 ,
         \i_tv80_core/i_mcode/n644 , \i_tv80_core/i_mcode/n643 ,
         \i_tv80_core/i_mcode/n642 , \i_tv80_core/i_mcode/n641 ,
         \i_tv80_core/i_mcode/n640 , \i_tv80_core/i_mcode/n639 ,
         \i_tv80_core/i_mcode/n638 , \i_tv80_core/i_mcode/n637 ,
         \i_tv80_core/i_mcode/n636 , \i_tv80_core/i_mcode/n635 ,
         \i_tv80_core/i_mcode/n634 , \i_tv80_core/i_mcode/n633 ,
         \i_tv80_core/i_mcode/n632 , \i_tv80_core/i_mcode/n631 ,
         \i_tv80_core/i_mcode/n630 , \i_tv80_core/i_mcode/n629 ,
         \i_tv80_core/i_mcode/n628 , \i_tv80_core/i_mcode/n627 ,
         \i_tv80_core/i_mcode/n626 , \i_tv80_core/i_mcode/n625 ,
         \i_tv80_core/i_mcode/n624 , \i_tv80_core/i_mcode/n623 ,
         \i_tv80_core/i_mcode/n622 , \i_tv80_core/i_mcode/n621 ,
         \i_tv80_core/i_mcode/n620 , \i_tv80_core/i_mcode/n619 ,
         \i_tv80_core/i_mcode/n618 , \i_tv80_core/i_mcode/n617 ,
         \i_tv80_core/i_mcode/n616 , \i_tv80_core/i_mcode/n615 ,
         \i_tv80_core/i_mcode/n614 , \i_tv80_core/i_mcode/n613 ,
         \i_tv80_core/i_mcode/n612 , \i_tv80_core/i_mcode/n611 ,
         \i_tv80_core/i_mcode/n610 , \i_tv80_core/i_mcode/n609 ,
         \i_tv80_core/i_mcode/n608 , \i_tv80_core/i_mcode/n607 ,
         \i_tv80_core/i_mcode/n606 , \i_tv80_core/i_mcode/n605 ,
         \i_tv80_core/i_mcode/n604 , \i_tv80_core/i_mcode/n603 ,
         \i_tv80_core/i_mcode/n602 , \i_tv80_core/i_mcode/n601 ,
         \i_tv80_core/i_mcode/n600 , \i_tv80_core/i_mcode/n599 ,
         \i_tv80_core/i_mcode/n598 , \i_tv80_core/i_mcode/n597 ,
         \i_tv80_core/i_mcode/n596 , \i_tv80_core/i_mcode/n595 ,
         \i_tv80_core/i_mcode/n594 , \i_tv80_core/i_mcode/n593 ,
         \i_tv80_core/i_mcode/n592 , \i_tv80_core/i_mcode/n591 ,
         \i_tv80_core/i_mcode/n590 , \i_tv80_core/i_mcode/n589 ,
         \i_tv80_core/i_mcode/n588 , \i_tv80_core/i_mcode/n587 ,
         \i_tv80_core/i_mcode/n586 , \i_tv80_core/i_mcode/n585 ,
         \i_tv80_core/i_mcode/n584 , \i_tv80_core/i_mcode/n583 ,
         \i_tv80_core/i_mcode/n582 , \i_tv80_core/i_mcode/n581 ,
         \i_tv80_core/i_mcode/n580 , \i_tv80_core/i_mcode/n579 ,
         \i_tv80_core/i_mcode/n578 , \i_tv80_core/i_mcode/n577 ,
         \i_tv80_core/i_mcode/n576 , \i_tv80_core/i_mcode/n575 ,
         \i_tv80_core/i_mcode/n574 , \i_tv80_core/i_mcode/n573 ,
         \i_tv80_core/i_mcode/n572 , \i_tv80_core/i_mcode/n571 ,
         \i_tv80_core/i_mcode/n570 , \i_tv80_core/i_mcode/n569 ,
         \i_tv80_core/i_mcode/n568 , \i_tv80_core/i_mcode/n567 ,
         \i_tv80_core/i_mcode/n566 , \i_tv80_core/i_mcode/n565 ,
         \i_tv80_core/i_mcode/n564 , \i_tv80_core/i_mcode/n563 ,
         \i_tv80_core/i_mcode/n562 , \i_tv80_core/i_mcode/n561 ,
         \i_tv80_core/i_mcode/n560 , \i_tv80_core/i_mcode/n559 ,
         \i_tv80_core/i_mcode/n558 , \i_tv80_core/i_mcode/n557 ,
         \i_tv80_core/i_mcode/n556 , \i_tv80_core/i_mcode/n555 ,
         \i_tv80_core/i_mcode/n554 , \i_tv80_core/i_mcode/n553 ,
         \i_tv80_core/i_mcode/n552 , \i_tv80_core/i_mcode/n551 ,
         \i_tv80_core/i_mcode/n550 , \i_tv80_core/i_mcode/n549 ,
         \i_tv80_core/i_mcode/n548 , \i_tv80_core/i_mcode/n547 ,
         \i_tv80_core/i_mcode/n546 , \i_tv80_core/i_mcode/n545 ,
         \i_tv80_core/i_mcode/n544 , \i_tv80_core/i_mcode/n543 ,
         \i_tv80_core/i_mcode/n542 , \i_tv80_core/i_mcode/n541 ,
         \i_tv80_core/i_mcode/n540 , \i_tv80_core/i_mcode/n539 ,
         \i_tv80_core/i_mcode/n538 , \i_tv80_core/i_mcode/n537 ,
         \i_tv80_core/i_mcode/n536 , \i_tv80_core/i_mcode/n535 ,
         \i_tv80_core/i_mcode/n534 , \i_tv80_core/i_mcode/n533 ,
         \i_tv80_core/i_mcode/n532 , \i_tv80_core/i_mcode/n531 ,
         \i_tv80_core/i_mcode/n530 , \i_tv80_core/i_mcode/n529 ,
         \i_tv80_core/i_mcode/n528 , \i_tv80_core/i_mcode/n527 ,
         \i_tv80_core/i_mcode/n526 , \i_tv80_core/i_mcode/n525 ,
         \i_tv80_core/i_mcode/n524 , \i_tv80_core/i_mcode/n523 ,
         \i_tv80_core/i_mcode/n522 , \i_tv80_core/i_mcode/n521 ,
         \i_tv80_core/i_mcode/n520 , \i_tv80_core/i_mcode/n519 ,
         \i_tv80_core/i_mcode/n518 , \i_tv80_core/i_mcode/n517 ,
         \i_tv80_core/i_mcode/n516 , \i_tv80_core/i_mcode/n515 ,
         \i_tv80_core/i_mcode/n514 , \i_tv80_core/i_mcode/n513 ,
         \i_tv80_core/i_mcode/n512 , \i_tv80_core/i_mcode/n511 ,
         \i_tv80_core/i_mcode/n510 , \i_tv80_core/i_mcode/n509 ,
         \i_tv80_core/i_mcode/n508 , \i_tv80_core/i_mcode/n507 ,
         \i_tv80_core/i_mcode/n506 , \i_tv80_core/i_mcode/n505 ,
         \i_tv80_core/i_mcode/n504 , \i_tv80_core/i_mcode/n503 ,
         \i_tv80_core/i_mcode/n502 , \i_tv80_core/i_mcode/n501 ,
         \i_tv80_core/i_mcode/n500 , \i_tv80_core/i_mcode/n499 ,
         \i_tv80_core/i_mcode/n498 , \i_tv80_core/i_mcode/n497 ,
         \i_tv80_core/i_mcode/n496 , \i_tv80_core/i_mcode/n495 ,
         \i_tv80_core/i_mcode/n494 , \i_tv80_core/i_mcode/n493 ,
         \i_tv80_core/i_mcode/n492 , \i_tv80_core/i_mcode/n491 ,
         \i_tv80_core/i_mcode/n490 , \i_tv80_core/i_mcode/n489 ,
         \i_tv80_core/i_mcode/n488 , \i_tv80_core/i_mcode/n487 ,
         \i_tv80_core/i_mcode/n486 , \i_tv80_core/i_mcode/n485 ,
         \i_tv80_core/i_mcode/n484 , \i_tv80_core/i_mcode/n483 ,
         \i_tv80_core/i_mcode/n482 , \i_tv80_core/i_mcode/n481 ,
         \i_tv80_core/i_mcode/n480 , \i_tv80_core/i_mcode/n479 ,
         \i_tv80_core/i_mcode/n478 , \i_tv80_core/i_mcode/n477 ,
         \i_tv80_core/i_mcode/n476 , \i_tv80_core/i_mcode/n475 ,
         \i_tv80_core/i_mcode/n474 , \i_tv80_core/i_mcode/n473 ,
         \i_tv80_core/i_mcode/n472 , \i_tv80_core/i_mcode/n471 ,
         \i_tv80_core/i_mcode/n470 , \i_tv80_core/i_mcode/n469 ,
         \i_tv80_core/i_mcode/n468 , \i_tv80_core/i_mcode/n467 ,
         \i_tv80_core/i_mcode/n466 , \i_tv80_core/i_mcode/n465 ,
         \i_tv80_core/i_mcode/n464 , \i_tv80_core/i_mcode/n463 ,
         \i_tv80_core/i_mcode/n462 , \i_tv80_core/i_mcode/n461 ,
         \i_tv80_core/i_mcode/n460 , \i_tv80_core/i_mcode/n459 ,
         \i_tv80_core/i_mcode/n458 , \i_tv80_core/i_mcode/n457 ,
         \i_tv80_core/i_mcode/n456 , \i_tv80_core/i_mcode/n455 ,
         \i_tv80_core/i_mcode/n454 , \i_tv80_core/i_mcode/n453 ,
         \i_tv80_core/i_mcode/n452 , \i_tv80_core/i_mcode/n451 ,
         \i_tv80_core/i_mcode/n450 , \i_tv80_core/i_mcode/n449 ,
         \i_tv80_core/i_mcode/n448 , \i_tv80_core/i_mcode/n447 ,
         \i_tv80_core/i_mcode/n446 , \i_tv80_core/i_mcode/n445 ,
         \i_tv80_core/i_mcode/n444 , \i_tv80_core/i_mcode/n443 ,
         \i_tv80_core/i_mcode/n442 , \i_tv80_core/i_mcode/n441 ,
         \i_tv80_core/i_mcode/n440 , \i_tv80_core/i_mcode/n439 ,
         \i_tv80_core/i_mcode/n438 , \i_tv80_core/i_mcode/n437 ,
         \i_tv80_core/i_mcode/n436 , \i_tv80_core/i_mcode/n435 ,
         \i_tv80_core/i_mcode/n434 , \i_tv80_core/i_mcode/n433 ,
         \i_tv80_core/i_mcode/n432 , \i_tv80_core/i_mcode/n431 ,
         \i_tv80_core/i_mcode/n430 , \i_tv80_core/i_mcode/n429 ,
         \i_tv80_core/i_mcode/n428 , \i_tv80_core/i_mcode/n427 ,
         \i_tv80_core/i_mcode/n426 , \i_tv80_core/i_mcode/n425 ,
         \i_tv80_core/i_mcode/n424 , \i_tv80_core/i_mcode/n423 ,
         \i_tv80_core/i_mcode/n422 , \i_tv80_core/i_mcode/n421 ,
         \i_tv80_core/i_mcode/n420 , \i_tv80_core/i_mcode/n419 ,
         \i_tv80_core/i_mcode/n418 , \i_tv80_core/i_mcode/n417 ,
         \i_tv80_core/i_mcode/n416 , \i_tv80_core/i_mcode/n415 ,
         \i_tv80_core/i_mcode/n414 , \i_tv80_core/i_mcode/n413 ,
         \i_tv80_core/i_mcode/n412 , \i_tv80_core/i_mcode/n411 ,
         \i_tv80_core/i_mcode/n410 , \i_tv80_core/i_mcode/n409 ,
         \i_tv80_core/i_mcode/n408 , \i_tv80_core/i_mcode/n407 ,
         \i_tv80_core/i_mcode/n406 , \i_tv80_core/i_mcode/n405 ,
         \i_tv80_core/i_mcode/n404 , \i_tv80_core/i_mcode/n403 ,
         \i_tv80_core/i_mcode/n402 , \i_tv80_core/i_mcode/n401 ,
         \i_tv80_core/i_mcode/n400 , \i_tv80_core/i_mcode/n399 ,
         \i_tv80_core/i_mcode/n398 , \i_tv80_core/i_mcode/n397 ,
         \i_tv80_core/i_mcode/n396 , \i_tv80_core/i_mcode/n395 ,
         \i_tv80_core/i_mcode/n394 , \i_tv80_core/i_mcode/n393 ,
         \i_tv80_core/i_mcode/n392 , \i_tv80_core/i_mcode/n391 ,
         \i_tv80_core/i_mcode/n390 , \i_tv80_core/i_mcode/n389 ,
         \i_tv80_core/i_mcode/n388 , \i_tv80_core/i_mcode/n387 ,
         \i_tv80_core/i_mcode/n386 , \i_tv80_core/i_mcode/n385 ,
         \i_tv80_core/i_mcode/n384 , \i_tv80_core/i_mcode/n383 ,
         \i_tv80_core/i_mcode/n382 , \i_tv80_core/i_mcode/n381 ,
         \i_tv80_core/i_mcode/n380 , \i_tv80_core/i_mcode/n379 ,
         \i_tv80_core/i_mcode/n378 , \i_tv80_core/i_mcode/n377 ,
         \i_tv80_core/i_mcode/n376 , \i_tv80_core/i_mcode/n375 ,
         \i_tv80_core/i_mcode/n374 , \i_tv80_core/i_mcode/n373 ,
         \i_tv80_core/i_mcode/n372 , \i_tv80_core/i_mcode/n371 ,
         \i_tv80_core/i_mcode/n370 , \i_tv80_core/i_mcode/n369 ,
         \i_tv80_core/i_mcode/n368 , \i_tv80_core/i_mcode/n367 ,
         \i_tv80_core/i_mcode/n366 , \i_tv80_core/i_mcode/n365 ,
         \i_tv80_core/i_mcode/n364 , \i_tv80_core/i_mcode/n363 ,
         \i_tv80_core/i_mcode/n362 , \i_tv80_core/i_mcode/n361 ,
         \i_tv80_core/i_mcode/n360 , \i_tv80_core/i_mcode/n359 ,
         \i_tv80_core/i_mcode/n358 , \i_tv80_core/i_mcode/n357 ,
         \i_tv80_core/i_mcode/n356 , \i_tv80_core/i_mcode/n355 ,
         \i_tv80_core/i_mcode/n354 , \i_tv80_core/i_mcode/n353 ,
         \i_tv80_core/i_mcode/n352 , \i_tv80_core/i_mcode/n351 ,
         \i_tv80_core/i_mcode/n350 , \i_tv80_core/i_mcode/n349 ,
         \i_tv80_core/i_mcode/n348 , \i_tv80_core/i_mcode/n347 ,
         \i_tv80_core/i_mcode/n346 , \i_tv80_core/i_mcode/n345 ,
         \i_tv80_core/i_mcode/n344 , \i_tv80_core/i_mcode/n343 ,
         \i_tv80_core/i_mcode/n342 , \i_tv80_core/i_mcode/n341 ,
         \i_tv80_core/i_mcode/n340 , \i_tv80_core/i_mcode/n339 ,
         \i_tv80_core/i_mcode/n338 , \i_tv80_core/i_mcode/n337 ,
         \i_tv80_core/i_mcode/n336 , \i_tv80_core/i_mcode/n335 ,
         \i_tv80_core/i_mcode/n334 , \i_tv80_core/i_mcode/n333 ,
         \i_tv80_core/i_mcode/n332 , \i_tv80_core/i_mcode/n331 ,
         \i_tv80_core/i_mcode/n330 , \i_tv80_core/i_mcode/n329 ,
         \i_tv80_core/i_mcode/n328 , \i_tv80_core/i_mcode/n327 ,
         \i_tv80_core/i_mcode/n326 , \i_tv80_core/i_mcode/n325 ,
         \i_tv80_core/i_mcode/n324 , \i_tv80_core/i_mcode/n323 ,
         \i_tv80_core/i_mcode/n322 , \i_tv80_core/i_mcode/n321 ,
         \i_tv80_core/i_mcode/n320 , \i_tv80_core/i_mcode/n319 ,
         \i_tv80_core/i_mcode/n318 , \i_tv80_core/i_mcode/n317 ,
         \i_tv80_core/i_mcode/n316 , \i_tv80_core/i_mcode/n315 ,
         \i_tv80_core/i_mcode/n314 , \i_tv80_core/i_mcode/n313 ,
         \i_tv80_core/i_mcode/n312 , \i_tv80_core/i_mcode/n311 ,
         \i_tv80_core/i_mcode/n310 , \i_tv80_core/i_mcode/n309 ,
         \i_tv80_core/i_mcode/n308 , \i_tv80_core/i_mcode/n307 ,
         \i_tv80_core/i_mcode/n306 , \i_tv80_core/i_mcode/n305 ,
         \i_tv80_core/i_mcode/n304 , \i_tv80_core/i_mcode/n303 ,
         \i_tv80_core/i_mcode/n302 , \i_tv80_core/i_mcode/n301 ,
         \i_tv80_core/i_mcode/n300 , \i_tv80_core/i_mcode/n299 ,
         \i_tv80_core/i_mcode/n298 , \i_tv80_core/i_mcode/n297 ,
         \i_tv80_core/i_mcode/n296 , \i_tv80_core/i_mcode/n295 ,
         \i_tv80_core/i_mcode/n294 , \i_tv80_core/i_mcode/n293 ,
         \i_tv80_core/i_mcode/n292 , \i_tv80_core/i_mcode/n291 ,
         \i_tv80_core/i_mcode/n290 , \i_tv80_core/i_mcode/n289 ,
         \i_tv80_core/i_mcode/n288 , \i_tv80_core/i_mcode/n287 ,
         \i_tv80_core/i_mcode/n286 , \i_tv80_core/i_mcode/n285 ,
         \i_tv80_core/i_mcode/n284 , \i_tv80_core/i_mcode/n283 ,
         \i_tv80_core/i_mcode/n282 , \i_tv80_core/i_mcode/n281 ,
         \i_tv80_core/i_mcode/n280 , \i_tv80_core/i_mcode/n279 ,
         \i_tv80_core/i_mcode/n278 , \i_tv80_core/i_mcode/n277 ,
         \i_tv80_core/i_mcode/n276 , \i_tv80_core/i_mcode/n275 ,
         \i_tv80_core/i_mcode/n274 , \i_tv80_core/i_mcode/n273 ,
         \i_tv80_core/i_mcode/n272 , \i_tv80_core/i_mcode/n271 ,
         \i_tv80_core/i_mcode/n270 , \i_tv80_core/i_mcode/n269 ,
         \i_tv80_core/i_mcode/n268 , \i_tv80_core/i_mcode/n267 ,
         \i_tv80_core/i_mcode/n266 , \i_tv80_core/i_mcode/n265 ,
         \i_tv80_core/i_mcode/n264 , \i_tv80_core/i_mcode/n263 ,
         \i_tv80_core/i_mcode/n262 , \i_tv80_core/i_mcode/n261 ,
         \i_tv80_core/i_mcode/n260 , \i_tv80_core/i_mcode/n259 ,
         \i_tv80_core/i_mcode/n258 , \i_tv80_core/i_mcode/n257 ,
         \i_tv80_core/i_mcode/n256 , \i_tv80_core/i_mcode/n255 ,
         \i_tv80_core/i_mcode/n254 , \i_tv80_core/i_mcode/n253 ,
         \i_tv80_core/i_mcode/n252 , \i_tv80_core/i_mcode/n251 ,
         \i_tv80_core/i_mcode/n250 , \i_tv80_core/i_mcode/n249 ,
         \i_tv80_core/i_mcode/n248 , \i_tv80_core/i_mcode/n247 ,
         \i_tv80_core/i_mcode/n246 , \i_tv80_core/i_mcode/n245 ,
         \i_tv80_core/i_mcode/n244 , \i_tv80_core/i_mcode/n243 ,
         \i_tv80_core/i_mcode/n242 , \i_tv80_core/i_mcode/n241 ,
         \i_tv80_core/i_mcode/n240 , \i_tv80_core/i_mcode/n239 ,
         \i_tv80_core/i_mcode/n238 , \i_tv80_core/i_mcode/n237 ,
         \i_tv80_core/i_mcode/n236 , \i_tv80_core/i_mcode/n235 ,
         \i_tv80_core/i_mcode/n234 , \i_tv80_core/i_mcode/n233 ,
         \i_tv80_core/i_mcode/n232 , \i_tv80_core/i_mcode/n231 ,
         \i_tv80_core/i_mcode/n230 , \i_tv80_core/i_mcode/n229 ,
         \i_tv80_core/i_mcode/n228 , \i_tv80_core/i_mcode/n227 ,
         \i_tv80_core/i_mcode/n226 , \i_tv80_core/i_mcode/n225 ,
         \i_tv80_core/i_mcode/n224 , \i_tv80_core/i_mcode/n223 ,
         \i_tv80_core/i_mcode/n222 , \i_tv80_core/i_mcode/n221 ,
         \i_tv80_core/i_mcode/n220 , \i_tv80_core/i_mcode/n219 ,
         \i_tv80_core/i_mcode/n218 , \i_tv80_core/i_mcode/n217 ,
         \i_tv80_core/i_mcode/n216 , \i_tv80_core/i_mcode/n215 ,
         \i_tv80_core/i_mcode/n214 , \i_tv80_core/i_mcode/n213 ,
         \i_tv80_core/i_mcode/n212 , \i_tv80_core/i_mcode/n211 ,
         \i_tv80_core/i_mcode/n210 , \i_tv80_core/i_mcode/n209 ,
         \i_tv80_core/i_mcode/n208 , \i_tv80_core/i_mcode/n207 ,
         \i_tv80_core/i_mcode/n206 , \i_tv80_core/i_mcode/n205 ,
         \i_tv80_core/i_mcode/n204 , \i_tv80_core/i_mcode/n203 ,
         \i_tv80_core/i_mcode/n202 , \i_tv80_core/i_mcode/n201 ,
         \i_tv80_core/i_mcode/n200 , \i_tv80_core/i_mcode/n199 ,
         \i_tv80_core/i_mcode/n198 , \i_tv80_core/i_mcode/n197 ,
         \i_tv80_core/i_mcode/n196 , \i_tv80_core/i_mcode/n195 ,
         \i_tv80_core/i_mcode/n194 , \i_tv80_core/i_mcode/n193 ,
         \i_tv80_core/i_mcode/n192 , \i_tv80_core/i_mcode/n191 ,
         \i_tv80_core/i_mcode/n190 , \i_tv80_core/i_mcode/n189 ,
         \i_tv80_core/i_mcode/n188 , \i_tv80_core/i_mcode/n187 ,
         \i_tv80_core/i_mcode/n186 , \i_tv80_core/i_mcode/n185 ,
         \i_tv80_core/i_mcode/n184 , \i_tv80_core/i_mcode/n183 ,
         \i_tv80_core/i_mcode/n182 , \i_tv80_core/i_mcode/n181 ,
         \i_tv80_core/i_mcode/n180 , \i_tv80_core/i_mcode/n179 ,
         \i_tv80_core/i_mcode/n178 , \i_tv80_core/i_mcode/n177 ,
         \i_tv80_core/i_mcode/n176 , \i_tv80_core/i_mcode/n175 ,
         \i_tv80_core/i_mcode/n174 , \i_tv80_core/i_mcode/n173 ,
         \i_tv80_core/i_mcode/n172 , \i_tv80_core/i_mcode/n171 ,
         \i_tv80_core/i_mcode/n170 , \i_tv80_core/i_mcode/n169 ,
         \i_tv80_core/i_mcode/n168 , \i_tv80_core/i_mcode/n167 ,
         \i_tv80_core/i_mcode/n166 , \i_tv80_core/i_mcode/n165 ,
         \i_tv80_core/i_mcode/n164 , \i_tv80_core/i_mcode/n163 ,
         \i_tv80_core/i_mcode/n162 , \i_tv80_core/i_mcode/n161 ,
         \i_tv80_core/i_mcode/n160 , \i_tv80_core/i_mcode/n159 ,
         \i_tv80_core/i_mcode/n158 , \i_tv80_core/i_mcode/n157 ,
         \i_tv80_core/i_mcode/n156 , \i_tv80_core/i_mcode/n155 ,
         \i_tv80_core/i_mcode/n154 , \i_tv80_core/i_mcode/n153 ,
         \i_tv80_core/i_mcode/n152 , \i_tv80_core/i_mcode/n151 ,
         \i_tv80_core/i_mcode/n150 , \i_tv80_core/i_mcode/n149 ,
         \i_tv80_core/i_mcode/n148 , \i_tv80_core/i_mcode/n147 ,
         \i_tv80_core/i_mcode/n146 , \i_tv80_core/i_mcode/n145 ,
         \i_tv80_core/i_mcode/n144 , \i_tv80_core/i_mcode/n143 ,
         \i_tv80_core/i_mcode/n142 , \i_tv80_core/i_mcode/n141 ,
         \i_tv80_core/i_mcode/n140 , \i_tv80_core/i_mcode/n139 ,
         \i_tv80_core/i_mcode/n138 , \i_tv80_core/i_mcode/n137 ,
         \i_tv80_core/i_mcode/n136 , \i_tv80_core/i_mcode/n135 ,
         \i_tv80_core/i_mcode/n134 , \i_tv80_core/i_mcode/n133 ,
         \i_tv80_core/i_mcode/n129 , \i_tv80_core/i_mcode/n128 ,
         \i_tv80_core/i_mcode/n126 , \i_tv80_core/i_mcode/n125 ,
         \i_tv80_core/i_mcode/n124 , \i_tv80_core/i_mcode/n123 ,
         \i_tv80_core/i_mcode/n122 , \i_tv80_core/i_mcode/n121 ,
         \i_tv80_core/i_mcode/n120 , \i_tv80_core/i_mcode/n119 ,
         \i_tv80_core/i_mcode/n118 , \i_tv80_core/i_mcode/n117 ,
         \i_tv80_core/i_mcode/n116 , \i_tv80_core/i_mcode/n115 ,
         \i_tv80_core/i_mcode/n114 , \i_tv80_core/i_mcode/n113 ,
         \i_tv80_core/i_mcode/n112 , \i_tv80_core/i_mcode/n111 ,
         \i_tv80_core/i_mcode/n110 , \i_tv80_core/i_mcode/n109 ,
         \i_tv80_core/i_mcode/n108 , \i_tv80_core/i_mcode/n107 ,
         \i_tv80_core/i_mcode/n106 , \i_tv80_core/i_mcode/n105 ,
         \i_tv80_core/i_mcode/n104 , \i_tv80_core/i_mcode/n103 ,
         \i_tv80_core/i_mcode/n102 , \i_tv80_core/i_mcode/n101 ,
         \i_tv80_core/i_mcode/n100 , \i_tv80_core/i_mcode/n99 ,
         \i_tv80_core/i_mcode/n98 , \i_tv80_core/i_mcode/n97 ,
         \i_tv80_core/i_mcode/n96 , \i_tv80_core/i_mcode/n95 ,
         \i_tv80_core/i_mcode/n94 , \i_tv80_core/i_mcode/n93 ,
         \i_tv80_core/i_mcode/n92 , \i_tv80_core/i_mcode/n91 ,
         \i_tv80_core/i_mcode/n90 , \i_tv80_core/i_mcode/n89 ,
         \i_tv80_core/i_mcode/n88 , \i_tv80_core/i_mcode/n87 ,
         \i_tv80_core/i_mcode/n86 , \i_tv80_core/i_mcode/n85 ,
         \i_tv80_core/i_mcode/n84 , \i_tv80_core/i_mcode/n83 ,
         \i_tv80_core/i_mcode/n82 , \i_tv80_core/i_mcode/n81 ,
         \i_tv80_core/i_mcode/n80 , \i_tv80_core/i_mcode/n79 ,
         \i_tv80_core/i_mcode/n78 , \i_tv80_core/i_mcode/n77 ,
         \i_tv80_core/i_mcode/n76 , \i_tv80_core/i_mcode/n75 ,
         \i_tv80_core/i_mcode/n74 , \i_tv80_core/i_mcode/n73 ,
         \i_tv80_core/i_mcode/n72 , \i_tv80_core/i_mcode/n71 ,
         \i_tv80_core/i_mcode/n70 , \i_tv80_core/i_mcode/n69 ,
         \i_tv80_core/i_mcode/n68 , \i_tv80_core/i_mcode/n67 ,
         \i_tv80_core/i_mcode/n66 , \i_tv80_core/i_mcode/n65 ,
         \i_tv80_core/i_mcode/n64 , \i_tv80_core/i_mcode/n63 ,
         \i_tv80_core/i_mcode/n62 , \i_tv80_core/i_mcode/n61 ,
         \i_tv80_core/i_mcode/n60 , \i_tv80_core/i_mcode/n59 ,
         \i_tv80_core/i_mcode/n58 , \i_tv80_core/i_mcode/n57 ,
         \i_tv80_core/i_mcode/n56 , \i_tv80_core/i_mcode/n55 ,
         \i_tv80_core/i_mcode/n54 , \i_tv80_core/i_mcode/n53 ,
         \i_tv80_core/i_mcode/n52 , \i_tv80_core/i_mcode/n51 ,
         \i_tv80_core/i_mcode/n50 , \i_tv80_core/i_mcode/n49 ,
         \i_tv80_core/i_mcode/n48 , \i_tv80_core/i_mcode/n47 ,
         \i_tv80_core/i_mcode/n46 , \i_tv80_core/i_mcode/n45 ,
         \i_tv80_core/i_mcode/n44 , \i_tv80_core/i_mcode/n43 ,
         \i_tv80_core/i_mcode/n42 , \i_tv80_core/i_mcode/n41 ,
         \i_tv80_core/i_mcode/n40 , \i_tv80_core/i_mcode/n39 ,
         \i_tv80_core/i_mcode/n38 , \i_tv80_core/i_mcode/n37 ,
         \i_tv80_core/i_mcode/n36 , \i_tv80_core/i_mcode/n35 ,
         \i_tv80_core/i_mcode/n34 , \i_tv80_core/i_mcode/n33 ,
         \i_tv80_core/i_mcode/n32 , \i_tv80_core/i_mcode/n31 ,
         \i_tv80_core/i_mcode/n30 , \i_tv80_core/i_mcode/n29 ,
         \i_tv80_core/i_mcode/n28 , \i_tv80_core/i_mcode/n27 ,
         \i_tv80_core/i_mcode/n26 , \i_tv80_core/i_mcode/n25 ,
         \i_tv80_core/i_mcode/n24 , \i_tv80_core/i_mcode/n23 ,
         \i_tv80_core/i_mcode/n22 , \i_tv80_core/i_mcode/n21 ,
         \i_tv80_core/i_mcode/n20 , \i_tv80_core/i_mcode/n19 ,
         \i_tv80_core/i_mcode/n18 , \i_tv80_core/i_mcode/n17 ,
         \i_tv80_core/i_mcode/n16 , \i_tv80_core/i_mcode/n15 ,
         \i_tv80_core/i_mcode/n14 , \i_tv80_core/i_mcode/n13 ,
         \i_tv80_core/i_mcode/n12 , \i_tv80_core/i_mcode/n11 ,
         \i_tv80_core/i_mcode/n10 , \i_tv80_core/i_mcode/n9 ,
         \i_tv80_core/i_mcode/n8 , \i_tv80_core/i_mcode/n7 ,
         \i_tv80_core/i_mcode/n6 , \i_tv80_core/i_mcode/n5 ,
         \i_tv80_core/i_mcode/n4 , \i_tv80_core/i_mcode/n3 ,
         \i_tv80_core/i_mcode/n2 , \i_tv80_core/i_mcode/n1 ,
         \i_tv80_core/i_alu/n469 , \i_tv80_core/i_alu/n468 ,
         \i_tv80_core/i_alu/n467 , \i_tv80_core/i_alu/n466 ,
         \i_tv80_core/i_alu/n465 , \i_tv80_core/i_alu/n464 ,
         \i_tv80_core/i_alu/n463 , \i_tv80_core/i_alu/n462 ,
         \i_tv80_core/i_alu/n461 , \i_tv80_core/i_alu/n460 ,
         \i_tv80_core/i_alu/n459 , \i_tv80_core/i_alu/n458 ,
         \i_tv80_core/i_alu/n457 , \i_tv80_core/i_alu/n456 ,
         \i_tv80_core/i_alu/n455 , \i_tv80_core/i_alu/n454 ,
         \i_tv80_core/i_alu/n453 , \i_tv80_core/i_alu/n452 ,
         \i_tv80_core/i_alu/n451 , \i_tv80_core/i_alu/n450 ,
         \i_tv80_core/i_alu/n449 , \i_tv80_core/i_alu/n448 ,
         \i_tv80_core/i_alu/n447 , \i_tv80_core/i_alu/n446 ,
         \i_tv80_core/i_alu/n445 , \i_tv80_core/i_alu/n444 ,
         \i_tv80_core/i_alu/n443 , \i_tv80_core/i_alu/n442 ,
         \i_tv80_core/i_alu/n441 , \i_tv80_core/i_alu/n440 ,
         \i_tv80_core/i_alu/n439 , \i_tv80_core/i_alu/n438 ,
         \i_tv80_core/i_alu/n437 , \i_tv80_core/i_alu/n436 ,
         \i_tv80_core/i_alu/n435 , \i_tv80_core/i_alu/n434 ,
         \i_tv80_core/i_alu/n433 , \i_tv80_core/i_alu/n432 ,
         \i_tv80_core/i_alu/n431 , \i_tv80_core/i_alu/n430 ,
         \i_tv80_core/i_alu/n429 , \i_tv80_core/i_alu/n428 ,
         \i_tv80_core/i_alu/n427 , \i_tv80_core/i_alu/n426 ,
         \i_tv80_core/i_alu/n425 , \i_tv80_core/i_alu/n424 ,
         \i_tv80_core/i_alu/n423 , \i_tv80_core/i_alu/n422 ,
         \i_tv80_core/i_alu/n421 , \i_tv80_core/i_alu/n420 ,
         \i_tv80_core/i_alu/n419 , \i_tv80_core/i_alu/n418 ,
         \i_tv80_core/i_alu/n417 , \i_tv80_core/i_alu/n416 ,
         \i_tv80_core/i_alu/n415 , \i_tv80_core/i_alu/n414 ,
         \i_tv80_core/i_alu/n413 , \i_tv80_core/i_alu/n412 ,
         \i_tv80_core/i_alu/n411 , \i_tv80_core/i_alu/n410 ,
         \i_tv80_core/i_alu/n409 , \i_tv80_core/i_alu/n408 ,
         \i_tv80_core/i_alu/n407 , \i_tv80_core/i_alu/n406 ,
         \i_tv80_core/i_alu/n405 , \i_tv80_core/i_alu/n404 ,
         \i_tv80_core/i_alu/n403 , \i_tv80_core/i_alu/n402 ,
         \i_tv80_core/i_alu/n401 , \i_tv80_core/i_alu/n400 ,
         \i_tv80_core/i_alu/n399 , \i_tv80_core/i_alu/n398 ,
         \i_tv80_core/i_alu/n397 , \i_tv80_core/i_alu/n396 ,
         \i_tv80_core/i_alu/n395 , \i_tv80_core/i_alu/n394 ,
         \i_tv80_core/i_alu/n393 , \i_tv80_core/i_alu/n392 ,
         \i_tv80_core/i_alu/n391 , \i_tv80_core/i_alu/n390 ,
         \i_tv80_core/i_alu/n389 , \i_tv80_core/i_alu/n388 ,
         \i_tv80_core/i_alu/n387 , \i_tv80_core/i_alu/n386 ,
         \i_tv80_core/i_alu/n385 , \i_tv80_core/i_alu/n384 ,
         \i_tv80_core/i_alu/n383 , \i_tv80_core/i_alu/n382 ,
         \i_tv80_core/i_alu/n381 , \i_tv80_core/i_alu/n380 ,
         \i_tv80_core/i_alu/n379 , \i_tv80_core/i_alu/n378 ,
         \i_tv80_core/i_alu/n377 , \i_tv80_core/i_alu/n376 ,
         \i_tv80_core/i_alu/n375 , \i_tv80_core/i_alu/n374 ,
         \i_tv80_core/i_alu/n373 , \i_tv80_core/i_alu/n372 ,
         \i_tv80_core/i_alu/n371 , \i_tv80_core/i_alu/n370 ,
         \i_tv80_core/i_alu/n369 , \i_tv80_core/i_alu/n368 ,
         \i_tv80_core/i_alu/n367 , \i_tv80_core/i_alu/n366 ,
         \i_tv80_core/i_alu/n365 , \i_tv80_core/i_alu/n364 ,
         \i_tv80_core/i_alu/n363 , \i_tv80_core/i_alu/n362 ,
         \i_tv80_core/i_alu/n361 , \i_tv80_core/i_alu/n360 ,
         \i_tv80_core/i_alu/n359 , \i_tv80_core/i_alu/n358 ,
         \i_tv80_core/i_alu/n357 , \i_tv80_core/i_alu/n356 ,
         \i_tv80_core/i_alu/n355 , \i_tv80_core/i_alu/n354 ,
         \i_tv80_core/i_alu/n353 , \i_tv80_core/i_alu/n352 ,
         \i_tv80_core/i_alu/n351 , \i_tv80_core/i_alu/n350 ,
         \i_tv80_core/i_alu/n349 , \i_tv80_core/i_alu/n348 ,
         \i_tv80_core/i_alu/n347 , \i_tv80_core/i_alu/n346 ,
         \i_tv80_core/i_alu/n345 , \i_tv80_core/i_alu/n344 ,
         \i_tv80_core/i_alu/n343 , \i_tv80_core/i_alu/n342 ,
         \i_tv80_core/i_alu/n341 , \i_tv80_core/i_alu/n340 ,
         \i_tv80_core/i_alu/n339 , \i_tv80_core/i_alu/n338 ,
         \i_tv80_core/i_alu/n337 , \i_tv80_core/i_alu/n336 ,
         \i_tv80_core/i_alu/n335 , \i_tv80_core/i_alu/n334 ,
         \i_tv80_core/i_alu/n333 , \i_tv80_core/i_alu/n332 ,
         \i_tv80_core/i_alu/n331 , \i_tv80_core/i_alu/n330 ,
         \i_tv80_core/i_alu/n329 , \i_tv80_core/i_alu/n328 ,
         \i_tv80_core/i_alu/n327 , \i_tv80_core/i_alu/n326 ,
         \i_tv80_core/i_alu/n325 , \i_tv80_core/i_alu/n324 ,
         \i_tv80_core/i_alu/n323 , \i_tv80_core/i_alu/n322 ,
         \i_tv80_core/i_alu/n321 , \i_tv80_core/i_alu/n320 ,
         \i_tv80_core/i_alu/n319 , \i_tv80_core/i_alu/n318 ,
         \i_tv80_core/i_alu/n317 , \i_tv80_core/i_alu/n316 ,
         \i_tv80_core/i_alu/n315 , \i_tv80_core/i_alu/n314 ,
         \i_tv80_core/i_alu/n313 , \i_tv80_core/i_alu/n312 ,
         \i_tv80_core/i_alu/n311 , \i_tv80_core/i_alu/n310 ,
         \i_tv80_core/i_alu/n309 , \i_tv80_core/i_alu/n308 ,
         \i_tv80_core/i_alu/n307 , \i_tv80_core/i_alu/n306 ,
         \i_tv80_core/i_alu/n305 , \i_tv80_core/i_alu/n304 ,
         \i_tv80_core/i_alu/n303 , \i_tv80_core/i_alu/n302 ,
         \i_tv80_core/i_alu/n301 , \i_tv80_core/i_alu/n300 ,
         \i_tv80_core/i_alu/n299 , \i_tv80_core/i_alu/n298 ,
         \i_tv80_core/i_alu/n297 , \i_tv80_core/i_alu/n296 ,
         \i_tv80_core/i_alu/n295 , \i_tv80_core/i_alu/n294 ,
         \i_tv80_core/i_alu/n293 , \i_tv80_core/i_alu/n292 ,
         \i_tv80_core/i_alu/n291 , \i_tv80_core/i_alu/n290 ,
         \i_tv80_core/i_alu/n289 , \i_tv80_core/i_alu/n288 ,
         \i_tv80_core/i_alu/n287 , \i_tv80_core/i_alu/n286 ,
         \i_tv80_core/i_alu/n285 , \i_tv80_core/i_alu/n284 ,
         \i_tv80_core/i_alu/n283 , \i_tv80_core/i_alu/n282 ,
         \i_tv80_core/i_alu/n281 , \i_tv80_core/i_alu/n280 ,
         \i_tv80_core/i_alu/n279 , \i_tv80_core/i_alu/n278 ,
         \i_tv80_core/i_alu/n277 , \i_tv80_core/i_alu/n276 ,
         \i_tv80_core/i_alu/n275 , \i_tv80_core/i_alu/n274 ,
         \i_tv80_core/i_alu/n273 , \i_tv80_core/i_alu/n272 ,
         \i_tv80_core/i_alu/n271 , \i_tv80_core/i_alu/n270 ,
         \i_tv80_core/i_alu/n269 , \i_tv80_core/i_alu/n268 ,
         \i_tv80_core/i_alu/n267 , \i_tv80_core/i_alu/n266 ,
         \i_tv80_core/i_alu/n265 , \i_tv80_core/i_alu/n264 ,
         \i_tv80_core/i_alu/n263 , \i_tv80_core/i_alu/n262 ,
         \i_tv80_core/i_alu/n261 , \i_tv80_core/i_alu/n260 ,
         \i_tv80_core/i_alu/n259 , \i_tv80_core/i_alu/n258 ,
         \i_tv80_core/i_alu/n257 , \i_tv80_core/i_alu/n256 ,
         \i_tv80_core/i_alu/n255 , \i_tv80_core/i_alu/n254 ,
         \i_tv80_core/i_alu/n253 , \i_tv80_core/i_alu/n252 ,
         \i_tv80_core/i_alu/n251 , \i_tv80_core/i_alu/n250 ,
         \i_tv80_core/i_alu/n249 , \i_tv80_core/i_alu/n248 ,
         \i_tv80_core/i_alu/n247 , \i_tv80_core/i_alu/n246 ,
         \i_tv80_core/i_alu/n245 , \i_tv80_core/i_alu/n244 ,
         \i_tv80_core/i_alu/n243 , \i_tv80_core/i_alu/n242 ,
         \i_tv80_core/i_alu/n241 , \i_tv80_core/i_alu/n240 ,
         \i_tv80_core/i_alu/n239 , \i_tv80_core/i_alu/n238 ,
         \i_tv80_core/i_alu/n237 , \i_tv80_core/i_alu/n236 ,
         \i_tv80_core/i_alu/n235 , \i_tv80_core/i_alu/n234 ,
         \i_tv80_core/i_alu/n233 , \i_tv80_core/i_alu/n232 ,
         \i_tv80_core/i_alu/n231 , \i_tv80_core/i_alu/n230 ,
         \i_tv80_core/i_alu/n229 , \i_tv80_core/i_alu/n228 ,
         \i_tv80_core/i_alu/n227 , \i_tv80_core/i_alu/n226 ,
         \i_tv80_core/i_alu/n225 , \i_tv80_core/i_alu/n224 ,
         \i_tv80_core/i_alu/n223 , \i_tv80_core/i_alu/n222 ,
         \i_tv80_core/i_alu/n221 , \i_tv80_core/i_alu/n220 ,
         \i_tv80_core/i_alu/n219 , \i_tv80_core/i_alu/n218 ,
         \i_tv80_core/i_alu/n217 , \i_tv80_core/i_alu/n216 ,
         \i_tv80_core/i_alu/n215 , \i_tv80_core/i_alu/n214 ,
         \i_tv80_core/i_alu/n213 , \i_tv80_core/i_alu/n212 ,
         \i_tv80_core/i_alu/n211 , \i_tv80_core/i_alu/n210 ,
         \i_tv80_core/i_alu/n209 , \i_tv80_core/i_alu/n208 ,
         \i_tv80_core/i_alu/n207 , \i_tv80_core/i_alu/n206 ,
         \i_tv80_core/i_alu/n205 , \i_tv80_core/i_alu/n204 ,
         \i_tv80_core/i_alu/n203 , \i_tv80_core/i_alu/n202 ,
         \i_tv80_core/i_alu/n201 , \i_tv80_core/i_alu/n200 ,
         \i_tv80_core/i_alu/n199 , \i_tv80_core/i_alu/n198 ,
         \i_tv80_core/i_alu/n197 , \i_tv80_core/i_alu/n196 ,
         \i_tv80_core/i_alu/n195 , \i_tv80_core/i_alu/n194 ,
         \i_tv80_core/i_alu/n193 , \i_tv80_core/i_alu/n192 ,
         \i_tv80_core/i_alu/n191 , \i_tv80_core/i_alu/n190 ,
         \i_tv80_core/i_alu/n189 , \i_tv80_core/i_alu/n188 ,
         \i_tv80_core/i_alu/n187 , \i_tv80_core/i_alu/n186 ,
         \i_tv80_core/i_alu/n185 , \i_tv80_core/i_alu/n184 ,
         \i_tv80_core/i_alu/n183 , \i_tv80_core/i_alu/n182 ,
         \i_tv80_core/i_alu/n181 , \i_tv80_core/i_alu/n180 ,
         \i_tv80_core/i_alu/n179 , \i_tv80_core/i_alu/n178 ,
         \i_tv80_core/i_alu/n177 , \i_tv80_core/i_alu/n176 ,
         \i_tv80_core/i_alu/n175 , \i_tv80_core/i_alu/n174 ,
         \i_tv80_core/i_alu/n173 , \i_tv80_core/i_alu/n172 ,
         \i_tv80_core/i_alu/n171 , \i_tv80_core/i_alu/n170 ,
         \i_tv80_core/i_alu/n169 , \i_tv80_core/i_alu/n168 ,
         \i_tv80_core/i_alu/n167 , \i_tv80_core/i_alu/n166 ,
         \i_tv80_core/i_alu/n165 , \i_tv80_core/i_alu/n164 ,
         \i_tv80_core/i_alu/n163 , \i_tv80_core/i_alu/n162 ,
         \i_tv80_core/i_alu/n161 , \i_tv80_core/i_alu/n160 ,
         \i_tv80_core/i_alu/n159 , \i_tv80_core/i_alu/n158 ,
         \i_tv80_core/i_alu/n157 , \i_tv80_core/i_alu/n156 ,
         \i_tv80_core/i_alu/n155 , \i_tv80_core/i_alu/n154 ,
         \i_tv80_core/i_alu/n153 , \i_tv80_core/i_alu/n152 ,
         \i_tv80_core/i_alu/n151 , \i_tv80_core/i_alu/n150 ,
         \i_tv80_core/i_alu/n149 , \i_tv80_core/i_alu/n148 ,
         \i_tv80_core/i_alu/n147 , \i_tv80_core/i_alu/n146 ,
         \i_tv80_core/i_alu/n145 , \i_tv80_core/i_alu/n144 ,
         \i_tv80_core/i_alu/n143 , \i_tv80_core/i_alu/n142 ,
         \i_tv80_core/i_alu/n141 , \i_tv80_core/i_alu/n140 ,
         \i_tv80_core/i_alu/n139 , \i_tv80_core/i_alu/n138 ,
         \i_tv80_core/i_alu/n137 , \i_tv80_core/i_alu/n136 ,
         \i_tv80_core/i_alu/n135 , \i_tv80_core/i_alu/n134 ,
         \i_tv80_core/i_alu/n133 , \i_tv80_core/i_alu/n132 ,
         \i_tv80_core/i_alu/n131 , \i_tv80_core/i_alu/n130 ,
         \i_tv80_core/i_alu/n129 , \i_tv80_core/i_alu/n128 ,
         \i_tv80_core/i_alu/n127 , \i_tv80_core/i_alu/n126 ,
         \i_tv80_core/i_alu/n125 , \i_tv80_core/i_alu/n124 ,
         \i_tv80_core/i_alu/n123 , \i_tv80_core/i_alu/n122 ,
         \i_tv80_core/i_alu/n121 , \i_tv80_core/i_alu/n120 ,
         \i_tv80_core/i_alu/n119 , \i_tv80_core/i_alu/n118 ,
         \i_tv80_core/i_alu/n117 , \i_tv80_core/i_alu/n116 ,
         \i_tv80_core/i_alu/n115 , \i_tv80_core/i_alu/n114 ,
         \i_tv80_core/i_alu/n113 , \i_tv80_core/i_alu/n112 ,
         \i_tv80_core/i_alu/n111 , \i_tv80_core/i_alu/n110 ,
         \i_tv80_core/i_alu/n109 , \i_tv80_core/i_alu/n108 ,
         \i_tv80_core/i_alu/n107 , \i_tv80_core/i_alu/n106 ,
         \i_tv80_core/i_alu/n105 , \i_tv80_core/i_alu/n104 ,
         \i_tv80_core/i_alu/n103 , \i_tv80_core/i_alu/n102 ,
         \i_tv80_core/i_alu/n101 , \i_tv80_core/i_alu/n100 ,
         \i_tv80_core/i_alu/n99 , \i_tv80_core/i_alu/n98 ,
         \i_tv80_core/i_alu/n97 , \i_tv80_core/i_alu/n96 ,
         \i_tv80_core/i_alu/n95 , \i_tv80_core/i_alu/n94 ,
         \i_tv80_core/i_alu/n93 , \i_tv80_core/i_alu/n92 ,
         \i_tv80_core/i_alu/n91 , \i_tv80_core/i_alu/n90 ,
         \i_tv80_core/i_alu/n89 , \i_tv80_core/i_alu/n88 ,
         \i_tv80_core/i_alu/n87 , \i_tv80_core/i_alu/n86 ,
         \i_tv80_core/i_alu/n85 , \i_tv80_core/i_alu/n84 ,
         \i_tv80_core/i_alu/n83 , \i_tv80_core/i_alu/n82 ,
         \i_tv80_core/i_alu/n81 , \i_tv80_core/i_alu/n80 ,
         \i_tv80_core/i_alu/n79 , \i_tv80_core/i_alu/n78 ,
         \i_tv80_core/i_alu/n77 , \i_tv80_core/i_alu/n76 ,
         \i_tv80_core/i_alu/n75 , \i_tv80_core/i_alu/n74 ,
         \i_tv80_core/i_alu/n73 , \i_tv80_core/i_alu/n72 ,
         \i_tv80_core/i_alu/n71 , \i_tv80_core/i_alu/n70 ,
         \i_tv80_core/i_alu/n69 , \i_tv80_core/i_alu/n68 ,
         \i_tv80_core/i_alu/n67 , \i_tv80_core/i_alu/n66 ,
         \i_tv80_core/i_alu/n65 , \i_tv80_core/i_alu/n64 ,
         \i_tv80_core/i_alu/n63 , \i_tv80_core/i_alu/n62 ,
         \i_tv80_core/i_alu/n61 , \i_tv80_core/i_alu/n60 ,
         \i_tv80_core/i_alu/n59 , \i_tv80_core/i_alu/n58 ,
         \i_tv80_core/i_alu/n57 , \i_tv80_core/i_alu/n56 ,
         \i_tv80_core/i_alu/n55 , \i_tv80_core/i_alu/n54 ,
         \i_tv80_core/i_alu/n53 , \i_tv80_core/i_alu/n52 ,
         \i_tv80_core/i_alu/n51 , \i_tv80_core/i_alu/n50 ,
         \i_tv80_core/i_alu/n49 , \i_tv80_core/i_alu/n48 ,
         \i_tv80_core/i_alu/n47 , \i_tv80_core/i_alu/n46 ,
         \i_tv80_core/i_alu/n45 , \i_tv80_core/i_alu/n44 ,
         \i_tv80_core/i_alu/n43 , \i_tv80_core/i_alu/n42 ,
         \i_tv80_core/i_alu/n41 , \i_tv80_core/i_alu/n40 ,
         \i_tv80_core/i_alu/n39 , \i_tv80_core/i_alu/n38 ,
         \i_tv80_core/i_alu/n37 , \i_tv80_core/i_alu/n36 ,
         \i_tv80_core/i_alu/n35 , \i_tv80_core/i_alu/n34 ,
         \i_tv80_core/i_alu/n33 , \i_tv80_core/i_alu/n32 ,
         \i_tv80_core/i_alu/n31 , \i_tv80_core/i_alu/n30 ,
         \i_tv80_core/i_alu/n29 , \i_tv80_core/i_alu/n28 ,
         \i_tv80_core/i_alu/n27 , \i_tv80_core/i_alu/n26 ,
         \i_tv80_core/i_alu/n25 , \i_tv80_core/i_alu/n24 ,
         \i_tv80_core/i_alu/n23 , \i_tv80_core/i_alu/n22 ,
         \i_tv80_core/i_alu/n21 , \i_tv80_core/i_alu/n20 ,
         \i_tv80_core/i_alu/n19 , \i_tv80_core/i_alu/n18 ,
         \i_tv80_core/i_alu/n17 , \i_tv80_core/i_alu/n16 ,
         \i_tv80_core/i_alu/n15 , \i_tv80_core/i_alu/n14 ,
         \i_tv80_core/i_alu/n13 , \i_tv80_core/i_alu/n12 ,
         \i_tv80_core/i_alu/n11 , \i_tv80_core/i_alu/n10 ,
         \i_tv80_core/i_alu/n9 , \i_tv80_core/i_alu/n8 ,
         \i_tv80_core/i_alu/n7 , \i_tv80_core/i_alu/n6 ,
         \i_tv80_core/i_alu/n5 , \i_tv80_core/i_alu/n4 ,
         \i_tv80_core/i_alu/n3 , \i_tv80_core/i_alu/n2 ,
         \i_tv80_core/i_alu/n1 , \i_tv80_core/i_reg/n495 ,
         \i_tv80_core/i_reg/n494 , \i_tv80_core/i_reg/n493 ,
         \i_tv80_core/i_reg/n492 , \i_tv80_core/i_reg/n490 ,
         \i_tv80_core/i_reg/n489 , \i_tv80_core/i_reg/n488 ,
         \i_tv80_core/i_reg/n487 , \i_tv80_core/i_reg/n486 ,
         \i_tv80_core/i_reg/n485 , \i_tv80_core/i_reg/n484 ,
         \i_tv80_core/i_reg/n483 , \i_tv80_core/i_reg/n482 ,
         \i_tv80_core/i_reg/n481 , \i_tv80_core/i_reg/n480 ,
         \i_tv80_core/i_reg/n479 , \i_tv80_core/i_reg/n478 ,
         \i_tv80_core/i_reg/n477 , \i_tv80_core/i_reg/n476 ,
         \i_tv80_core/i_reg/n475 , \i_tv80_core/i_reg/n474 ,
         \i_tv80_core/i_reg/n473 , \i_tv80_core/i_reg/n472 ,
         \i_tv80_core/i_reg/n471 , \i_tv80_core/i_reg/n470 ,
         \i_tv80_core/i_reg/n469 , \i_tv80_core/i_reg/n468 ,
         \i_tv80_core/i_reg/n467 , \i_tv80_core/i_reg/n466 ,
         \i_tv80_core/i_reg/n465 , \i_tv80_core/i_reg/n464 ,
         \i_tv80_core/i_reg/n463 , \i_tv80_core/i_reg/n462 ,
         \i_tv80_core/i_reg/n461 , \i_tv80_core/i_reg/n460 ,
         \i_tv80_core/i_reg/n459 , \i_tv80_core/i_reg/n458 ,
         \i_tv80_core/i_reg/n457 , \i_tv80_core/i_reg/n456 ,
         \i_tv80_core/i_reg/n455 , \i_tv80_core/i_reg/n454 ,
         \i_tv80_core/i_reg/n453 , \i_tv80_core/i_reg/n452 ,
         \i_tv80_core/i_reg/n451 , \i_tv80_core/i_reg/n450 ,
         \i_tv80_core/i_reg/n449 , \i_tv80_core/i_reg/n448 ,
         \i_tv80_core/i_reg/n447 , \i_tv80_core/i_reg/n446 ,
         \i_tv80_core/i_reg/n445 , \i_tv80_core/i_reg/n444 ,
         \i_tv80_core/i_reg/n443 , \i_tv80_core/i_reg/n442 ,
         \i_tv80_core/i_reg/n441 , \i_tv80_core/i_reg/n440 ,
         \i_tv80_core/i_reg/n439 , \i_tv80_core/i_reg/n438 ,
         \i_tv80_core/i_reg/n437 , \i_tv80_core/i_reg/n436 ,
         \i_tv80_core/i_reg/n435 , \i_tv80_core/i_reg/n434 ,
         \i_tv80_core/i_reg/n433 , \i_tv80_core/i_reg/n432 ,
         \i_tv80_core/i_reg/n431 , \i_tv80_core/i_reg/n430 ,
         \i_tv80_core/i_reg/n429 , \i_tv80_core/i_reg/n428 ,
         \i_tv80_core/i_reg/n427 , \i_tv80_core/i_reg/n426 ,
         \i_tv80_core/i_reg/n425 , \i_tv80_core/i_reg/n424 ,
         \i_tv80_core/i_reg/n423 , \i_tv80_core/i_reg/n422 ,
         \i_tv80_core/i_reg/n421 , \i_tv80_core/i_reg/n420 ,
         \i_tv80_core/i_reg/n419 , \i_tv80_core/i_reg/n418 ,
         \i_tv80_core/i_reg/n417 , \i_tv80_core/i_reg/n416 ,
         \i_tv80_core/i_reg/n415 , \i_tv80_core/i_reg/n414 ,
         \i_tv80_core/i_reg/n413 , \i_tv80_core/i_reg/n412 ,
         \i_tv80_core/i_reg/n411 , \i_tv80_core/i_reg/n410 ,
         \i_tv80_core/i_reg/n409 , \i_tv80_core/i_reg/n408 ,
         \i_tv80_core/i_reg/n407 , \i_tv80_core/i_reg/n406 ,
         \i_tv80_core/i_reg/n405 , \i_tv80_core/i_reg/n404 ,
         \i_tv80_core/i_reg/n403 , \i_tv80_core/i_reg/n402 ,
         \i_tv80_core/i_reg/n401 , \i_tv80_core/i_reg/n400 ,
         \i_tv80_core/i_reg/n399 , \i_tv80_core/i_reg/n398 ,
         \i_tv80_core/i_reg/n397 , \i_tv80_core/i_reg/n396 ,
         \i_tv80_core/i_reg/n395 , \i_tv80_core/i_reg/n394 ,
         \i_tv80_core/i_reg/n393 , \i_tv80_core/i_reg/n392 ,
         \i_tv80_core/i_reg/n391 , \i_tv80_core/i_reg/n390 ,
         \i_tv80_core/i_reg/n389 , \i_tv80_core/i_reg/n388 ,
         \i_tv80_core/i_reg/n387 , \i_tv80_core/i_reg/n386 ,
         \i_tv80_core/i_reg/n385 , \i_tv80_core/i_reg/n384 ,
         \i_tv80_core/i_reg/n383 , \i_tv80_core/i_reg/n382 ,
         \i_tv80_core/i_reg/n381 , \i_tv80_core/i_reg/n380 ,
         \i_tv80_core/i_reg/n379 , \i_tv80_core/i_reg/n378 ,
         \i_tv80_core/i_reg/n377 , \i_tv80_core/i_reg/n376 ,
         \i_tv80_core/i_reg/n375 , \i_tv80_core/i_reg/n374 ,
         \i_tv80_core/i_reg/n373 , \i_tv80_core/i_reg/n372 ,
         \i_tv80_core/i_reg/n371 , \i_tv80_core/i_reg/n370 ,
         \i_tv80_core/i_reg/n369 , \i_tv80_core/i_reg/n368 ,
         \i_tv80_core/i_reg/n367 , \i_tv80_core/i_reg/n366 ,
         \i_tv80_core/i_reg/n365 , \i_tv80_core/i_reg/n364 ,
         \i_tv80_core/i_reg/n363 , \i_tv80_core/i_reg/n362 ,
         \i_tv80_core/i_reg/n361 , \i_tv80_core/i_reg/n360 ,
         \i_tv80_core/i_reg/n359 , \i_tv80_core/i_reg/n358 ,
         \i_tv80_core/i_reg/n357 , \i_tv80_core/i_reg/n356 ,
         \i_tv80_core/i_reg/n355 , \i_tv80_core/i_reg/n354 ,
         \i_tv80_core/i_reg/n353 , \i_tv80_core/i_reg/n352 ,
         \i_tv80_core/i_reg/n351 , \i_tv80_core/i_reg/n350 ,
         \i_tv80_core/i_reg/n349 , \i_tv80_core/i_reg/n348 ,
         \i_tv80_core/i_reg/n347 , \i_tv80_core/i_reg/n346 ,
         \i_tv80_core/i_reg/n345 , \i_tv80_core/i_reg/n344 ,
         \i_tv80_core/i_reg/n343 , \i_tv80_core/i_reg/n342 ,
         \i_tv80_core/i_reg/n341 , \i_tv80_core/i_reg/n340 ,
         \i_tv80_core/i_reg/n339 , \i_tv80_core/i_reg/n338 ,
         \i_tv80_core/i_reg/n337 , \i_tv80_core/i_reg/n336 ,
         \i_tv80_core/i_reg/n335 , \i_tv80_core/i_reg/n334 ,
         \i_tv80_core/i_reg/n333 , \i_tv80_core/i_reg/n332 ,
         \i_tv80_core/i_reg/n331 , \i_tv80_core/i_reg/n330 ,
         \i_tv80_core/i_reg/n329 , \i_tv80_core/i_reg/n328 ,
         \i_tv80_core/i_reg/n327 , \i_tv80_core/i_reg/n326 ,
         \i_tv80_core/i_reg/n325 , \i_tv80_core/i_reg/n324 ,
         \i_tv80_core/i_reg/n323 , \i_tv80_core/i_reg/n322 ,
         \i_tv80_core/i_reg/n321 , \i_tv80_core/i_reg/n320 ,
         \i_tv80_core/i_reg/n319 , \i_tv80_core/i_reg/n318 ,
         \i_tv80_core/i_reg/n317 , \i_tv80_core/i_reg/n316 ,
         \i_tv80_core/i_reg/n315 , \i_tv80_core/i_reg/n314 ,
         \i_tv80_core/i_reg/n313 , \i_tv80_core/i_reg/n312 ,
         \i_tv80_core/i_reg/n311 , \i_tv80_core/i_reg/n310 ,
         \i_tv80_core/i_reg/n309 , \i_tv80_core/i_reg/n308 ,
         \i_tv80_core/i_reg/n307 , \i_tv80_core/i_reg/n306 ,
         \i_tv80_core/i_reg/n305 , \i_tv80_core/i_reg/n304 ,
         \i_tv80_core/i_reg/n303 , \i_tv80_core/i_reg/n302 ,
         \i_tv80_core/i_reg/n173 , \i_tv80_core/i_reg/n172 ,
         \i_tv80_core/i_reg/n171 , \i_tv80_core/i_reg/n170 ,
         \i_tv80_core/i_reg/n169 , \i_tv80_core/i_reg/n168 ,
         \i_tv80_core/i_reg/n167 , \i_tv80_core/i_reg/n166 ,
         \i_tv80_core/i_reg/n165 , \i_tv80_core/i_reg/n164 ,
         \i_tv80_core/i_reg/n163 , \i_tv80_core/i_reg/n162 ,
         \i_tv80_core/i_reg/n161 , \i_tv80_core/i_reg/n160 ,
         \i_tv80_core/i_reg/n159 , \i_tv80_core/i_reg/n158 ,
         \i_tv80_core/i_reg/n157 , \i_tv80_core/i_reg/n156 ,
         \i_tv80_core/i_reg/n155 , \i_tv80_core/i_reg/n154 ,
         \i_tv80_core/i_reg/n153 , \i_tv80_core/i_reg/n152 ,
         \i_tv80_core/i_reg/n151 , \i_tv80_core/i_reg/n150 ,
         \i_tv80_core/i_reg/n149 , \i_tv80_core/i_reg/n148 ,
         \i_tv80_core/i_reg/n147 , \i_tv80_core/i_reg/n146 ,
         \i_tv80_core/i_reg/n145 , \i_tv80_core/i_reg/n144 ,
         \i_tv80_core/i_reg/n143 , \i_tv80_core/i_reg/n142 ,
         \i_tv80_core/i_reg/n141 , \i_tv80_core/i_reg/n140 ,
         \i_tv80_core/i_reg/n139 , \i_tv80_core/i_reg/n138 ,
         \i_tv80_core/i_reg/n137 , \i_tv80_core/i_reg/n136 ,
         \i_tv80_core/i_reg/n135 , \i_tv80_core/i_reg/n134 ,
         \i_tv80_core/i_reg/n133 , \i_tv80_core/i_reg/n132 ,
         \i_tv80_core/i_reg/n131 , \i_tv80_core/i_reg/n130 ,
         \i_tv80_core/i_reg/n129 , \i_tv80_core/i_reg/n128 ,
         \i_tv80_core/i_reg/n127 , \i_tv80_core/i_reg/n126 ,
         \i_tv80_core/i_reg/n125 , \i_tv80_core/i_reg/n124 ,
         \i_tv80_core/i_reg/n123 , \i_tv80_core/i_reg/n122 ,
         \i_tv80_core/i_reg/n121 , \i_tv80_core/i_reg/n120 ,
         \i_tv80_core/i_reg/n119 , \i_tv80_core/i_reg/n118 ,
         \i_tv80_core/i_reg/n117 , \i_tv80_core/i_reg/n116 ,
         \i_tv80_core/i_reg/n115 , \i_tv80_core/i_reg/n114 ,
         \i_tv80_core/i_reg/n113 , \i_tv80_core/i_reg/n112 ,
         \i_tv80_core/i_reg/n111 , \i_tv80_core/i_reg/n110 ,
         \i_tv80_core/i_reg/n109 , \i_tv80_core/i_reg/n108 ,
         \i_tv80_core/i_reg/n107 , \i_tv80_core/i_reg/n106 ,
         \i_tv80_core/i_reg/n105 , \i_tv80_core/i_reg/n104 ,
         \i_tv80_core/i_reg/n103 , \i_tv80_core/i_reg/n102 ,
         \i_tv80_core/i_reg/n101 , \i_tv80_core/i_reg/n100 ,
         \i_tv80_core/i_reg/n99 , \i_tv80_core/i_reg/n98 ,
         \i_tv80_core/i_reg/n97 , \i_tv80_core/i_reg/n96 ,
         \i_tv80_core/i_reg/n95 , \i_tv80_core/i_reg/n94 ,
         \i_tv80_core/i_reg/n93 , \i_tv80_core/i_reg/n92 ,
         \i_tv80_core/i_reg/n91 , \i_tv80_core/i_reg/n90 ,
         \i_tv80_core/i_reg/n89 , \i_tv80_core/i_reg/n88 ,
         \i_tv80_core/i_reg/n87 , \i_tv80_core/i_reg/n86 ,
         \i_tv80_core/i_reg/n85 , \i_tv80_core/i_reg/n84 ,
         \i_tv80_core/i_reg/n83 , \i_tv80_core/i_reg/n82 ,
         \i_tv80_core/i_reg/n81 , \i_tv80_core/i_reg/n80 ,
         \i_tv80_core/i_reg/n79 , \i_tv80_core/i_reg/n78 ,
         \i_tv80_core/i_reg/n77 , \i_tv80_core/i_reg/n76 ,
         \i_tv80_core/i_reg/n75 , \i_tv80_core/i_reg/n74 ,
         \i_tv80_core/i_reg/n73 , \i_tv80_core/i_reg/n72 ,
         \i_tv80_core/i_reg/n71 , \i_tv80_core/i_reg/n70 ,
         \i_tv80_core/i_reg/n69 , \i_tv80_core/i_reg/n68 ,
         \i_tv80_core/i_reg/n67 , \i_tv80_core/i_reg/n66 ,
         \i_tv80_core/i_reg/n65 , \i_tv80_core/i_reg/n64 ,
         \i_tv80_core/i_reg/n63 , \i_tv80_core/i_reg/n62 ,
         \i_tv80_core/i_reg/n61 , \i_tv80_core/i_reg/n60 ,
         \i_tv80_core/i_reg/n59 , \i_tv80_core/i_reg/n58 ,
         \i_tv80_core/i_reg/n57 , \i_tv80_core/i_reg/n56 ,
         \i_tv80_core/i_reg/n55 , \i_tv80_core/i_reg/n54 ,
         \i_tv80_core/i_reg/n53 , \i_tv80_core/i_reg/n52 ,
         \i_tv80_core/i_reg/n51 , \i_tv80_core/i_reg/n50 ,
         \i_tv80_core/i_reg/n49 , \i_tv80_core/i_reg/n48 ,
         \i_tv80_core/i_reg/n47 , \i_tv80_core/i_reg/n46 ,
         \i_tv80_core/i_reg/n45 , \i_tv80_core/i_reg/n44 ,
         \i_tv80_core/i_reg/n43 , \i_tv80_core/i_reg/n42 ,
         \i_tv80_core/i_reg/n41 , \i_tv80_core/i_reg/n40 ,
         \i_tv80_core/i_reg/n39 , \i_tv80_core/i_reg/n38 ,
         \i_tv80_core/i_reg/n37 , \i_tv80_core/i_reg/n36 ,
         \i_tv80_core/i_reg/n35 , \i_tv80_core/i_reg/n34 ,
         \i_tv80_core/i_reg/n33 , \i_tv80_core/i_reg/n32 ,
         \i_tv80_core/i_reg/n31 , \i_tv80_core/i_reg/n30 ,
         \i_tv80_core/i_reg/n29 , \i_tv80_core/i_reg/n28 ,
         \i_tv80_core/i_reg/n27 , \i_tv80_core/i_reg/n26 ,
         \i_tv80_core/i_reg/n25 , \i_tv80_core/i_reg/n24 ,
         \i_tv80_core/i_reg/n23 , \i_tv80_core/i_reg/n22 ,
         \i_tv80_core/i_reg/n21 , \i_tv80_core/i_reg/n20 ,
         \i_tv80_core/i_reg/n19 , \i_tv80_core/i_reg/n18 ,
         \i_tv80_core/i_reg/n17 , \i_tv80_core/i_reg/n16 ,
         \i_tv80_core/i_reg/n15 , \i_tv80_core/i_reg/n14 ,
         \i_tv80_core/i_reg/n13 , \i_tv80_core/i_reg/n12 ,
         \i_tv80_core/i_reg/n11 , \i_tv80_core/i_reg/n10 ,
         \i_tv80_core/i_reg/n9 , \i_tv80_core/i_reg/n8 ,
         \i_tv80_core/i_reg/n7 , \i_tv80_core/i_reg/n6 ,
         \i_tv80_core/i_reg/n5 , \i_tv80_core/i_reg/n4 ,
         \i_tv80_core/i_reg/n3 , \i_tv80_core/i_reg/n2 ,
         \i_tv80_core/i_reg/n1 , \i_tv80_core/i_reg/n301 ,
         \i_tv80_core/i_reg/n300 , \i_tv80_core/i_reg/n299 ,
         \i_tv80_core/i_reg/n298 , \i_tv80_core/i_reg/n297 ,
         \i_tv80_core/i_reg/n296 , \i_tv80_core/i_reg/n295 ,
         \i_tv80_core/i_reg/n294 , \i_tv80_core/i_reg/n293 ,
         \i_tv80_core/i_reg/n292 , \i_tv80_core/i_reg/n291 ,
         \i_tv80_core/i_reg/n290 , \i_tv80_core/i_reg/n289 ,
         \i_tv80_core/i_reg/n288 , \i_tv80_core/i_reg/n287 ,
         \i_tv80_core/i_reg/n286 , \i_tv80_core/i_reg/n285 ,
         \i_tv80_core/i_reg/n284 , \i_tv80_core/i_reg/n283 ,
         \i_tv80_core/i_reg/n282 , \i_tv80_core/i_reg/n281 ,
         \i_tv80_core/i_reg/n280 , \i_tv80_core/i_reg/n279 ,
         \i_tv80_core/i_reg/n278 , \i_tv80_core/i_reg/n277 ,
         \i_tv80_core/i_reg/n276 , \i_tv80_core/i_reg/n275 ,
         \i_tv80_core/i_reg/n274 , \i_tv80_core/i_reg/n273 ,
         \i_tv80_core/i_reg/n272 , \i_tv80_core/i_reg/n271 ,
         \i_tv80_core/i_reg/n270 , \i_tv80_core/i_reg/n269 ,
         \i_tv80_core/i_reg/n268 , \i_tv80_core/i_reg/n267 ,
         \i_tv80_core/i_reg/n266 , \i_tv80_core/i_reg/n265 ,
         \i_tv80_core/i_reg/n264 , \i_tv80_core/i_reg/n263 ,
         \i_tv80_core/i_reg/n262 , \i_tv80_core/i_reg/n261 ,
         \i_tv80_core/i_reg/n260 , \i_tv80_core/i_reg/n259 ,
         \i_tv80_core/i_reg/n258 , \i_tv80_core/i_reg/n257 ,
         \i_tv80_core/i_reg/n256 , \i_tv80_core/i_reg/n255 ,
         \i_tv80_core/i_reg/n254 , \i_tv80_core/i_reg/n253 ,
         \i_tv80_core/i_reg/n252 , \i_tv80_core/i_reg/n251 ,
         \i_tv80_core/i_reg/n250 , \i_tv80_core/i_reg/n249 ,
         \i_tv80_core/i_reg/n248 , \i_tv80_core/i_reg/n247 ,
         \i_tv80_core/i_reg/n246 , \i_tv80_core/i_reg/n245 ,
         \i_tv80_core/i_reg/n244 , \i_tv80_core/i_reg/n243 ,
         \i_tv80_core/i_reg/n242 , \i_tv80_core/i_reg/n241 ,
         \i_tv80_core/i_reg/n240 , \i_tv80_core/i_reg/n239 ,
         \i_tv80_core/i_reg/n238 , \i_tv80_core/i_reg/n237 ,
         \i_tv80_core/i_reg/n236 , \i_tv80_core/i_reg/n235 ,
         \i_tv80_core/i_reg/n234 , \i_tv80_core/i_reg/n233 ,
         \i_tv80_core/i_reg/n232 , \i_tv80_core/i_reg/n231 ,
         \i_tv80_core/i_reg/n230 , \i_tv80_core/i_reg/n229 ,
         \i_tv80_core/i_reg/n228 , \i_tv80_core/i_reg/n227 ,
         \i_tv80_core/i_reg/n226 , \i_tv80_core/i_reg/n225 ,
         \i_tv80_core/i_reg/n224 , \i_tv80_core/i_reg/n223 ,
         \i_tv80_core/i_reg/n222 , \i_tv80_core/i_reg/n221 ,
         \i_tv80_core/i_reg/n220 , \i_tv80_core/i_reg/n219 ,
         \i_tv80_core/i_reg/n218 , \i_tv80_core/i_reg/n217 ,
         \i_tv80_core/i_reg/n216 , \i_tv80_core/i_reg/n215 ,
         \i_tv80_core/i_reg/n214 , \i_tv80_core/i_reg/n213 ,
         \i_tv80_core/i_reg/n212 , \i_tv80_core/i_reg/n211 ,
         \i_tv80_core/i_reg/n210 , \i_tv80_core/i_reg/n209 ,
         \i_tv80_core/i_reg/n208 , \i_tv80_core/i_reg/n207 ,
         \i_tv80_core/i_reg/n206 , \i_tv80_core/i_reg/n205 ,
         \i_tv80_core/i_reg/n204 , \i_tv80_core/i_reg/n203 ,
         \i_tv80_core/i_reg/n202 , \i_tv80_core/i_reg/n201 ,
         \i_tv80_core/i_reg/n200 , \i_tv80_core/i_reg/n199 ,
         \i_tv80_core/i_reg/n198 , \i_tv80_core/i_reg/n197 ,
         \i_tv80_core/i_reg/n196 , \i_tv80_core/i_reg/n195 ,
         \i_tv80_core/i_reg/n194 , \i_tv80_core/i_reg/n193 ,
         \i_tv80_core/i_reg/n192 , \i_tv80_core/i_reg/n191 ,
         \i_tv80_core/i_reg/n190 , \i_tv80_core/i_reg/n189 ,
         \i_tv80_core/i_reg/n188 , \i_tv80_core/i_reg/n187 ,
         \i_tv80_core/i_reg/n186 , \i_tv80_core/i_reg/n185 ,
         \i_tv80_core/i_reg/n184 , \i_tv80_core/i_reg/n183 ,
         \i_tv80_core/i_reg/n182 , \i_tv80_core/i_reg/n181 ,
         \i_tv80_core/i_reg/n180 , \i_tv80_core/i_reg/n179 ,
         \i_tv80_core/i_reg/n178 , \i_tv80_core/i_reg/n177 ,
         \i_tv80_core/i_reg/n176 , \i_tv80_core/i_reg/n175 ,
         \i_tv80_core/i_reg/n174 , \i_tv80_core/i_reg/RegsL[0][7] ,
         \i_tv80_core/i_reg/RegsL[0][6] , \i_tv80_core/i_reg/RegsL[0][5] ,
         \i_tv80_core/i_reg/RegsL[0][4] , \i_tv80_core/i_reg/RegsL[0][3] ,
         \i_tv80_core/i_reg/RegsL[0][2] , \i_tv80_core/i_reg/RegsL[0][1] ,
         \i_tv80_core/i_reg/RegsL[0][0] , \i_tv80_core/i_reg/RegsL[1][7] ,
         \i_tv80_core/i_reg/RegsL[1][6] , \i_tv80_core/i_reg/RegsL[1][5] ,
         \i_tv80_core/i_reg/RegsL[1][4] , \i_tv80_core/i_reg/RegsL[1][3] ,
         \i_tv80_core/i_reg/RegsL[1][2] , \i_tv80_core/i_reg/RegsL[1][1] ,
         \i_tv80_core/i_reg/RegsL[1][0] , \i_tv80_core/i_reg/RegsL[2][7] ,
         \i_tv80_core/i_reg/RegsL[2][6] , \i_tv80_core/i_reg/RegsL[2][5] ,
         \i_tv80_core/i_reg/RegsL[2][4] , \i_tv80_core/i_reg/RegsL[2][3] ,
         \i_tv80_core/i_reg/RegsL[2][2] , \i_tv80_core/i_reg/RegsL[2][1] ,
         \i_tv80_core/i_reg/RegsL[2][0] , \i_tv80_core/i_reg/RegsL[3][7] ,
         \i_tv80_core/i_reg/RegsL[3][6] , \i_tv80_core/i_reg/RegsL[3][5] ,
         \i_tv80_core/i_reg/RegsL[3][4] , \i_tv80_core/i_reg/RegsL[3][3] ,
         \i_tv80_core/i_reg/RegsL[3][2] , \i_tv80_core/i_reg/RegsL[3][1] ,
         \i_tv80_core/i_reg/RegsL[3][0] , \i_tv80_core/i_reg/RegsL[4][7] ,
         \i_tv80_core/i_reg/RegsL[4][6] , \i_tv80_core/i_reg/RegsL[4][5] ,
         \i_tv80_core/i_reg/RegsL[4][4] , \i_tv80_core/i_reg/RegsL[4][3] ,
         \i_tv80_core/i_reg/RegsL[4][2] , \i_tv80_core/i_reg/RegsL[4][1] ,
         \i_tv80_core/i_reg/RegsL[4][0] , \i_tv80_core/i_reg/RegsL[5][7] ,
         \i_tv80_core/i_reg/RegsL[5][6] , \i_tv80_core/i_reg/RegsL[5][5] ,
         \i_tv80_core/i_reg/RegsL[5][4] , \i_tv80_core/i_reg/RegsL[5][3] ,
         \i_tv80_core/i_reg/RegsL[5][2] , \i_tv80_core/i_reg/RegsL[5][1] ,
         \i_tv80_core/i_reg/RegsL[5][0] , \i_tv80_core/i_reg/RegsL[6][7] ,
         \i_tv80_core/i_reg/RegsL[6][6] , \i_tv80_core/i_reg/RegsL[6][5] ,
         \i_tv80_core/i_reg/RegsL[6][4] , \i_tv80_core/i_reg/RegsL[6][3] ,
         \i_tv80_core/i_reg/RegsL[6][2] , \i_tv80_core/i_reg/RegsL[6][1] ,
         \i_tv80_core/i_reg/RegsL[6][0] , \i_tv80_core/i_reg/RegsL[7][7] ,
         \i_tv80_core/i_reg/RegsL[7][6] , \i_tv80_core/i_reg/RegsL[7][5] ,
         \i_tv80_core/i_reg/RegsL[7][4] , \i_tv80_core/i_reg/RegsL[7][3] ,
         \i_tv80_core/i_reg/RegsL[7][2] , \i_tv80_core/i_reg/RegsL[7][1] ,
         \i_tv80_core/i_reg/RegsL[7][0] , \i_tv80_core/i_reg/RegsH[0][7] ,
         \i_tv80_core/i_reg/RegsH[0][6] , \i_tv80_core/i_reg/RegsH[0][5] ,
         \i_tv80_core/i_reg/RegsH[0][4] , \i_tv80_core/i_reg/RegsH[0][3] ,
         \i_tv80_core/i_reg/RegsH[0][2] , \i_tv80_core/i_reg/RegsH[0][1] ,
         \i_tv80_core/i_reg/RegsH[0][0] , \i_tv80_core/i_reg/RegsH[1][7] ,
         \i_tv80_core/i_reg/RegsH[1][6] , \i_tv80_core/i_reg/RegsH[1][5] ,
         \i_tv80_core/i_reg/RegsH[1][4] , \i_tv80_core/i_reg/RegsH[1][3] ,
         \i_tv80_core/i_reg/RegsH[1][2] , \i_tv80_core/i_reg/RegsH[1][1] ,
         \i_tv80_core/i_reg/RegsH[1][0] , \i_tv80_core/i_reg/RegsH[2][7] ,
         \i_tv80_core/i_reg/RegsH[2][6] , \i_tv80_core/i_reg/RegsH[2][5] ,
         \i_tv80_core/i_reg/RegsH[2][4] , \i_tv80_core/i_reg/RegsH[2][3] ,
         \i_tv80_core/i_reg/RegsH[2][2] , \i_tv80_core/i_reg/RegsH[2][1] ,
         \i_tv80_core/i_reg/RegsH[2][0] , \i_tv80_core/i_reg/RegsH[3][7] ,
         \i_tv80_core/i_reg/RegsH[3][6] , \i_tv80_core/i_reg/RegsH[3][5] ,
         \i_tv80_core/i_reg/RegsH[3][4] , \i_tv80_core/i_reg/RegsH[3][3] ,
         \i_tv80_core/i_reg/RegsH[3][2] , \i_tv80_core/i_reg/RegsH[3][1] ,
         \i_tv80_core/i_reg/RegsH[3][0] , \i_tv80_core/i_reg/RegsH[4][7] ,
         \i_tv80_core/i_reg/RegsH[4][6] , \i_tv80_core/i_reg/RegsH[4][5] ,
         \i_tv80_core/i_reg/RegsH[4][4] , \i_tv80_core/i_reg/RegsH[4][3] ,
         \i_tv80_core/i_reg/RegsH[4][2] , \i_tv80_core/i_reg/RegsH[4][1] ,
         \i_tv80_core/i_reg/RegsH[4][0] , \i_tv80_core/i_reg/RegsH[5][7] ,
         \i_tv80_core/i_reg/RegsH[5][6] , \i_tv80_core/i_reg/RegsH[5][5] ,
         \i_tv80_core/i_reg/RegsH[5][4] , \i_tv80_core/i_reg/RegsH[5][3] ,
         \i_tv80_core/i_reg/RegsH[5][2] , \i_tv80_core/i_reg/RegsH[5][1] ,
         \i_tv80_core/i_reg/RegsH[5][0] , \i_tv80_core/i_reg/RegsH[6][7] ,
         \i_tv80_core/i_reg/RegsH[6][6] , \i_tv80_core/i_reg/RegsH[6][5] ,
         \i_tv80_core/i_reg/RegsH[6][4] , \i_tv80_core/i_reg/RegsH[6][3] ,
         \i_tv80_core/i_reg/RegsH[6][2] , \i_tv80_core/i_reg/RegsH[6][1] ,
         \i_tv80_core/i_reg/RegsH[6][0] , \i_tv80_core/i_reg/RegsH[7][7] ,
         \i_tv80_core/i_reg/RegsH[7][6] , \i_tv80_core/i_reg/RegsH[7][5] ,
         \i_tv80_core/i_reg/RegsH[7][4] , \i_tv80_core/i_reg/RegsH[7][3] ,
         \i_tv80_core/i_reg/RegsH[7][2] , \i_tv80_core/i_reg/RegsH[7][1] ,
         \i_tv80_core/i_reg/RegsH[7][0] , \i_tv80_core/i_reg/n496 ,
         \i_tv80_core/add_944/n78 , \i_tv80_core/add_944/n77 ,
         \i_tv80_core/add_944/n76 , \i_tv80_core/add_944/n75 ,
         \i_tv80_core/add_944/n74 , \i_tv80_core/add_944/n73 ,
         \i_tv80_core/add_944/n72 , \i_tv80_core/add_944/n71 ,
         \i_tv80_core/add_944/n70 , \i_tv80_core/add_944/n69 ,
         \i_tv80_core/add_944/n68 , \i_tv80_core/add_944/n67 ,
         \i_tv80_core/add_944/n66 , \i_tv80_core/add_944/n65 ,
         \i_tv80_core/add_944/n64 , \i_tv80_core/add_944/n63 ,
         \i_tv80_core/add_944/n62 , \i_tv80_core/add_944/n61 ,
         \i_tv80_core/add_944/n60 , \i_tv80_core/add_944/n59 ,
         \i_tv80_core/add_944/n58 , \i_tv80_core/add_944/n57 ,
         \i_tv80_core/add_944/n56 , \i_tv80_core/add_944/n55 ,
         \i_tv80_core/add_944/n54 , \i_tv80_core/add_944/n53 ,
         \i_tv80_core/add_944/n52 , \i_tv80_core/add_944/n51 ,
         \i_tv80_core/add_944/n50 , \i_tv80_core/add_944/n49 ,
         \i_tv80_core/add_944/n48 , \i_tv80_core/add_944/n47 ,
         \i_tv80_core/add_944/n46 , \i_tv80_core/add_944/n45 ,
         \i_tv80_core/add_944/n44 , \i_tv80_core/add_944/n43 ,
         \i_tv80_core/add_944/n42 , \i_tv80_core/add_944/n41 ,
         \i_tv80_core/add_944/n40 , \i_tv80_core/add_944/n39 ,
         \i_tv80_core/add_944/n38 , \i_tv80_core/add_944/n37 ,
         \i_tv80_core/add_944/n36 , \i_tv80_core/add_944/n35 ,
         \i_tv80_core/add_944/n34 , \i_tv80_core/add_944/n33 ,
         \i_tv80_core/add_944/n32 , \i_tv80_core/add_944/n31 ,
         \i_tv80_core/add_944/n30 , \i_tv80_core/add_944/n29 ,
         \i_tv80_core/add_944/n28 , \i_tv80_core/add_944/n27 ,
         \i_tv80_core/add_944/n26 , \i_tv80_core/add_944/n25 ,
         \i_tv80_core/add_944/n24 , \i_tv80_core/add_944/n23 ,
         \i_tv80_core/add_944/n22 , \i_tv80_core/add_944/n21 ,
         \i_tv80_core/add_944/n20 , \i_tv80_core/add_944/n19 ,
         \i_tv80_core/add_944/n18 , \i_tv80_core/add_944/n17 ,
         \i_tv80_core/add_944/n16 , \i_tv80_core/add_944/n15 ,
         \i_tv80_core/add_944/n14 , \i_tv80_core/add_944/n13 ,
         \i_tv80_core/add_944/n12 , \i_tv80_core/add_944/n11 ,
         \i_tv80_core/add_944/n10 , \i_tv80_core/add_944/n9 ,
         \i_tv80_core/add_944/n8 , \i_tv80_core/add_944/n7 ,
         \i_tv80_core/add_944/n6 , \i_tv80_core/add_944/n5 ,
         \i_tv80_core/add_944/n4 , \i_tv80_core/add_944/n3 ,
         \i_tv80_core/add_944/n2 ;
  wire   [7:0] di_reg;
  wire   [2:0] mcycle;
  wire   [2:0] tstate;
  wire   [7:0] \i_tv80_core/RegDIL ;
  wire   [7:0] \i_tv80_core/RegDIH ;
  wire   [15:0] \i_tv80_core/RegBusB ;
  wire   [2:0] \i_tv80_core/RegAddrB ;
  wire   [2:0] \i_tv80_core/RegAddrA ;
  wire   [15:0] \i_tv80_core/RegBusA ;
  wire   [2:0] \i_tv80_core/RegAddrC ;
  wire   [15:0] \i_tv80_core/SP ;
  wire   [7:0] \i_tv80_core/ACC ;
  wire   [15:0] \i_tv80_core/PC ;
  wire   [15:0] \i_tv80_core/RegBusC ;
  wire   [15:0] \i_tv80_core/TmpAddr ;
  wire   [7:0] \i_tv80_core/R ;
  wire   [7:0] \i_tv80_core/F_Out ;
  wire   [7:0] \i_tv80_core/ALU_Q ;
  wire   [7:0] \i_tv80_core/BusB ;
  wire   [7:0] \i_tv80_core/BusA ;
  wire   [3:0] \i_tv80_core/ALU_Op_r ;
  wire   [1:0] \i_tv80_core/IMode ;
  wire   [2:0] \i_tv80_core/Special_LD ;
  wire   [2:0] \i_tv80_core/Set_Addr_To ;
  wire   [3:0] \i_tv80_core/ALU_Op ;
  wire   [3:0] \i_tv80_core/Set_BusA_To ;
  wire   [3:0] \i_tv80_core/Set_BusB_To ;
  wire   [3:0] \i_tv80_core/IncDec_16 ;
  wire   [1:0] \i_tv80_core/Prefix ;
  wire   [2:0] \i_tv80_core/tstates ;
  wire   [2:0] \i_tv80_core/mcycles_d ;
  wire   [7:0] \i_tv80_core/F ;
  wire   [1:0] \i_tv80_core/ISet ;
  wire   [7:0] \i_tv80_core/IR ;
  wire   [6:2] \i_tv80_core/add_776/carry ;

  DFF_X1 \di_reg_reg[0]  ( .D(n84), .CK(clk), .Q(di_reg[0]), .QN(n45) );
  DFF_X1 \di_reg_reg[7]  ( .D(n91), .CK(clk), .Q(di_reg[7]), .QN(n41) );
  DFF_X1 \di_reg_reg[6]  ( .D(n90), .CK(clk), .Q(di_reg[6]), .QN(n42) );
  DFF_X1 \di_reg_reg[5]  ( .D(n89), .CK(clk), .Q(di_reg[5]) );
  DFF_X1 \di_reg_reg[4]  ( .D(n88), .CK(clk), .Q(di_reg[4]), .QN(n43) );
  DFF_X1 \di_reg_reg[3]  ( .D(n87), .CK(clk), .Q(di_reg[3]), .QN(n44) );
  DFF_X1 \di_reg_reg[2]  ( .D(n86), .CK(clk), .Q(di_reg[2]) );
  DFF_X1 \di_reg_reg[1]  ( .D(n85), .CK(clk), .Q(di_reg[1]), .QN(n40) );
  DFF_X1 wr_n_reg ( .D(N34), .CK(clk), .Q(wr_n) );
  DFF_X1 rd_n_reg ( .D(N33), .CK(clk), .Q(rd_n) );
  DFF_X1 mreq_n_reg ( .D(N36), .CK(clk), .Q(mreq_n) );
  DFF_X1 iorq_n_reg ( .D(N35), .CK(clk), .Q(iorq_n) );
  AOI21_X1 U46 ( .B1(n71), .B2(n70), .A(n46), .ZN(n83) );
  NAND2_X1 U47 ( .A1(n72), .A2(n67), .ZN(n69) );
  INV_X1 U48 ( .A(no_read), .ZN(n67) );
  INV_X1 U49 ( .A(reset_n), .ZN(n46) );
  INV_X1 U50 ( .A(tstate[0]), .ZN(n47) );
  INV_X1 U51 ( .A(tstate[2]), .ZN(n75) );
  NAND3_X1 U52 ( .A1(tstate[1]), .A2(n47), .A3(n75), .ZN(n68) );
  INV_X1 U53 ( .A(wait_n), .ZN(n48) );
  OAI21_X1 U54 ( .B1(n68), .B2(n48), .A(reset_n), .ZN(n58) );
  NAND2_X1 U55 ( .A1(reset_n), .A2(n58), .ZN(n60) );
  INV_X1 U56 ( .A(di[0]), .ZN(n49) );
  OAI22_X1 U57 ( .A1(n60), .A2(n49), .B1(n58), .B2(n45), .ZN(n84) );
  INV_X1 U58 ( .A(di[1]), .ZN(n50) );
  OAI22_X1 U59 ( .A1(n60), .A2(n50), .B1(n58), .B2(n40), .ZN(n85) );
  INV_X1 U60 ( .A(di[2]), .ZN(n52) );
  INV_X1 U61 ( .A(di_reg[2]), .ZN(n51) );
  OAI22_X1 U62 ( .A1(n60), .A2(n52), .B1(n58), .B2(n51), .ZN(n86) );
  INV_X1 U63 ( .A(di[3]), .ZN(n53) );
  OAI22_X1 U64 ( .A1(n60), .A2(n53), .B1(n58), .B2(n44), .ZN(n87) );
  INV_X1 U65 ( .A(di[4]), .ZN(n54) );
  OAI22_X1 U66 ( .A1(n60), .A2(n54), .B1(n58), .B2(n43), .ZN(n88) );
  INV_X1 U67 ( .A(di[5]), .ZN(n56) );
  INV_X1 U68 ( .A(di_reg[5]), .ZN(n55) );
  OAI22_X1 U69 ( .A1(n60), .A2(n56), .B1(n58), .B2(n55), .ZN(n89) );
  INV_X1 U70 ( .A(di[6]), .ZN(n57) );
  OAI22_X1 U71 ( .A1(n60), .A2(n57), .B1(n58), .B2(n42), .ZN(n90) );
  INV_X1 U72 ( .A(di[7]), .ZN(n59) );
  OAI22_X1 U73 ( .A1(n60), .A2(n59), .B1(n58), .B2(n41), .ZN(n91) );
  INV_X1 U74 ( .A(n68), .ZN(n62) );
  INV_X1 U75 ( .A(mcycle[0]), .ZN(n61) );
  OR3_X1 U76 ( .A1(mcycle[1]), .A2(n61), .A3(mcycle[2]), .ZN(n70) );
  NAND4_X1 U77 ( .A1(write), .A2(reset_n), .A3(n62), .A4(n70), .ZN(N34) );
  NOR2_X1 U78 ( .A1(no_read), .A2(write), .ZN(n63) );
  INV_X1 U79 ( .A(n70), .ZN(n79) );
  MUX2_X1 U80 ( .A(n63), .B(intcycle_n), .S(n79), .Z(n66) );
  INV_X1 U81 ( .A(tstate[1]), .ZN(n64) );
  NAND3_X1 U82 ( .A1(tstate[0]), .A2(n75), .A3(n64), .ZN(n65) );
  OAI21_X1 U83 ( .B1(wait_n), .B2(n68), .A(n65), .ZN(n72) );
  NAND3_X1 U84 ( .A1(reset_n), .A2(n66), .A3(n72), .ZN(N33) );
  MUX2_X1 U85 ( .A(n69), .B(n68), .S(write), .Z(n71) );
  INV_X1 U86 ( .A(n72), .ZN(n78) );
  NOR2_X1 U87 ( .A1(intcycle_n), .A2(n78), .ZN(n73) );
  MUX2_X1 U88 ( .A(iorq), .B(n73), .S(n79), .Z(n74) );
  NAND2_X1 U89 ( .A1(n83), .A2(n74), .ZN(N35) );
  INV_X1 U90 ( .A(iorq), .ZN(n81) );
  INV_X1 U91 ( .A(intcycle_n), .ZN(n77) );
  NAND3_X1 U92 ( .A1(tstate[0]), .A2(tstate[1]), .A3(n75), .ZN(n76) );
  OAI21_X1 U93 ( .B1(n78), .B2(n77), .A(n76), .ZN(n80) );
  MUX2_X1 U94 ( .A(n81), .B(n80), .S(n79), .Z(n82) );
  NAND2_X1 U95 ( .A1(n83), .A2(n82), .ZN(N36) );
  OAI211_X1 \i_tv80_core/U1953  ( .C1(\i_tv80_core/n2162 ), .C2(
        \i_tv80_core/n2161 ), .A(\i_tv80_core/n376 ), .B(\i_tv80_core/n2160 ), 
        .ZN(\i_tv80_core/n1346 ) );
  NAND3_X1 \i_tv80_core/U1952  ( .A1(\i_tv80_core/n2159 ), .A2(
        \i_tv80_core/n2158 ), .A3(\i_tv80_core/n2157 ), .ZN(
        \i_tv80_core/n2160 ) );
  NOR3_X1 \i_tv80_core/U1951  ( .A1(tstate[0]), .A2(\i_tv80_core/n2156 ), .A3(
        \i_tv80_core/n2155 ), .ZN(\i_tv80_core/n2157 ) );
  AOI21_X1 \i_tv80_core/U1950  ( .B1(\i_tv80_core/n2154 ), .B2(
        \i_tv80_core/n2153 ), .A(\i_tv80_core/n2152 ), .ZN(\i_tv80_core/n2162 ) );
  NAND3_X1 \i_tv80_core/U1949  ( .A1(\i_tv80_core/n36 ), .A2(
        \i_tv80_core/n2151 ), .A3(\i_tv80_core/n154 ), .ZN(\i_tv80_core/n2153 ) );
  OAI221_X1 \i_tv80_core/U1948  ( .B1(\i_tv80_core/n2150 ), .B2(
        \i_tv80_core/n2149 ), .C1(\i_tv80_core/n1213 ), .C2(
        \i_tv80_core/n2148 ), .A(\i_tv80_core/n376 ), .ZN(\i_tv80_core/n1366 )
         );
  AOI21_X1 \i_tv80_core/U1947  ( .B1(\i_tv80_core/n36 ), .B2(
        \i_tv80_core/n2155 ), .A(\i_tv80_core/n2156 ), .ZN(\i_tv80_core/n2150 ) );
  NAND3_X1 \i_tv80_core/U1946  ( .A1(\i_tv80_core/n2147 ), .A2(
        \i_tv80_core/n2146 ), .A3(\i_tv80_core/n2145 ), .ZN(
        \i_tv80_core/n1233 ) );
  AOI221_X1 \i_tv80_core/U1945  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [15]), .C1(\i_tv80_core/n74 ), .C2(
        \i_tv80_core/TmpAddr [15]), .A(\i_tv80_core/n2143 ), .ZN(
        \i_tv80_core/n2145 ) );
  NOR3_X1 \i_tv80_core/U1944  ( .A1(\i_tv80_core/n2142 ), .A2(
        \i_tv80_core/n245 ), .A3(\i_tv80_core/n240 ), .ZN(\i_tv80_core/n2143 )
         );
  AOI221_X1 \i_tv80_core/U1943  ( .B1(\i_tv80_core/n2141 ), .B2(
        \i_tv80_core/ACC [7]), .C1(\i_tv80_core/N262 ), .C2(\i_tv80_core/n219 ), .A(\i_tv80_core/n2140 ), .ZN(\i_tv80_core/n2146 ) );
  OAI22_X1 \i_tv80_core/U1942  ( .A1(\i_tv80_core/n2139 ), .A2(
        \i_tv80_core/n2138 ), .B1(\i_tv80_core/n2137 ), .B2(
        \i_tv80_core/n2136 ), .ZN(\i_tv80_core/n2140 ) );
  AOI22_X1 \i_tv80_core/U1941  ( .A1(di_reg[7]), .A2(\i_tv80_core/n2135 ), 
        .B1(\i_tv80_core/n2134 ), .B2(\i_tv80_core/SP [15]), .ZN(
        \i_tv80_core/n2147 ) );
  NAND3_X1 \i_tv80_core/U1940  ( .A1(\i_tv80_core/n2133 ), .A2(
        \i_tv80_core/n2132 ), .A3(\i_tv80_core/n2131 ), .ZN(
        \i_tv80_core/n1234 ) );
  AOI221_X1 \i_tv80_core/U1939  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [14]), .C1(\i_tv80_core/n74 ), .C2(
        \i_tv80_core/TmpAddr [14]), .A(\i_tv80_core/n2130 ), .ZN(
        \i_tv80_core/n2131 ) );
  NOR3_X1 \i_tv80_core/U1938  ( .A1(\i_tv80_core/n2129 ), .A2(
        \i_tv80_core/n245 ), .A3(\i_tv80_core/n240 ), .ZN(\i_tv80_core/n2130 )
         );
  AOI221_X1 \i_tv80_core/U1937  ( .B1(\i_tv80_core/n2141 ), .B2(
        \i_tv80_core/ACC [6]), .C1(\i_tv80_core/N261 ), .C2(\i_tv80_core/n219 ), .A(\i_tv80_core/n2128 ), .ZN(\i_tv80_core/n2132 ) );
  OAI22_X1 \i_tv80_core/U1936  ( .A1(\i_tv80_core/n2139 ), .A2(
        \i_tv80_core/n2127 ), .B1(\i_tv80_core/n2137 ), .B2(
        \i_tv80_core/n2126 ), .ZN(\i_tv80_core/n2128 ) );
  AOI22_X1 \i_tv80_core/U1935  ( .A1(di_reg[6]), .A2(\i_tv80_core/n2135 ), 
        .B1(\i_tv80_core/n2134 ), .B2(\i_tv80_core/SP [14]), .ZN(
        \i_tv80_core/n2133 ) );
  NAND3_X1 \i_tv80_core/U1934  ( .A1(\i_tv80_core/n2125 ), .A2(
        \i_tv80_core/n2124 ), .A3(\i_tv80_core/n2123 ), .ZN(
        \i_tv80_core/n1235 ) );
  AOI221_X1 \i_tv80_core/U1933  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [13]), .C1(\i_tv80_core/n74 ), .C2(
        \i_tv80_core/TmpAddr [13]), .A(\i_tv80_core/n2122 ), .ZN(
        \i_tv80_core/n2123 ) );
  NOR3_X1 \i_tv80_core/U1932  ( .A1(\i_tv80_core/n2121 ), .A2(
        \i_tv80_core/n245 ), .A3(\i_tv80_core/n240 ), .ZN(\i_tv80_core/n2122 )
         );
  AOI221_X1 \i_tv80_core/U1931  ( .B1(\i_tv80_core/n2141 ), .B2(
        \i_tv80_core/ACC [5]), .C1(\i_tv80_core/N260 ), .C2(\i_tv80_core/n219 ), .A(\i_tv80_core/n2120 ), .ZN(\i_tv80_core/n2124 ) );
  OAI22_X1 \i_tv80_core/U1930  ( .A1(\i_tv80_core/n2139 ), .A2(
        \i_tv80_core/n2119 ), .B1(\i_tv80_core/n2137 ), .B2(
        \i_tv80_core/n2118 ), .ZN(\i_tv80_core/n2120 ) );
  AOI22_X1 \i_tv80_core/U1929  ( .A1(di_reg[5]), .A2(\i_tv80_core/n2135 ), 
        .B1(\i_tv80_core/n2134 ), .B2(\i_tv80_core/SP [13]), .ZN(
        \i_tv80_core/n2125 ) );
  NAND3_X1 \i_tv80_core/U1928  ( .A1(\i_tv80_core/n2117 ), .A2(
        \i_tv80_core/n2116 ), .A3(\i_tv80_core/n2115 ), .ZN(
        \i_tv80_core/n1236 ) );
  AOI221_X1 \i_tv80_core/U1927  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [12]), .C1(\i_tv80_core/n74 ), .C2(
        \i_tv80_core/TmpAddr [12]), .A(\i_tv80_core/n2114 ), .ZN(
        \i_tv80_core/n2115 ) );
  NOR3_X1 \i_tv80_core/U1926  ( .A1(\i_tv80_core/n2113 ), .A2(
        \i_tv80_core/n245 ), .A3(\i_tv80_core/n240 ), .ZN(\i_tv80_core/n2114 )
         );
  AOI221_X1 \i_tv80_core/U1925  ( .B1(\i_tv80_core/n2141 ), .B2(
        \i_tv80_core/ACC [4]), .C1(\i_tv80_core/N259 ), .C2(\i_tv80_core/n219 ), .A(\i_tv80_core/n2112 ), .ZN(\i_tv80_core/n2116 ) );
  OAI22_X1 \i_tv80_core/U1924  ( .A1(\i_tv80_core/n2139 ), .A2(
        \i_tv80_core/n2111 ), .B1(\i_tv80_core/n2137 ), .B2(
        \i_tv80_core/n2110 ), .ZN(\i_tv80_core/n2112 ) );
  AOI22_X1 \i_tv80_core/U1923  ( .A1(di_reg[4]), .A2(\i_tv80_core/n2135 ), 
        .B1(\i_tv80_core/n2134 ), .B2(\i_tv80_core/SP [12]), .ZN(
        \i_tv80_core/n2117 ) );
  NAND3_X1 \i_tv80_core/U1922  ( .A1(\i_tv80_core/n2109 ), .A2(
        \i_tv80_core/n2108 ), .A3(\i_tv80_core/n2107 ), .ZN(
        \i_tv80_core/n1237 ) );
  AOI221_X1 \i_tv80_core/U1921  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [11]), .C1(\i_tv80_core/n75 ), .C2(
        \i_tv80_core/TmpAddr [11]), .A(\i_tv80_core/n2106 ), .ZN(
        \i_tv80_core/n2107 ) );
  NOR3_X1 \i_tv80_core/U1920  ( .A1(\i_tv80_core/n2105 ), .A2(
        \i_tv80_core/n245 ), .A3(\i_tv80_core/n240 ), .ZN(\i_tv80_core/n2106 )
         );
  AOI221_X1 \i_tv80_core/U1919  ( .B1(\i_tv80_core/n2141 ), .B2(
        \i_tv80_core/ACC [3]), .C1(\i_tv80_core/N258 ), .C2(\i_tv80_core/n219 ), .A(\i_tv80_core/n2104 ), .ZN(\i_tv80_core/n2108 ) );
  OAI22_X1 \i_tv80_core/U1918  ( .A1(\i_tv80_core/n2139 ), .A2(
        \i_tv80_core/n2103 ), .B1(\i_tv80_core/n2137 ), .B2(
        \i_tv80_core/n2102 ), .ZN(\i_tv80_core/n2104 ) );
  AOI22_X1 \i_tv80_core/U1917  ( .A1(di_reg[3]), .A2(\i_tv80_core/n2135 ), 
        .B1(\i_tv80_core/n2134 ), .B2(\i_tv80_core/SP [11]), .ZN(
        \i_tv80_core/n2109 ) );
  NAND3_X1 \i_tv80_core/U1916  ( .A1(\i_tv80_core/n2101 ), .A2(
        \i_tv80_core/n2100 ), .A3(\i_tv80_core/n2099 ), .ZN(
        \i_tv80_core/n1238 ) );
  AOI221_X1 \i_tv80_core/U1915  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [10]), .C1(\i_tv80_core/n75 ), .C2(
        \i_tv80_core/TmpAddr [10]), .A(\i_tv80_core/n2098 ), .ZN(
        \i_tv80_core/n2099 ) );
  NOR3_X1 \i_tv80_core/U1914  ( .A1(\i_tv80_core/n2097 ), .A2(
        \i_tv80_core/n245 ), .A3(\i_tv80_core/n240 ), .ZN(\i_tv80_core/n2098 )
         );
  AOI221_X1 \i_tv80_core/U1913  ( .B1(\i_tv80_core/n2141 ), .B2(
        \i_tv80_core/ACC [2]), .C1(\i_tv80_core/N257 ), .C2(\i_tv80_core/n219 ), .A(\i_tv80_core/n2096 ), .ZN(\i_tv80_core/n2100 ) );
  OAI22_X1 \i_tv80_core/U1912  ( .A1(\i_tv80_core/n2139 ), .A2(
        \i_tv80_core/n2095 ), .B1(\i_tv80_core/n2137 ), .B2(
        \i_tv80_core/n2094 ), .ZN(\i_tv80_core/n2096 ) );
  AOI22_X1 \i_tv80_core/U1911  ( .A1(di_reg[2]), .A2(\i_tv80_core/n2135 ), 
        .B1(\i_tv80_core/n2134 ), .B2(\i_tv80_core/SP [10]), .ZN(
        \i_tv80_core/n2101 ) );
  NAND3_X1 \i_tv80_core/U1910  ( .A1(\i_tv80_core/n2093 ), .A2(
        \i_tv80_core/n2092 ), .A3(\i_tv80_core/n2091 ), .ZN(
        \i_tv80_core/n1239 ) );
  AOI221_X1 \i_tv80_core/U1909  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [9]), .C1(\i_tv80_core/n75 ), .C2(
        \i_tv80_core/TmpAddr [9]), .A(\i_tv80_core/n2090 ), .ZN(
        \i_tv80_core/n2091 ) );
  NOR3_X1 \i_tv80_core/U1908  ( .A1(\i_tv80_core/n2089 ), .A2(
        \i_tv80_core/n245 ), .A3(\i_tv80_core/n240 ), .ZN(\i_tv80_core/n2090 )
         );
  AOI221_X1 \i_tv80_core/U1907  ( .B1(\i_tv80_core/n2141 ), .B2(
        \i_tv80_core/ACC [1]), .C1(\i_tv80_core/N256 ), .C2(\i_tv80_core/n219 ), .A(\i_tv80_core/n2088 ), .ZN(\i_tv80_core/n2092 ) );
  OAI22_X1 \i_tv80_core/U1906  ( .A1(\i_tv80_core/n2139 ), .A2(
        \i_tv80_core/n2087 ), .B1(\i_tv80_core/n2137 ), .B2(
        \i_tv80_core/n2086 ), .ZN(\i_tv80_core/n2088 ) );
  AOI22_X1 \i_tv80_core/U1905  ( .A1(di_reg[1]), .A2(\i_tv80_core/n2135 ), 
        .B1(\i_tv80_core/n2134 ), .B2(\i_tv80_core/SP [9]), .ZN(
        \i_tv80_core/n2093 ) );
  NAND3_X1 \i_tv80_core/U1904  ( .A1(\i_tv80_core/n2085 ), .A2(
        \i_tv80_core/n2084 ), .A3(\i_tv80_core/n2083 ), .ZN(
        \i_tv80_core/n1240 ) );
  AOI221_X1 \i_tv80_core/U1903  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [8]), .C1(\i_tv80_core/n75 ), .C2(
        \i_tv80_core/TmpAddr [8]), .A(\i_tv80_core/n2082 ), .ZN(
        \i_tv80_core/n2083 ) );
  NOR3_X1 \i_tv80_core/U1902  ( .A1(\i_tv80_core/n2081 ), .A2(
        \i_tv80_core/n245 ), .A3(\i_tv80_core/n240 ), .ZN(\i_tv80_core/n2082 )
         );
  INV_X1 \i_tv80_core/U1901  ( .A(\i_tv80_core/n2077 ), .ZN(
        \i_tv80_core/n2078 ) );
  OAI22_X1 \i_tv80_core/U1900  ( .A1(\i_tv80_core/n2076 ), .A2(
        \i_tv80_core/n2075 ), .B1(\i_tv80_core/n2079 ), .B2(
        \i_tv80_core/n2074 ), .ZN(\i_tv80_core/n2144 ) );
  AOI221_X1 \i_tv80_core/U1899  ( .B1(\i_tv80_core/n2141 ), .B2(
        \i_tv80_core/ACC [0]), .C1(\i_tv80_core/N255 ), .C2(\i_tv80_core/n219 ), .A(\i_tv80_core/n2073 ), .ZN(\i_tv80_core/n2084 ) );
  OAI22_X1 \i_tv80_core/U1898  ( .A1(\i_tv80_core/n2139 ), .A2(
        \i_tv80_core/n2072 ), .B1(\i_tv80_core/n2137 ), .B2(
        \i_tv80_core/n2071 ), .ZN(\i_tv80_core/n2073 ) );
  OAI211_X1 \i_tv80_core/U1897  ( .C1(\i_tv80_core/n2070 ), .C2(
        \i_tv80_core/n2069 ), .A(\i_tv80_core/n367 ), .B(\i_tv80_core/n2137 ), 
        .ZN(\i_tv80_core/n2139 ) );
  AOI22_X1 \i_tv80_core/U1896  ( .A1(di_reg[0]), .A2(\i_tv80_core/n2135 ), 
        .B1(\i_tv80_core/n2134 ), .B2(\i_tv80_core/SP [8]), .ZN(
        \i_tv80_core/n2085 ) );
  OAI22_X1 \i_tv80_core/U1895  ( .A1(\i_tv80_core/n2076 ), .A2(
        \i_tv80_core/n2067 ), .B1(\i_tv80_core/n2079 ), .B2(
        \i_tv80_core/n2066 ), .ZN(\i_tv80_core/n2135 ) );
  OAI221_X1 \i_tv80_core/U1894  ( .B1(\i_tv80_core/n221 ), .B2(
        \i_tv80_core/n2065 ), .C1(\i_tv80_core/n1188 ), .C2(\i_tv80_core/n79 ), 
        .A(\i_tv80_core/n2063 ), .ZN(\i_tv80_core/n1241 ) );
  AOI221_X1 \i_tv80_core/U1893  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [7]), .C1(\i_tv80_core/n2134 ), .C2(
        \i_tv80_core/SP [7]), .A(\i_tv80_core/n2062 ), .ZN(\i_tv80_core/n2063 ) );
  OAI21_X1 \i_tv80_core/U1892  ( .B1(\i_tv80_core/n2061 ), .B2(
        \i_tv80_core/n2060 ), .A(\i_tv80_core/n2059 ), .ZN(\i_tv80_core/n2062 ) );
  AOI222_X1 \i_tv80_core/U1891  ( .A1(\i_tv80_core/N254 ), .A2(
        \i_tv80_core/n219 ), .B1(A[7]), .B2(\i_tv80_core/n2058 ), .C1(
        \i_tv80_core/n996 ), .C2(\i_tv80_core/n2057 ), .ZN(\i_tv80_core/n2059 ) );
  NAND2_X1 \i_tv80_core/U1890  ( .A1(\i_tv80_core/n2056 ), .A2(
        \i_tv80_core/n2055 ), .ZN(\i_tv80_core/n1242 ) );
  AOI221_X1 \i_tv80_core/U1889  ( .B1(\i_tv80_core/n2054 ), .B2(
        \i_tv80_core/RegBusC [6]), .C1(\i_tv80_core/N253 ), .C2(
        \i_tv80_core/n219 ), .A(\i_tv80_core/n2053 ), .ZN(\i_tv80_core/n2055 )
         );
  OAI22_X1 \i_tv80_core/U1888  ( .A1(\i_tv80_core/n2137 ), .A2(
        \i_tv80_core/n2052 ), .B1(\i_tv80_core/n1147 ), .B2(
        \i_tv80_core/n2051 ), .ZN(\i_tv80_core/n2053 ) );
  AOI221_X1 \i_tv80_core/U1887  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [6]), .C1(di_reg[6]), .C2(\i_tv80_core/n2141 ), .A(
        \i_tv80_core/n2050 ), .ZN(\i_tv80_core/n2056 ) );
  OAI222_X1 \i_tv80_core/U1886  ( .A1(\i_tv80_core/n1189 ), .A2(
        \i_tv80_core/n2049 ), .B1(\i_tv80_core/n2048 ), .B2(
        \i_tv80_core/n2076 ), .C1(\i_tv80_core/n1154 ), .C2(
        \i_tv80_core/n2047 ), .ZN(\i_tv80_core/n2050 ) );
  NAND2_X1 \i_tv80_core/U1885  ( .A1(\i_tv80_core/n2046 ), .A2(
        \i_tv80_core/n2045 ), .ZN(\i_tv80_core/n1243 ) );
  AOI221_X1 \i_tv80_core/U1884  ( .B1(\i_tv80_core/n2054 ), .B2(
        \i_tv80_core/RegBusC [5]), .C1(\i_tv80_core/N252 ), .C2(
        \i_tv80_core/n219 ), .A(\i_tv80_core/n2044 ), .ZN(\i_tv80_core/n2045 )
         );
  OAI22_X1 \i_tv80_core/U1883  ( .A1(\i_tv80_core/n2137 ), .A2(
        \i_tv80_core/n2043 ), .B1(\i_tv80_core/n1148 ), .B2(
        \i_tv80_core/n2051 ), .ZN(\i_tv80_core/n2044 ) );
  AOI221_X1 \i_tv80_core/U1882  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [5]), .C1(di_reg[5]), .C2(\i_tv80_core/n2141 ), .A(
        \i_tv80_core/n2042 ), .ZN(\i_tv80_core/n2046 ) );
  OAI222_X1 \i_tv80_core/U1881  ( .A1(\i_tv80_core/n1190 ), .A2(
        \i_tv80_core/n27 ), .B1(\i_tv80_core/n2041 ), .B2(\i_tv80_core/n2076 ), 
        .C1(\i_tv80_core/n1155 ), .C2(\i_tv80_core/n2047 ), .ZN(
        \i_tv80_core/n2042 ) );
  OAI221_X1 \i_tv80_core/U1880  ( .B1(\i_tv80_core/n221 ), .B2(
        \i_tv80_core/n2040 ), .C1(\i_tv80_core/n1191 ), .C2(
        \i_tv80_core/n2064 ), .A(\i_tv80_core/n2039 ), .ZN(\i_tv80_core/n1244 ) );
  OAI21_X1 \i_tv80_core/U1879  ( .B1(\i_tv80_core/n2060 ), .B2(
        \i_tv80_core/n2037 ), .A(\i_tv80_core/n2036 ), .ZN(\i_tv80_core/n2038 ) );
  AOI222_X1 \i_tv80_core/U1878  ( .A1(\i_tv80_core/N251 ), .A2(
        \i_tv80_core/n219 ), .B1(A[4]), .B2(\i_tv80_core/n2058 ), .C1(
        \i_tv80_core/n2057 ), .C2(\i_tv80_core/R [4]), .ZN(\i_tv80_core/n2036 ) );
  OAI221_X1 \i_tv80_core/U1877  ( .B1(\i_tv80_core/n221 ), .B2(
        \i_tv80_core/n2035 ), .C1(\i_tv80_core/n1192 ), .C2(
        \i_tv80_core/n2064 ), .A(\i_tv80_core/n2034 ), .ZN(\i_tv80_core/n1245 ) );
  AOI221_X1 \i_tv80_core/U1876  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [3]), .C1(\i_tv80_core/n2134 ), .C2(
        \i_tv80_core/SP [3]), .A(\i_tv80_core/n2033 ), .ZN(\i_tv80_core/n2034 ) );
  OAI21_X1 \i_tv80_core/U1875  ( .B1(\i_tv80_core/n2060 ), .B2(
        \i_tv80_core/n2032 ), .A(\i_tv80_core/n2031 ), .ZN(\i_tv80_core/n2033 ) );
  AOI222_X1 \i_tv80_core/U1874  ( .A1(\i_tv80_core/N250 ), .A2(
        \i_tv80_core/n219 ), .B1(A[3]), .B2(\i_tv80_core/n2058 ), .C1(
        \i_tv80_core/n2057 ), .C2(\i_tv80_core/R [3]), .ZN(\i_tv80_core/n2031 ) );
  NAND2_X1 \i_tv80_core/U1873  ( .A1(\i_tv80_core/n2030 ), .A2(
        \i_tv80_core/n2029 ), .ZN(\i_tv80_core/n1246 ) );
  AOI221_X1 \i_tv80_core/U1872  ( .B1(\i_tv80_core/n2054 ), .B2(
        \i_tv80_core/RegBusC [2]), .C1(\i_tv80_core/N249 ), .C2(
        \i_tv80_core/n219 ), .A(\i_tv80_core/n2028 ), .ZN(\i_tv80_core/n2029 )
         );
  OAI22_X1 \i_tv80_core/U1871  ( .A1(\i_tv80_core/n2137 ), .A2(
        \i_tv80_core/n2027 ), .B1(\i_tv80_core/n1151 ), .B2(
        \i_tv80_core/n2051 ), .ZN(\i_tv80_core/n2028 ) );
  AOI221_X1 \i_tv80_core/U1870  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [2]), .C1(di_reg[2]), .C2(\i_tv80_core/n2141 ), .A(
        \i_tv80_core/n2026 ), .ZN(\i_tv80_core/n2030 ) );
  OAI222_X1 \i_tv80_core/U1869  ( .A1(\i_tv80_core/n1193 ), .A2(
        \i_tv80_core/n27 ), .B1(\i_tv80_core/n2025 ), .B2(\i_tv80_core/n2076 ), 
        .C1(\i_tv80_core/n1158 ), .C2(\i_tv80_core/n2047 ), .ZN(
        \i_tv80_core/n2026 ) );
  NAND2_X1 \i_tv80_core/U1868  ( .A1(\i_tv80_core/n2024 ), .A2(
        \i_tv80_core/n2023 ), .ZN(\i_tv80_core/n1247 ) );
  AOI221_X1 \i_tv80_core/U1867  ( .B1(\i_tv80_core/n2054 ), .B2(
        \i_tv80_core/RegBusC [1]), .C1(\i_tv80_core/N248 ), .C2(
        \i_tv80_core/n219 ), .A(\i_tv80_core/n2022 ), .ZN(\i_tv80_core/n2023 )
         );
  OAI22_X1 \i_tv80_core/U1866  ( .A1(\i_tv80_core/n2137 ), .A2(
        \i_tv80_core/n2021 ), .B1(\i_tv80_core/n1152 ), .B2(
        \i_tv80_core/n2051 ), .ZN(\i_tv80_core/n2022 ) );
  INV_X1 \i_tv80_core/U1865  ( .A(\i_tv80_core/n2020 ), .ZN(
        \i_tv80_core/n2054 ) );
  AOI221_X1 \i_tv80_core/U1864  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [1]), .C1(di_reg[1]), .C2(\i_tv80_core/n2141 ), .A(
        \i_tv80_core/n2019 ), .ZN(\i_tv80_core/n2024 ) );
  OAI222_X1 \i_tv80_core/U1863  ( .A1(\i_tv80_core/n1194 ), .A2(
        \i_tv80_core/n2049 ), .B1(\i_tv80_core/n2018 ), .B2(
        \i_tv80_core/n2076 ), .C1(\i_tv80_core/n1159 ), .C2(
        \i_tv80_core/n2047 ), .ZN(\i_tv80_core/n2019 ) );
  OAI221_X1 \i_tv80_core/U1862  ( .B1(\i_tv80_core/n221 ), .B2(
        \i_tv80_core/n2017 ), .C1(\i_tv80_core/n1195 ), .C2(\i_tv80_core/n79 ), 
        .A(\i_tv80_core/n2016 ), .ZN(\i_tv80_core/n1248 ) );
  AOI221_X1 \i_tv80_core/U1861  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [0]), .C1(\i_tv80_core/n2134 ), .C2(
        \i_tv80_core/SP [0]), .A(\i_tv80_core/n2015 ), .ZN(\i_tv80_core/n2016 ) );
  OAI21_X1 \i_tv80_core/U1860  ( .B1(\i_tv80_core/n2060 ), .B2(
        \i_tv80_core/n2014 ), .A(\i_tv80_core/n2013 ), .ZN(\i_tv80_core/n2015 ) );
  AOI222_X1 \i_tv80_core/U1859  ( .A1(\i_tv80_core/N247 ), .A2(
        \i_tv80_core/n219 ), .B1(A[0]), .B2(\i_tv80_core/n2058 ), .C1(
        \i_tv80_core/n2057 ), .C2(\i_tv80_core/R [0]), .ZN(\i_tv80_core/n2013 ) );
  INV_X1 \i_tv80_core/U1858  ( .A(\i_tv80_core/n2047 ), .ZN(
        \i_tv80_core/n2057 ) );
  NAND3_X1 \i_tv80_core/U1857  ( .A1(\i_tv80_core/n368 ), .A2(
        \i_tv80_core/n2070 ), .A3(\i_tv80_core/n2137 ), .ZN(
        \i_tv80_core/n2047 ) );
  INV_X1 \i_tv80_core/U1856  ( .A(\i_tv80_core/n2137 ), .ZN(
        \i_tv80_core/n2058 ) );
  NAND4_X1 \i_tv80_core/U1855  ( .A1(\i_tv80_core/n2010 ), .A2(
        \i_tv80_core/n29 ), .A3(\i_tv80_core/n95 ), .A4(\i_tv80_core/n2008 ), 
        .ZN(\i_tv80_core/n2060 ) );
  NAND4_X1 \i_tv80_core/U1854  ( .A1(\i_tv80_core/Set_Addr_To [0]), .A2(
        \i_tv80_core/n29 ), .A3(\i_tv80_core/n2010 ), .A4(\i_tv80_core/n2008 ), 
        .ZN(\i_tv80_core/n2051 ) );
  OAI22_X1 \i_tv80_core/U1853  ( .A1(\i_tv80_core/n2006 ), .A2(
        \i_tv80_core/n2005 ), .B1(\i_tv80_core/n95 ), .B2(\i_tv80_core/n2008 ), 
        .ZN(\i_tv80_core/n2007 ) );
  INV_X1 \i_tv80_core/U1852  ( .A(\i_tv80_core/Set_Addr_To [1]), .ZN(
        \i_tv80_core/n2008 ) );
  INV_X1 \i_tv80_core/U1851  ( .A(\i_tv80_core/n2004 ), .ZN(
        \i_tv80_core/n2064 ) );
  OAI21_X1 \i_tv80_core/U1850  ( .B1(\i_tv80_core/n2003 ), .B2(
        \i_tv80_core/n2076 ), .A(\i_tv80_core/n26 ), .ZN(\i_tv80_core/n2004 )
         );
  INV_X1 \i_tv80_core/U1849  ( .A(\i_tv80_core/n2066 ), .ZN(
        \i_tv80_core/n2001 ) );
  NAND2_X1 \i_tv80_core/U1848  ( .A1(\i_tv80_core/n241 ), .A2(
        \i_tv80_core/n2000 ), .ZN(\i_tv80_core/n2066 ) );
  INV_X1 \i_tv80_core/U1847  ( .A(\i_tv80_core/Inc_WZ ), .ZN(
        \i_tv80_core/n2000 ) );
  INV_X1 \i_tv80_core/U1846  ( .A(\i_tv80_core/n2074 ), .ZN(
        \i_tv80_core/n2002 ) );
  NAND3_X1 \i_tv80_core/U1845  ( .A1(\i_tv80_core/n1999 ), .A2(
        \i_tv80_core/n1998 ), .A3(\i_tv80_core/n2005 ), .ZN(
        \i_tv80_core/n2074 ) );
  INV_X1 \i_tv80_core/U1844  ( .A(\i_tv80_core/n2006 ), .ZN(
        \i_tv80_core/n1999 ) );
  NAND2_X1 \i_tv80_core/U1843  ( .A1(\i_tv80_core/n1997 ), .A2(
        \i_tv80_core/n1996 ), .ZN(\i_tv80_core/n2080 ) );
  NAND2_X1 \i_tv80_core/U1842  ( .A1(\i_tv80_core/n2010 ), .A2(
        \i_tv80_core/n2077 ), .ZN(\i_tv80_core/n2020 ) );
  OAI22_X1 \i_tv80_core/U1841  ( .A1(\i_tv80_core/n1998 ), .A2(
        \i_tv80_core/n2006 ), .B1(\i_tv80_core/Set_Addr_To [1]), .B2(
        \i_tv80_core/n29 ), .ZN(\i_tv80_core/n2077 ) );
  NAND3_X1 \i_tv80_core/U1840  ( .A1(\i_tv80_core/Set_Addr_To [1]), .A2(
        \i_tv80_core/n2009 ), .A3(\i_tv80_core/n92 ), .ZN(\i_tv80_core/n2006 )
         );
  INV_X1 \i_tv80_core/U1839  ( .A(\i_tv80_core/n2079 ), .ZN(
        \i_tv80_core/n2010 ) );
  NAND4_X1 \i_tv80_core/U1838  ( .A1(\i_tv80_core/n220 ), .A2(
        \i_tv80_core/n1996 ), .A3(\i_tv80_core/n1994 ), .A4(
        \i_tv80_core/n1993 ), .ZN(\i_tv80_core/n2079 ) );
  INV_X1 \i_tv80_core/U1837  ( .A(\i_tv80_core/n2076 ), .ZN(
        \i_tv80_core/n1996 ) );
  NAND2_X1 \i_tv80_core/U1836  ( .A1(\i_tv80_core/n1992 ), .A2(
        \i_tv80_core/n80 ), .ZN(\i_tv80_core/n2076 ) );
  OAI222_X1 \i_tv80_core/U1835  ( .A1(\i_tv80_core/n1991 ), .A2(
        \i_tv80_core/n1990 ), .B1(\i_tv80_core/n1989 ), .B2(
        \i_tv80_core/n1988 ), .C1(\i_tv80_core/n981 ), .C2(\i_tv80_core/n279 ), 
        .ZN(\i_tv80_core/n1073 ) );
  AOI222_X1 \i_tv80_core/U1834  ( .A1(\i_tv80_core/I_RRD ), .A2(
        \i_tv80_core/BusA [3]), .B1(\i_tv80_core/n230 ), .B2(
        \i_tv80_core/BusB [7]), .C1(\i_tv80_core/n229 ), .C2(
        \i_tv80_core/BusB [3]), .ZN(\i_tv80_core/n1989 ) );
  OAI222_X1 \i_tv80_core/U1833  ( .A1(\i_tv80_core/n1987 ), .A2(
        \i_tv80_core/n1990 ), .B1(\i_tv80_core/n1986 ), .B2(
        \i_tv80_core/n1988 ), .C1(\i_tv80_core/n980 ), .C2(\i_tv80_core/n279 ), 
        .ZN(\i_tv80_core/n1074 ) );
  AOI222_X1 \i_tv80_core/U1832  ( .A1(\i_tv80_core/I_RRD ), .A2(
        \i_tv80_core/n1985 ), .B1(\i_tv80_core/n230 ), .B2(
        \i_tv80_core/BusB [6]), .C1(\i_tv80_core/n229 ), .C2(
        \i_tv80_core/BusB [2]), .ZN(\i_tv80_core/n1986 ) );
  OAI222_X1 \i_tv80_core/U1831  ( .A1(\i_tv80_core/n1984 ), .A2(
        \i_tv80_core/n1990 ), .B1(\i_tv80_core/n1983 ), .B2(
        \i_tv80_core/n1988 ), .C1(\i_tv80_core/n979 ), .C2(\i_tv80_core/n279 ), 
        .ZN(\i_tv80_core/n1075 ) );
  AOI222_X1 \i_tv80_core/U1830  ( .A1(\i_tv80_core/I_RRD ), .A2(
        \i_tv80_core/n1982 ), .B1(\i_tv80_core/n230 ), .B2(
        \i_tv80_core/BusB [5]), .C1(\i_tv80_core/n229 ), .C2(
        \i_tv80_core/BusB [1]), .ZN(\i_tv80_core/n1983 ) );
  OAI222_X1 \i_tv80_core/U1829  ( .A1(\i_tv80_core/n1981 ), .A2(
        \i_tv80_core/n1990 ), .B1(\i_tv80_core/n1980 ), .B2(
        \i_tv80_core/n1988 ), .C1(\i_tv80_core/n978 ), .C2(\i_tv80_core/n279 ), 
        .ZN(\i_tv80_core/n1076 ) );
  AOI222_X1 \i_tv80_core/U1828  ( .A1(\i_tv80_core/I_RRD ), .A2(
        \i_tv80_core/BusA [0]), .B1(\i_tv80_core/n230 ), .B2(
        \i_tv80_core/BusB [4]), .C1(\i_tv80_core/n229 ), .C2(
        \i_tv80_core/n1979 ), .ZN(\i_tv80_core/n1980 ) );
  OAI222_X1 \i_tv80_core/U1827  ( .A1(\i_tv80_core/n1978 ), .A2(
        \i_tv80_core/n1990 ), .B1(\i_tv80_core/n1977 ), .B2(
        \i_tv80_core/n1988 ), .C1(\i_tv80_core/n977 ), .C2(\i_tv80_core/n279 ), 
        .ZN(\i_tv80_core/n1077 ) );
  AOI222_X1 \i_tv80_core/U1826  ( .A1(\i_tv80_core/I_RRD ), .A2(
        \i_tv80_core/BusB [7]), .B1(\i_tv80_core/n230 ), .B2(
        \i_tv80_core/BusB [3]), .C1(\i_tv80_core/n229 ), .C2(
        \i_tv80_core/BusA [3]), .ZN(\i_tv80_core/n1977 ) );
  OAI222_X1 \i_tv80_core/U1825  ( .A1(\i_tv80_core/n1976 ), .A2(
        \i_tv80_core/n1990 ), .B1(\i_tv80_core/n1975 ), .B2(
        \i_tv80_core/n1988 ), .C1(\i_tv80_core/n976 ), .C2(\i_tv80_core/n279 ), 
        .ZN(\i_tv80_core/n1078 ) );
  AOI222_X1 \i_tv80_core/U1824  ( .A1(\i_tv80_core/I_RRD ), .A2(
        \i_tv80_core/BusB [6]), .B1(\i_tv80_core/n230 ), .B2(
        \i_tv80_core/BusB [2]), .C1(\i_tv80_core/n229 ), .C2(
        \i_tv80_core/n1985 ), .ZN(\i_tv80_core/n1975 ) );
  INV_X1 \i_tv80_core/U1823  ( .A(\i_tv80_core/n1210 ), .ZN(
        \i_tv80_core/n1985 ) );
  INV_X1 \i_tv80_core/U1822  ( .A(\i_tv80_core/n1974 ), .ZN(
        \i_tv80_core/n1976 ) );
  OAI222_X1 \i_tv80_core/U1821  ( .A1(\i_tv80_core/n1973 ), .A2(
        \i_tv80_core/n1990 ), .B1(\i_tv80_core/n1972 ), .B2(
        \i_tv80_core/n1988 ), .C1(\i_tv80_core/n975 ), .C2(\i_tv80_core/n279 ), 
        .ZN(\i_tv80_core/n1079 ) );
  AOI222_X1 \i_tv80_core/U1820  ( .A1(\i_tv80_core/I_RRD ), .A2(
        \i_tv80_core/BusB [5]), .B1(\i_tv80_core/n230 ), .B2(
        \i_tv80_core/BusB [1]), .C1(\i_tv80_core/n229 ), .C2(
        \i_tv80_core/n1982 ), .ZN(\i_tv80_core/n1972 ) );
  INV_X1 \i_tv80_core/U1819  ( .A(\i_tv80_core/n1211 ), .ZN(
        \i_tv80_core/n1982 ) );
  OAI222_X1 \i_tv80_core/U1818  ( .A1(\i_tv80_core/n1971 ), .A2(
        \i_tv80_core/n1990 ), .B1(\i_tv80_core/n1970 ), .B2(
        \i_tv80_core/n1988 ), .C1(\i_tv80_core/n974 ), .C2(\i_tv80_core/n279 ), 
        .ZN(\i_tv80_core/n1080 ) );
  NAND3_X1 \i_tv80_core/U1817  ( .A1(\i_tv80_core/n279 ), .A2(
        \i_tv80_core/n367 ), .A3(\i_tv80_core/n1969 ), .ZN(\i_tv80_core/n1988 ) );
  NAND3_X1 \i_tv80_core/U1816  ( .A1(\i_tv80_core/n276 ), .A2(
        \i_tv80_core/n1968 ), .A3(\i_tv80_core/n1967 ), .ZN(
        \i_tv80_core/n1969 ) );
  NOR3_X1 \i_tv80_core/U1815  ( .A1(\i_tv80_core/n1966 ), .A2(
        \i_tv80_core/n1965 ), .A3(\i_tv80_core/n1964 ), .ZN(
        \i_tv80_core/n1967 ) );
  OAI211_X1 \i_tv80_core/U1814  ( .C1(\i_tv80_core/n1961 ), .C2(
        \i_tv80_core/n1964 ), .A(\i_tv80_core/n376 ), .B(\i_tv80_core/n1960 ), 
        .ZN(\i_tv80_core/n1963 ) );
  AOI222_X1 \i_tv80_core/U1813  ( .A1(\i_tv80_core/I_RRD ), .A2(
        \i_tv80_core/BusB [4]), .B1(\i_tv80_core/n230 ), .B2(
        \i_tv80_core/n1979 ), .C1(\i_tv80_core/n229 ), .C2(
        \i_tv80_core/BusA [0]), .ZN(\i_tv80_core/n1970 ) );
  INV_X1 \i_tv80_core/U1812  ( .A(\i_tv80_core/I_RLD ), .ZN(
        \i_tv80_core/n1958 ) );
  INV_X1 \i_tv80_core/U1811  ( .A(\i_tv80_core/I_RRD ), .ZN(
        \i_tv80_core/n1959 ) );
  NAND3_X1 \i_tv80_core/U1810  ( .A1(\i_tv80_core/n1957 ), .A2(
        \i_tv80_core/n367 ), .A3(\i_tv80_core/n1956 ), .ZN(\i_tv80_core/n1990 ) );
  INV_X1 \i_tv80_core/U1809  ( .A(\i_tv80_core/n1961 ), .ZN(
        \i_tv80_core/n1956 ) );
  INV_X1 \i_tv80_core/U1808  ( .A(\i_tv80_core/n1955 ), .ZN(
        \i_tv80_core/n1971 ) );
  INV_X1 \i_tv80_core/U1807  ( .A(\i_tv80_core/n1954 ), .ZN(
        \i_tv80_core/n2177 ) );
  AOI22_X1 \i_tv80_core/U1806  ( .A1(\i_tv80_core/Arith16 ), .A2(
        \i_tv80_core/n366 ), .B1(\i_tv80_core/Arith16_r ), .B2(
        \i_tv80_core/n1953 ), .ZN(\i_tv80_core/n1954 ) );
  OAI21_X1 \i_tv80_core/U1805  ( .B1(\i_tv80_core/n1130 ), .B2(
        \i_tv80_core/n1962 ), .A(\i_tv80_core/n1952 ), .ZN(\i_tv80_core/n1363 ) );
  NAND4_X1 \i_tv80_core/U1804  ( .A1(\i_tv80_core/n1951 ), .A2(
        \i_tv80_core/n1950 ), .A3(\i_tv80_core/n1949 ), .A4(
        \i_tv80_core/n1948 ), .ZN(\i_tv80_core/n1952 ) );
  NOR4_X1 \i_tv80_core/U1803  ( .A1(\i_tv80_core/n1947 ), .A2(
        \i_tv80_core/n1946 ), .A3(mcycle[2]), .A4(\i_tv80_core/n1944 ), .ZN(
        \i_tv80_core/n1948 ) );
  INV_X1 \i_tv80_core/U1802  ( .A(\i_tv80_core/n1136 ), .ZN(
        \i_tv80_core/n1950 ) );
  INV_X1 \i_tv80_core/U1801  ( .A(\i_tv80_core/n1943 ), .ZN(
        \i_tv80_core/n1951 ) );
  OAI221_X1 \i_tv80_core/U1800  ( .B1(\i_tv80_core/n1942 ), .B2(
        \i_tv80_core/n1941 ), .C1(\i_tv80_core/n1940 ), .C2(
        \i_tv80_core/n1939 ), .A(\i_tv80_core/n1938 ), .ZN(\i_tv80_core/n1337 ) );
  MUX2_X1 \i_tv80_core/U1799  ( .A(\i_tv80_core/n1937 ), .B(
        \i_tv80_core/n1936 ), .S(\i_tv80_core/n1935 ), .Z(\i_tv80_core/n1938 )
         );
  AOI221_X1 \i_tv80_core/U1798  ( .B1(\i_tv80_core/n1934 ), .B2(
        \i_tv80_core/SP [15]), .C1(\i_tv80_core/n253 ), .C2(
        \i_tv80_core/SP [7]), .A(\i_tv80_core/n1933 ), .ZN(\i_tv80_core/n1936 ) );
  OAI22_X1 \i_tv80_core/U1797  ( .A1(\i_tv80_core/n1170 ), .A2(
        \i_tv80_core/n1932 ), .B1(\i_tv80_core/n2061 ), .B2(
        \i_tv80_core/n1931 ), .ZN(\i_tv80_core/n1933 ) );
  INV_X1 \i_tv80_core/U1796  ( .A(\i_tv80_core/RegBusA [15]), .ZN(
        \i_tv80_core/n1941 ) );
  OAI221_X1 \i_tv80_core/U1795  ( .B1(\i_tv80_core/n1942 ), .B2(
        \i_tv80_core/n1930 ), .C1(\i_tv80_core/n1940 ), .C2(
        \i_tv80_core/n1929 ), .A(\i_tv80_core/n1928 ), .ZN(\i_tv80_core/n1338 ) );
  MUX2_X1 \i_tv80_core/U1794  ( .A(\i_tv80_core/n1927 ), .B(
        \i_tv80_core/n1926 ), .S(\i_tv80_core/n1935 ), .Z(\i_tv80_core/n1928 )
         );
  AOI221_X1 \i_tv80_core/U1793  ( .B1(\i_tv80_core/n1934 ), .B2(
        \i_tv80_core/SP [14]), .C1(\i_tv80_core/n253 ), .C2(
        \i_tv80_core/SP [6]), .A(\i_tv80_core/n1925 ), .ZN(\i_tv80_core/n1926 ) );
  OAI22_X1 \i_tv80_core/U1792  ( .A1(\i_tv80_core/n1171 ), .A2(
        \i_tv80_core/n62 ), .B1(\i_tv80_core/n1924 ), .B2(\i_tv80_core/n1931 ), 
        .ZN(\i_tv80_core/n1925 ) );
  OAI221_X1 \i_tv80_core/U1791  ( .B1(\i_tv80_core/n1942 ), .B2(
        \i_tv80_core/n1923 ), .C1(\i_tv80_core/n1940 ), .C2(
        \i_tv80_core/n1922 ), .A(\i_tv80_core/n1921 ), .ZN(\i_tv80_core/n1339 ) );
  MUX2_X1 \i_tv80_core/U1790  ( .A(\i_tv80_core/n1920 ), .B(
        \i_tv80_core/n1919 ), .S(\i_tv80_core/n1935 ), .Z(\i_tv80_core/n1921 )
         );
  AOI221_X1 \i_tv80_core/U1789  ( .B1(\i_tv80_core/n1934 ), .B2(
        \i_tv80_core/SP [13]), .C1(\i_tv80_core/n253 ), .C2(
        \i_tv80_core/SP [5]), .A(\i_tv80_core/n1918 ), .ZN(\i_tv80_core/n1919 ) );
  OAI22_X1 \i_tv80_core/U1788  ( .A1(\i_tv80_core/n1172 ), .A2(
        \i_tv80_core/n62 ), .B1(\i_tv80_core/n1917 ), .B2(\i_tv80_core/n1931 ), 
        .ZN(\i_tv80_core/n1918 ) );
  INV_X1 \i_tv80_core/U1787  ( .A(\i_tv80_core/n352 ), .ZN(\i_tv80_core/n1922 ) );
  OAI221_X1 \i_tv80_core/U1786  ( .B1(\i_tv80_core/n1942 ), .B2(
        \i_tv80_core/n1916 ), .C1(\i_tv80_core/n1940 ), .C2(\i_tv80_core/n125 ), .A(\i_tv80_core/n1914 ), .ZN(\i_tv80_core/n1340 ) );
  MUX2_X1 \i_tv80_core/U1785  ( .A(\i_tv80_core/n1913 ), .B(
        \i_tv80_core/n1912 ), .S(\i_tv80_core/n1935 ), .Z(\i_tv80_core/n1914 )
         );
  AOI221_X1 \i_tv80_core/U1784  ( .B1(\i_tv80_core/n1934 ), .B2(
        \i_tv80_core/SP [12]), .C1(\i_tv80_core/n253 ), .C2(
        \i_tv80_core/SP [4]), .A(\i_tv80_core/n1911 ), .ZN(\i_tv80_core/n1912 ) );
  OAI22_X1 \i_tv80_core/U1783  ( .A1(\i_tv80_core/n1173 ), .A2(
        \i_tv80_core/n62 ), .B1(\i_tv80_core/n2037 ), .B2(\i_tv80_core/n1931 ), 
        .ZN(\i_tv80_core/n1911 ) );
  OAI221_X1 \i_tv80_core/U1782  ( .B1(\i_tv80_core/n1942 ), .B2(
        \i_tv80_core/n123 ), .C1(\i_tv80_core/n1940 ), .C2(\i_tv80_core/n181 ), 
        .A(\i_tv80_core/n1908 ), .ZN(\i_tv80_core/n1341 ) );
  MUX2_X1 \i_tv80_core/U1781  ( .A(\i_tv80_core/n1209 ), .B(
        \i_tv80_core/n1907 ), .S(\i_tv80_core/n1935 ), .Z(\i_tv80_core/n1908 )
         );
  AOI221_X1 \i_tv80_core/U1780  ( .B1(\i_tv80_core/n1934 ), .B2(
        \i_tv80_core/SP [11]), .C1(\i_tv80_core/n253 ), .C2(
        \i_tv80_core/SP [3]), .A(\i_tv80_core/n1906 ), .ZN(\i_tv80_core/n1907 ) );
  OAI22_X1 \i_tv80_core/U1779  ( .A1(\i_tv80_core/n1174 ), .A2(
        \i_tv80_core/n62 ), .B1(\i_tv80_core/n2032 ), .B2(\i_tv80_core/n1931 ), 
        .ZN(\i_tv80_core/n1906 ) );
  OAI221_X1 \i_tv80_core/U1778  ( .B1(\i_tv80_core/n1942 ), .B2(
        \i_tv80_core/n113 ), .C1(\i_tv80_core/n1940 ), .C2(\i_tv80_core/n146 ), 
        .A(\i_tv80_core/n1903 ), .ZN(\i_tv80_core/n1342 ) );
  MUX2_X1 \i_tv80_core/U1777  ( .A(\i_tv80_core/n1210 ), .B(
        \i_tv80_core/n1902 ), .S(\i_tv80_core/n1935 ), .Z(\i_tv80_core/n1903 )
         );
  AOI221_X1 \i_tv80_core/U1776  ( .B1(\i_tv80_core/n1934 ), .B2(
        \i_tv80_core/SP [10]), .C1(\i_tv80_core/n253 ), .C2(
        \i_tv80_core/SP [2]), .A(\i_tv80_core/n1901 ), .ZN(\i_tv80_core/n1902 ) );
  OAI22_X1 \i_tv80_core/U1775  ( .A1(\i_tv80_core/n1175 ), .A2(
        \i_tv80_core/n1932 ), .B1(\i_tv80_core/n1900 ), .B2(
        \i_tv80_core/n1931 ), .ZN(\i_tv80_core/n1901 ) );
  OAI221_X1 \i_tv80_core/U1774  ( .B1(\i_tv80_core/n1942 ), .B2(
        \i_tv80_core/n1899 ), .C1(\i_tv80_core/n1940 ), .C2(\i_tv80_core/n124 ), .A(\i_tv80_core/n1897 ), .ZN(\i_tv80_core/n1343 ) );
  MUX2_X1 \i_tv80_core/U1773  ( .A(\i_tv80_core/n1211 ), .B(
        \i_tv80_core/n1896 ), .S(\i_tv80_core/n1935 ), .Z(\i_tv80_core/n1897 )
         );
  AOI221_X1 \i_tv80_core/U1772  ( .B1(\i_tv80_core/n1934 ), .B2(
        \i_tv80_core/SP [9]), .C1(\i_tv80_core/n253 ), .C2(\i_tv80_core/SP [1]), .A(\i_tv80_core/n1895 ), .ZN(\i_tv80_core/n1896 ) );
  OAI22_X1 \i_tv80_core/U1771  ( .A1(\i_tv80_core/n1176 ), .A2(
        \i_tv80_core/n1932 ), .B1(\i_tv80_core/n1894 ), .B2(
        \i_tv80_core/n1931 ), .ZN(\i_tv80_core/n1895 ) );
  OAI221_X1 \i_tv80_core/U1770  ( .B1(\i_tv80_core/n1942 ), .B2(
        \i_tv80_core/n1893 ), .C1(\i_tv80_core/n1940 ), .C2(
        \i_tv80_core/n1892 ), .A(\i_tv80_core/n1891 ), .ZN(\i_tv80_core/n1344 ) );
  MUX2_X1 \i_tv80_core/U1769  ( .A(\i_tv80_core/n1212 ), .B(
        \i_tv80_core/n1890 ), .S(\i_tv80_core/n1935 ), .Z(\i_tv80_core/n1891 )
         );
  AOI221_X1 \i_tv80_core/U1768  ( .B1(\i_tv80_core/n1934 ), .B2(
        \i_tv80_core/SP [8]), .C1(\i_tv80_core/n253 ), .C2(\i_tv80_core/SP [0]), .A(\i_tv80_core/n1889 ), .ZN(\i_tv80_core/n1890 ) );
  OAI22_X1 \i_tv80_core/U1767  ( .A1(\i_tv80_core/n1177 ), .A2(
        \i_tv80_core/n1932 ), .B1(\i_tv80_core/n2014 ), .B2(
        \i_tv80_core/n1931 ), .ZN(\i_tv80_core/n1889 ) );
  INV_X1 \i_tv80_core/U1766  ( .A(\i_tv80_core/n1886 ), .ZN(
        \i_tv80_core/n1888 ) );
  INV_X1 \i_tv80_core/U1765  ( .A(\i_tv80_core/n1884 ), .ZN(
        \i_tv80_core/n1934 ) );
  NAND2_X1 \i_tv80_core/U1764  ( .A1(\i_tv80_core/N1102 ), .A2(
        \i_tv80_core/Set_BusA_To [1]), .ZN(\i_tv80_core/n1886 ) );
  OAI221_X1 \i_tv80_core/U1763  ( .B1(\i_tv80_core/n1885 ), .B2(
        \i_tv80_core/n1884 ), .C1(\i_tv80_core/n1881 ), .C2(
        \i_tv80_core/n1883 ), .A(\i_tv80_core/n371 ), .ZN(\i_tv80_core/n1882 )
         );
  INV_X1 \i_tv80_core/U1762  ( .A(\i_tv80_core/Set_BusA_To [3]), .ZN(
        \i_tv80_core/n1883 ) );
  NAND2_X1 \i_tv80_core/U1761  ( .A1(\i_tv80_core/Set_BusA_To [0]), .A2(
        \i_tv80_core/Set_BusA_To [3]), .ZN(\i_tv80_core/n1884 ) );
  NAND2_X1 \i_tv80_core/U1760  ( .A1(\i_tv80_core/n1880 ), .A2(
        \i_tv80_core/n1879 ), .ZN(\i_tv80_core/n1044 ) );
  MUX2_X1 \i_tv80_core/U1759  ( .A(\i_tv80_core/n1010 ), .B(
        \i_tv80_core/n1878 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1879 )
         );
  NAND2_X1 \i_tv80_core/U1758  ( .A1(\i_tv80_core/n1877 ), .A2(
        \i_tv80_core/n46 ), .ZN(\i_tv80_core/n1878 ) );
  OAI211_X1 \i_tv80_core/U1757  ( .C1(\i_tv80_core/n1197 ), .C2(
        \i_tv80_core/n216 ), .A(\i_tv80_core/n1876 ), .B(\i_tv80_core/n1875 ), 
        .ZN(\i_tv80_core/n1880 ) );
  INV_X1 \i_tv80_core/U1756  ( .A(\i_tv80_core/n1874 ), .ZN(
        \i_tv80_core/n1876 ) );
  NAND2_X1 \i_tv80_core/U1755  ( .A1(\i_tv80_core/n216 ), .A2(
        \i_tv80_core/n1875 ), .ZN(\i_tv80_core/n1877 ) );
  MUX2_X1 \i_tv80_core/U1754  ( .A(\i_tv80_core/n1998 ), .B(
        \i_tv80_core/Set_Addr_To [0]), .S(\i_tv80_core/n216 ), .Z(
        \i_tv80_core/n1872 ) );
  NAND3_X1 \i_tv80_core/U1753  ( .A1(\i_tv80_core/n167 ), .A2(
        \i_tv80_core/n44 ), .A3(\i_tv80_core/n1865 ), .ZN(\i_tv80_core/n1867 )
         );
  NAND4_X1 \i_tv80_core/U1752  ( .A1(\i_tv80_core/n188 ), .A2(
        \i_tv80_core/n1863 ), .A3(\i_tv80_core/n46 ), .A4(\i_tv80_core/n1864 ), 
        .ZN(\i_tv80_core/n1868 ) );
  OAI211_X1 \i_tv80_core/U1751  ( .C1(\i_tv80_core/n1862 ), .C2(
        \i_tv80_core/n1861 ), .A(\i_tv80_core/n1859 ), .B(\i_tv80_core/n1860 ), 
        .ZN(\i_tv80_core/n1869 ) );
  NAND3_X1 \i_tv80_core/U1750  ( .A1(\i_tv80_core/n188 ), .A2(
        \i_tv80_core/n1864 ), .A3(\i_tv80_core/n1863 ), .ZN(
        \i_tv80_core/n1859 ) );
  OAI21_X1 \i_tv80_core/U1749  ( .B1(\i_tv80_core/n2156 ), .B2(
        \i_tv80_core/n354 ), .A(\i_tv80_core/n1858 ), .ZN(\i_tv80_core/n1863 )
         );
  OAI221_X1 \i_tv80_core/U1748  ( .B1(\i_tv80_core/n1179 ), .B2(
        \i_tv80_core/n1857 ), .C1(\i_tv80_core/n1006 ), .C2(
        \i_tv80_core/n1856 ), .A(\i_tv80_core/n1855 ), .ZN(\i_tv80_core/n1860 ) );
  NAND3_X1 \i_tv80_core/U1747  ( .A1(tstate[2]), .A2(\i_tv80_core/n44 ), .A3(
        \i_tv80_core/n1854 ), .ZN(\i_tv80_core/n1855 ) );
  NOR3_X1 \i_tv80_core/U1746  ( .A1(tstate[1]), .A2(tstate[0]), .A3(
        \i_tv80_core/n1853 ), .ZN(\i_tv80_core/n1854 ) );
  INV_X1 \i_tv80_core/U1745  ( .A(\i_tv80_core/ExchangeDH ), .ZN(
        \i_tv80_core/n1853 ) );
  INV_X1 \i_tv80_core/U1744  ( .A(\i_tv80_core/n1865 ), .ZN(
        \i_tv80_core/n1862 ) );
  NAND2_X1 \i_tv80_core/U1743  ( .A1(\i_tv80_core/n1858 ), .A2(
        \i_tv80_core/n356 ), .ZN(\i_tv80_core/n1865 ) );
  OAI221_X1 \i_tv80_core/U1742  ( .B1(\i_tv80_core/n1852 ), .B2(
        \i_tv80_core/n1874 ), .C1(\i_tv80_core/n1006 ), .C2(\i_tv80_core/n371 ), .A(\i_tv80_core/n1851 ), .ZN(\i_tv80_core/n1041 ) );
  NAND3_X1 \i_tv80_core/U1741  ( .A1(\i_tv80_core/n1885 ), .A2(
        \i_tv80_core/n46 ), .A3(\i_tv80_core/n1850 ), .ZN(\i_tv80_core/n1851 )
         );
  INV_X1 \i_tv80_core/U1740  ( .A(\i_tv80_core/n1849 ), .ZN(
        \i_tv80_core/n1850 ) );
  NOR4_X1 \i_tv80_core/U1739  ( .A1(\i_tv80_core/n1197 ), .A2(
        \i_tv80_core/Set_BusA_To [1]), .A3(\i_tv80_core/n1848 ), .A4(
        \i_tv80_core/n1881 ), .ZN(\i_tv80_core/n1852 ) );
  OAI211_X1 \i_tv80_core/U1738  ( .C1(\i_tv80_core/n167 ), .C2(
        \i_tv80_core/n1864 ), .A(\i_tv80_core/n188 ), .B(\i_tv80_core/n1844 ), 
        .ZN(\i_tv80_core/n1845 ) );
  OAI21_X1 \i_tv80_core/U1737  ( .B1(\i_tv80_core/n356 ), .B2(
        \i_tv80_core/n2156 ), .A(\i_tv80_core/n1858 ), .ZN(\i_tv80_core/n1844 ) );
  AOI21_X1 \i_tv80_core/U1736  ( .B1(\i_tv80_core/n1858 ), .B2(
        \i_tv80_core/n354 ), .A(\i_tv80_core/n1861 ), .ZN(\i_tv80_core/n1846 )
         );
  AOI21_X1 \i_tv80_core/U1735  ( .B1(\i_tv80_core/n1843 ), .B2(
        \i_tv80_core/n1842 ), .A(\i_tv80_core/n1841 ), .ZN(\i_tv80_core/n1847 ) );
  MUX2_X1 \i_tv80_core/U1734  ( .A(\i_tv80_core/n1842 ), .B(\i_tv80_core/n68 ), 
        .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1045 ) );
  OAI211_X1 \i_tv80_core/U1733  ( .C1(\i_tv80_core/n1864 ), .C2(
        \i_tv80_core/n1840 ), .A(\i_tv80_core/n1838 ), .B(\i_tv80_core/n1839 ), 
        .ZN(\i_tv80_core/RegAddrA [0]) );
  AOI21_X1 \i_tv80_core/U1732  ( .B1(\i_tv80_core/n1837 ), .B2(
        \i_tv80_core/n1836 ), .A(\i_tv80_core/n1835 ), .ZN(\i_tv80_core/n1838 ) );
  OAI33_X1 \i_tv80_core/U1731  ( .A1(\i_tv80_core/n1834 ), .A2(
        \i_tv80_core/n1833 ), .A3(\i_tv80_core/n1832 ), .B1(\i_tv80_core/n360 ), .B2(\i_tv80_core/n357 ), .B3(\i_tv80_core/n1861 ), .ZN(\i_tv80_core/n1835 )
         );
  NAND2_X1 \i_tv80_core/U1730  ( .A1(\i_tv80_core/n1857 ), .A2(
        \i_tv80_core/n1831 ), .ZN(\i_tv80_core/n1832 ) );
  INV_X1 \i_tv80_core/U1729  ( .A(\i_tv80_core/n1840 ), .ZN(
        \i_tv80_core/n1833 ) );
  NOR3_X1 \i_tv80_core/U1728  ( .A1(\i_tv80_core/n194 ), .A2(
        \i_tv80_core/n1830 ), .A3(\i_tv80_core/n167 ), .ZN(\i_tv80_core/n1836 ) );
  INV_X1 \i_tv80_core/U1727  ( .A(\i_tv80_core/n1829 ), .ZN(
        \i_tv80_core/n1830 ) );
  NAND2_X1 \i_tv80_core/U1726  ( .A1(\i_tv80_core/n1866 ), .A2(
        \i_tv80_core/n1827 ), .ZN(\i_tv80_core/n1840 ) );
  INV_X1 \i_tv80_core/U1725  ( .A(\i_tv80_core/n1861 ), .ZN(
        \i_tv80_core/n1866 ) );
  NAND2_X1 \i_tv80_core/U1724  ( .A1(\i_tv80_core/n1826 ), .A2(
        \i_tv80_core/n1829 ), .ZN(\i_tv80_core/n1861 ) );
  OAI21_X1 \i_tv80_core/U1723  ( .B1(\i_tv80_core/n1826 ), .B2(
        \i_tv80_core/n1849 ), .A(\i_tv80_core/n1825 ), .ZN(\i_tv80_core/n1040 ) );
  MUX2_X1 \i_tv80_core/U1722  ( .A(\i_tv80_core/n1005 ), .B(
        \i_tv80_core/n1885 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1825 )
         );
  NAND2_X1 \i_tv80_core/U1721  ( .A1(\i_tv80_core/n295 ), .A2(
        \i_tv80_core/n68 ), .ZN(\i_tv80_core/n1849 ) );
  MUX2_X1 \i_tv80_core/U1720  ( .A(\i_tv80_core/n1824 ), .B(\i_tv80_core/n44 ), 
        .S(\i_tv80_core/n1841 ), .Z(\i_tv80_core/n1091 ) );
  OAI221_X1 \i_tv80_core/U1719  ( .B1(\i_tv80_core/n1823 ), .B2(
        \i_tv80_core/n1874 ), .C1(\i_tv80_core/n1009 ), .C2(\i_tv80_core/n371 ), .A(\i_tv80_core/n1822 ), .ZN(\i_tv80_core/n1043 ) );
  NAND3_X1 \i_tv80_core/U1718  ( .A1(\i_tv80_core/n46 ), .A2(
        \i_tv80_core/n1821 ), .A3(\i_tv80_core/n1820 ), .ZN(
        \i_tv80_core/n1822 ) );
  INV_X1 \i_tv80_core/U1717  ( .A(\i_tv80_core/n1819 ), .ZN(
        \i_tv80_core/n1820 ) );
  NAND2_X1 \i_tv80_core/U1716  ( .A1(\i_tv80_core/n371 ), .A2(
        \i_tv80_core/n44 ), .ZN(\i_tv80_core/n1874 ) );
  NOR4_X1 \i_tv80_core/U1715  ( .A1(\i_tv80_core/Set_BusB_To [1]), .A2(
        \i_tv80_core/n1197 ), .A3(\i_tv80_core/n1848 ), .A4(\i_tv80_core/n344 ), .ZN(\i_tv80_core/n1823 ) );
  MUX2_X1 \i_tv80_core/U1714  ( .A(\i_tv80_core/n1818 ), .B(
        \i_tv80_core/n1817 ), .S(\i_tv80_core/n1179 ), .Z(\i_tv80_core/n1362 )
         );
  NOR2_X1 \i_tv80_core/U1713  ( .A1(\i_tv80_core/n1818 ), .A2(
        \i_tv80_core/n1947 ), .ZN(\i_tv80_core/n1817 ) );
  AOI21_X1 \i_tv80_core/U1712  ( .B1(\i_tv80_core/ExchangeRS ), .B2(
        \i_tv80_core/n1992 ), .A(\i_tv80_core/n380 ), .ZN(\i_tv80_core/n1818 )
         );
  NOR2_X1 \i_tv80_core/U1711  ( .A1(\i_tv80_core/n1012 ), .A2(
        \i_tv80_core/n1841 ), .ZN(\i_tv80_core/RegAddrB [1]) );
  MUX2_X1 \i_tv80_core/U1710  ( .A(\i_tv80_core/n1816 ), .B(
        \i_tv80_core/N1107 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1046 )
         );
  NAND2_X1 \i_tv80_core/U1709  ( .A1(\i_tv80_core/n1007 ), .A2(
        \i_tv80_core/n1857 ), .ZN(\i_tv80_core/RegAddrB [0]) );
  OAI21_X1 \i_tv80_core/U1708  ( .B1(\i_tv80_core/n1826 ), .B2(
        \i_tv80_core/n1819 ), .A(\i_tv80_core/n1815 ), .ZN(\i_tv80_core/n1042 ) );
  MUX2_X1 \i_tv80_core/U1707  ( .A(\i_tv80_core/n1007 ), .B(
        \i_tv80_core/n1821 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1815 )
         );
  INV_X1 \i_tv80_core/U1706  ( .A(\i_tv80_core/Set_BusB_To [1]), .ZN(
        \i_tv80_core/n1821 ) );
  NAND2_X1 \i_tv80_core/U1705  ( .A1(\i_tv80_core/N1107 ), .A2(
        \i_tv80_core/n295 ), .ZN(\i_tv80_core/n1819 ) );
  NAND3_X1 \i_tv80_core/U1704  ( .A1(\i_tv80_core/n218 ), .A2(
        \i_tv80_core/n1810 ), .A3(\i_tv80_core/n1811 ), .ZN(
        \i_tv80_core/n1812 ) );
  NAND3_X1 \i_tv80_core/U1703  ( .A1(\i_tv80_core/n1808 ), .A2(
        \i_tv80_core/n1809 ), .A3(\i_tv80_core/n231 ), .ZN(\i_tv80_core/n1813 ) );
  OAI21_X1 \i_tv80_core/U1702  ( .B1(\i_tv80_core/n1804 ), .B2(
        \i_tv80_core/n1803 ), .A(\i_tv80_core/n1802 ), .ZN(\i_tv80_core/n1805 ) );
  INV_X1 \i_tv80_core/U1701  ( .A(\i_tv80_core/n1798 ), .ZN(
        \i_tv80_core/n1799 ) );
  INV_X1 \i_tv80_core/U1700  ( .A(\i_tv80_core/n1795 ), .ZN(
        \i_tv80_core/n1797 ) );
  NAND2_X1 \i_tv80_core/U1699  ( .A1(\i_tv80_core/n347 ), .A2(
        \i_tv80_core/RegBusA [14]), .ZN(\i_tv80_core/n1803 ) );
  INV_X1 \i_tv80_core/U1698  ( .A(\i_tv80_core/n1810 ), .ZN(
        \i_tv80_core/n1806 ) );
  NAND2_X1 \i_tv80_core/U1697  ( .A1(\i_tv80_core/n374 ), .A2(
        \i_tv80_core/n1930 ), .ZN(\i_tv80_core/n1810 ) );
  INV_X1 \i_tv80_core/U1696  ( .A(\i_tv80_core/RegBusA [14]), .ZN(
        \i_tv80_core/n1930 ) );
  INV_X1 \i_tv80_core/U1695  ( .A(\i_tv80_core/n1804 ), .ZN(
        \i_tv80_core/n1811 ) );
  NAND2_X1 \i_tv80_core/U1694  ( .A1(\i_tv80_core/n1796 ), .A2(
        \i_tv80_core/n1795 ), .ZN(\i_tv80_core/n1804 ) );
  MUX2_X1 \i_tv80_core/U1693  ( .A(\i_tv80_core/n1800 ), .B(
        \i_tv80_core/RegBusA [15]), .S(\i_tv80_core/n370 ), .Z(
        \i_tv80_core/n1063 ) );
  NAND3_X1 \i_tv80_core/U1692  ( .A1(\i_tv80_core/n218 ), .A2(
        \i_tv80_core/n1790 ), .A3(\i_tv80_core/n1796 ), .ZN(
        \i_tv80_core/n1791 ) );
  NAND2_X1 \i_tv80_core/U1691  ( .A1(\i_tv80_core/n1789 ), .A2(
        \i_tv80_core/n232 ), .ZN(\i_tv80_core/n1808 ) );
  NAND3_X1 \i_tv80_core/U1690  ( .A1(\i_tv80_core/n1786 ), .A2(
        \i_tv80_core/n1787 ), .A3(\i_tv80_core/n1785 ), .ZN(
        \i_tv80_core/n1789 ) );
  AOI21_X1 \i_tv80_core/U1689  ( .B1(\i_tv80_core/n373 ), .B2(
        \i_tv80_core/n1923 ), .A(\i_tv80_core/n1770 ), .ZN(\i_tv80_core/n1771 ) );
  INV_X1 \i_tv80_core/U1688  ( .A(\i_tv80_core/n147 ), .ZN(\i_tv80_core/n1923 ) );
  NAND3_X1 \i_tv80_core/U1687  ( .A1(\i_tv80_core/n1807 ), .A2(
        \i_tv80_core/n1796 ), .A3(\i_tv80_core/n1790 ), .ZN(
        \i_tv80_core/n1793 ) );
  INV_X1 \i_tv80_core/U1686  ( .A(\i_tv80_core/n1809 ), .ZN(
        \i_tv80_core/n1807 ) );
  NAND2_X1 \i_tv80_core/U1685  ( .A1(\i_tv80_core/n347 ), .A2(
        \i_tv80_core/n147 ), .ZN(\i_tv80_core/n1809 ) );
  AOI221_X1 \i_tv80_core/U1684  ( .B1(\i_tv80_core/RegBusB [14]), .B2(
        \i_tv80_core/n1841 ), .C1(\i_tv80_core/n1801 ), .C2(
        \i_tv80_core/n1769 ), .A(\i_tv80_core/n1768 ), .ZN(\i_tv80_core/n1794 ) );
  INV_X1 \i_tv80_core/U1683  ( .A(\i_tv80_core/n1767 ), .ZN(
        \i_tv80_core/n1768 ) );
  MUX2_X1 \i_tv80_core/U1682  ( .A(\i_tv80_core/n1769 ), .B(
        \i_tv80_core/RegBusA [14]), .S(\i_tv80_core/n370 ), .Z(
        \i_tv80_core/n1062 ) );
  AOI211_X1 \i_tv80_core/U1681  ( .C1(\i_tv80_core/n1761 ), .C2(
        \i_tv80_core/n159 ), .A(\i_tv80_core/n1759 ), .B(\i_tv80_core/n1758 ), 
        .ZN(\i_tv80_core/n1762 ) );
  NOR2_X1 \i_tv80_core/U1680  ( .A1(\i_tv80_core/n1756 ), .A2(
        \i_tv80_core/n111 ), .ZN(\i_tv80_core/n1761 ) );
  OAI21_X1 \i_tv80_core/U1679  ( .B1(\i_tv80_core/n178 ), .B2(
        \i_tv80_core/n1755 ), .A(\i_tv80_core/n1754 ), .ZN(\i_tv80_core/n1763 ) );
  OAI21_X1 \i_tv80_core/U1678  ( .B1(\i_tv80_core/n1753 ), .B2(
        \i_tv80_core/n1750 ), .A(\i_tv80_core/n1796 ), .ZN(\i_tv80_core/n1751 ) );
  INV_X1 \i_tv80_core/U1677  ( .A(\i_tv80_core/n1749 ), .ZN(
        \i_tv80_core/n1752 ) );
  XOR2_X1 \i_tv80_core/U1676  ( .A(\i_tv80_core/RegBusA [13]), .B(
        \i_tv80_core/n372 ), .Z(\i_tv80_core/n1753 ) );
  INV_X1 \i_tv80_core/U1675  ( .A(\i_tv80_core/n1757 ), .ZN(
        \i_tv80_core/n1770 ) );
  NAND2_X1 \i_tv80_core/U1674  ( .A1(\i_tv80_core/n373 ), .A2(
        \i_tv80_core/n1916 ), .ZN(\i_tv80_core/n1757 ) );
  INV_X1 \i_tv80_core/U1673  ( .A(\i_tv80_core/RegBusA [12]), .ZN(
        \i_tv80_core/n1916 ) );
  INV_X1 \i_tv80_core/U1672  ( .A(\i_tv80_core/n1748 ), .ZN(
        \i_tv80_core/n1764 ) );
  OAI21_X1 \i_tv80_core/U1671  ( .B1(\i_tv80_core/n111 ), .B2(
        \i_tv80_core/n1747 ), .A(\i_tv80_core/n96 ), .ZN(\i_tv80_core/n1765 )
         );
  NOR3_X1 \i_tv80_core/U1670  ( .A1(\i_tv80_core/n1748 ), .A2(
        \i_tv80_core/n1755 ), .A3(\i_tv80_core/n177 ), .ZN(\i_tv80_core/n1766 ) );
  NAND3_X1 \i_tv80_core/U1669  ( .A1(\i_tv80_core/n1749 ), .A2(
        \i_tv80_core/n1750 ), .A3(\i_tv80_core/n1745 ), .ZN(
        \i_tv80_core/n1755 ) );
  NAND2_X1 \i_tv80_core/U1668  ( .A1(\i_tv80_core/n347 ), .A2(
        \i_tv80_core/RegBusA [12]), .ZN(\i_tv80_core/n1750 ) );
  OAI221_X1 \i_tv80_core/U1667  ( .B1(\i_tv80_core/n1857 ), .B2(
        \i_tv80_core/n1744 ), .C1(\i_tv80_core/n1027 ), .C2(
        \i_tv80_core/n1839 ), .A(\i_tv80_core/n1743 ), .ZN(\i_tv80_core/n1748 ) );
  INV_X1 \i_tv80_core/U1666  ( .A(\i_tv80_core/RegBusB [13]), .ZN(
        \i_tv80_core/n1744 ) );
  MUX2_X1 \i_tv80_core/U1665  ( .A(\i_tv80_core/n1742 ), .B(\i_tv80_core/n147 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1061 ) );
  AOI21_X1 \i_tv80_core/U1664  ( .B1(\i_tv80_core/n1737 ), .B2(
        \i_tv80_core/n1736 ), .A(\i_tv80_core/n1735 ), .ZN(\i_tv80_core/n1738 ) );
  OAI33_X1 \i_tv80_core/U1663  ( .A1(\i_tv80_core/n1734 ), .A2(
        \i_tv80_core/n1733 ), .A3(\i_tv80_core/n1749 ), .B1(
        \i_tv80_core/n1732 ), .B2(\i_tv80_core/n1731 ), .B3(
        \i_tv80_core/n1734 ), .ZN(\i_tv80_core/n1735 ) );
  NOR2_X1 \i_tv80_core/U1662  ( .A1(\i_tv80_core/n1730 ), .A2(
        \i_tv80_core/n182 ), .ZN(\i_tv80_core/n1732 ) );
  INV_X1 \i_tv80_core/U1661  ( .A(\i_tv80_core/n1772 ), .ZN(
        \i_tv80_core/n1730 ) );
  NOR4_X1 \i_tv80_core/U1660  ( .A1(\i_tv80_core/n122 ), .A2(
        \i_tv80_core/n1733 ), .A3(\i_tv80_core/n1734 ), .A4(
        \i_tv80_core/n1759 ), .ZN(\i_tv80_core/n1737 ) );
  NAND2_X1 \i_tv80_core/U1659  ( .A1(\i_tv80_core/n374 ), .A2(
        \i_tv80_core/n1910 ), .ZN(\i_tv80_core/n1772 ) );
  INV_X1 \i_tv80_core/U1658  ( .A(\i_tv80_core/RegBusA [10]), .ZN(
        \i_tv80_core/n1905 ) );
  OAI21_X1 \i_tv80_core/U1657  ( .B1(\i_tv80_core/n1759 ), .B2(
        \i_tv80_core/n159 ), .A(\i_tv80_core/n1729 ), .ZN(\i_tv80_core/n1739 )
         );
  NOR4_X1 \i_tv80_core/U1656  ( .A1(\i_tv80_core/n134 ), .A2(
        \i_tv80_core/n1728 ), .A3(\i_tv80_core/n1727 ), .A4(\i_tv80_core/n180 ), .ZN(\i_tv80_core/n1729 ) );
  NAND3_X1 \i_tv80_core/U1655  ( .A1(\i_tv80_core/n1796 ), .A2(
        \i_tv80_core/n1749 ), .A3(\i_tv80_core/n1733 ), .ZN(
        \i_tv80_core/n1728 ) );
  NAND2_X1 \i_tv80_core/U1654  ( .A1(\i_tv80_core/n347 ), .A2(
        \i_tv80_core/RegBusA [11]), .ZN(\i_tv80_core/n1749 ) );
  INV_X1 \i_tv80_core/U1653  ( .A(\i_tv80_core/n1746 ), .ZN(
        \i_tv80_core/n1759 ) );
  NAND2_X1 \i_tv80_core/U1652  ( .A1(\i_tv80_core/n1725 ), .A2(
        \i_tv80_core/n373 ), .ZN(\i_tv80_core/n1746 ) );
  NAND4_X1 \i_tv80_core/U1651  ( .A1(\i_tv80_core/n358 ), .A2(
        \i_tv80_core/n352 ), .A3(\i_tv80_core/RegBusA [8]), .A4(
        \i_tv80_core/n31 ), .ZN(\i_tv80_core/n1725 ) );
  NAND3_X1 \i_tv80_core/U1650  ( .A1(\i_tv80_core/n1796 ), .A2(
        \i_tv80_core/n1731 ), .A3(\i_tv80_core/n177 ), .ZN(\i_tv80_core/n1740 ) );
  NAND2_X1 \i_tv80_core/U1649  ( .A1(\i_tv80_core/n1723 ), .A2(
        \i_tv80_core/n1724 ), .ZN(\i_tv80_core/n1727 ) );
  NAND2_X1 \i_tv80_core/U1648  ( .A1(\i_tv80_core/n1722 ), .A2(
        \i_tv80_core/n1775 ), .ZN(\i_tv80_core/n1726 ) );
  AOI221_X1 \i_tv80_core/U1647  ( .B1(\i_tv80_core/RegBusB [12]), .B2(
        \i_tv80_core/n1841 ), .C1(\i_tv80_core/n1801 ), .C2(
        \i_tv80_core/n1721 ), .A(\i_tv80_core/n273 ), .ZN(\i_tv80_core/n1741 )
         );
  MUX2_X1 \i_tv80_core/U1646  ( .A(\i_tv80_core/n1721 ), .B(
        \i_tv80_core/RegBusA [12]), .S(\i_tv80_core/n370 ), .Z(
        \i_tv80_core/n1060 ) );
  NAND2_X1 \i_tv80_core/U1645  ( .A1(\i_tv80_core/n1720 ), .A2(
        \i_tv80_core/n1719 ), .ZN(\i_tv80_core/n2165 ) );
  OAI21_X1 \i_tv80_core/U1644  ( .B1(\i_tv80_core/n217 ), .B2(
        \i_tv80_core/n1718 ), .A(\i_tv80_core/n1717 ), .ZN(\i_tv80_core/n1719 ) );
  NOR4_X1 \i_tv80_core/U1643  ( .A1(\i_tv80_core/n1716 ), .A2(
        \i_tv80_core/n1734 ), .A3(\i_tv80_core/n1715 ), .A4(
        \i_tv80_core/n1714 ), .ZN(\i_tv80_core/n1717 ) );
  INV_X1 \i_tv80_core/U1642  ( .A(\i_tv80_core/n1723 ), .ZN(
        \i_tv80_core/n1715 ) );
  OAI221_X1 \i_tv80_core/U1641  ( .B1(\i_tv80_core/n1857 ), .B2(
        \i_tv80_core/n1709 ), .C1(\i_tv80_core/n1025 ), .C2(
        \i_tv80_core/n1839 ), .A(\i_tv80_core/n1708 ), .ZN(\i_tv80_core/n1710 ) );
  INV_X1 \i_tv80_core/U1640  ( .A(\i_tv80_core/RegBusB [11]), .ZN(
        \i_tv80_core/n1709 ) );
  NOR3_X1 \i_tv80_core/U1639  ( .A1(\i_tv80_core/n1910 ), .A2(
        \i_tv80_core/n1734 ), .A3(\i_tv80_core/n32 ), .ZN(\i_tv80_core/n1711 )
         );
  NAND2_X1 \i_tv80_core/U1638  ( .A1(\i_tv80_core/RegBusA [10]), .A2(
        \i_tv80_core/n347 ), .ZN(\i_tv80_core/n1723 ) );
  INV_X1 \i_tv80_core/U1637  ( .A(\i_tv80_core/RegBusA [11]), .ZN(
        \i_tv80_core/n1910 ) );
  OAI21_X1 \i_tv80_core/U1636  ( .B1(\i_tv80_core/n1707 ), .B2(
        \i_tv80_core/n1706 ), .A(\i_tv80_core/n1705 ), .ZN(\i_tv80_core/n1712 ) );
  NAND3_X1 \i_tv80_core/U1635  ( .A1(\i_tv80_core/n1703 ), .A2(
        \i_tv80_core/n1704 ), .A3(\i_tv80_core/n1796 ), .ZN(
        \i_tv80_core/n1705 ) );
  INV_X1 \i_tv80_core/U1634  ( .A(\i_tv80_core/n1714 ), .ZN(
        \i_tv80_core/n1704 ) );
  XOR2_X1 \i_tv80_core/U1633  ( .A(\i_tv80_core/RegBusA [11]), .B(
        \i_tv80_core/n372 ), .Z(\i_tv80_core/n1714 ) );
  INV_X1 \i_tv80_core/U1632  ( .A(\i_tv80_core/n1716 ), .ZN(
        \i_tv80_core/n1707 ) );
  NAND2_X1 \i_tv80_core/U1631  ( .A1(\i_tv80_core/n1724 ), .A2(
        \i_tv80_core/n1722 ), .ZN(\i_tv80_core/n1716 ) );
  NOR4_X1 \i_tv80_core/U1630  ( .A1(\i_tv80_core/n217 ), .A2(
        \i_tv80_core/n1718 ), .A3(\i_tv80_core/n1703 ), .A4(
        \i_tv80_core/n1706 ), .ZN(\i_tv80_core/n1713 ) );
  NAND2_X1 \i_tv80_core/U1629  ( .A1(\i_tv80_core/n1796 ), .A2(
        \i_tv80_core/n1714 ), .ZN(\i_tv80_core/n1706 ) );
  OAI21_X1 \i_tv80_core/U1628  ( .B1(\i_tv80_core/n160 ), .B2(
        \i_tv80_core/n347 ), .A(\i_tv80_core/n1702 ), .ZN(\i_tv80_core/n1703 )
         );
  OAI21_X1 \i_tv80_core/U1627  ( .B1(\i_tv80_core/n347 ), .B2(
        \i_tv80_core/n1701 ), .A(\i_tv80_core/n1700 ), .ZN(\i_tv80_core/n1718 ) );
  MUX2_X1 \i_tv80_core/U1626  ( .A(\i_tv80_core/n1696 ), .B(\i_tv80_core/n11 ), 
        .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1059 ) );
  NAND4_X1 \i_tv80_core/U1625  ( .A1(\i_tv80_core/n1691 ), .A2(
        \i_tv80_core/n1722 ), .A3(\i_tv80_core/n1796 ), .A4(
        \i_tv80_core/n1692 ), .ZN(\i_tv80_core/n1693 ) );
  NAND3_X1 \i_tv80_core/U1624  ( .A1(\i_tv80_core/n1690 ), .A2(
        \i_tv80_core/n1702 ), .A3(\i_tv80_core/n1689 ), .ZN(
        \i_tv80_core/n1691 ) );
  NAND4_X1 \i_tv80_core/U1623  ( .A1(\i_tv80_core/n135 ), .A2(
        \i_tv80_core/n1702 ), .A3(\i_tv80_core/n150 ), .A4(\i_tv80_core/n1690 ), .ZN(\i_tv80_core/n1694 ) );
  NAND2_X1 \i_tv80_core/U1622  ( .A1(\i_tv80_core/n374 ), .A2(
        \i_tv80_core/n1899 ), .ZN(\i_tv80_core/n1702 ) );
  INV_X1 \i_tv80_core/U1621  ( .A(\i_tv80_core/RegBusA [9]), .ZN(
        \i_tv80_core/n1899 ) );
  NAND2_X1 \i_tv80_core/U1620  ( .A1(\i_tv80_core/n1687 ), .A2(
        \i_tv80_core/n373 ), .ZN(\i_tv80_core/n1690 ) );
  NAND4_X1 \i_tv80_core/U1619  ( .A1(\i_tv80_core/RegBusA [8]), .A2(
        \i_tv80_core/n352 ), .A3(\i_tv80_core/n170 ), .A4(\i_tv80_core/n30 ), 
        .ZN(\i_tv80_core/n1687 ) );
  OAI21_X1 \i_tv80_core/U1618  ( .B1(\i_tv80_core/n1688 ), .B2(
        \i_tv80_core/n1722 ), .A(\i_tv80_core/n1684 ), .ZN(\i_tv80_core/n1685 ) );
  NAND2_X1 \i_tv80_core/U1617  ( .A1(\i_tv80_core/RegBusA [9]), .A2(
        \i_tv80_core/n347 ), .ZN(\i_tv80_core/n1722 ) );
  NAND2_X1 \i_tv80_core/U1616  ( .A1(\i_tv80_core/n1796 ), .A2(
        \i_tv80_core/n1683 ), .ZN(\i_tv80_core/n1688 ) );
  MUX2_X1 \i_tv80_core/U1615  ( .A(\i_tv80_core/n1686 ), .B(\i_tv80_core/n3 ), 
        .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1058 ) );
  OAI21_X1 \i_tv80_core/U1614  ( .B1(\i_tv80_core/n1682 ), .B2(
        \i_tv80_core/n135 ), .A(\i_tv80_core/n1681 ), .ZN(
        \i_tv80_core/RegDIH [1]) );
  OAI221_X1 \i_tv80_core/U1613  ( .B1(\i_tv80_core/n1857 ), .B2(
        \i_tv80_core/n1676 ), .C1(\i_tv80_core/n1023 ), .C2(
        \i_tv80_core/n1839 ), .A(\i_tv80_core/n1675 ), .ZN(\i_tv80_core/n1677 ) );
  INV_X1 \i_tv80_core/U1612  ( .A(\i_tv80_core/RegBusB [9]), .ZN(
        \i_tv80_core/n1676 ) );
  INV_X1 \i_tv80_core/U1611  ( .A(\i_tv80_core/n1682 ), .ZN(
        \i_tv80_core/n1679 ) );
  NOR3_X1 \i_tv80_core/U1610  ( .A1(\i_tv80_core/n1678 ), .A2(
        \i_tv80_core/n1674 ), .A3(\i_tv80_core/n1734 ), .ZN(
        \i_tv80_core/n1680 ) );
  OAI21_X1 \i_tv80_core/U1609  ( .B1(\i_tv80_core/n1701 ), .B2(
        \i_tv80_core/n347 ), .A(\i_tv80_core/n1700 ), .ZN(\i_tv80_core/n1678 )
         );
  NAND2_X1 \i_tv80_core/U1608  ( .A1(\i_tv80_core/n373 ), .A2(
        \i_tv80_core/n1893 ), .ZN(\i_tv80_core/n1700 ) );
  INV_X1 \i_tv80_core/U1607  ( .A(\i_tv80_core/RegBusA [8]), .ZN(
        \i_tv80_core/n1893 ) );
  INV_X1 \i_tv80_core/U1606  ( .A(\i_tv80_core/n1673 ), .ZN(
        \i_tv80_core/n1701 ) );
  NAND4_X1 \i_tv80_core/U1605  ( .A1(\i_tv80_core/n1699 ), .A2(
        \i_tv80_core/n1697 ), .A3(\i_tv80_core/n1724 ), .A4(
        \i_tv80_core/n1698 ), .ZN(\i_tv80_core/n1689 ) );
  NAND3_X1 \i_tv80_core/U1604  ( .A1(\i_tv80_core/n187 ), .A2(
        \i_tv80_core/n1616 ), .A3(\i_tv80_core/n1671 ), .ZN(
        \i_tv80_core/n1697 ) );
  NAND2_X1 \i_tv80_core/U1603  ( .A1(\i_tv80_core/n1670 ), .A2(
        \i_tv80_core/n373 ), .ZN(\i_tv80_core/n1783 ) );
  INV_X1 \i_tv80_core/U1602  ( .A(\i_tv80_core/n1669 ), .ZN(
        \i_tv80_core/n1699 ) );
  OAI21_X1 \i_tv80_core/U1601  ( .B1(\i_tv80_core/n109 ), .B2(
        \i_tv80_core/n374 ), .A(\i_tv80_core/n1668 ), .ZN(\i_tv80_core/n1669 )
         );
  NAND2_X1 \i_tv80_core/U1600  ( .A1(\i_tv80_core/n347 ), .A2(
        \i_tv80_core/RegBusA [8]), .ZN(\i_tv80_core/n1724 ) );
  INV_X1 \i_tv80_core/U1599  ( .A(\i_tv80_core/n1667 ), .ZN(
        \i_tv80_core/n1698 ) );
  OAI21_X1 \i_tv80_core/U1598  ( .B1(\i_tv80_core/n149 ), .B2(
        \i_tv80_core/n374 ), .A(\i_tv80_core/n1666 ), .ZN(\i_tv80_core/n1667 )
         );
  INV_X1 \i_tv80_core/U1597  ( .A(\i_tv80_core/n30 ), .ZN(\i_tv80_core/n1939 )
         );
  NAND2_X1 \i_tv80_core/U1596  ( .A1(\i_tv80_core/n1796 ), .A2(
        \i_tv80_core/n1674 ), .ZN(\i_tv80_core/n1682 ) );
  INV_X1 \i_tv80_core/U1595  ( .A(\i_tv80_core/n1665 ), .ZN(
        \i_tv80_core/n1674 ) );
  MUX2_X1 \i_tv80_core/U1594  ( .A(\i_tv80_core/n1664 ), .B(
        \i_tv80_core/RegBusA [9]), .S(\i_tv80_core/n370 ), .Z(
        \i_tv80_core/n1057 ) );
  NOR3_X1 \i_tv80_core/U1593  ( .A1(\i_tv80_core/n1734 ), .A2(
        \i_tv80_core/n151 ), .A3(\i_tv80_core/n1656 ), .ZN(\i_tv80_core/n1657 ) );
  INV_X1 \i_tv80_core/U1592  ( .A(\i_tv80_core/n1655 ), .ZN(
        \i_tv80_core/n1658 ) );
  INV_X1 \i_tv80_core/U1591  ( .A(\i_tv80_core/n1736 ), .ZN(
        \i_tv80_core/n1659 ) );
  NAND4_X1 \i_tv80_core/U1590  ( .A1(\i_tv80_core/n1796 ), .A2(
        \i_tv80_core/n1656 ), .A3(\i_tv80_core/n1655 ), .A4(
        \i_tv80_core/n1736 ), .ZN(\i_tv80_core/n1661 ) );
  NAND2_X1 \i_tv80_core/U1589  ( .A1(\i_tv80_core/n1760 ), .A2(
        \i_tv80_core/n94 ), .ZN(\i_tv80_core/n1736 ) );
  NAND2_X1 \i_tv80_core/U1588  ( .A1(\i_tv80_core/n1673 ), .A2(
        \i_tv80_core/n373 ), .ZN(\i_tv80_core/n1655 ) );
  NAND3_X1 \i_tv80_core/U1587  ( .A1(\i_tv80_core/n352 ), .A2(
        \i_tv80_core/n30 ), .A3(\i_tv80_core/n358 ), .ZN(\i_tv80_core/n1673 )
         );
  NAND3_X1 \i_tv80_core/U1586  ( .A1(\i_tv80_core/n151 ), .A2(
        \i_tv80_core/n1656 ), .A3(\i_tv80_core/n1796 ), .ZN(
        \i_tv80_core/n1662 ) );
  NAND2_X1 \i_tv80_core/U1585  ( .A1(\i_tv80_core/n347 ), .A2(
        \i_tv80_core/n346 ), .ZN(\i_tv80_core/n1775 ) );
  INV_X1 \i_tv80_core/U1584  ( .A(\i_tv80_core/n1652 ), .ZN(
        \i_tv80_core/n1653 ) );
  MUX2_X1 \i_tv80_core/U1583  ( .A(\i_tv80_core/n1654 ), .B(
        \i_tv80_core/RegBusA [8]), .S(\i_tv80_core/n370 ), .Z(
        \i_tv80_core/n1056 ) );
  AOI22_X1 \i_tv80_core/U1582  ( .A1(\i_tv80_core/n1648 ), .A2(
        \i_tv80_core/n1647 ), .B1(\i_tv80_core/n1646 ), .B2(\i_tv80_core/n359 ), .ZN(\i_tv80_core/n1649 ) );
  INV_X1 \i_tv80_core/U1581  ( .A(\i_tv80_core/n1643 ), .ZN(
        \i_tv80_core/n1645 ) );
  NAND2_X1 \i_tv80_core/U1580  ( .A1(\i_tv80_core/n1643 ), .A2(
        \i_tv80_core/n1642 ), .ZN(\i_tv80_core/n1647 ) );
  NAND2_X1 \i_tv80_core/U1579  ( .A1(\i_tv80_core/n1640 ), .A2(
        \i_tv80_core/n1641 ), .ZN(\i_tv80_core/n1642 ) );
  INV_X1 \i_tv80_core/U1578  ( .A(\i_tv80_core/n1639 ), .ZN(
        \i_tv80_core/n1641 ) );
  INV_X1 \i_tv80_core/U1577  ( .A(\i_tv80_core/n358 ), .ZN(\i_tv80_core/n1929 ) );
  INV_X1 \i_tv80_core/U1576  ( .A(\i_tv80_core/n1651 ), .ZN(
        \i_tv80_core/n1648 ) );
  AOI221_X1 \i_tv80_core/U1575  ( .B1(\i_tv80_core/RegBusB [7]), .B2(
        \i_tv80_core/n1841 ), .C1(\i_tv80_core/n1801 ), .C2(
        \i_tv80_core/n1638 ), .A(\i_tv80_core/n1637 ), .ZN(\i_tv80_core/n1650 ) );
  NAND2_X1 \i_tv80_core/U1574  ( .A1(\i_tv80_core/n1636 ), .A2(
        \i_tv80_core/n1798 ), .ZN(\i_tv80_core/n1637 ) );
  NAND3_X1 \i_tv80_core/U1573  ( .A1(\i_tv80_core/n227 ), .A2(
        \i_tv80_core/n1635 ), .A3(\i_tv80_core/n1634 ), .ZN(
        \i_tv80_core/n1798 ) );
  NAND3_X1 \i_tv80_core/U1572  ( .A1(\i_tv80_core/n1633 ), .A2(
        \i_tv80_core/n1632 ), .A3(\i_tv80_core/n1631 ), .ZN(
        \i_tv80_core/n1634 ) );
  NAND3_X1 \i_tv80_core/U1571  ( .A1(\i_tv80_core/n1633 ), .A2(
        \i_tv80_core/n1630 ), .A3(\i_tv80_core/n1632 ), .ZN(
        \i_tv80_core/n1635 ) );
  NAND3_X1 \i_tv80_core/U1570  ( .A1(\i_tv80_core/n1629 ), .A2(
        \i_tv80_core/n31 ), .A3(\i_tv80_core/n1796 ), .ZN(\i_tv80_core/n1636 )
         );
  INV_X1 \i_tv80_core/U1569  ( .A(\i_tv80_core/n1668 ), .ZN(
        \i_tv80_core/n1629 ) );
  NAND3_X1 \i_tv80_core/U1568  ( .A1(\i_tv80_core/n1644 ), .A2(
        \i_tv80_core/n168 ), .A3(\i_tv80_core/n1796 ), .ZN(\i_tv80_core/n1651 ) );
  NAND2_X1 \i_tv80_core/U1567  ( .A1(\i_tv80_core/n176 ), .A2(
        \i_tv80_core/n347 ), .ZN(\i_tv80_core/n1668 ) );
  MUX2_X1 \i_tv80_core/U1566  ( .A(\i_tv80_core/n1638 ), .B(\i_tv80_core/n31 ), 
        .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1055 ) );
  NAND2_X1 \i_tv80_core/U1565  ( .A1(\i_tv80_core/n35 ), .A2(
        \i_tv80_core/n190 ), .ZN(\i_tv80_core/n1622 ) );
  OAI211_X1 \i_tv80_core/U1564  ( .C1(\i_tv80_core/n352 ), .C2(
        \i_tv80_core/n347 ), .A(\i_tv80_core/n1783 ), .B(\i_tv80_core/n1617 ), 
        .ZN(\i_tv80_core/n1618 ) );
  OAI221_X1 \i_tv80_core/U1563  ( .B1(\i_tv80_core/n1857 ), .B2(
        \i_tv80_core/n1614 ), .C1(\i_tv80_core/n1020 ), .C2(
        \i_tv80_core/n1839 ), .A(\i_tv80_core/n1767 ), .ZN(\i_tv80_core/n1620 ) );
  NAND2_X1 \i_tv80_core/U1562  ( .A1(\i_tv80_core/n227 ), .A2(
        \i_tv80_core/n1613 ), .ZN(\i_tv80_core/n1767 ) );
  INV_X1 \i_tv80_core/U1561  ( .A(\i_tv80_core/RegBusB [6]), .ZN(
        \i_tv80_core/n1614 ) );
  NAND2_X1 \i_tv80_core/U1560  ( .A1(\i_tv80_core/n1666 ), .A2(
        \i_tv80_core/n1784 ), .ZN(\i_tv80_core/n1639 ) );
  NAND2_X1 \i_tv80_core/U1559  ( .A1(\i_tv80_core/n115 ), .A2(
        \i_tv80_core/n347 ), .ZN(\i_tv80_core/n1666 ) );
  MUX2_X1 \i_tv80_core/U1558  ( .A(\i_tv80_core/n1612 ), .B(\i_tv80_core/n170 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1054 ) );
  OAI33_X1 \i_tv80_core/U1557  ( .A1(\i_tv80_core/n159 ), .A2(
        \i_tv80_core/n1607 ), .A3(\i_tv80_core/n1606 ), .B1(
        \i_tv80_core/n1747 ), .B2(\i_tv80_core/n1609 ), .B3(
        \i_tv80_core/n1605 ), .ZN(\i_tv80_core/n1608 ) );
  NAND2_X1 \i_tv80_core/U1556  ( .A1(\i_tv80_core/n1611 ), .A2(
        \i_tv80_core/n140 ), .ZN(\i_tv80_core/n1605 ) );
  INV_X1 \i_tv80_core/U1555  ( .A(\i_tv80_core/n1760 ), .ZN(
        \i_tv80_core/n1747 ) );
  NAND3_X1 \i_tv80_core/U1554  ( .A1(\i_tv80_core/n1616 ), .A2(
        \i_tv80_core/n187 ), .A3(\i_tv80_core/n1671 ), .ZN(\i_tv80_core/n1760 ) );
  NAND2_X1 \i_tv80_core/U1553  ( .A1(\i_tv80_core/n1670 ), .A2(
        \i_tv80_core/n373 ), .ZN(\i_tv80_core/n1616 ) );
  NAND3_X1 \i_tv80_core/U1552  ( .A1(\i_tv80_core/RegBusA [0]), .A2(
        \i_tv80_core/RegBusA [2]), .A3(\i_tv80_core/RegBusA [1]), .ZN(
        \i_tv80_core/n1670 ) );
  OAI21_X1 \i_tv80_core/U1551  ( .B1(\i_tv80_core/n1915 ), .B2(
        \i_tv80_core/n1909 ), .A(\i_tv80_core/n373 ), .ZN(\i_tv80_core/n1671 )
         );
  INV_X1 \i_tv80_core/U1550  ( .A(\i_tv80_core/RegBusA [4]), .ZN(
        \i_tv80_core/n1915 ) );
  NAND4_X1 \i_tv80_core/U1549  ( .A1(\i_tv80_core/n1909 ), .A2(
        \i_tv80_core/n1892 ), .A3(\i_tv80_core/n1904 ), .A4(
        \i_tv80_core/n1898 ), .ZN(\i_tv80_core/n1672 ) );
  INV_X1 \i_tv80_core/U1548  ( .A(\i_tv80_core/RegBusA [0]), .ZN(
        \i_tv80_core/n1892 ) );
  NOR2_X1 \i_tv80_core/U1547  ( .A1(\i_tv80_core/n1606 ), .A2(
        \i_tv80_core/n140 ), .ZN(\i_tv80_core/n1610 ) );
  NAND2_X1 \i_tv80_core/U1546  ( .A1(\i_tv80_core/RegBusA [4]), .A2(
        \i_tv80_core/n347 ), .ZN(\i_tv80_core/n1784 ) );
  INV_X1 \i_tv80_core/U1545  ( .A(\i_tv80_core/n1606 ), .ZN(
        \i_tv80_core/n1611 ) );
  OAI221_X1 \i_tv80_core/U1544  ( .B1(\i_tv80_core/n1857 ), .B2(
        \i_tv80_core/n1604 ), .C1(\i_tv80_core/n1019 ), .C2(
        \i_tv80_core/n1839 ), .A(\i_tv80_core/n1743 ), .ZN(\i_tv80_core/n1606 ) );
  NAND3_X1 \i_tv80_core/U1543  ( .A1(\i_tv80_core/n227 ), .A2(
        \i_tv80_core/n1603 ), .A3(\i_tv80_core/n1602 ), .ZN(
        \i_tv80_core/n1743 ) );
  NAND3_X1 \i_tv80_core/U1542  ( .A1(\i_tv80_core/n1601 ), .A2(
        \i_tv80_core/n1600 ), .A3(\i_tv80_core/n1599 ), .ZN(
        \i_tv80_core/n1602 ) );
  NAND3_X1 \i_tv80_core/U1541  ( .A1(\i_tv80_core/n1601 ), .A2(
        \i_tv80_core/n1630 ), .A3(\i_tv80_core/n1600 ), .ZN(
        \i_tv80_core/n1603 ) );
  INV_X1 \i_tv80_core/U1540  ( .A(\i_tv80_core/RegBusB [5]), .ZN(
        \i_tv80_core/n1604 ) );
  MUX2_X1 \i_tv80_core/U1539  ( .A(\i_tv80_core/n1598 ), .B(\i_tv80_core/n352 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1053 ) );
  NAND2_X1 \i_tv80_core/U1538  ( .A1(\i_tv80_core/n1597 ), .A2(
        \i_tv80_core/n1596 ), .ZN(\i_tv80_core/RegDIL [4]) );
  AOI221_X1 \i_tv80_core/U1537  ( .B1(\i_tv80_core/n1801 ), .B2(
        \i_tv80_core/n1595 ), .C1(\i_tv80_core/RegBusB [4]), .C2(
        \i_tv80_core/n1841 ), .A(\i_tv80_core/n273 ), .ZN(\i_tv80_core/n1596 )
         );
  OAI211_X1 \i_tv80_core/U1536  ( .C1(\i_tv80_core/n1593 ), .C2(
        \i_tv80_core/n1592 ), .A(\i_tv80_core/n1591 ), .B(\i_tv80_core/n1590 ), 
        .ZN(\i_tv80_core/n1597 ) );
  AOI21_X1 \i_tv80_core/U1535  ( .B1(\i_tv80_core/n1589 ), .B2(
        \i_tv80_core/n1588 ), .A(\i_tv80_core/n1734 ), .ZN(\i_tv80_core/n1590 ) );
  INV_X1 \i_tv80_core/U1534  ( .A(\i_tv80_core/n1587 ), .ZN(
        \i_tv80_core/n1589 ) );
  NAND3_X1 \i_tv80_core/U1533  ( .A1(\i_tv80_core/n1592 ), .A2(
        \i_tv80_core/n1587 ), .A3(\i_tv80_core/n1593 ), .ZN(
        \i_tv80_core/n1591 ) );
  NAND2_X1 \i_tv80_core/U1532  ( .A1(\i_tv80_core/n347 ), .A2(
        \i_tv80_core/n200 ), .ZN(\i_tv80_core/n1587 ) );
  OAI211_X1 \i_tv80_core/U1531  ( .C1(\i_tv80_core/n1586 ), .C2(
        \i_tv80_core/n1585 ), .A(\i_tv80_core/n1584 ), .B(\i_tv80_core/n1617 ), 
        .ZN(\i_tv80_core/n1592 ) );
  NAND2_X1 \i_tv80_core/U1530  ( .A1(\i_tv80_core/n1909 ), .A2(
        \i_tv80_core/n373 ), .ZN(\i_tv80_core/n1617 ) );
  AOI21_X1 \i_tv80_core/U1529  ( .B1(\i_tv80_core/n146 ), .B2(
        \i_tv80_core/n124 ), .A(\i_tv80_core/n373 ), .ZN(\i_tv80_core/n1585 )
         );
  INV_X1 \i_tv80_core/U1528  ( .A(\i_tv80_core/RegBusA [1]), .ZN(
        \i_tv80_core/n1898 ) );
  INV_X1 \i_tv80_core/U1527  ( .A(\i_tv80_core/n1583 ), .ZN(
        \i_tv80_core/n1586 ) );
  MUX2_X1 \i_tv80_core/U1526  ( .A(\i_tv80_core/n1595 ), .B(\i_tv80_core/n112 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1052 ) );
  OAI21_X1 \i_tv80_core/U1525  ( .B1(\i_tv80_core/n256 ), .B2(
        \i_tv80_core/n1734 ), .A(\i_tv80_core/n1582 ), .ZN(
        \i_tv80_core/RegDIL [3]) );
  AOI221_X1 \i_tv80_core/U1524  ( .B1(\i_tv80_core/n1801 ), .B2(
        \i_tv80_core/n1581 ), .C1(\i_tv80_core/RegBusB [3]), .C2(
        \i_tv80_core/n1841 ), .A(\i_tv80_core/n1580 ), .ZN(\i_tv80_core/n1582 ) );
  INV_X1 \i_tv80_core/U1523  ( .A(\i_tv80_core/n1708 ), .ZN(
        \i_tv80_core/n1580 ) );
  NAND2_X1 \i_tv80_core/U1522  ( .A1(\i_tv80_core/n227 ), .A2(
        \i_tv80_core/n1579 ), .ZN(\i_tv80_core/n1708 ) );
  MUX2_X1 \i_tv80_core/U1521  ( .A(\i_tv80_core/n1581 ), .B(\i_tv80_core/n200 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1051 ) );
  OAI21_X1 \i_tv80_core/U1520  ( .B1(\i_tv80_core/n258 ), .B2(
        \i_tv80_core/n1734 ), .A(\i_tv80_core/n1578 ), .ZN(
        \i_tv80_core/RegDIL [2]) );
  AOI221_X1 \i_tv80_core/U1519  ( .B1(\i_tv80_core/n1801 ), .B2(
        \i_tv80_core/n1577 ), .C1(\i_tv80_core/RegBusB [2]), .C2(
        \i_tv80_core/n1841 ), .A(\i_tv80_core/n1576 ), .ZN(\i_tv80_core/n1578 ) );
  INV_X1 \i_tv80_core/U1518  ( .A(\i_tv80_core/n1684 ), .ZN(
        \i_tv80_core/n1576 ) );
  NAND2_X1 \i_tv80_core/U1517  ( .A1(\i_tv80_core/n227 ), .A2(
        \i_tv80_core/n1974 ), .ZN(\i_tv80_core/n1684 ) );
  MUX2_X1 \i_tv80_core/U1516  ( .A(\i_tv80_core/n1577 ), .B(\i_tv80_core/n133 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1050 ) );
  OAI211_X1 \i_tv80_core/U1515  ( .C1(\i_tv80_core/n1575 ), .C2(
        \i_tv80_core/n1734 ), .A(\i_tv80_core/n1675 ), .B(\i_tv80_core/n1574 ), 
        .ZN(\i_tv80_core/RegDIL [1]) );
  AOI22_X1 \i_tv80_core/U1514  ( .A1(\i_tv80_core/RegBusB [1]), .A2(
        \i_tv80_core/n1841 ), .B1(\i_tv80_core/n1801 ), .B2(
        \i_tv80_core/n1573 ), .ZN(\i_tv80_core/n1574 ) );
  NAND2_X1 \i_tv80_core/U1513  ( .A1(\i_tv80_core/n227 ), .A2(
        \i_tv80_core/n1572 ), .ZN(\i_tv80_core/n1675 ) );
  MUX2_X1 \i_tv80_core/U1512  ( .A(\i_tv80_core/n1573 ), .B(\i_tv80_core/n179 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1049 ) );
  OAI211_X1 \i_tv80_core/U1511  ( .C1(\i_tv80_core/n345 ), .C2(
        \i_tv80_core/n1734 ), .A(\i_tv80_core/n1652 ), .B(\i_tv80_core/n1571 ), 
        .ZN(\i_tv80_core/RegDIL [0]) );
  AOI22_X1 \i_tv80_core/U1510  ( .A1(\i_tv80_core/RegBusB [0]), .A2(
        \i_tv80_core/n1841 ), .B1(\i_tv80_core/n1801 ), .B2(
        \i_tv80_core/n1570 ), .ZN(\i_tv80_core/n1571 ) );
  NAND2_X1 \i_tv80_core/U1509  ( .A1(\i_tv80_core/n227 ), .A2(
        \i_tv80_core/n1955 ), .ZN(\i_tv80_core/n1652 ) );
  INV_X1 \i_tv80_core/U1508  ( .A(\i_tv80_core/n1569 ), .ZN(
        \i_tv80_core/n1568 ) );
  NAND2_X1 \i_tv80_core/U1507  ( .A1(\i_tv80_core/n148 ), .A2(
        \i_tv80_core/n1567 ), .ZN(\i_tv80_core/n1569 ) );
  MUX2_X1 \i_tv80_core/U1506  ( .A(\i_tv80_core/n1827 ), .B(\i_tv80_core/n365 ), .S(\i_tv80_core/n1565 ), .Z(\i_tv80_core/n1567 ) );
  MUX2_X1 \i_tv80_core/U1505  ( .A(\i_tv80_core/n1570 ), .B(\i_tv80_core/n345 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n1048 ) );
  NAND2_X1 \i_tv80_core/U1504  ( .A1(\i_tv80_core/n274 ), .A2(
        \i_tv80_core/n1564 ), .ZN(\i_tv80_core/RegWEH ) );
  NAND3_X1 \i_tv80_core/U1503  ( .A1(\i_tv80_core/n1957 ), .A2(
        \i_tv80_core/n1563 ), .A3(\i_tv80_core/n294 ), .ZN(\i_tv80_core/n1564 ) );
  NAND2_X1 \i_tv80_core/U1502  ( .A1(\i_tv80_core/n274 ), .A2(
        \i_tv80_core/n1562 ), .ZN(\i_tv80_core/RegWEL ) );
  NAND4_X1 \i_tv80_core/U1501  ( .A1(\i_tv80_core/n1957 ), .A2(
        \i_tv80_core/n1132 ), .A3(\i_tv80_core/n1563 ), .A4(
        \i_tv80_core/n1561 ), .ZN(\i_tv80_core/n1562 ) );
  OAI211_X1 \i_tv80_core/U1500  ( .C1(\i_tv80_core/n77 ), .C2(
        \i_tv80_core/n1864 ), .A(\i_tv80_core/n155 ), .B(\i_tv80_core/n1559 ), 
        .ZN(\i_tv80_core/n1560 ) );
  OAI22_X1 \i_tv80_core/U1499  ( .A1(\i_tv80_core/n1565 ), .A2(
        \i_tv80_core/n1558 ), .B1(\i_tv80_core/n2156 ), .B2(\i_tv80_core/n36 ), 
        .ZN(\i_tv80_core/n1559 ) );
  INV_X1 \i_tv80_core/U1498  ( .A(\i_tv80_core/n1856 ), .ZN(
        \i_tv80_core/n1843 ) );
  NAND2_X1 \i_tv80_core/U1497  ( .A1(\i_tv80_core/n1839 ), .A2(
        \i_tv80_core/n1857 ), .ZN(\i_tv80_core/n1856 ) );
  MUX2_X1 \i_tv80_core/U1496  ( .A(\i_tv80_core/RegBusB [8]), .B(
        \i_tv80_core/RegBusB [0]), .S(\i_tv80_core/Set_BusB_To [0]), .Z(
        \i_tv80_core/n1106 ) );
  MUX2_X1 \i_tv80_core/U1495  ( .A(\i_tv80_core/RegBusB [9]), .B(
        \i_tv80_core/RegBusB [1]), .S(\i_tv80_core/Set_BusB_To [0]), .Z(
        \i_tv80_core/n1105 ) );
  MUX2_X1 \i_tv80_core/U1494  ( .A(\i_tv80_core/RegBusB [10]), .B(
        \i_tv80_core/RegBusB [2]), .S(\i_tv80_core/Set_BusB_To [0]), .Z(
        \i_tv80_core/n1104 ) );
  MUX2_X1 \i_tv80_core/U1493  ( .A(\i_tv80_core/RegBusB [11]), .B(
        \i_tv80_core/RegBusB [3]), .S(\i_tv80_core/Set_BusB_To [0]), .Z(
        \i_tv80_core/n1103 ) );
  MUX2_X1 \i_tv80_core/U1492  ( .A(\i_tv80_core/RegBusB [12]), .B(
        \i_tv80_core/RegBusB [4]), .S(\i_tv80_core/Set_BusB_To [0]), .Z(
        \i_tv80_core/n1102 ) );
  MUX2_X1 \i_tv80_core/U1491  ( .A(\i_tv80_core/RegBusB [13]), .B(
        \i_tv80_core/RegBusB [5]), .S(\i_tv80_core/Set_BusB_To [0]), .Z(
        \i_tv80_core/n1101 ) );
  MUX2_X1 \i_tv80_core/U1490  ( .A(\i_tv80_core/RegBusB [14]), .B(
        \i_tv80_core/RegBusB [6]), .S(\i_tv80_core/Set_BusB_To [0]), .Z(
        \i_tv80_core/n1100 ) );
  MUX2_X1 \i_tv80_core/U1489  ( .A(\i_tv80_core/RegBusB [15]), .B(
        \i_tv80_core/RegBusB [7]), .S(\i_tv80_core/Set_BusB_To [0]), .Z(
        \i_tv80_core/n1099 ) );
  OAI211_X1 \i_tv80_core/U1488  ( .C1(\i_tv80_core/n1557 ), .C2(
        \i_tv80_core/n1556 ), .A(\i_tv80_core/n1555 ), .B(\i_tv80_core/n1554 ), 
        .ZN(\i_tv80_core/n1249 ) );
  AOI211_X1 \i_tv80_core/U1487  ( .C1(\i_tv80_core/n1553 ), .C2(
        \i_tv80_core/n1552 ), .A(\i_tv80_core/n1550 ), .B(\i_tv80_core/n1551 ), 
        .ZN(\i_tv80_core/n1554 ) );
  OAI22_X1 \i_tv80_core/U1486  ( .A1(\i_tv80_core/n2138 ), .A2(
        \i_tv80_core/n1549 ), .B1(\i_tv80_core/n2142 ), .B2(
        \i_tv80_core/n1548 ), .ZN(\i_tv80_core/n1550 ) );
  INV_X1 \i_tv80_core/U1485  ( .A(\i_tv80_core/RegBusC [15]), .ZN(
        \i_tv80_core/n2142 ) );
  OAI221_X1 \i_tv80_core/U1484  ( .B1(\i_tv80_core/n1111 ), .B2(
        \i_tv80_core/n5 ), .C1(\i_tv80_core/n1546 ), .C2(\i_tv80_core/n1545 ), 
        .A(\i_tv80_core/n1544 ), .ZN(\i_tv80_core/n1551 ) );
  AOI22_X1 \i_tv80_core/U1483  ( .A1(\i_tv80_core/n1543 ), .A2(di_reg[7]), 
        .B1(\i_tv80_core/n84 ), .B2(\i_tv80_core/TmpAddr [15]), .ZN(
        \i_tv80_core/n1544 ) );
  INV_X1 \i_tv80_core/U1482  ( .A(\i_tv80_core/n1557 ), .ZN(
        \i_tv80_core/n1552 ) );
  INV_X1 \i_tv80_core/U1481  ( .A(\i_tv80_core/n1541 ), .ZN(
        \i_tv80_core/n1553 ) );
  NAND3_X1 \i_tv80_core/U1480  ( .A1(\i_tv80_core/n1540 ), .A2(
        \i_tv80_core/n1541 ), .A3(\i_tv80_core/n1556 ), .ZN(
        \i_tv80_core/n1555 ) );
  NAND2_X1 \i_tv80_core/U1479  ( .A1(\i_tv80_core/n1539 ), .A2(
        \i_tv80_core/n1538 ), .ZN(\i_tv80_core/n1541 ) );
  INV_X1 \i_tv80_core/U1478  ( .A(\i_tv80_core/n1546 ), .ZN(
        \i_tv80_core/n1540 ) );
  NAND2_X1 \i_tv80_core/U1477  ( .A1(\i_tv80_core/n1537 ), .A2(
        \i_tv80_core/n10 ), .ZN(\i_tv80_core/n1546 ) );
  INV_X1 \i_tv80_core/U1476  ( .A(\i_tv80_core/n1536 ), .ZN(
        \i_tv80_core/n1537 ) );
  NAND2_X1 \i_tv80_core/U1475  ( .A1(\i_tv80_core/n1535 ), .A2(
        \i_tv80_core/n1534 ), .ZN(\i_tv80_core/n1556 ) );
  NAND3_X1 \i_tv80_core/U1474  ( .A1(\i_tv80_core/n5 ), .A2(
        \i_tv80_core/n1536 ), .A3(\i_tv80_core/n1533 ), .ZN(
        \i_tv80_core/n1557 ) );
  NOR3_X1 \i_tv80_core/U1473  ( .A1(\i_tv80_core/n1947 ), .A2(
        \i_tv80_core/n1532 ), .A3(\i_tv80_core/n1531 ), .ZN(
        \i_tv80_core/n1533 ) );
  INV_X1 \i_tv80_core/U1472  ( .A(\i_tv80_core/n1545 ), .ZN(
        \i_tv80_core/n1531 ) );
  NAND2_X1 \i_tv80_core/U1471  ( .A1(\i_tv80_core/PC [14]), .A2(
        \i_tv80_core/n1530 ), .ZN(\i_tv80_core/n1545 ) );
  INV_X1 \i_tv80_core/U1470  ( .A(\i_tv80_core/n1529 ), .ZN(
        \i_tv80_core/n1532 ) );
  XOR2_X1 \i_tv80_core/U1469  ( .A(\i_tv80_core/n1530 ), .B(
        \i_tv80_core/PC [15]), .Z(\i_tv80_core/n1536 ) );
  OAI222_X1 \i_tv80_core/U1468  ( .A1(\i_tv80_core/n2061 ), .A2(
        \i_tv80_core/n1528 ), .B1(\i_tv80_core/n1180 ), .B2(
        \i_tv80_core/n1527 ), .C1(\i_tv80_core/n1526 ), .C2(
        \i_tv80_core/n1525 ), .ZN(\i_tv80_core/n1280 ) );
  OAI21_X1 \i_tv80_core/U1467  ( .B1(\i_tv80_core/n1526 ), .B2(
        \i_tv80_core/n1524 ), .A(\i_tv80_core/n1523 ), .ZN(\i_tv80_core/n1296 ) );
  AOI221_X1 \i_tv80_core/U1466  ( .B1(\i_tv80_core/n1522 ), .B2(
        \i_tv80_core/RegBusC [15]), .C1(\i_tv80_core/n18 ), .C2(
        \i_tv80_core/SP [15]), .A(\i_tv80_core/n1520 ), .ZN(
        \i_tv80_core/n1523 ) );
  OAI21_X1 \i_tv80_core/U1465  ( .B1(\i_tv80_core/n1991 ), .B2(
        \i_tv80_core/n1519 ), .A(\i_tv80_core/n350 ), .ZN(\i_tv80_core/n1520 )
         );
  INV_X1 \i_tv80_core/U1464  ( .A(\i_tv80_core/n1518 ), .ZN(
        \i_tv80_core/n1991 ) );
  OAI33_X1 \i_tv80_core/U1463  ( .A1(\i_tv80_core/n1513 ), .A2(
        \i_tv80_core/n1512 ), .A3(\i_tv80_core/n129 ), .B1(\i_tv80_core/n1510 ), .B2(\i_tv80_core/n98 ), .B3(\i_tv80_core/n1508 ), .ZN(\i_tv80_core/n1514 )
         );
  INV_X1 \i_tv80_core/U1462  ( .A(\i_tv80_core/n1517 ), .ZN(
        \i_tv80_core/n1512 ) );
  OAI21_X1 \i_tv80_core/U1461  ( .B1(\i_tv80_core/n108 ), .B2(
        \i_tv80_core/n1508 ), .A(\i_tv80_core/n1507 ), .ZN(\i_tv80_core/n1516 ) );
  NAND3_X1 \i_tv80_core/U1460  ( .A1(\i_tv80_core/n102 ), .A2(
        \i_tv80_core/n1513 ), .A3(\i_tv80_core/n1508 ), .ZN(
        \i_tv80_core/n1507 ) );
  OAI21_X1 \i_tv80_core/U1459  ( .B1(\i_tv80_core/n1508 ), .B2(
        \i_tv80_core/n129 ), .A(\i_tv80_core/n1506 ), .ZN(\i_tv80_core/n1517 )
         );
  NAND3_X1 \i_tv80_core/U1458  ( .A1(\i_tv80_core/n1508 ), .A2(
        \i_tv80_core/n129 ), .A3(\i_tv80_core/n1510 ), .ZN(\i_tv80_core/n1506 ) );
  INV_X1 \i_tv80_core/U1457  ( .A(\i_tv80_core/n1513 ), .ZN(
        \i_tv80_core/n1510 ) );
  INV_X1 \i_tv80_core/U1456  ( .A(\i_tv80_core/n1505 ), .ZN(
        \i_tv80_core/n1508 ) );
  MUX2_X1 \i_tv80_core/U1455  ( .A(\i_tv80_core/SP [15]), .B(
        \i_tv80_core/RegBusC [15]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n1505 ) );
  NAND2_X1 \i_tv80_core/U1454  ( .A1(\i_tv80_core/n1504 ), .A2(
        \i_tv80_core/n1503 ), .ZN(\i_tv80_core/n1250 ) );
  OAI21_X1 \i_tv80_core/U1453  ( .B1(\i_tv80_core/n1181 ), .B2(
        \i_tv80_core/n1498 ), .A(\i_tv80_core/n1497 ), .ZN(\i_tv80_core/n1499 ) );
  NAND4_X1 \i_tv80_core/U1452  ( .A1(\i_tv80_core/n10 ), .A2(
        \i_tv80_core/n1534 ), .A3(\i_tv80_core/n1496 ), .A4(
        \i_tv80_core/n1535 ), .ZN(\i_tv80_core/n1497 ) );
  NOR2_X1 \i_tv80_core/U1451  ( .A1(\i_tv80_core/n9 ), .A2(\i_tv80_core/n1496 ), .ZN(\i_tv80_core/n1500 ) );
  INV_X1 \i_tv80_core/U1450  ( .A(\i_tv80_core/n1535 ), .ZN(
        \i_tv80_core/n1501 ) );
  NAND2_X1 \i_tv80_core/U1449  ( .A1(\i_tv80_core/PC [13]), .A2(
        \i_tv80_core/n1530 ), .ZN(\i_tv80_core/n1535 ) );
  AOI221_X1 \i_tv80_core/U1448  ( .B1(\i_tv80_core/n1494 ), .B2(
        \i_tv80_core/n10 ), .C1(\i_tv80_core/n6 ), .C2(\i_tv80_core/n1003 ), 
        .A(\i_tv80_core/n1493 ), .ZN(\i_tv80_core/n1504 ) );
  OAI22_X1 \i_tv80_core/U1447  ( .A1(\i_tv80_core/n1924 ), .A2(
        \i_tv80_core/n1492 ), .B1(\i_tv80_core/n2129 ), .B2(
        \i_tv80_core/n1548 ), .ZN(\i_tv80_core/n1493 ) );
  INV_X1 \i_tv80_core/U1446  ( .A(\i_tv80_core/RegBusC [14]), .ZN(
        \i_tv80_core/n2129 ) );
  NOR2_X1 \i_tv80_core/U1445  ( .A1(\i_tv80_core/n1534 ), .A2(
        \i_tv80_core/n1496 ), .ZN(\i_tv80_core/n1494 ) );
  OAI211_X1 \i_tv80_core/U1444  ( .C1(\i_tv80_core/PC [13]), .C2(
        \i_tv80_core/n1530 ), .A(\i_tv80_core/n1491 ), .B(\i_tv80_core/n1490 ), 
        .ZN(\i_tv80_core/n1534 ) );
  NAND3_X1 \i_tv80_core/U1443  ( .A1(\i_tv80_core/n1487 ), .A2(
        \i_tv80_core/n1488 ), .A3(\i_tv80_core/n1489 ), .ZN(
        \i_tv80_core/n1490 ) );
  XOR2_X1 \i_tv80_core/U1442  ( .A(\i_tv80_core/n1530 ), .B(
        \i_tv80_core/PC [14]), .Z(\i_tv80_core/n1496 ) );
  OAI222_X1 \i_tv80_core/U1441  ( .A1(\i_tv80_core/n1924 ), .A2(
        \i_tv80_core/n1528 ), .B1(\i_tv80_core/n1181 ), .B2(
        \i_tv80_core/n1527 ), .C1(\i_tv80_core/n255 ), .C2(\i_tv80_core/n1525 ), .ZN(\i_tv80_core/n1281 ) );
  OAI21_X1 \i_tv80_core/U1440  ( .B1(\i_tv80_core/n255 ), .B2(
        \i_tv80_core/n1524 ), .A(\i_tv80_core/n1486 ), .ZN(\i_tv80_core/n1297 ) );
  AOI221_X1 \i_tv80_core/U1439  ( .B1(\i_tv80_core/n1522 ), .B2(
        \i_tv80_core/RegBusC [14]), .C1(\i_tv80_core/n18 ), .C2(
        \i_tv80_core/SP [14]), .A(\i_tv80_core/n1485 ), .ZN(
        \i_tv80_core/n1486 ) );
  OAI21_X1 \i_tv80_core/U1438  ( .B1(\i_tv80_core/n1987 ), .B2(
        \i_tv80_core/n1519 ), .A(\i_tv80_core/n350 ), .ZN(\i_tv80_core/n1485 )
         );
  NAND4_X1 \i_tv80_core/U1437  ( .A1(\i_tv80_core/n1481 ), .A2(
        \i_tv80_core/n1483 ), .A3(\i_tv80_core/n72 ), .A4(\i_tv80_core/n1484 ), 
        .ZN(\i_tv80_core/n1515 ) );
  OAI211_X1 \i_tv80_core/U1436  ( .C1(\i_tv80_core/n129 ), .C2(
        \i_tv80_core/n1480 ), .A(\i_tv80_core/n1479 ), .B(\i_tv80_core/n1478 ), 
        .ZN(\i_tv80_core/n1481 ) );
  AOI211_X1 \i_tv80_core/U1435  ( .C1(\i_tv80_core/n1477 ), .C2(
        \i_tv80_core/n106 ), .A(\i_tv80_core/n1476 ), .B(\i_tv80_core/n1475 ), 
        .ZN(\i_tv80_core/n1479 ) );
  INV_X1 \i_tv80_core/U1434  ( .A(\i_tv80_core/n1474 ), .ZN(
        \i_tv80_core/n1475 ) );
  INV_X1 \i_tv80_core/U1433  ( .A(\i_tv80_core/n1473 ), .ZN(
        \i_tv80_core/n1476 ) );
  MUX2_X1 \i_tv80_core/U1432  ( .A(\i_tv80_core/SP [14]), .B(
        \i_tv80_core/RegBusC [14]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n1513 ) );
  NAND2_X1 \i_tv80_core/U1431  ( .A1(\i_tv80_core/n1472 ), .A2(
        \i_tv80_core/n1471 ), .ZN(\i_tv80_core/n1251 ) );
  OAI22_X1 \i_tv80_core/U1430  ( .A1(\i_tv80_core/n2119 ), .A2(
        \i_tv80_core/n1549 ), .B1(\i_tv80_core/n2121 ), .B2(
        \i_tv80_core/n1548 ), .ZN(\i_tv80_core/n1468 ) );
  INV_X1 \i_tv80_core/U1429  ( .A(\i_tv80_core/RegBusC [13]), .ZN(
        \i_tv80_core/n2121 ) );
  NOR2_X1 \i_tv80_core/U1428  ( .A1(\i_tv80_core/n8 ), .A2(\i_tv80_core/n1467 ), .ZN(\i_tv80_core/n1469 ) );
  INV_X1 \i_tv80_core/U1427  ( .A(\i_tv80_core/n1488 ), .ZN(
        \i_tv80_core/n1470 ) );
  AOI221_X1 \i_tv80_core/U1426  ( .B1(\i_tv80_core/n1542 ), .B2(
        \i_tv80_core/TmpAddr [13]), .C1(\i_tv80_core/n1502 ), .C2(
        \i_tv80_core/PC [13]), .A(\i_tv80_core/n1466 ), .ZN(
        \i_tv80_core/n1472 ) );
  OAI33_X1 \i_tv80_core/U1425  ( .A1(\i_tv80_core/n8 ), .A2(
        \i_tv80_core/n1467 ), .A3(\i_tv80_core/n1465 ), .B1(
        \i_tv80_core/n1464 ), .B2(\i_tv80_core/n1463 ), .B3(\i_tv80_core/n9 ), 
        .ZN(\i_tv80_core/n1466 ) );
  INV_X1 \i_tv80_core/U1424  ( .A(\i_tv80_core/n1465 ), .ZN(
        \i_tv80_core/n1463 ) );
  NAND2_X1 \i_tv80_core/U1423  ( .A1(\i_tv80_core/n1467 ), .A2(
        \i_tv80_core/n1488 ), .ZN(\i_tv80_core/n1464 ) );
  NAND2_X1 \i_tv80_core/U1422  ( .A1(\i_tv80_core/PC [12]), .A2(
        \i_tv80_core/n1530 ), .ZN(\i_tv80_core/n1488 ) );
  NAND2_X1 \i_tv80_core/U1421  ( .A1(\i_tv80_core/n1462 ), .A2(
        \i_tv80_core/n1491 ), .ZN(\i_tv80_core/n1465 ) );
  NAND2_X1 \i_tv80_core/U1420  ( .A1(\i_tv80_core/n1539 ), .A2(
        \i_tv80_core/n1461 ), .ZN(\i_tv80_core/n1491 ) );
  XOR2_X1 \i_tv80_core/U1419  ( .A(\i_tv80_core/n1530 ), .B(
        \i_tv80_core/PC [13]), .Z(\i_tv80_core/n1467 ) );
  OAI33_X1 \i_tv80_core/U1418  ( .A1(\i_tv80_core/n1455 ), .A2(
        \i_tv80_core/n1454 ), .A3(\i_tv80_core/n1525 ), .B1(\i_tv80_core/n71 ), 
        .B2(\i_tv80_core/n1457 ), .B3(\i_tv80_core/n1453 ), .ZN(
        \i_tv80_core/n1456 ) );
  NAND2_X1 \i_tv80_core/U1417  ( .A1(\i_tv80_core/n1452 ), .A2(
        \i_tv80_core/n1473 ), .ZN(\i_tv80_core/n1453 ) );
  INV_X1 \i_tv80_core/U1416  ( .A(\i_tv80_core/n1525 ), .ZN(
        \i_tv80_core/n1452 ) );
  NOR2_X1 \i_tv80_core/U1415  ( .A1(\i_tv80_core/n1525 ), .A2(
        \i_tv80_core/n1473 ), .ZN(\i_tv80_core/n1458 ) );
  INV_X1 \i_tv80_core/U1414  ( .A(\i_tv80_core/n1527 ), .ZN(
        \i_tv80_core/n1459 ) );
  OAI221_X1 \i_tv80_core/U1413  ( .B1(\i_tv80_core/n1984 ), .B2(
        \i_tv80_core/n1519 ), .C1(\i_tv80_core/n1451 ), .C2(
        \i_tv80_core/n1524 ), .A(\i_tv80_core/n1450 ), .ZN(\i_tv80_core/n1298 ) );
  AOI221_X1 \i_tv80_core/U1412  ( .B1(\i_tv80_core/n1522 ), .B2(
        \i_tv80_core/RegBusC [13]), .C1(\i_tv80_core/n18 ), .C2(
        \i_tv80_core/SP [13]), .A(\i_tv80_core/n380 ), .ZN(\i_tv80_core/n1450 ) );
  INV_X1 \i_tv80_core/U1411  ( .A(\i_tv80_core/n1454 ), .ZN(
        \i_tv80_core/n1457 ) );
  XOR2_X1 \i_tv80_core/U1410  ( .A(\i_tv80_core/n1474 ), .B(\i_tv80_core/n174 ), .Z(\i_tv80_core/n1454 ) );
  MUX2_X1 \i_tv80_core/U1409  ( .A(\i_tv80_core/SP [13]), .B(
        \i_tv80_core/RegBusC [13]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n1474 ) );
  NAND2_X1 \i_tv80_core/U1408  ( .A1(\i_tv80_core/n1449 ), .A2(
        \i_tv80_core/n98 ), .ZN(\i_tv80_core/n1473 ) );
  NAND3_X1 \i_tv80_core/U1407  ( .A1(\i_tv80_core/n1448 ), .A2(
        \i_tv80_core/n1483 ), .A3(\i_tv80_core/n1484 ), .ZN(
        \i_tv80_core/n1455 ) );
  AOI21_X1 \i_tv80_core/U1406  ( .B1(\i_tv80_core/n1447 ), .B2(
        \i_tv80_core/n1446 ), .A(\i_tv80_core/n355 ), .ZN(\i_tv80_core/n1448 )
         );
  INV_X1 \i_tv80_core/U1405  ( .A(\i_tv80_core/n1445 ), .ZN(
        \i_tv80_core/n1447 ) );
  NAND2_X1 \i_tv80_core/U1404  ( .A1(\i_tv80_core/n1480 ), .A2(
        \i_tv80_core/n129 ), .ZN(\i_tv80_core/n1483 ) );
  INV_X1 \i_tv80_core/U1403  ( .A(\i_tv80_core/n1444 ), .ZN(
        \i_tv80_core/n1484 ) );
  OAI22_X1 \i_tv80_core/U1402  ( .A1(\i_tv80_core/n174 ), .A2(
        \i_tv80_core/n1477 ), .B1(\i_tv80_core/n99 ), .B2(\i_tv80_core/n1449 ), 
        .ZN(\i_tv80_core/n1444 ) );
  INV_X1 \i_tv80_core/U1401  ( .A(\i_tv80_core/n1443 ), .ZN(
        \i_tv80_core/n1449 ) );
  OAI211_X1 \i_tv80_core/U1400  ( .C1(\i_tv80_core/n2113 ), .C2(
        \i_tv80_core/n73 ), .A(\i_tv80_core/n1442 ), .B(\i_tv80_core/n1441 ), 
        .ZN(\i_tv80_core/n1252 ) );
  AOI222_X1 \i_tv80_core/U1399  ( .A1(\i_tv80_core/n1502 ), .A2(
        \i_tv80_core/PC [12]), .B1(\i_tv80_core/n1440 ), .B2(\i_tv80_core/n10 ), .C1(\i_tv80_core/n66 ), .C2(\i_tv80_core/n1001 ), .ZN(\i_tv80_core/n1441 )
         );
  XOR2_X1 \i_tv80_core/U1398  ( .A(\i_tv80_core/PC [12]), .B(
        \i_tv80_core/n1539 ), .Z(\i_tv80_core/n1439 ) );
  NAND2_X1 \i_tv80_core/U1397  ( .A1(\i_tv80_core/n1487 ), .A2(
        \i_tv80_core/n1489 ), .ZN(\i_tv80_core/n1462 ) );
  OAI21_X1 \i_tv80_core/U1396  ( .B1(\i_tv80_core/PC [11]), .B2(
        \i_tv80_core/n1530 ), .A(\i_tv80_core/n1438 ), .ZN(\i_tv80_core/n1487 ) );
  NAND2_X1 \i_tv80_core/U1395  ( .A1(\i_tv80_core/PC [11]), .A2(
        \i_tv80_core/n1530 ), .ZN(\i_tv80_core/n1489 ) );
  AOI22_X1 \i_tv80_core/U1394  ( .A1(\i_tv80_core/n1542 ), .A2(
        \i_tv80_core/TmpAddr [12]), .B1(\i_tv80_core/n24 ), .B2(di_reg[4]), 
        .ZN(\i_tv80_core/n1442 ) );
  INV_X1 \i_tv80_core/U1393  ( .A(\i_tv80_core/RegBusC [12]), .ZN(
        \i_tv80_core/n2113 ) );
  OAI211_X1 \i_tv80_core/U1392  ( .C1(\i_tv80_core/n2105 ), .C2(
        \i_tv80_core/n73 ), .A(\i_tv80_core/n1437 ), .B(\i_tv80_core/n1436 ), 
        .ZN(\i_tv80_core/n1253 ) );
  AOI222_X1 \i_tv80_core/U1391  ( .A1(\i_tv80_core/n1502 ), .A2(
        \i_tv80_core/PC [11]), .B1(\i_tv80_core/n10 ), .B2(\i_tv80_core/n1435 ), .C1(\i_tv80_core/n66 ), .C2(\i_tv80_core/n1000 ), .ZN(\i_tv80_core/n1436 )
         );
  XOR2_X1 \i_tv80_core/U1390  ( .A(\i_tv80_core/n1434 ), .B(
        \i_tv80_core/n1433 ), .Z(\i_tv80_core/n1435 ) );
  XOR2_X1 \i_tv80_core/U1389  ( .A(\i_tv80_core/PC [11]), .B(
        \i_tv80_core/n1539 ), .Z(\i_tv80_core/n1433 ) );
  INV_X1 \i_tv80_core/U1388  ( .A(\i_tv80_core/n70 ), .ZN(\i_tv80_core/n1434 )
         );
  OAI21_X1 \i_tv80_core/U1387  ( .B1(\i_tv80_core/n1432 ), .B2(
        \i_tv80_core/n1431 ), .A(\i_tv80_core/n1430 ), .ZN(\i_tv80_core/n1438 ) );
  AOI211_X1 \i_tv80_core/U1386  ( .C1(\i_tv80_core/PC [10]), .C2(
        \i_tv80_core/n1530 ), .A(\i_tv80_core/n1429 ), .B(\i_tv80_core/n285 ), 
        .ZN(\i_tv80_core/n1430 ) );
  INV_X1 \i_tv80_core/U1385  ( .A(\i_tv80_core/n1428 ), .ZN(
        \i_tv80_core/n1429 ) );
  OAI211_X1 \i_tv80_core/U1384  ( .C1(\i_tv80_core/PC [10]), .C2(
        \i_tv80_core/n1530 ), .A(\i_tv80_core/n1427 ), .B(\i_tv80_core/n1426 ), 
        .ZN(\i_tv80_core/n1431 ) );
  AOI22_X1 \i_tv80_core/U1383  ( .A1(\i_tv80_core/n1542 ), .A2(
        \i_tv80_core/TmpAddr [11]), .B1(\i_tv80_core/n24 ), .B2(di_reg[3]), 
        .ZN(\i_tv80_core/n1437 ) );
  OAI222_X1 \i_tv80_core/U1382  ( .A1(\i_tv80_core/n1184 ), .A2(
        \i_tv80_core/n1527 ), .B1(\i_tv80_core/n1425 ), .B2(
        \i_tv80_core/n1525 ), .C1(\i_tv80_core/n2032 ), .C2(
        \i_tv80_core/n1528 ), .ZN(\i_tv80_core/n1284 ) );
  INV_X1 \i_tv80_core/U1381  ( .A(\i_tv80_core/n1424 ), .ZN(
        \i_tv80_core/n1425 ) );
  OAI211_X1 \i_tv80_core/U1380  ( .C1(\i_tv80_core/n2097 ), .C2(
        \i_tv80_core/n73 ), .A(\i_tv80_core/n1423 ), .B(\i_tv80_core/n1422 ), 
        .ZN(\i_tv80_core/n1254 ) );
  AOI222_X1 \i_tv80_core/U1379  ( .A1(\i_tv80_core/n1502 ), .A2(
        \i_tv80_core/PC [10]), .B1(\i_tv80_core/n10 ), .B2(\i_tv80_core/n1421 ), .C1(\i_tv80_core/n66 ), .C2(\i_tv80_core/n999 ), .ZN(\i_tv80_core/n1422 ) );
  XOR2_X1 \i_tv80_core/U1378  ( .A(\i_tv80_core/n1419 ), .B(
        \i_tv80_core/n1420 ), .Z(\i_tv80_core/n1421 ) );
  AOI21_X1 \i_tv80_core/U1377  ( .B1(\i_tv80_core/n1418 ), .B2(
        \i_tv80_core/n1427 ), .A(\i_tv80_core/n285 ), .ZN(\i_tv80_core/n1419 )
         );
  NAND2_X1 \i_tv80_core/U1376  ( .A1(\i_tv80_core/n1539 ), .A2(
        \i_tv80_core/n1417 ), .ZN(\i_tv80_core/n1427 ) );
  XOR2_X1 \i_tv80_core/U1375  ( .A(\i_tv80_core/PC [10]), .B(
        \i_tv80_core/n1539 ), .Z(\i_tv80_core/n1420 ) );
  AOI22_X1 \i_tv80_core/U1374  ( .A1(\i_tv80_core/n1542 ), .A2(
        \i_tv80_core/TmpAddr [10]), .B1(\i_tv80_core/n24 ), .B2(di_reg[2]), 
        .ZN(\i_tv80_core/n1423 ) );
  OAI211_X1 \i_tv80_core/U1373  ( .C1(\i_tv80_core/n2089 ), .C2(
        \i_tv80_core/n73 ), .A(\i_tv80_core/n1416 ), .B(\i_tv80_core/n1415 ), 
        .ZN(\i_tv80_core/n1255 ) );
  AOI222_X1 \i_tv80_core/U1372  ( .A1(\i_tv80_core/n1502 ), .A2(
        \i_tv80_core/PC [9]), .B1(\i_tv80_core/n10 ), .B2(\i_tv80_core/n1414 ), 
        .C1(\i_tv80_core/n66 ), .C2(\i_tv80_core/n998 ), .ZN(
        \i_tv80_core/n1415 ) );
  XOR2_X1 \i_tv80_core/U1371  ( .A(\i_tv80_core/n1413 ), .B(
        \i_tv80_core/n1412 ), .Z(\i_tv80_core/n1414 ) );
  XOR2_X1 \i_tv80_core/U1370  ( .A(\i_tv80_core/PC [9]), .B(
        \i_tv80_core/n1539 ), .Z(\i_tv80_core/n1412 ) );
  INV_X1 \i_tv80_core/U1369  ( .A(\i_tv80_core/n1418 ), .ZN(
        \i_tv80_core/n1413 ) );
  OAI21_X1 \i_tv80_core/U1368  ( .B1(\i_tv80_core/n1432 ), .B2(
        \i_tv80_core/n1411 ), .A(\i_tv80_core/n1428 ), .ZN(\i_tv80_core/n1418 ) );
  NAND2_X1 \i_tv80_core/U1367  ( .A1(\i_tv80_core/PC [8]), .A2(
        \i_tv80_core/n1530 ), .ZN(\i_tv80_core/n1428 ) );
  INV_X1 \i_tv80_core/U1366  ( .A(\i_tv80_core/n1426 ), .ZN(
        \i_tv80_core/n1411 ) );
  NAND2_X1 \i_tv80_core/U1365  ( .A1(\i_tv80_core/n1539 ), .A2(
        \i_tv80_core/n1410 ), .ZN(\i_tv80_core/n1426 ) );
  AOI22_X1 \i_tv80_core/U1364  ( .A1(\i_tv80_core/n1542 ), .A2(
        \i_tv80_core/TmpAddr [9]), .B1(\i_tv80_core/n24 ), .B2(di_reg[1]), 
        .ZN(\i_tv80_core/n1416 ) );
  OAI222_X1 \i_tv80_core/U1363  ( .A1(\i_tv80_core/n1186 ), .A2(
        \i_tv80_core/n1527 ), .B1(\i_tv80_core/n1409 ), .B2(
        \i_tv80_core/n1525 ), .C1(\i_tv80_core/n1894 ), .C2(
        \i_tv80_core/n1528 ), .ZN(\i_tv80_core/n1286 ) );
  INV_X1 \i_tv80_core/U1362  ( .A(\i_tv80_core/n1408 ), .ZN(
        \i_tv80_core/n1409 ) );
  OAI211_X1 \i_tv80_core/U1361  ( .C1(\i_tv80_core/n2081 ), .C2(
        \i_tv80_core/n73 ), .A(\i_tv80_core/n1407 ), .B(\i_tv80_core/n1406 ), 
        .ZN(\i_tv80_core/n1256 ) );
  AOI222_X1 \i_tv80_core/U1360  ( .A1(\i_tv80_core/n1502 ), .A2(
        \i_tv80_core/PC [8]), .B1(\i_tv80_core/n10 ), .B2(\i_tv80_core/n1405 ), 
        .C1(\i_tv80_core/n66 ), .C2(\i_tv80_core/n997 ), .ZN(
        \i_tv80_core/n1406 ) );
  INV_X1 \i_tv80_core/U1359  ( .A(\i_tv80_core/n1404 ), .ZN(
        \i_tv80_core/n2069 ) );
  XOR2_X1 \i_tv80_core/U1358  ( .A(\i_tv80_core/n1432 ), .B(
        \i_tv80_core/n1403 ), .Z(\i_tv80_core/n1405 ) );
  XOR2_X1 \i_tv80_core/U1357  ( .A(\i_tv80_core/PC [8]), .B(
        \i_tv80_core/n1539 ), .Z(\i_tv80_core/n1403 ) );
  INV_X1 \i_tv80_core/U1356  ( .A(\i_tv80_core/n1402 ), .ZN(
        \i_tv80_core/n1432 ) );
  OAI22_X1 \i_tv80_core/U1355  ( .A1(\i_tv80_core/n1539 ), .A2(
        \i_tv80_core/n1401 ), .B1(\i_tv80_core/n1399 ), .B2(
        \i_tv80_core/n1400 ), .ZN(\i_tv80_core/n1402 ) );
  OAI21_X1 \i_tv80_core/U1354  ( .B1(\i_tv80_core/n281 ), .B2(
        \i_tv80_core/n260 ), .A(\i_tv80_core/n1395 ), .ZN(\i_tv80_core/n1396 )
         );
  INV_X1 \i_tv80_core/U1353  ( .A(\i_tv80_core/n1397 ), .ZN(
        \i_tv80_core/n1395 ) );
  OAI211_X1 \i_tv80_core/U1352  ( .C1(\i_tv80_core/n281 ), .C2(
        \i_tv80_core/n1394 ), .A(\i_tv80_core/n1393 ), .B(\i_tv80_core/n1392 ), 
        .ZN(\i_tv80_core/n1397 ) );
  INV_X1 \i_tv80_core/U1351  ( .A(\i_tv80_core/n1391 ), .ZN(
        \i_tv80_core/n1398 ) );
  INV_X1 \i_tv80_core/U1350  ( .A(\i_tv80_core/n1390 ), .ZN(
        \i_tv80_core/n1400 ) );
  AOI22_X1 \i_tv80_core/U1349  ( .A1(\i_tv80_core/n1542 ), .A2(
        \i_tv80_core/TmpAddr [8]), .B1(\i_tv80_core/n1543 ), .B2(di_reg[0]), 
        .ZN(\i_tv80_core/n1407 ) );
  INV_X1 \i_tv80_core/U1348  ( .A(\i_tv80_core/n1492 ), .ZN(
        \i_tv80_core/n1543 ) );
  NAND2_X1 \i_tv80_core/U1347  ( .A1(\i_tv80_core/n22 ), .A2(\i_tv80_core/n69 ), .ZN(\i_tv80_core/n1492 ) );
  INV_X1 \i_tv80_core/U1346  ( .A(\i_tv80_core/n1498 ), .ZN(
        \i_tv80_core/n1542 ) );
  NAND2_X1 \i_tv80_core/U1345  ( .A1(\i_tv80_core/n22 ), .A2(
        \i_tv80_core/n1389 ), .ZN(\i_tv80_core/n1498 ) );
  INV_X1 \i_tv80_core/U1344  ( .A(\i_tv80_core/n2075 ), .ZN(
        \i_tv80_core/n1389 ) );
  OAI222_X1 \i_tv80_core/U1343  ( .A1(\i_tv80_core/n1187 ), .A2(
        \i_tv80_core/n1527 ), .B1(\i_tv80_core/n7 ), .B2(\i_tv80_core/n1525 ), 
        .C1(\i_tv80_core/n2014 ), .C2(\i_tv80_core/n1528 ), .ZN(
        \i_tv80_core/n1287 ) );
  OAI221_X1 \i_tv80_core/U1342  ( .B1(\i_tv80_core/n1188 ), .B2(
        \i_tv80_core/n1388 ), .C1(\i_tv80_core/n73 ), .C2(\i_tv80_core/n2065 ), 
        .A(\i_tv80_core/n1230 ), .ZN(\i_tv80_core/n1257 ) );
  AOI22_X1 \i_tv80_core/U1341  ( .A1(\i_tv80_core/n10 ), .A2(
        \i_tv80_core/n1229 ), .B1(\i_tv80_core/n1502 ), .B2(
        \i_tv80_core/PC [7]), .ZN(\i_tv80_core/n1230 ) );
  XOR2_X1 \i_tv80_core/U1340  ( .A(\i_tv80_core/n1221 ), .B(
        \i_tv80_core/n1219 ), .Z(\i_tv80_core/n1229 ) );
  AOI21_X1 \i_tv80_core/U1339  ( .B1(\i_tv80_core/n1214 ), .B2(
        \i_tv80_core/n1390 ), .A(\i_tv80_core/n1182 ), .ZN(\i_tv80_core/n1219 ) );
  INV_X1 \i_tv80_core/U1338  ( .A(\i_tv80_core/n1393 ), .ZN(
        \i_tv80_core/n1182 ) );
  NAND2_X1 \i_tv80_core/U1337  ( .A1(\i_tv80_core/PC [6]), .A2(
        \i_tv80_core/n1166 ), .ZN(\i_tv80_core/n1393 ) );
  XOR2_X1 \i_tv80_core/U1336  ( .A(\i_tv80_core/PC [7]), .B(
        \i_tv80_core/n1539 ), .Z(\i_tv80_core/n1221 ) );
  INV_X1 \i_tv80_core/U1335  ( .A(\i_tv80_core/n1530 ), .ZN(
        \i_tv80_core/n1539 ) );
  OAI222_X1 \i_tv80_core/U1334  ( .A1(\i_tv80_core/n1141 ), .A2(
        \i_tv80_core/n9 ), .B1(\i_tv80_core/n2048 ), .B2(\i_tv80_core/n1140 ), 
        .C1(\i_tv80_core/n1120 ), .C2(\i_tv80_core/n5 ), .ZN(
        \i_tv80_core/n1258 ) );
  INV_X1 \i_tv80_core/U1333  ( .A(\i_tv80_core/n1139 ), .ZN(
        \i_tv80_core/n2048 ) );
  OAI221_X1 \i_tv80_core/U1332  ( .B1(\i_tv80_core/n1189 ), .B2(
        \i_tv80_core/n2003 ), .C1(\i_tv80_core/n1138 ), .C2(
        \i_tv80_core/n1131 ), .A(\i_tv80_core/n65 ), .ZN(\i_tv80_core/n1139 )
         );
  OAI21_X1 \i_tv80_core/U1331  ( .B1(\i_tv80_core/n281 ), .B2(
        \i_tv80_core/n1125 ), .A(\i_tv80_core/n1392 ), .ZN(\i_tv80_core/n1214 ) );
  NAND2_X1 \i_tv80_core/U1330  ( .A1(\i_tv80_core/PC [5]), .A2(
        \i_tv80_core/n1123 ), .ZN(\i_tv80_core/n1392 ) );
  OAI21_X1 \i_tv80_core/U1329  ( .B1(\i_tv80_core/n1924 ), .B2(
        \i_tv80_core/n20 ), .A(\i_tv80_core/n1161 ), .ZN(\i_tv80_core/n1166 )
         );
  OAI222_X1 \i_tv80_core/U1328  ( .A1(\i_tv80_core/n1924 ), .A2(
        \i_tv80_core/n1122 ), .B1(\i_tv80_core/n1119 ), .B2(
        \i_tv80_core/n1118 ), .C1(\i_tv80_core/n1189 ), .C2(
        \i_tv80_core/n1117 ), .ZN(\i_tv80_core/n1289 ) );
  OAI222_X1 \i_tv80_core/U1327  ( .A1(\i_tv80_core/n1116 ), .A2(
        \i_tv80_core/n8 ), .B1(\i_tv80_core/n2041 ), .B2(\i_tv80_core/n1140 ), 
        .C1(\i_tv80_core/n1121 ), .C2(\i_tv80_core/n5 ), .ZN(
        \i_tv80_core/n1259 ) );
  INV_X1 \i_tv80_core/U1326  ( .A(\i_tv80_core/n1115 ), .ZN(
        \i_tv80_core/n2041 ) );
  OAI221_X1 \i_tv80_core/U1325  ( .B1(\i_tv80_core/n1190 ), .B2(
        \i_tv80_core/n2003 ), .C1(\i_tv80_core/n1114 ), .C2(
        \i_tv80_core/n1131 ), .A(\i_tv80_core/n65 ), .ZN(\i_tv80_core/n1115 )
         );
  XOR2_X1 \i_tv80_core/U1324  ( .A(\i_tv80_core/n1113 ), .B(
        \i_tv80_core/n1125 ), .Z(\i_tv80_core/n1116 ) );
  INV_X1 \i_tv80_core/U1323  ( .A(\i_tv80_core/n1112 ), .ZN(
        \i_tv80_core/n1125 ) );
  OAI21_X1 \i_tv80_core/U1322  ( .B1(\i_tv80_core/n260 ), .B2(
        \i_tv80_core/n1391 ), .A(\i_tv80_core/n1394 ), .ZN(\i_tv80_core/n1112 ) );
  NAND2_X1 \i_tv80_core/U1321  ( .A1(\i_tv80_core/PC [4]), .A2(
        \i_tv80_core/n1095 ), .ZN(\i_tv80_core/n1394 ) );
  OAI21_X1 \i_tv80_core/U1320  ( .B1(\i_tv80_core/PC [4]), .B2(
        \i_tv80_core/n1095 ), .A(\i_tv80_core/n1092 ), .ZN(\i_tv80_core/n1391 ) );
  XOR2_X1 \i_tv80_core/U1319  ( .A(\i_tv80_core/n1123 ), .B(
        \i_tv80_core/PC [5]), .Z(\i_tv80_core/n1113 ) );
  OAI21_X1 \i_tv80_core/U1318  ( .B1(\i_tv80_core/n1917 ), .B2(
        \i_tv80_core/n20 ), .A(\i_tv80_core/n1161 ), .ZN(\i_tv80_core/n1123 )
         );
  OAI221_X1 \i_tv80_core/U1317  ( .B1(\i_tv80_core/n1069 ), .B2(
        \i_tv80_core/n1118 ), .C1(\i_tv80_core/n1917 ), .C2(
        \i_tv80_core/n1122 ), .A(\i_tv80_core/n1068 ), .ZN(\i_tv80_core/n1290 ) );
  AOI22_X1 \i_tv80_core/U1316  ( .A1(\i_tv80_core/n1067 ), .A2(
        \i_tv80_core/n1066 ), .B1(\i_tv80_core/n1065 ), .B2(
        \i_tv80_core/TmpAddr [5]), .ZN(\i_tv80_core/n1068 ) );
  INV_X1 \i_tv80_core/U1315  ( .A(di_reg[5]), .ZN(\i_tv80_core/n1917 ) );
  INV_X1 \i_tv80_core/U1314  ( .A(\i_tv80_core/n1064 ), .ZN(
        \i_tv80_core/n1069 ) );
  OAI221_X1 \i_tv80_core/U1313  ( .B1(\i_tv80_core/n1191 ), .B2(
        \i_tv80_core/n1388 ), .C1(\i_tv80_core/n2040 ), .C2(
        \i_tv80_core/n1548 ), .A(\i_tv80_core/n1047 ), .ZN(\i_tv80_core/n1260 ) );
  AOI22_X1 \i_tv80_core/U1312  ( .A1(\i_tv80_core/n10 ), .A2(
        \i_tv80_core/n1039 ), .B1(\i_tv80_core/n1502 ), .B2(
        \i_tv80_core/PC [4]), .ZN(\i_tv80_core/n1047 ) );
  XOR2_X1 \i_tv80_core/U1311  ( .A(\i_tv80_core/n1038 ), .B(
        \i_tv80_core/n1036 ), .Z(\i_tv80_core/n1039 ) );
  AOI21_X1 \i_tv80_core/U1310  ( .B1(\i_tv80_core/n1034 ), .B2(
        \i_tv80_core/n1092 ), .A(\i_tv80_core/n1029 ), .ZN(\i_tv80_core/n1036 ) );
  INV_X1 \i_tv80_core/U1309  ( .A(\i_tv80_core/n1071 ), .ZN(
        \i_tv80_core/n1029 ) );
  NAND2_X1 \i_tv80_core/U1308  ( .A1(\i_tv80_core/PC [3]), .A2(
        \i_tv80_core/n1028 ), .ZN(\i_tv80_core/n1071 ) );
  NAND2_X1 \i_tv80_core/U1307  ( .A1(\i_tv80_core/n1026 ), .A2(
        \i_tv80_core/n1024 ), .ZN(\i_tv80_core/n1092 ) );
  XOR2_X1 \i_tv80_core/U1306  ( .A(\i_tv80_core/PC [4]), .B(
        \i_tv80_core/n1022 ), .Z(\i_tv80_core/n1038 ) );
  INV_X1 \i_tv80_core/U1305  ( .A(\i_tv80_core/n1095 ), .ZN(
        \i_tv80_core/n1022 ) );
  OAI21_X1 \i_tv80_core/U1304  ( .B1(\i_tv80_core/n2037 ), .B2(
        \i_tv80_core/n19 ), .A(\i_tv80_core/n1161 ), .ZN(\i_tv80_core/n1095 )
         );
  OAI221_X1 \i_tv80_core/U1303  ( .B1(\i_tv80_core/n1192 ), .B2(
        \i_tv80_core/n1388 ), .C1(\i_tv80_core/n2035 ), .C2(
        \i_tv80_core/n1548 ), .A(\i_tv80_core/n1021 ), .ZN(\i_tv80_core/n1261 ) );
  AOI22_X1 \i_tv80_core/U1302  ( .A1(\i_tv80_core/n10 ), .A2(
        \i_tv80_core/n1018 ), .B1(\i_tv80_core/n1502 ), .B2(
        \i_tv80_core/PC [3]), .ZN(\i_tv80_core/n1021 ) );
  XOR2_X1 \i_tv80_core/U1301  ( .A(\i_tv80_core/n1017 ), .B(
        \i_tv80_core/n1016 ), .Z(\i_tv80_core/n1018 ) );
  XOR2_X1 \i_tv80_core/U1300  ( .A(\i_tv80_core/PC [3]), .B(
        \i_tv80_core/n1026 ), .Z(\i_tv80_core/n1016 ) );
  INV_X1 \i_tv80_core/U1299  ( .A(\i_tv80_core/n1028 ), .ZN(
        \i_tv80_core/n1026 ) );
  OAI21_X1 \i_tv80_core/U1298  ( .B1(\i_tv80_core/n2032 ), .B2(
        \i_tv80_core/n19 ), .A(\i_tv80_core/n1161 ), .ZN(\i_tv80_core/n1028 )
         );
  INV_X1 \i_tv80_core/U1297  ( .A(\i_tv80_core/n1034 ), .ZN(
        \i_tv80_core/n1017 ) );
  NAND2_X1 \i_tv80_core/U1296  ( .A1(\i_tv80_core/n1072 ), .A2(
        \i_tv80_core/n1070 ), .ZN(\i_tv80_core/n1034 ) );
  OAI21_X1 \i_tv80_core/U1295  ( .B1(\i_tv80_core/PC [2]), .B2(
        \i_tv80_core/n1015 ), .A(\i_tv80_core/n1014 ), .ZN(\i_tv80_core/n1070 ) );
  NAND2_X1 \i_tv80_core/U1294  ( .A1(\i_tv80_core/PC [2]), .A2(
        \i_tv80_core/n1015 ), .ZN(\i_tv80_core/n1072 ) );
  AOI22_X1 \i_tv80_core/U1293  ( .A1(\i_tv80_core/n1065 ), .A2(
        \i_tv80_core/TmpAddr [3]), .B1(\i_tv80_core/n991 ), .B2(
        \i_tv80_core/n963 ), .ZN(\i_tv80_core/n1011 ) );
  INV_X1 \i_tv80_core/U1292  ( .A(\i_tv80_core/n1118 ), .ZN(\i_tv80_core/n991 ) );
  OAI222_X1 \i_tv80_core/U1291  ( .A1(\i_tv80_core/n962 ), .A2(
        \i_tv80_core/n8 ), .B1(\i_tv80_core/n2025 ), .B2(\i_tv80_core/n1140 ), 
        .C1(\i_tv80_core/n1124 ), .C2(\i_tv80_core/n5 ), .ZN(
        \i_tv80_core/n1262 ) );
  INV_X1 \i_tv80_core/U1290  ( .A(\i_tv80_core/n961 ), .ZN(\i_tv80_core/n2025 ) );
  OAI221_X1 \i_tv80_core/U1289  ( .B1(\i_tv80_core/n1193 ), .B2(
        \i_tv80_core/n2003 ), .C1(\i_tv80_core/n960 ), .C2(\i_tv80_core/n1131 ), .A(\i_tv80_core/n65 ), .ZN(\i_tv80_core/n961 ) );
  OAI21_X1 \i_tv80_core/U1288  ( .B1(\i_tv80_core/n259 ), .B2(
        \i_tv80_core/n959 ), .A(\i_tv80_core/n958 ), .ZN(\i_tv80_core/n1014 )
         );
  OAI221_X1 \i_tv80_core/U1287  ( .B1(di_reg[0]), .B2(\i_tv80_core/n20 ), .C1(
        \i_tv80_core/PC [1]), .C2(\i_tv80_core/n957 ), .A(\i_tv80_core/PC [0]), 
        .ZN(\i_tv80_core/n958 ) );
  INV_X1 \i_tv80_core/U1286  ( .A(\i_tv80_core/n956 ), .ZN(\i_tv80_core/n957 )
         );
  OAI21_X1 \i_tv80_core/U1285  ( .B1(\i_tv80_core/n1900 ), .B2(
        \i_tv80_core/n19 ), .A(\i_tv80_core/n1161 ), .ZN(\i_tv80_core/n1015 )
         );
  OAI222_X1 \i_tv80_core/U1284  ( .A1(\i_tv80_core/n1193 ), .A2(
        \i_tv80_core/n1117 ), .B1(\i_tv80_core/n1900 ), .B2(
        \i_tv80_core/n1122 ), .C1(\i_tv80_core/n955 ), .C2(\i_tv80_core/n1118 ), .ZN(\i_tv80_core/n1293 ) );
  INV_X1 \i_tv80_core/U1283  ( .A(\i_tv80_core/n954 ), .ZN(\i_tv80_core/n955 )
         );
  OAI222_X1 \i_tv80_core/U1282  ( .A1(\i_tv80_core/n953 ), .A2(
        \i_tv80_core/n9 ), .B1(\i_tv80_core/n2018 ), .B2(\i_tv80_core/n1140 ), 
        .C1(\i_tv80_core/n959 ), .C2(\i_tv80_core/n5 ), .ZN(
        \i_tv80_core/n1263 ) );
  INV_X1 \i_tv80_core/U1281  ( .A(\i_tv80_core/n952 ), .ZN(\i_tv80_core/n2018 ) );
  OAI221_X1 \i_tv80_core/U1280  ( .B1(\i_tv80_core/n1194 ), .B2(
        \i_tv80_core/n2003 ), .C1(\i_tv80_core/n951 ), .C2(\i_tv80_core/n1131 ), .A(\i_tv80_core/n65 ), .ZN(\i_tv80_core/n952 ) );
  INV_X1 \i_tv80_core/U1279  ( .A(\i_tv80_core/n950 ), .ZN(\i_tv80_core/n2003 ) );
  XOR2_X1 \i_tv80_core/U1278  ( .A(\i_tv80_core/n949 ), .B(\i_tv80_core/n948 ), 
        .Z(\i_tv80_core/n953 ) );
  NOR2_X1 \i_tv80_core/U1277  ( .A1(\i_tv80_core/n947 ), .A2(
        \i_tv80_core/n946 ), .ZN(\i_tv80_core/n948 ) );
  XOR2_X1 \i_tv80_core/U1276  ( .A(\i_tv80_core/PC [1]), .B(\i_tv80_core/n259 ), .Z(\i_tv80_core/n949 ) );
  NAND2_X1 \i_tv80_core/U1275  ( .A1(\i_tv80_core/JumpE ), .A2(di_reg[1]), 
        .ZN(\i_tv80_core/n956 ) );
  OAI221_X1 \i_tv80_core/U1274  ( .B1(\i_tv80_core/n1195 ), .B2(
        \i_tv80_core/n1388 ), .C1(\i_tv80_core/n2017 ), .C2(
        \i_tv80_core/n1548 ), .A(\i_tv80_core/n945 ), .ZN(\i_tv80_core/n1264 )
         );
  AOI22_X1 \i_tv80_core/U1273  ( .A1(\i_tv80_core/n10 ), .A2(
        \i_tv80_core/n944 ), .B1(\i_tv80_core/n1502 ), .B2(\i_tv80_core/PC [0]), .ZN(\i_tv80_core/n945 ) );
  INV_X1 \i_tv80_core/U1272  ( .A(\i_tv80_core/n4 ), .ZN(\i_tv80_core/n1502 )
         );
  MUX2_X1 \i_tv80_core/U1271  ( .A(\i_tv80_core/n45 ), .B(\i_tv80_core/n2014 ), 
        .S(\i_tv80_core/JumpE ), .Z(\i_tv80_core/n947 ) );
  NAND2_X1 \i_tv80_core/U1270  ( .A1(\i_tv80_core/n942 ), .A2(
        \i_tv80_core/n16 ), .ZN(\i_tv80_core/n1529 ) );
  INV_X1 \i_tv80_core/U1269  ( .A(\i_tv80_core/n1131 ), .ZN(
        \i_tv80_core/n1997 ) );
  NAND2_X1 \i_tv80_core/U1268  ( .A1(\i_tv80_core/n22 ), .A2(
        \i_tv80_core/n950 ), .ZN(\i_tv80_core/n1388 ) );
  NAND2_X1 \i_tv80_core/U1267  ( .A1(\i_tv80_core/n222 ), .A2(
        \i_tv80_core/n1404 ), .ZN(\i_tv80_core/n950 ) );
  NAND3_X1 \i_tv80_core/U1266  ( .A1(\i_tv80_core/n941 ), .A2(
        \i_tv80_core/n220 ), .A3(\i_tv80_core/n1993 ), .ZN(\i_tv80_core/n1404 ) );
  INV_X1 \i_tv80_core/U1265  ( .A(\i_tv80_core/n1994 ), .ZN(\i_tv80_core/n941 ) );
  NAND4_X1 \i_tv80_core/U1264  ( .A1(halt_n), .A2(\i_tv80_core/n937 ), .A3(
        \i_tv80_core/n936 ), .A4(\i_tv80_core/n935 ), .ZN(\i_tv80_core/n938 )
         );
  NOR3_X1 \i_tv80_core/U1263  ( .A1(\i_tv80_core/Halt ), .A2(
        \i_tv80_core/Jump ), .A3(\i_tv80_core/Call ), .ZN(\i_tv80_core/n935 )
         );
  INV_X1 \i_tv80_core/U1262  ( .A(\i_tv80_core/n2011 ), .ZN(\i_tv80_core/n937 ) );
  AOI21_X1 \i_tv80_core/U1261  ( .B1(\i_tv80_core/n57 ), .B2(
        \i_tv80_core/n934 ), .A(\i_tv80_core/n933 ), .ZN(\i_tv80_core/n940 )
         );
  INV_X1 \i_tv80_core/U1260  ( .A(\i_tv80_core/n943 ), .ZN(\i_tv80_core/n933 )
         );
  NAND4_X1 \i_tv80_core/U1259  ( .A1(\i_tv80_core/n1131 ), .A2(
        \i_tv80_core/n1994 ), .A3(\i_tv80_core/n222 ), .A4(\i_tv80_core/n1126 ), .ZN(\i_tv80_core/n934 ) );
  NAND2_X1 \i_tv80_core/U1258  ( .A1(\i_tv80_core/n932 ), .A2(
        \i_tv80_core/n220 ), .ZN(\i_tv80_core/n1126 ) );
  INV_X1 \i_tv80_core/U1257  ( .A(\i_tv80_core/n930 ), .ZN(\i_tv80_core/n931 )
         );
  INV_X1 \i_tv80_core/U1256  ( .A(\i_tv80_core/n1993 ), .ZN(\i_tv80_core/n932 ) );
  NAND4_X1 \i_tv80_core/U1255  ( .A1(\i_tv80_core/n929 ), .A2(
        \i_tv80_core/n928 ), .A3(\i_tv80_core/n927 ), .A4(\i_tv80_core/n926 ), 
        .ZN(\i_tv80_core/n1993 ) );
  NAND3_X1 \i_tv80_core/U1254  ( .A1(\i_tv80_core/n930 ), .A2(
        \i_tv80_core/n1871 ), .A3(\i_tv80_core/n2067 ), .ZN(
        \i_tv80_core/n2075 ) );
  INV_X1 \i_tv80_core/U1253  ( .A(\i_tv80_core/JumpXY ), .ZN(
        \i_tv80_core/n1871 ) );
  NAND3_X1 \i_tv80_core/U1252  ( .A1(\i_tv80_core/n925 ), .A2(
        \i_tv80_core/IntCycle ), .A3(\i_tv80_core/n924 ), .ZN(
        \i_tv80_core/n1994 ) );
  NOR3_X1 \i_tv80_core/U1251  ( .A1(\i_tv80_core/n1943 ), .A2(
        \i_tv80_core/n923 ), .A3(mcycle[2]), .ZN(\i_tv80_core/n924 ) );
  NAND2_X1 \i_tv80_core/U1250  ( .A1(\i_tv80_core/JumpXY ), .A2(
        \i_tv80_core/n2067 ), .ZN(\i_tv80_core/n1131 ) );
  INV_X1 \i_tv80_core/U1249  ( .A(\i_tv80_core/Jump ), .ZN(\i_tv80_core/n2067 ) );
  OAI21_X1 \i_tv80_core/U1248  ( .B1(\i_tv80_core/Inc_PC ), .B2(
        \i_tv80_core/n922 ), .A(\i_tv80_core/n921 ), .ZN(\i_tv80_core/n943 )
         );
  NAND2_X1 \i_tv80_core/U1247  ( .A1(\i_tv80_core/n1169 ), .A2(
        \i_tv80_core/n19 ), .ZN(\i_tv80_core/n922 ) );
  OAI222_X1 \i_tv80_core/U1246  ( .A1(\i_tv80_core/n2014 ), .A2(
        \i_tv80_core/n1122 ), .B1(\i_tv80_core/n920 ), .B2(\i_tv80_core/n1118 ), .C1(\i_tv80_core/n1195 ), .C2(\i_tv80_core/n1117 ), .ZN(\i_tv80_core/n1295 )
         );
  OAI222_X1 \i_tv80_core/U1245  ( .A1(\i_tv80_core/n1194 ), .A2(
        \i_tv80_core/n1117 ), .B1(\i_tv80_core/n1894 ), .B2(
        \i_tv80_core/n1122 ), .C1(\i_tv80_core/n919 ), .C2(\i_tv80_core/n1118 ), .ZN(\i_tv80_core/n1294 ) );
  OAI221_X1 \i_tv80_core/U1244  ( .B1(\i_tv80_core/n918 ), .B2(
        \i_tv80_core/n1118 ), .C1(\i_tv80_core/n2037 ), .C2(
        \i_tv80_core/n1122 ), .A(\i_tv80_core/n917 ), .ZN(\i_tv80_core/n1291 )
         );
  AOI22_X1 \i_tv80_core/U1243  ( .A1(\i_tv80_core/n1067 ), .A2(
        \i_tv80_core/n185 ), .B1(\i_tv80_core/n1065 ), .B2(
        \i_tv80_core/TmpAddr [4]), .ZN(\i_tv80_core/n917 ) );
  INV_X1 \i_tv80_core/U1242  ( .A(\i_tv80_core/n1117 ), .ZN(
        \i_tv80_core/n1065 ) );
  INV_X1 \i_tv80_core/U1241  ( .A(\i_tv80_core/n1013 ), .ZN(
        \i_tv80_core/n1067 ) );
  NAND4_X1 \i_tv80_core/U1240  ( .A1(\i_tv80_core/n368 ), .A2(
        \i_tv80_core/n916 ), .A3(\i_tv80_core/n1117 ), .A4(\i_tv80_core/n915 ), 
        .ZN(\i_tv80_core/n1013 ) );
  INV_X1 \i_tv80_core/U1239  ( .A(\i_tv80_core/n914 ), .ZN(\i_tv80_core/n918 )
         );
  OAI222_X1 \i_tv80_core/U1238  ( .A1(\i_tv80_core/n2061 ), .A2(
        \i_tv80_core/n1122 ), .B1(\i_tv80_core/n913 ), .B2(\i_tv80_core/n1118 ), .C1(\i_tv80_core/n1188 ), .C2(\i_tv80_core/n1117 ), .ZN(\i_tv80_core/n1288 )
         );
  NAND2_X1 \i_tv80_core/U1237  ( .A1(\i_tv80_core/n912 ), .A2(
        \i_tv80_core/n1122 ), .ZN(\i_tv80_core/n1117 ) );
  NAND2_X1 \i_tv80_core/U1236  ( .A1(\i_tv80_core/n215 ), .A2(
        \i_tv80_core/n915 ), .ZN(\i_tv80_core/n1118 ) );
  INV_X1 \i_tv80_core/U1235  ( .A(\i_tv80_core/n911 ), .ZN(\i_tv80_core/n913 )
         );
  NAND2_X1 \i_tv80_core/U1234  ( .A1(\i_tv80_core/n910 ), .A2(
        \i_tv80_core/n366 ), .ZN(\i_tv80_core/n1122 ) );
  INV_X1 \i_tv80_core/U1233  ( .A(\i_tv80_core/n915 ), .ZN(\i_tv80_core/n910 )
         );
  NAND2_X1 \i_tv80_core/U1232  ( .A1(\i_tv80_core/LDZ ), .A2(
        \i_tv80_core/n364 ), .ZN(\i_tv80_core/n915 ) );
  OAI222_X1 \i_tv80_core/U1231  ( .A1(\i_tv80_core/n1185 ), .A2(
        \i_tv80_core/n1527 ), .B1(\i_tv80_core/n909 ), .B2(\i_tv80_core/n1525 ), .C1(\i_tv80_core/n1900 ), .C2(\i_tv80_core/n1528 ), .ZN(\i_tv80_core/n1285 )
         );
  INV_X1 \i_tv80_core/U1230  ( .A(di_reg[2]), .ZN(\i_tv80_core/n1900 ) );
  INV_X1 \i_tv80_core/U1229  ( .A(\i_tv80_core/n908 ), .ZN(\i_tv80_core/n909 )
         );
  OAI222_X1 \i_tv80_core/U1228  ( .A1(\i_tv80_core/n1183 ), .A2(
        \i_tv80_core/n1527 ), .B1(\i_tv80_core/n257 ), .B2(\i_tv80_core/n1525 ), .C1(\i_tv80_core/n2037 ), .C2(\i_tv80_core/n1528 ), .ZN(\i_tv80_core/n1283 )
         );
  INV_X1 \i_tv80_core/U1227  ( .A(\i_tv80_core/LDW ), .ZN(\i_tv80_core/n907 )
         );
  NAND2_X1 \i_tv80_core/U1226  ( .A1(\i_tv80_core/n912 ), .A2(
        \i_tv80_core/n1528 ), .ZN(\i_tv80_core/n1527 ) );
  NAND3_X1 \i_tv80_core/U1225  ( .A1(\i_tv80_core/LDW ), .A2(
        \i_tv80_core/n364 ), .A3(\i_tv80_core/n367 ), .ZN(\i_tv80_core/n1528 )
         );
  INV_X1 \i_tv80_core/U1224  ( .A(\i_tv80_core/n905 ), .ZN(\i_tv80_core/n912 )
         );
  OAI21_X1 \i_tv80_core/U1223  ( .B1(\i_tv80_core/n904 ), .B2(
        \i_tv80_core/n939 ), .A(\i_tv80_core/n350 ), .ZN(\i_tv80_core/n905 )
         );
  AOI21_X1 \i_tv80_core/U1222  ( .B1(\i_tv80_core/RstP ), .B2(
        \i_tv80_core/n921 ), .A(\i_tv80_core/n906 ), .ZN(\i_tv80_core/n904 )
         );
  INV_X1 \i_tv80_core/U1221  ( .A(\i_tv80_core/n916 ), .ZN(\i_tv80_core/n906 )
         );
  NAND2_X1 \i_tv80_core/U1220  ( .A1(\i_tv80_core/n1873 ), .A2(
        \i_tv80_core/n364 ), .ZN(\i_tv80_core/n916 ) );
  OAI221_X1 \i_tv80_core/U1219  ( .B1(\i_tv80_core/n1981 ), .B2(
        \i_tv80_core/n1519 ), .C1(\i_tv80_core/n257 ), .C2(\i_tv80_core/n1524 ), .A(\i_tv80_core/n903 ), .ZN(\i_tv80_core/n1299 ) );
  AOI221_X1 \i_tv80_core/U1218  ( .B1(\i_tv80_core/n1522 ), .B2(
        \i_tv80_core/RegBusC [12]), .C1(\i_tv80_core/n18 ), .C2(
        \i_tv80_core/SP [12]), .A(\i_tv80_core/n378 ), .ZN(\i_tv80_core/n903 )
         );
  INV_X1 \i_tv80_core/U1217  ( .A(\i_tv80_core/n902 ), .ZN(\i_tv80_core/n1522 ) );
  AOI22_X1 \i_tv80_core/U1216  ( .A1(\i_tv80_core/n899 ), .A2(
        \i_tv80_core/n1446 ), .B1(\i_tv80_core/n898 ), .B2(\i_tv80_core/n129 ), 
        .ZN(\i_tv80_core/n900 ) );
  NAND2_X1 \i_tv80_core/U1215  ( .A1(\i_tv80_core/n897 ), .A2(
        \i_tv80_core/n72 ), .ZN(\i_tv80_core/n898 ) );
  NAND2_X1 \i_tv80_core/U1214  ( .A1(\i_tv80_core/n101 ), .A2(
        \i_tv80_core/n1445 ), .ZN(\i_tv80_core/n899 ) );
  NAND2_X1 \i_tv80_core/U1213  ( .A1(\i_tv80_core/n158 ), .A2(
        \i_tv80_core/n1480 ), .ZN(\i_tv80_core/n1445 ) );
  XOR2_X1 \i_tv80_core/U1212  ( .A(\i_tv80_core/n1443 ), .B(\i_tv80_core/n99 ), 
        .Z(\i_tv80_core/n901 ) );
  MUX2_X1 \i_tv80_core/U1211  ( .A(\i_tv80_core/SP [12]), .B(
        \i_tv80_core/RegBusC [12]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n1443 ) );
  OAI221_X1 \i_tv80_core/U1210  ( .B1(\i_tv80_core/n2105 ), .B2(
        \i_tv80_core/n902 ), .C1(\i_tv80_core/n1142 ), .C2(\i_tv80_core/n82 ), 
        .A(\i_tv80_core/n894 ), .ZN(\i_tv80_core/n1300 ) );
  AOI221_X1 \i_tv80_core/U1209  ( .B1(\i_tv80_core/n893 ), .B2(
        \i_tv80_core/n1579 ), .C1(\i_tv80_core/n1424 ), .C2(\i_tv80_core/n13 ), 
        .A(\i_tv80_core/n379 ), .ZN(\i_tv80_core/n894 ) );
  INV_X1 \i_tv80_core/U1208  ( .A(\i_tv80_core/n1446 ), .ZN(
        \i_tv80_core/n1477 ) );
  MUX2_X1 \i_tv80_core/U1207  ( .A(\i_tv80_core/SP [11]), .B(
        \i_tv80_core/RegBusC [11]), .S(\i_tv80_core/n364 ), .Z(
        \i_tv80_core/n1446 ) );
  OAI21_X1 \i_tv80_core/U1206  ( .B1(\i_tv80_core/n891 ), .B2(
        \i_tv80_core/n897 ), .A(\i_tv80_core/n1482 ), .ZN(\i_tv80_core/n892 )
         );
  INV_X1 \i_tv80_core/U1205  ( .A(\i_tv80_core/n1480 ), .ZN(\i_tv80_core/n897 ) );
  INV_X1 \i_tv80_core/U1204  ( .A(\i_tv80_core/n1478 ), .ZN(\i_tv80_core/n891 ) );
  NAND2_X1 \i_tv80_core/U1203  ( .A1(\i_tv80_core/n890 ), .A2(
        \i_tv80_core/n101 ), .ZN(\i_tv80_core/n1478 ) );
  INV_X1 \i_tv80_core/U1202  ( .A(\i_tv80_core/RegBusC [11]), .ZN(
        \i_tv80_core/n2105 ) );
  OAI221_X1 \i_tv80_core/U1201  ( .B1(\i_tv80_core/n2097 ), .B2(
        \i_tv80_core/n902 ), .C1(\i_tv80_core/n1143 ), .C2(\i_tv80_core/n82 ), 
        .A(\i_tv80_core/n889 ), .ZN(\i_tv80_core/n1301 ) );
  AOI221_X1 \i_tv80_core/U1200  ( .B1(\i_tv80_core/n893 ), .B2(
        \i_tv80_core/n1974 ), .C1(\i_tv80_core/n908 ), .C2(\i_tv80_core/n13 ), 
        .A(\i_tv80_core/n380 ), .ZN(\i_tv80_core/n889 ) );
  XOR2_X1 \i_tv80_core/U1199  ( .A(\i_tv80_core/n888 ), .B(\i_tv80_core/n890 ), 
        .Z(\i_tv80_core/n908 ) );
  INV_X1 \i_tv80_core/U1198  ( .A(\i_tv80_core/n896 ), .ZN(\i_tv80_core/n890 )
         );
  OAI221_X1 \i_tv80_core/U1197  ( .B1(\i_tv80_core/n887 ), .B2(
        \i_tv80_core/n63 ), .C1(\i_tv80_core/n886 ), .C2(\i_tv80_core/n63 ), 
        .A(\i_tv80_core/n885 ), .ZN(\i_tv80_core/n896 ) );
  AOI21_X1 \i_tv80_core/U1196  ( .B1(\i_tv80_core/n884 ), .B2(
        \i_tv80_core/n129 ), .A(\i_tv80_core/n883 ), .ZN(\i_tv80_core/n885 )
         );
  OAI21_X1 \i_tv80_core/U1195  ( .B1(\i_tv80_core/n107 ), .B2(
        \i_tv80_core/n882 ), .A(\i_tv80_core/n881 ), .ZN(\i_tv80_core/n883 )
         );
  INV_X1 \i_tv80_core/U1194  ( .A(\i_tv80_core/n86 ), .ZN(\i_tv80_core/n884 )
         );
  XOR2_X1 \i_tv80_core/U1193  ( .A(\i_tv80_core/n1480 ), .B(\i_tv80_core/n99 ), 
        .Z(\i_tv80_core/n888 ) );
  MUX2_X1 \i_tv80_core/U1192  ( .A(\i_tv80_core/SP [10]), .B(
        \i_tv80_core/RegBusC [10]), .S(\i_tv80_core/n364 ), .Z(
        \i_tv80_core/n1480 ) );
  INV_X1 \i_tv80_core/U1191  ( .A(\i_tv80_core/RegBusC [10]), .ZN(
        \i_tv80_core/n2097 ) );
  OAI221_X1 \i_tv80_core/U1190  ( .B1(\i_tv80_core/n2089 ), .B2(
        \i_tv80_core/n902 ), .C1(\i_tv80_core/n1144 ), .C2(\i_tv80_core/n82 ), 
        .A(\i_tv80_core/n877 ), .ZN(\i_tv80_core/n1302 ) );
  AOI221_X1 \i_tv80_core/U1189  ( .B1(\i_tv80_core/n893 ), .B2(
        \i_tv80_core/n54 ), .C1(\i_tv80_core/n1408 ), .C2(\i_tv80_core/n13 ), 
        .A(\i_tv80_core/n378 ), .ZN(\i_tv80_core/n877 ) );
  INV_X1 \i_tv80_core/U1188  ( .A(\i_tv80_core/n880 ), .ZN(\i_tv80_core/n882 )
         );
  MUX2_X1 \i_tv80_core/U1187  ( .A(\i_tv80_core/SP [9]), .B(
        \i_tv80_core/RegBusC [9]), .S(\i_tv80_core/n364 ), .Z(
        \i_tv80_core/n880 ) );
  OAI22_X1 \i_tv80_core/U1186  ( .A1(\i_tv80_core/n105 ), .A2(
        \i_tv80_core/n875 ), .B1(\i_tv80_core/n874 ), .B2(\i_tv80_core/n873 ), 
        .ZN(\i_tv80_core/n876 ) );
  AOI21_X1 \i_tv80_core/U1185  ( .B1(\i_tv80_core/n872 ), .B2(
        \i_tv80_core/n871 ), .A(\i_tv80_core/n129 ), .ZN(\i_tv80_core/n873 )
         );
  INV_X1 \i_tv80_core/U1184  ( .A(\i_tv80_core/n879 ), .ZN(\i_tv80_core/n874 )
         );
  INV_X1 \i_tv80_core/U1183  ( .A(\i_tv80_core/RegBusC [9]), .ZN(
        \i_tv80_core/n2089 ) );
  OAI221_X1 \i_tv80_core/U1182  ( .B1(\i_tv80_core/n2081 ), .B2(
        \i_tv80_core/n902 ), .C1(\i_tv80_core/n1145 ), .C2(\i_tv80_core/n82 ), 
        .A(\i_tv80_core/n870 ), .ZN(\i_tv80_core/n1303 ) );
  AOI221_X1 \i_tv80_core/U1181  ( .B1(\i_tv80_core/n893 ), .B2(
        \i_tv80_core/n1955 ), .C1(\i_tv80_core/n13 ), .C2(\i_tv80_core/n14 ), 
        .A(\i_tv80_core/n379 ), .ZN(\i_tv80_core/n870 ) );
  OAI21_X1 \i_tv80_core/U1180  ( .B1(\i_tv80_core/n869 ), .B2(
        \i_tv80_core/n872 ), .A(\i_tv80_core/n137 ), .ZN(\i_tv80_core/n875 )
         );
  INV_X1 \i_tv80_core/U1179  ( .A(\i_tv80_core/n881 ), .ZN(\i_tv80_core/n869 )
         );
  NAND2_X1 \i_tv80_core/U1178  ( .A1(\i_tv80_core/n871 ), .A2(
        \i_tv80_core/n85 ), .ZN(\i_tv80_core/n881 ) );
  MUX2_X1 \i_tv80_core/U1177  ( .A(\i_tv80_core/SP [8]), .B(
        \i_tv80_core/RegBusC [8]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n879 ) );
  INV_X1 \i_tv80_core/U1176  ( .A(\i_tv80_core/n1519 ), .ZN(\i_tv80_core/n893 ) );
  NAND3_X1 \i_tv80_core/U1175  ( .A1(\i_tv80_core/n1965 ), .A2(
        \i_tv80_core/n1957 ), .A3(\i_tv80_core/n895 ), .ZN(\i_tv80_core/n1519 ) );
  NAND2_X1 \i_tv80_core/U1174  ( .A1(\i_tv80_core/LDSPHL ), .A2(
        \i_tv80_core/n868 ), .ZN(\i_tv80_core/n902 ) );
  INV_X1 \i_tv80_core/U1173  ( .A(\i_tv80_core/n867 ), .ZN(\i_tv80_core/n868 )
         );
  OAI21_X1 \i_tv80_core/U1172  ( .B1(\i_tv80_core/n866 ), .B2(
        \i_tv80_core/n865 ), .A(\i_tv80_core/n895 ), .ZN(\i_tv80_core/n867 )
         );
  INV_X1 \i_tv80_core/U1171  ( .A(\i_tv80_core/n1521 ), .ZN(\i_tv80_core/n895 ) );
  OAI21_X1 \i_tv80_core/U1170  ( .B1(\i_tv80_core/n78 ), .B2(
        \i_tv80_core/n1965 ), .A(\i_tv80_core/n863 ), .ZN(\i_tv80_core/n1521 )
         );
  INV_X1 \i_tv80_core/U1169  ( .A(\i_tv80_core/n862 ), .ZN(\i_tv80_core/n1965 ) );
  INV_X1 \i_tv80_core/U1168  ( .A(\i_tv80_core/RegBusC [8]), .ZN(
        \i_tv80_core/n2081 ) );
  OAI221_X1 \i_tv80_core/U1167  ( .B1(\i_tv80_core/n2065 ), .B2(
        \i_tv80_core/n861 ), .C1(\i_tv80_core/n1146 ), .C2(\i_tv80_core/n60 ), 
        .A(\i_tv80_core/n859 ), .ZN(\i_tv80_core/n1304 ) );
  AOI221_X1 \i_tv80_core/U1166  ( .B1(\i_tv80_core/n1518 ), .B2(
        \i_tv80_core/n250 ), .C1(\i_tv80_core/n911 ), .C2(\i_tv80_core/n226 ), 
        .A(\i_tv80_core/n380 ), .ZN(\i_tv80_core/n859 ) );
  NAND2_X1 \i_tv80_core/U1165  ( .A1(\i_tv80_core/n886 ), .A2(
        \i_tv80_core/n887 ), .ZN(\i_tv80_core/n872 ) );
  NAND2_X1 \i_tv80_core/U1164  ( .A1(\i_tv80_core/n856 ), .A2(
        \i_tv80_core/n857 ), .ZN(\i_tv80_core/n887 ) );
  NAND4_X1 \i_tv80_core/U1163  ( .A1(\i_tv80_core/n121 ), .A2(
        \i_tv80_core/n855 ), .A3(\i_tv80_core/n43 ), .A4(\i_tv80_core/n854 ), 
        .ZN(\i_tv80_core/n856 ) );
  AOI221_X1 \i_tv80_core/U1162  ( .B1(\i_tv80_core/n853 ), .B2(
        \i_tv80_core/n43 ), .C1(\i_tv80_core/n15 ), .C2(\i_tv80_core/n43 ), 
        .A(\i_tv80_core/n852 ), .ZN(\i_tv80_core/n857 ) );
  NOR2_X1 \i_tv80_core/U1161  ( .A1(\i_tv80_core/n849 ), .A2(
        \i_tv80_core/n848 ), .ZN(\i_tv80_core/n853 ) );
  MUX2_X1 \i_tv80_core/U1160  ( .A(\i_tv80_core/SP [7]), .B(
        \i_tv80_core/RegBusC [7]), .S(\i_tv80_core/n364 ), .Z(
        \i_tv80_core/n871 ) );
  INV_X1 \i_tv80_core/U1159  ( .A(\i_tv80_core/RegBusC [7]), .ZN(
        \i_tv80_core/n2065 ) );
  OAI221_X1 \i_tv80_core/U1158  ( .B1(\i_tv80_core/n1138 ), .B2(
        \i_tv80_core/n861 ), .C1(\i_tv80_core/n1147 ), .C2(\i_tv80_core/n60 ), 
        .A(\i_tv80_core/n841 ), .ZN(\i_tv80_core/n1305 ) );
  AOI221_X1 \i_tv80_core/U1157  ( .B1(\i_tv80_core/n250 ), .B2(
        \i_tv80_core/n1613 ), .C1(\i_tv80_core/n55 ), .C2(\i_tv80_core/n840 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n841 ) );
  INV_X1 \i_tv80_core/U1156  ( .A(\i_tv80_core/n1119 ), .ZN(\i_tv80_core/n840 ) );
  INV_X1 \i_tv80_core/U1155  ( .A(\i_tv80_core/n838 ), .ZN(\i_tv80_core/n852 )
         );
  OAI21_X1 \i_tv80_core/U1154  ( .B1(\i_tv80_core/n1924 ), .B2(
        \i_tv80_core/n842 ), .A(\i_tv80_core/n837 ), .ZN(\i_tv80_core/n838 )
         );
  INV_X1 \i_tv80_core/U1153  ( .A(di_reg[6]), .ZN(\i_tv80_core/n1924 ) );
  INV_X1 \i_tv80_core/U1152  ( .A(\i_tv80_core/n836 ), .ZN(\i_tv80_core/n851 )
         );
  MUX2_X1 \i_tv80_core/U1151  ( .A(\i_tv80_core/SP [6]), .B(
        \i_tv80_core/RegBusC [6]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n836 ) );
  NAND3_X1 \i_tv80_core/U1150  ( .A1(\i_tv80_core/n843 ), .A2(
        \i_tv80_core/n844 ), .A3(\i_tv80_core/n835 ), .ZN(\i_tv80_core/n839 )
         );
  NAND3_X1 \i_tv80_core/U1149  ( .A1(\i_tv80_core/n834 ), .A2(
        \i_tv80_core/n121 ), .A3(\i_tv80_core/n855 ), .ZN(\i_tv80_core/n835 )
         );
  INV_X1 \i_tv80_core/U1148  ( .A(\i_tv80_core/n847 ), .ZN(\i_tv80_core/n834 )
         );
  NAND2_X1 \i_tv80_core/U1147  ( .A1(\i_tv80_core/n850 ), .A2(
        \i_tv80_core/n854 ), .ZN(\i_tv80_core/n847 ) );
  NAND2_X1 \i_tv80_core/U1146  ( .A1(\i_tv80_core/n849 ), .A2(
        \i_tv80_core/n848 ), .ZN(\i_tv80_core/n854 ) );
  NAND2_X1 \i_tv80_core/U1145  ( .A1(\i_tv80_core/n833 ), .A2(
        \i_tv80_core/n261 ), .ZN(\i_tv80_core/n844 ) );
  NAND3_X1 \i_tv80_core/U1144  ( .A1(\i_tv80_core/n832 ), .A2(
        \i_tv80_core/n850 ), .A3(\i_tv80_core/n831 ), .ZN(\i_tv80_core/n843 )
         );
  INV_X1 \i_tv80_core/U1143  ( .A(\i_tv80_core/n849 ), .ZN(\i_tv80_core/n831 )
         );
  OAI221_X1 \i_tv80_core/U1142  ( .B1(\i_tv80_core/n830 ), .B2(
        \i_tv80_core/n842 ), .C1(\i_tv80_core/n348 ), .C2(\i_tv80_core/n830 ), 
        .A(\i_tv80_core/n829 ), .ZN(\i_tv80_core/n850 ) );
  INV_X1 \i_tv80_core/U1141  ( .A(\i_tv80_core/n828 ), .ZN(\i_tv80_core/n830 )
         );
  INV_X1 \i_tv80_core/U1140  ( .A(\i_tv80_core/RegBusC [6]), .ZN(
        \i_tv80_core/n1138 ) );
  OAI221_X1 \i_tv80_core/U1139  ( .B1(\i_tv80_core/n1114 ), .B2(
        \i_tv80_core/n861 ), .C1(\i_tv80_core/n1148 ), .C2(\i_tv80_core/n60 ), 
        .A(\i_tv80_core/n827 ), .ZN(\i_tv80_core/n1306 ) );
  AOI221_X1 \i_tv80_core/U1138  ( .B1(\i_tv80_core/n250 ), .B2(
        \i_tv80_core/n826 ), .C1(\i_tv80_core/n226 ), .C2(\i_tv80_core/n1064 ), 
        .A(\i_tv80_core/n378 ), .ZN(\i_tv80_core/n827 ) );
  NAND2_X1 \i_tv80_core/U1137  ( .A1(\i_tv80_core/n364 ), .A2(di_reg[5]), .ZN(
        \i_tv80_core/n828 ) );
  INV_X1 \i_tv80_core/U1136  ( .A(\i_tv80_core/n829 ), .ZN(\i_tv80_core/n833 )
         );
  MUX2_X1 \i_tv80_core/U1135  ( .A(\i_tv80_core/SP [5]), .B(
        \i_tv80_core/RegBusC [5]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n829 ) );
  OAI21_X1 \i_tv80_core/U1134  ( .B1(\i_tv80_core/n832 ), .B2(
        \i_tv80_core/n823 ), .A(\i_tv80_core/n822 ), .ZN(\i_tv80_core/n825 )
         );
  OAI21_X1 \i_tv80_core/U1133  ( .B1(\i_tv80_core/n848 ), .B2(
        \i_tv80_core/n846 ), .A(\i_tv80_core/n76 ), .ZN(\i_tv80_core/n822 ) );
  INV_X1 \i_tv80_core/U1132  ( .A(\i_tv80_core/RegBusC [5]), .ZN(
        \i_tv80_core/n1114 ) );
  OAI221_X1 \i_tv80_core/U1131  ( .B1(\i_tv80_core/n2040 ), .B2(
        \i_tv80_core/n861 ), .C1(\i_tv80_core/n1149 ), .C2(\i_tv80_core/n60 ), 
        .A(\i_tv80_core/n821 ), .ZN(\i_tv80_core/n1307 ) );
  AOI221_X1 \i_tv80_core/U1130  ( .B1(\i_tv80_core/n250 ), .B2(
        \i_tv80_core/n1594 ), .C1(\i_tv80_core/n55 ), .C2(\i_tv80_core/n914 ), 
        .A(\i_tv80_core/n379 ), .ZN(\i_tv80_core/n821 ) );
  INV_X1 \i_tv80_core/U1129  ( .A(\i_tv80_core/n846 ), .ZN(\i_tv80_core/n823 )
         );
  NAND2_X1 \i_tv80_core/U1128  ( .A1(\i_tv80_core/n120 ), .A2(
        \i_tv80_core/n855 ), .ZN(\i_tv80_core/n846 ) );
  NAND2_X1 \i_tv80_core/U1127  ( .A1(\i_tv80_core/n820 ), .A2(
        \i_tv80_core/n819 ), .ZN(\i_tv80_core/n855 ) );
  OAI221_X1 \i_tv80_core/U1126  ( .B1(\i_tv80_core/n818 ), .B2(
        \i_tv80_core/n817 ), .C1(\i_tv80_core/n816 ), .C2(\i_tv80_core/n815 ), 
        .A(\i_tv80_core/n814 ), .ZN(\i_tv80_core/n819 ) );
  OAI211_X1 \i_tv80_core/U1125  ( .C1(\i_tv80_core/n813 ), .C2(
        \i_tv80_core/n812 ), .A(\i_tv80_core/n375 ), .B(\i_tv80_core/n842 ), 
        .ZN(\i_tv80_core/n814 ) );
  INV_X1 \i_tv80_core/U1124  ( .A(\i_tv80_core/n811 ), .ZN(\i_tv80_core/n816 )
         );
  OAI21_X1 \i_tv80_core/U1123  ( .B1(\i_tv80_core/n810 ), .B2(
        \i_tv80_core/n809 ), .A(\i_tv80_core/n837 ), .ZN(\i_tv80_core/n820 )
         );
  INV_X1 \i_tv80_core/U1122  ( .A(\i_tv80_core/n808 ), .ZN(\i_tv80_core/n809 )
         );
  INV_X1 \i_tv80_core/U1121  ( .A(\i_tv80_core/n807 ), .ZN(\i_tv80_core/n810 )
         );
  OAI21_X1 \i_tv80_core/U1120  ( .B1(\i_tv80_core/n87 ), .B2(
        \i_tv80_core/n808 ), .A(\i_tv80_core/n804 ), .ZN(\i_tv80_core/n805 )
         );
  INV_X1 \i_tv80_core/U1119  ( .A(\i_tv80_core/n803 ), .ZN(\i_tv80_core/n804 )
         );
  NAND2_X1 \i_tv80_core/U1118  ( .A1(\i_tv80_core/n806 ), .A2(
        \i_tv80_core/n802 ), .ZN(\i_tv80_core/n808 ) );
  INV_X1 \i_tv80_core/U1117  ( .A(\i_tv80_core/n848 ), .ZN(\i_tv80_core/n832 )
         );
  MUX2_X1 \i_tv80_core/U1116  ( .A(\i_tv80_core/SP [4]), .B(
        \i_tv80_core/RegBusC [4]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n848 ) );
  OAI21_X1 \i_tv80_core/U1115  ( .B1(\i_tv80_core/n2037 ), .B2(
        \i_tv80_core/n842 ), .A(\i_tv80_core/n824 ), .ZN(\i_tv80_core/n849 )
         );
  INV_X1 \i_tv80_core/U1114  ( .A(di_reg[4]), .ZN(\i_tv80_core/n2037 ) );
  INV_X1 \i_tv80_core/U1113  ( .A(\i_tv80_core/RegBusC [4]), .ZN(
        \i_tv80_core/n2040 ) );
  OAI221_X1 \i_tv80_core/U1112  ( .B1(\i_tv80_core/n2035 ), .B2(
        \i_tv80_core/n861 ), .C1(\i_tv80_core/n1150 ), .C2(\i_tv80_core/n60 ), 
        .A(\i_tv80_core/n801 ), .ZN(\i_tv80_core/n1308 ) );
  AOI221_X1 \i_tv80_core/U1111  ( .B1(\i_tv80_core/n250 ), .B2(
        \i_tv80_core/n1579 ), .C1(\i_tv80_core/n226 ), .C2(\i_tv80_core/n963 ), 
        .A(\i_tv80_core/n380 ), .ZN(\i_tv80_core/n801 ) );
  NAND2_X1 \i_tv80_core/U1110  ( .A1(\i_tv80_core/n365 ), .A2(di_reg[3]), .ZN(
        \i_tv80_core/n802 ) );
  INV_X1 \i_tv80_core/U1109  ( .A(\i_tv80_core/n799 ), .ZN(\i_tv80_core/n806 )
         );
  MUX2_X1 \i_tv80_core/U1108  ( .A(\i_tv80_core/SP [3]), .B(
        \i_tv80_core/RegBusC [3]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n799 ) );
  NAND2_X1 \i_tv80_core/U1107  ( .A1(\i_tv80_core/n798 ), .A2(
        \i_tv80_core/n803 ), .ZN(\i_tv80_core/n800 ) );
  OAI221_X1 \i_tv80_core/U1106  ( .B1(\i_tv80_core/n797 ), .B2(
        \i_tv80_core/n842 ), .C1(\i_tv80_core/n348 ), .C2(\i_tv80_core/n797 ), 
        .A(\i_tv80_core/n796 ), .ZN(\i_tv80_core/n803 ) );
  INV_X1 \i_tv80_core/U1105  ( .A(\i_tv80_core/n795 ), .ZN(\i_tv80_core/n797 )
         );
  OAI21_X1 \i_tv80_core/U1104  ( .B1(\i_tv80_core/n87 ), .B2(
        \i_tv80_core/n807 ), .A(\i_tv80_core/n794 ), .ZN(\i_tv80_core/n798 )
         );
  NAND2_X1 \i_tv80_core/U1103  ( .A1(\i_tv80_core/n793 ), .A2(
        \i_tv80_core/n795 ), .ZN(\i_tv80_core/n807 ) );
  NAND2_X1 \i_tv80_core/U1102  ( .A1(\i_tv80_core/n375 ), .A2(
        \i_tv80_core/n842 ), .ZN(\i_tv80_core/n824 ) );
  INV_X1 \i_tv80_core/U1101  ( .A(\i_tv80_core/RegBusC [3]), .ZN(
        \i_tv80_core/n2035 ) );
  OAI221_X1 \i_tv80_core/U1100  ( .B1(\i_tv80_core/n960 ), .B2(
        \i_tv80_core/n861 ), .C1(\i_tv80_core/n1151 ), .C2(\i_tv80_core/n60 ), 
        .A(\i_tv80_core/n792 ), .ZN(\i_tv80_core/n1309 ) );
  AOI221_X1 \i_tv80_core/U1099  ( .B1(\i_tv80_core/n250 ), .B2(
        \i_tv80_core/n1974 ), .C1(\i_tv80_core/n55 ), .C2(\i_tv80_core/n954 ), 
        .A(\i_tv80_core/n378 ), .ZN(\i_tv80_core/n792 ) );
  INV_X1 \i_tv80_core/U1098  ( .A(\i_tv80_core/n794 ), .ZN(\i_tv80_core/n790 )
         );
  OAI21_X1 \i_tv80_core/U1097  ( .B1(\i_tv80_core/n818 ), .B2(
        \i_tv80_core/n271 ), .A(\i_tv80_core/n789 ), .ZN(\i_tv80_core/n794 )
         );
  OAI21_X1 \i_tv80_core/U1096  ( .B1(\i_tv80_core/n87 ), .B2(
        \i_tv80_core/n811 ), .A(\i_tv80_core/n813 ), .ZN(\i_tv80_core/n789 )
         );
  NAND2_X1 \i_tv80_core/U1095  ( .A1(\i_tv80_core/n818 ), .A2(
        \i_tv80_core/n817 ), .ZN(\i_tv80_core/n811 ) );
  INV_X1 \i_tv80_core/U1094  ( .A(\i_tv80_core/n812 ), .ZN(\i_tv80_core/n818 )
         );
  INV_X1 \i_tv80_core/U1093  ( .A(\i_tv80_core/n796 ), .ZN(\i_tv80_core/n793 )
         );
  MUX2_X1 \i_tv80_core/U1092  ( .A(\i_tv80_core/SP [2]), .B(
        \i_tv80_core/RegBusC [2]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n796 ) );
  NAND2_X1 \i_tv80_core/U1091  ( .A1(\i_tv80_core/n795 ), .A2(
        \i_tv80_core/n837 ), .ZN(\i_tv80_core/n791 ) );
  NAND2_X1 \i_tv80_core/U1090  ( .A1(\i_tv80_core/n364 ), .A2(di_reg[2]), .ZN(
        \i_tv80_core/n795 ) );
  INV_X1 \i_tv80_core/U1089  ( .A(\i_tv80_core/RegBusC [2]), .ZN(
        \i_tv80_core/n960 ) );
  OAI221_X1 \i_tv80_core/U1088  ( .B1(\i_tv80_core/n951 ), .B2(
        \i_tv80_core/n861 ), .C1(\i_tv80_core/n1152 ), .C2(\i_tv80_core/n60 ), 
        .A(\i_tv80_core/n788 ), .ZN(\i_tv80_core/n1310 ) );
  AOI221_X1 \i_tv80_core/U1087  ( .B1(\i_tv80_core/n250 ), .B2(
        \i_tv80_core/n54 ), .C1(\i_tv80_core/n226 ), .C2(\i_tv80_core/n787 ), 
        .A(\i_tv80_core/n378 ), .ZN(\i_tv80_core/n788 ) );
  INV_X1 \i_tv80_core/U1086  ( .A(\i_tv80_core/n919 ), .ZN(\i_tv80_core/n787 )
         );
  XOR2_X1 \i_tv80_core/U1085  ( .A(\i_tv80_core/n786 ), .B(\i_tv80_core/n271 ), 
        .Z(\i_tv80_core/n919 ) );
  NAND2_X1 \i_tv80_core/U1084  ( .A1(\i_tv80_core/n365 ), .A2(di_reg[1]), .ZN(
        \i_tv80_core/n817 ) );
  NAND2_X1 \i_tv80_core/U1083  ( .A1(\i_tv80_core/n375 ), .A2(
        \i_tv80_core/n842 ), .ZN(\i_tv80_core/n837 ) );
  XOR2_X1 \i_tv80_core/U1082  ( .A(\i_tv80_core/n812 ), .B(\i_tv80_core/n813 ), 
        .Z(\i_tv80_core/n786 ) );
  INV_X1 \i_tv80_core/U1081  ( .A(\i_tv80_core/n815 ), .ZN(\i_tv80_core/n813 )
         );
  NAND2_X1 \i_tv80_core/U1080  ( .A1(\i_tv80_core/n785 ), .A2(
        \i_tv80_core/n784 ), .ZN(\i_tv80_core/n815 ) );
  MUX2_X1 \i_tv80_core/U1079  ( .A(\i_tv80_core/SP [1]), .B(
        \i_tv80_core/RegBusC [1]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n812 ) );
  INV_X1 \i_tv80_core/U1078  ( .A(\i_tv80_core/RegBusC [1]), .ZN(
        \i_tv80_core/n951 ) );
  OAI221_X1 \i_tv80_core/U1077  ( .B1(\i_tv80_core/n2017 ), .B2(
        \i_tv80_core/n861 ), .C1(\i_tv80_core/n1153 ), .C2(\i_tv80_core/n60 ), 
        .A(\i_tv80_core/n783 ), .ZN(\i_tv80_core/n1311 ) );
  AOI221_X1 \i_tv80_core/U1076  ( .B1(\i_tv80_core/n250 ), .B2(
        \i_tv80_core/n1955 ), .C1(\i_tv80_core/n55 ), .C2(\i_tv80_core/n782 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n783 ) );
  INV_X1 \i_tv80_core/U1075  ( .A(\i_tv80_core/n920 ), .ZN(\i_tv80_core/n782 )
         );
  MUX2_X1 \i_tv80_core/U1074  ( .A(\i_tv80_core/SP [0]), .B(
        \i_tv80_core/RegBusC [0]), .S(\i_tv80_core/n363 ), .Z(
        \i_tv80_core/n784 ) );
  NAND2_X1 \i_tv80_core/U1073  ( .A1(\i_tv80_core/n365 ), .A2(
        \i_tv80_core/n2014 ), .ZN(\i_tv80_core/n785 ) );
  INV_X1 \i_tv80_core/U1072  ( .A(\i_tv80_core/LDSPHL ), .ZN(
        \i_tv80_core/n1870 ) );
  NAND3_X1 \i_tv80_core/U1071  ( .A1(\i_tv80_core/n254 ), .A2(
        \i_tv80_core/n1957 ), .A3(\i_tv80_core/n1968 ), .ZN(\i_tv80_core/n781 ) );
  OAI21_X1 \i_tv80_core/U1070  ( .B1(\i_tv80_core/n1966 ), .B2(
        \i_tv80_core/n78 ), .A(\i_tv80_core/n863 ), .ZN(\i_tv80_core/n780 ) );
  INV_X1 \i_tv80_core/U1069  ( .A(\i_tv80_core/n779 ), .ZN(\i_tv80_core/n863 )
         );
  OAI21_X1 \i_tv80_core/U1068  ( .B1(\i_tv80_core/n1957 ), .B2(
        \i_tv80_core/n864 ), .A(\i_tv80_core/n366 ), .ZN(\i_tv80_core/n779 )
         );
  INV_X1 \i_tv80_core/U1067  ( .A(\i_tv80_core/n778 ), .ZN(\i_tv80_core/n864 )
         );
  OAI21_X1 \i_tv80_core/U1066  ( .B1(\i_tv80_core/n777 ), .B2(
        \i_tv80_core/LDSPHL ), .A(\i_tv80_core/n942 ), .ZN(\i_tv80_core/n778 )
         );
  AOI211_X1 \i_tv80_core/U1065  ( .C1(\i_tv80_core/n776 ), .C2(
        \i_tv80_core/n1558 ), .A(\i_tv80_core/n775 ), .B(\i_tv80_core/n1864 ), 
        .ZN(\i_tv80_core/n777 ) );
  NAND3_X1 \i_tv80_core/U1064  ( .A1(\i_tv80_core/n1565 ), .A2(
        \i_tv80_core/n36 ), .A3(\i_tv80_core/n154 ), .ZN(\i_tv80_core/n776 )
         );
  INV_X1 \i_tv80_core/U1063  ( .A(\i_tv80_core/n774 ), .ZN(\i_tv80_core/n1966 ) );
  INV_X1 \i_tv80_core/U1062  ( .A(\i_tv80_core/RegBusC [0]), .ZN(
        \i_tv80_core/n2017 ) );
  MUX2_X1 \i_tv80_core/U1061  ( .A(\i_tv80_core/n773 ), .B(\i_tv80_core/n45 ), 
        .S(\i_tv80_core/n2012 ), .Z(\i_tv80_core/n1265 ) );
  INV_X1 \i_tv80_core/U1060  ( .A(\i_tv80_core/n772 ), .ZN(\i_tv80_core/n2012 ) );
  OAI21_X1 \i_tv80_core/U1059  ( .B1(\i_tv80_core/n771 ), .B2(
        \i_tv80_core/n939 ), .A(\i_tv80_core/n350 ), .ZN(\i_tv80_core/n772 )
         );
  NOR3_X1 \i_tv80_core/U1058  ( .A1(\i_tv80_core/n995 ), .A2(
        \i_tv80_core/n770 ), .A3(\i_tv80_core/n1947 ), .ZN(\i_tv80_core/n773 )
         );
  INV_X1 \i_tv80_core/U1057  ( .A(\i_tv80_core/n769 ), .ZN(\i_tv80_core/n770 )
         );
  NAND2_X1 \i_tv80_core/U1056  ( .A1(\i_tv80_core/n768 ), .A2(
        \i_tv80_core/n767 ), .ZN(\i_tv80_core/n1328 ) );
  AOI221_X1 \i_tv80_core/U1055  ( .B1(\i_tv80_core/n252 ), .B2(
        \i_tv80_core/n1518 ), .C1(\i_tv80_core/n225 ), .C2(\i_tv80_core/n766 ), 
        .A(\i_tv80_core/n765 ), .ZN(\i_tv80_core/n767 ) );
  MUX2_X1 \i_tv80_core/U1054  ( .A(\i_tv80_core/n764 ), .B(\i_tv80_core/n224 ), 
        .S(\i_tv80_core/n1170 ), .Z(\i_tv80_core/n765 ) );
  AOI221_X1 \i_tv80_core/U1053  ( .B1(\i_tv80_core/n246 ), .B2(
        \i_tv80_core/n996 ), .C1(\i_tv80_core/n248 ), .C2(\i_tv80_core/n1004 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n768 ) );
  NAND2_X1 \i_tv80_core/U1052  ( .A1(\i_tv80_core/n376 ), .A2(
        \i_tv80_core/n763 ), .ZN(\i_tv80_core/n1088 ) );
  MUX2_X1 \i_tv80_core/U1051  ( .A(\i_tv80_core/n973 ), .B(\i_tv80_core/n1170 ), .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n763 ) );
  MUX2_X1 \i_tv80_core/U1050  ( .A(\i_tv80_core/n761 ), .B(\i_tv80_core/n996 ), 
        .S(\i_tv80_core/n760 ), .Z(\i_tv80_core/n1320 ) );
  NOR2_X1 \i_tv80_core/U1049  ( .A1(\i_tv80_core/n1170 ), .A2(
        \i_tv80_core/n1947 ), .ZN(\i_tv80_core/n761 ) );
  OAI22_X1 \i_tv80_core/U1048  ( .A1(\i_tv80_core/n1170 ), .A2(
        \i_tv80_core/n759 ), .B1(\i_tv80_core/n2138 ), .B2(\i_tv80_core/n758 ), 
        .ZN(\i_tv80_core/n1312 ) );
  OR2_X1 \i_tv80_core/U1047  ( .A1(\i_tv80_core/n757 ), .A2(\i_tv80_core/n756 ), .ZN(\i_tv80_core/n1278 ) );
  MUX2_X1 \i_tv80_core/U1046  ( .A(\i_tv80_core/n755 ), .B(\i_tv80_core/F [1]), 
        .S(\i_tv80_core/n754 ), .Z(\i_tv80_core/n757 ) );
  OAI22_X1 \i_tv80_core/U1045  ( .A1(\i_tv80_core/n1973 ), .A2(
        \i_tv80_core/n753 ), .B1(\i_tv80_core/n752 ), .B2(\i_tv80_core/n751 ), 
        .ZN(\i_tv80_core/n755 ) );
  AOI22_X1 \i_tv80_core/U1044  ( .A1(\i_tv80_core/F_Out [1]), .A2(
        \i_tv80_core/n278 ), .B1(\i_tv80_core/n277 ), .B2(\i_tv80_core/n750 ), 
        .ZN(\i_tv80_core/n752 ) );
  INV_X1 \i_tv80_core/U1043  ( .A(\i_tv80_core/n1572 ), .ZN(
        \i_tv80_core/n1973 ) );
  NAND2_X1 \i_tv80_core/U1042  ( .A1(\i_tv80_core/n376 ), .A2(
        \i_tv80_core/n749 ), .ZN(\i_tv80_core/n1089 ) );
  MUX2_X1 \i_tv80_core/U1041  ( .A(\i_tv80_core/n985 ), .B(\i_tv80_core/n1206 ), .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n749 ) );
  MUX2_X1 \i_tv80_core/U1040  ( .A(\i_tv80_core/n748 ), .B(\i_tv80_core/F [3]), 
        .S(\i_tv80_core/n747 ), .Z(\i_tv80_core/n1276 ) );
  OAI221_X1 \i_tv80_core/U1039  ( .B1(\i_tv80_core/n746 ), .B2(
        \i_tv80_core/n745 ), .C1(\i_tv80_core/n1978 ), .C2(\i_tv80_core/n753 ), 
        .A(\i_tv80_core/n376 ), .ZN(\i_tv80_core/n748 ) );
  INV_X1 \i_tv80_core/U1038  ( .A(\i_tv80_core/n1579 ), .ZN(
        \i_tv80_core/n1978 ) );
  AOI221_X1 \i_tv80_core/U1037  ( .B1(\i_tv80_core/F_Out [3]), .B2(
        \i_tv80_core/n278 ), .C1(\i_tv80_core/n987 ), .C2(\i_tv80_core/n277 ), 
        .A(\i_tv80_core/n744 ), .ZN(\i_tv80_core/n745 ) );
  OAI21_X1 \i_tv80_core/U1036  ( .B1(\i_tv80_core/n743 ), .B2(
        \i_tv80_core/n742 ), .A(\i_tv80_core/n741 ), .ZN(\i_tv80_core/n744 )
         );
  MUX2_X1 \i_tv80_core/U1035  ( .A(\i_tv80_core/n740 ), .B(\i_tv80_core/n739 ), 
        .S(\i_tv80_core/n1174 ), .Z(\i_tv80_core/n741 ) );
  NAND2_X1 \i_tv80_core/U1034  ( .A1(\i_tv80_core/n376 ), .A2(
        \i_tv80_core/n738 ), .ZN(\i_tv80_core/n1269 ) );
  MUX2_X1 \i_tv80_core/U1033  ( .A(\i_tv80_core/n737 ), .B(\i_tv80_core/n1204 ), .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n738 ) );
  OR2_X1 \i_tv80_core/U1032  ( .A1(\i_tv80_core/n736 ), .A2(\i_tv80_core/n756 ), .ZN(\i_tv80_core/n1275 ) );
  NAND2_X1 \i_tv80_core/U1031  ( .A1(\i_tv80_core/n350 ), .A2(
        \i_tv80_core/n735 ), .ZN(\i_tv80_core/n756 ) );
  NAND3_X1 \i_tv80_core/U1030  ( .A1(\i_tv80_core/n734 ), .A2(
        \i_tv80_core/n733 ), .A3(\i_tv80_core/n732 ), .ZN(\i_tv80_core/n735 )
         );
  INV_X1 \i_tv80_core/U1029  ( .A(\i_tv80_core/n739 ), .ZN(\i_tv80_core/n733 )
         );
  MUX2_X1 \i_tv80_core/U1028  ( .A(\i_tv80_core/n731 ), .B(\i_tv80_core/n730 ), 
        .S(\i_tv80_core/n754 ), .Z(\i_tv80_core/n736 ) );
  INV_X1 \i_tv80_core/U1027  ( .A(\i_tv80_core/n732 ), .ZN(\i_tv80_core/n754 )
         );
  OAI21_X1 \i_tv80_core/U1026  ( .B1(\i_tv80_core/n1947 ), .B2(
        \i_tv80_core/n729 ), .A(\i_tv80_core/n747 ), .ZN(\i_tv80_core/n732 )
         );
  INV_X1 \i_tv80_core/U1025  ( .A(\i_tv80_core/n1203 ), .ZN(\i_tv80_core/n730 ) );
  OAI22_X1 \i_tv80_core/U1024  ( .A1(\i_tv80_core/n1981 ), .A2(
        \i_tv80_core/n753 ), .B1(\i_tv80_core/n728 ), .B2(\i_tv80_core/n751 ), 
        .ZN(\i_tv80_core/n731 ) );
  AOI221_X1 \i_tv80_core/U1023  ( .B1(\i_tv80_core/n277 ), .B2(
        \i_tv80_core/n727 ), .C1(\i_tv80_core/F_Out [4]), .C2(
        \i_tv80_core/n278 ), .A(\i_tv80_core/n726 ), .ZN(\i_tv80_core/n728 )
         );
  NOR3_X1 \i_tv80_core/U1022  ( .A1(\i_tv80_core/I_SCF ), .A2(
        \i_tv80_core/n1207 ), .A3(\i_tv80_core/n725 ), .ZN(\i_tv80_core/n726 )
         );
  INV_X1 \i_tv80_core/U1021  ( .A(\i_tv80_core/n1594 ), .ZN(
        \i_tv80_core/n1981 ) );
  NAND2_X1 \i_tv80_core/U1020  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n724 ), .ZN(\i_tv80_core/n1090 ) );
  MUX2_X1 \i_tv80_core/U1019  ( .A(\i_tv80_core/n988 ), .B(\i_tv80_core/n1203 ), .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n724 ) );
  OAI21_X1 \i_tv80_core/U1018  ( .B1(\i_tv80_core/n723 ), .B2(
        \i_tv80_core/n722 ), .A(\i_tv80_core/n721 ), .ZN(\i_tv80_core/n1279 )
         );
  OAI21_X1 \i_tv80_core/U1017  ( .B1(\i_tv80_core/n1953 ), .B2(
        \i_tv80_core/n720 ), .A(\i_tv80_core/n719 ), .ZN(\i_tv80_core/n721 )
         );
  NOR3_X1 \i_tv80_core/U1016  ( .A1(\i_tv80_core/n718 ), .A2(
        \i_tv80_core/n717 ), .A3(\i_tv80_core/n716 ), .ZN(\i_tv80_core/n720 )
         );
  INV_X1 \i_tv80_core/U1015  ( .A(\i_tv80_core/n715 ), .ZN(\i_tv80_core/n718 )
         );
  AOI21_X1 \i_tv80_core/U1014  ( .B1(\i_tv80_core/n367 ), .B2(
        \i_tv80_core/n716 ), .A(\i_tv80_core/n714 ), .ZN(\i_tv80_core/n722 )
         );
  NAND2_X1 \i_tv80_core/U1013  ( .A1(\i_tv80_core/n713 ), .A2(
        \i_tv80_core/n712 ), .ZN(\i_tv80_core/n716 ) );
  AOI221_X1 \i_tv80_core/U1012  ( .B1(\i_tv80_core/n717 ), .B2(
        \i_tv80_core/n1955 ), .C1(\i_tv80_core/n711 ), .C2(\i_tv80_core/n710 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n723 ) );
  NAND2_X1 \i_tv80_core/U1011  ( .A1(\i_tv80_core/n983 ), .A2(
        \i_tv80_core/n708 ), .ZN(\i_tv80_core/n713 ) );
  MUX2_X1 \i_tv80_core/U1010  ( .A(\i_tv80_core/n707 ), .B(\i_tv80_core/n984 ), 
        .S(\i_tv80_core/ExchangeAF ), .Z(\i_tv80_core/n709 ) );
  NAND2_X1 \i_tv80_core/U1009  ( .A1(\i_tv80_core/n706 ), .A2(
        \i_tv80_core/n719 ), .ZN(\i_tv80_core/n707 ) );
  INV_X1 \i_tv80_core/U1008  ( .A(\i_tv80_core/n1207 ), .ZN(\i_tv80_core/n719 ) );
  INV_X1 \i_tv80_core/U1007  ( .A(\i_tv80_core/I_SCF ), .ZN(\i_tv80_core/n706 ) );
  NAND2_X1 \i_tv80_core/U1006  ( .A1(reset_n), .A2(\i_tv80_core/n705 ), .ZN(
        \i_tv80_core/n1271 ) );
  MUX2_X1 \i_tv80_core/U1005  ( .A(\i_tv80_core/n704 ), .B(\i_tv80_core/n1207 ), .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n705 ) );
  INV_X1 \i_tv80_core/U1004  ( .A(\i_tv80_core/n703 ), .ZN(\i_tv80_core/n1093 ) );
  AOI22_X1 \i_tv80_core/U1003  ( .A1(\i_tv80_core/PreserveC ), .A2(
        \i_tv80_core/n366 ), .B1(\i_tv80_core/n1953 ), .B2(\i_tv80_core/n702 ), 
        .ZN(\i_tv80_core/n703 ) );
  MUX2_X1 \i_tv80_core/U1002  ( .A(\i_tv80_core/n701 ), .B(\i_tv80_core/F [5]), 
        .S(\i_tv80_core/n747 ), .Z(\i_tv80_core/n1274 ) );
  INV_X1 \i_tv80_core/U1001  ( .A(\i_tv80_core/n700 ), .ZN(\i_tv80_core/n747 )
         );
  OAI21_X1 \i_tv80_core/U1000  ( .B1(\i_tv80_core/n699 ), .B2(
        \i_tv80_core/n1947 ), .A(\i_tv80_core/n350 ), .ZN(\i_tv80_core/n700 )
         );
  NOR3_X1 \i_tv80_core/U999  ( .A1(\i_tv80_core/n698 ), .A2(\i_tv80_core/n697 ), .A3(\i_tv80_core/n696 ), .ZN(\i_tv80_core/n699 ) );
  INV_X1 \i_tv80_core/U998  ( .A(\i_tv80_core/n712 ), .ZN(\i_tv80_core/n696 )
         );
  NAND3_X1 \i_tv80_core/U997  ( .A1(\i_tv80_core/n942 ), .A2(\i_tv80_core/n56 ), .A3(\i_tv80_core/n695 ), .ZN(\i_tv80_core/n712 ) );
  INV_X1 \i_tv80_core/U996  ( .A(\i_tv80_core/n742 ), .ZN(\i_tv80_core/n697 )
         );
  NAND3_X1 \i_tv80_core/U995  ( .A1(\i_tv80_core/n694 ), .A2(
        \i_tv80_core/n270 ), .A3(\i_tv80_core/n753 ), .ZN(\i_tv80_core/n698 )
         );
  OAI221_X1 \i_tv80_core/U994  ( .B1(\i_tv80_core/n746 ), .B2(
        \i_tv80_core/n693 ), .C1(\i_tv80_core/n1984 ), .C2(\i_tv80_core/n753 ), 
        .A(\i_tv80_core/n376 ), .ZN(\i_tv80_core/n701 ) );
  INV_X1 \i_tv80_core/U993  ( .A(\i_tv80_core/n826 ), .ZN(\i_tv80_core/n1984 )
         );
  AOI221_X1 \i_tv80_core/U992  ( .B1(\i_tv80_core/F_Out [5]), .B2(
        \i_tv80_core/n278 ), .C1(\i_tv80_core/n989 ), .C2(\i_tv80_core/n277 ), 
        .A(\i_tv80_core/n692 ), .ZN(\i_tv80_core/n693 ) );
  OAI21_X1 \i_tv80_core/U991  ( .B1(\i_tv80_core/n691 ), .B2(
        \i_tv80_core/n742 ), .A(\i_tv80_core/n690 ), .ZN(\i_tv80_core/n692 )
         );
  MUX2_X1 \i_tv80_core/U990  ( .A(\i_tv80_core/n740 ), .B(\i_tv80_core/n739 ), 
        .S(\i_tv80_core/n1172 ), .Z(\i_tv80_core/n690 ) );
  NAND2_X1 \i_tv80_core/U989  ( .A1(\i_tv80_core/n689 ), .A2(
        \i_tv80_core/n688 ), .ZN(\i_tv80_core/n739 ) );
  INV_X1 \i_tv80_core/U988  ( .A(\i_tv80_core/n695 ), .ZN(\i_tv80_core/n689 )
         );
  NAND2_X1 \i_tv80_core/U987  ( .A1(\i_tv80_core/n688 ), .A2(
        \i_tv80_core/n695 ), .ZN(\i_tv80_core/n740 ) );
  OR2_X1 \i_tv80_core/U986  ( .A1(\i_tv80_core/I_CCF ), .A2(
        \i_tv80_core/I_SCF ), .ZN(\i_tv80_core/n695 ) );
  INV_X1 \i_tv80_core/U985  ( .A(\i_tv80_core/n725 ), .ZN(\i_tv80_core/n688 )
         );
  NAND3_X1 \i_tv80_core/U984  ( .A1(\i_tv80_core/n694 ), .A2(
        \i_tv80_core/n742 ), .A3(\i_tv80_core/n687 ), .ZN(\i_tv80_core/n725 )
         );
  NAND3_X1 \i_tv80_core/U983  ( .A1(\i_tv80_core/I_BT ), .A2(tstate[0]), .A3(
        \i_tv80_core/n292 ), .ZN(\i_tv80_core/n742 ) );
  INV_X1 \i_tv80_core/U982  ( .A(\i_tv80_core/n710 ), .ZN(\i_tv80_core/n746 )
         );
  NAND2_X1 \i_tv80_core/U981  ( .A1(\i_tv80_core/n686 ), .A2(
        \i_tv80_core/n685 ), .ZN(\i_tv80_core/n1330 ) );
  AOI221_X1 \i_tv80_core/U980  ( .B1(\i_tv80_core/n252 ), .B2(
        \i_tv80_core/n826 ), .C1(\i_tv80_core/n225 ), .C2(\i_tv80_core/n684 ), 
        .A(\i_tv80_core/n683 ), .ZN(\i_tv80_core/n685 ) );
  MUX2_X1 \i_tv80_core/U979  ( .A(\i_tv80_core/n764 ), .B(\i_tv80_core/n58 ), 
        .S(\i_tv80_core/n1172 ), .Z(\i_tv80_core/n683 ) );
  OAI211_X1 \i_tv80_core/U978  ( .C1(\i_tv80_core/n1630 ), .C2(
        \i_tv80_core/n1599 ), .A(\i_tv80_core/n1600 ), .B(\i_tv80_core/n1601 ), 
        .ZN(\i_tv80_core/n826 ) );
  NAND2_X1 \i_tv80_core/U977  ( .A1(\i_tv80_core/ExchangeRp ), .A2(
        \i_tv80_core/BusB [5]), .ZN(\i_tv80_core/n1601 ) );
  NAND2_X1 \i_tv80_core/U976  ( .A1(\i_tv80_core/n682 ), .A2(di_reg[5]), .ZN(
        \i_tv80_core/n1600 ) );
  INV_X1 \i_tv80_core/U975  ( .A(\i_tv80_core/ALU_Q [5]), .ZN(
        \i_tv80_core/n1599 ) );
  AOI221_X1 \i_tv80_core/U974  ( .B1(\i_tv80_core/n246 ), .B2(
        \i_tv80_core/R [5]), .C1(\i_tv80_core/n248 ), .C2(\i_tv80_core/n1002 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n686 ) );
  NAND2_X1 \i_tv80_core/U973  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n681 ), .ZN(\i_tv80_core/n1086 ) );
  MUX2_X1 \i_tv80_core/U972  ( .A(\i_tv80_core/n971 ), .B(\i_tv80_core/n1172 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n681 ) );
  MUX2_X1 \i_tv80_core/U971  ( .A(\i_tv80_core/BusB [5]), .B(
        \i_tv80_core/N1220 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n2170 )
         );
  OAI21_X1 \i_tv80_core/U970  ( .B1(\i_tv80_core/n1155 ), .B2(
        \i_tv80_core/n680 ), .A(\i_tv80_core/n679 ), .ZN(\i_tv80_core/n1322 )
         );
  AOI22_X1 \i_tv80_core/U969  ( .A1(\i_tv80_core/N158 ), .A2(
        \i_tv80_core/n213 ), .B1(\i_tv80_core/n214 ), .B2(\i_tv80_core/ACC [5]), .ZN(\i_tv80_core/n679 ) );
  OAI21_X1 \i_tv80_core/U968  ( .B1(\i_tv80_core/n1160 ), .B2(
        \i_tv80_core/n680 ), .A(\i_tv80_core/n678 ), .ZN(\i_tv80_core/n1327 )
         );
  AOI22_X1 \i_tv80_core/U967  ( .A1(\i_tv80_core/N153 ), .A2(
        \i_tv80_core/n213 ), .B1(\i_tv80_core/n214 ), .B2(\i_tv80_core/ACC [0]), .ZN(\i_tv80_core/n678 ) );
  NAND2_X1 \i_tv80_core/U966  ( .A1(\i_tv80_core/n677 ), .A2(
        \i_tv80_core/n676 ), .ZN(\i_tv80_core/n1335 ) );
  AOI221_X1 \i_tv80_core/U965  ( .B1(\i_tv80_core/n252 ), .B2(
        \i_tv80_core/n1955 ), .C1(\i_tv80_core/n225 ), .C2(\i_tv80_core/n675 ), 
        .A(\i_tv80_core/n674 ), .ZN(\i_tv80_core/n676 ) );
  MUX2_X1 \i_tv80_core/U964  ( .A(\i_tv80_core/n764 ), .B(\i_tv80_core/n224 ), 
        .S(\i_tv80_core/n1177 ), .Z(\i_tv80_core/n674 ) );
  OAI21_X1 \i_tv80_core/U963  ( .B1(\i_tv80_core/n1037 ), .B2(
        \i_tv80_core/n673 ), .A(\i_tv80_core/n672 ), .ZN(\i_tv80_core/n1955 )
         );
  AOI22_X1 \i_tv80_core/U962  ( .A1(\i_tv80_core/ALU_Q [0]), .A2(
        \i_tv80_core/n671 ), .B1(\i_tv80_core/n682 ), .B2(di_reg[0]), .ZN(
        \i_tv80_core/n672 ) );
  AOI221_X1 \i_tv80_core/U961  ( .B1(\i_tv80_core/n246 ), .B2(
        \i_tv80_core/R [0]), .C1(\i_tv80_core/n248 ), .C2(\i_tv80_core/n997 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n677 ) );
  NAND2_X1 \i_tv80_core/U960  ( .A1(reset_n), .A2(\i_tv80_core/n670 ), .ZN(
        \i_tv80_core/n1081 ) );
  MUX2_X1 \i_tv80_core/U959  ( .A(\i_tv80_core/n966 ), .B(\i_tv80_core/n1177 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n670 ) );
  MUX2_X1 \i_tv80_core/U958  ( .A(\i_tv80_core/n1979 ), .B(\i_tv80_core/N1215 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n2175 ) );
  INV_X1 \i_tv80_core/U957  ( .A(\i_tv80_core/n1037 ), .ZN(\i_tv80_core/n1979 ) );
  OAI22_X1 \i_tv80_core/U956  ( .A1(\i_tv80_core/n1177 ), .A2(
        \i_tv80_core/n759 ), .B1(\i_tv80_core/n2072 ), .B2(\i_tv80_core/n758 ), 
        .ZN(\i_tv80_core/n1319 ) );
  OAI21_X1 \i_tv80_core/U955  ( .B1(\i_tv80_core/n1159 ), .B2(
        \i_tv80_core/n680 ), .A(\i_tv80_core/n669 ), .ZN(\i_tv80_core/n1326 )
         );
  AOI22_X1 \i_tv80_core/U954  ( .A1(\i_tv80_core/N154 ), .A2(
        \i_tv80_core/n213 ), .B1(\i_tv80_core/n214 ), .B2(\i_tv80_core/ACC [1]), .ZN(\i_tv80_core/n669 ) );
  NAND2_X1 \i_tv80_core/U953  ( .A1(\i_tv80_core/n668 ), .A2(
        \i_tv80_core/n667 ), .ZN(\i_tv80_core/n1334 ) );
  AOI221_X1 \i_tv80_core/U952  ( .B1(\i_tv80_core/n252 ), .B2(
        \i_tv80_core/n54 ), .C1(\i_tv80_core/n225 ), .C2(\i_tv80_core/n666 ), 
        .A(\i_tv80_core/n665 ), .ZN(\i_tv80_core/n667 ) );
  MUX2_X1 \i_tv80_core/U951  ( .A(\i_tv80_core/n764 ), .B(\i_tv80_core/n224 ), 
        .S(\i_tv80_core/n1176 ), .Z(\i_tv80_core/n665 ) );
  OAI222_X1 \i_tv80_core/U950  ( .A1(\i_tv80_core/n1894 ), .A2(
        \i_tv80_core/n664 ), .B1(\i_tv80_core/n1630 ), .B2(\i_tv80_core/n691 ), 
        .C1(\i_tv80_core/n1030 ), .C2(\i_tv80_core/n673 ), .ZN(
        \i_tv80_core/n1572 ) );
  INV_X1 \i_tv80_core/U949  ( .A(\i_tv80_core/ALU_Q [1]), .ZN(
        \i_tv80_core/n691 ) );
  AOI221_X1 \i_tv80_core/U948  ( .B1(\i_tv80_core/n246 ), .B2(
        \i_tv80_core/R [1]), .C1(\i_tv80_core/n248 ), .C2(\i_tv80_core/n998 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n668 ) );
  NAND2_X1 \i_tv80_core/U947  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n663 ), .ZN(\i_tv80_core/n1082 ) );
  MUX2_X1 \i_tv80_core/U946  ( .A(\i_tv80_core/n967 ), .B(\i_tv80_core/n1176 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n663 ) );
  MUX2_X1 \i_tv80_core/U945  ( .A(\i_tv80_core/BusB [1]), .B(
        \i_tv80_core/N1216 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n2174 )
         );
  OAI22_X1 \i_tv80_core/U944  ( .A1(\i_tv80_core/n1176 ), .A2(
        \i_tv80_core/n759 ), .B1(\i_tv80_core/n2087 ), .B2(\i_tv80_core/n758 ), 
        .ZN(\i_tv80_core/n1318 ) );
  OAI21_X1 \i_tv80_core/U943  ( .B1(\i_tv80_core/n1158 ), .B2(
        \i_tv80_core/n680 ), .A(\i_tv80_core/n662 ), .ZN(\i_tv80_core/n1325 )
         );
  AOI22_X1 \i_tv80_core/U942  ( .A1(\i_tv80_core/N155 ), .A2(
        \i_tv80_core/n213 ), .B1(\i_tv80_core/n214 ), .B2(\i_tv80_core/ACC [2]), .ZN(\i_tv80_core/n662 ) );
  NAND2_X1 \i_tv80_core/U941  ( .A1(\i_tv80_core/n661 ), .A2(
        \i_tv80_core/n660 ), .ZN(\i_tv80_core/n1333 ) );
  AOI221_X1 \i_tv80_core/U940  ( .B1(\i_tv80_core/n252 ), .B2(
        \i_tv80_core/n1974 ), .C1(\i_tv80_core/n225 ), .C2(\i_tv80_core/n659 ), 
        .A(\i_tv80_core/n658 ), .ZN(\i_tv80_core/n660 ) );
  MUX2_X1 \i_tv80_core/U939  ( .A(\i_tv80_core/n764 ), .B(\i_tv80_core/n58 ), 
        .S(\i_tv80_core/n1175 ), .Z(\i_tv80_core/n658 ) );
  AOI221_X1 \i_tv80_core/U938  ( .B1(\i_tv80_core/n246 ), .B2(
        \i_tv80_core/R [2]), .C1(\i_tv80_core/n248 ), .C2(\i_tv80_core/n999 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n661 ) );
  NAND2_X1 \i_tv80_core/U937  ( .A1(reset_n), .A2(\i_tv80_core/n657 ), .ZN(
        \i_tv80_core/n1083 ) );
  MUX2_X1 \i_tv80_core/U936  ( .A(\i_tv80_core/n968 ), .B(\i_tv80_core/n1175 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n657 ) );
  OAI22_X1 \i_tv80_core/U935  ( .A1(\i_tv80_core/n1175 ), .A2(
        \i_tv80_core/n759 ), .B1(\i_tv80_core/n2095 ), .B2(\i_tv80_core/n758 ), 
        .ZN(\i_tv80_core/n1317 ) );
  OAI21_X1 \i_tv80_core/U934  ( .B1(\i_tv80_core/n1157 ), .B2(
        \i_tv80_core/n680 ), .A(\i_tv80_core/n656 ), .ZN(\i_tv80_core/n1324 )
         );
  AOI22_X1 \i_tv80_core/U933  ( .A1(\i_tv80_core/N156 ), .A2(
        \i_tv80_core/n213 ), .B1(\i_tv80_core/n214 ), .B2(\i_tv80_core/ACC [3]), .ZN(\i_tv80_core/n656 ) );
  NAND2_X1 \i_tv80_core/U932  ( .A1(\i_tv80_core/n655 ), .A2(
        \i_tv80_core/n654 ), .ZN(\i_tv80_core/n1332 ) );
  AOI221_X1 \i_tv80_core/U931  ( .B1(\i_tv80_core/n252 ), .B2(
        \i_tv80_core/n1579 ), .C1(\i_tv80_core/n225 ), .C2(\i_tv80_core/n653 ), 
        .A(\i_tv80_core/n652 ), .ZN(\i_tv80_core/n654 ) );
  MUX2_X1 \i_tv80_core/U930  ( .A(\i_tv80_core/n764 ), .B(\i_tv80_core/n224 ), 
        .S(\i_tv80_core/n1174 ), .Z(\i_tv80_core/n652 ) );
  OAI222_X1 \i_tv80_core/U929  ( .A1(\i_tv80_core/n2032 ), .A2(
        \i_tv80_core/n664 ), .B1(\i_tv80_core/n1630 ), .B2(\i_tv80_core/n743 ), 
        .C1(\i_tv80_core/n1032 ), .C2(\i_tv80_core/n673 ), .ZN(
        \i_tv80_core/n1579 ) );
  INV_X1 \i_tv80_core/U928  ( .A(\i_tv80_core/ALU_Q [3]), .ZN(
        \i_tv80_core/n743 ) );
  INV_X1 \i_tv80_core/U927  ( .A(di_reg[3]), .ZN(\i_tv80_core/n2032 ) );
  AOI221_X1 \i_tv80_core/U926  ( .B1(\i_tv80_core/n246 ), .B2(
        \i_tv80_core/R [3]), .C1(\i_tv80_core/n248 ), .C2(\i_tv80_core/n1000 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n655 ) );
  NAND2_X1 \i_tv80_core/U925  ( .A1(reset_n), .A2(\i_tv80_core/n651 ), .ZN(
        \i_tv80_core/n1084 ) );
  MUX2_X1 \i_tv80_core/U924  ( .A(\i_tv80_core/n969 ), .B(\i_tv80_core/n1174 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n651 ) );
  MUX2_X1 \i_tv80_core/U923  ( .A(\i_tv80_core/BusB [3]), .B(
        \i_tv80_core/N1218 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n2172 )
         );
  OAI22_X1 \i_tv80_core/U922  ( .A1(\i_tv80_core/n1174 ), .A2(
        \i_tv80_core/n759 ), .B1(\i_tv80_core/n2103 ), .B2(\i_tv80_core/n758 ), 
        .ZN(\i_tv80_core/n1316 ) );
  OAI21_X1 \i_tv80_core/U921  ( .B1(\i_tv80_core/n1156 ), .B2(
        \i_tv80_core/n680 ), .A(\i_tv80_core/n650 ), .ZN(\i_tv80_core/n1323 )
         );
  AOI22_X1 \i_tv80_core/U920  ( .A1(\i_tv80_core/N157 ), .A2(
        \i_tv80_core/n213 ), .B1(\i_tv80_core/n214 ), .B2(\i_tv80_core/ACC [4]), .ZN(\i_tv80_core/n650 ) );
  NAND2_X1 \i_tv80_core/U919  ( .A1(\i_tv80_core/n649 ), .A2(
        \i_tv80_core/n648 ), .ZN(\i_tv80_core/n1331 ) );
  AOI221_X1 \i_tv80_core/U918  ( .B1(\i_tv80_core/n252 ), .B2(
        \i_tv80_core/n1594 ), .C1(\i_tv80_core/n225 ), .C2(\i_tv80_core/n647 ), 
        .A(\i_tv80_core/n646 ), .ZN(\i_tv80_core/n648 ) );
  MUX2_X1 \i_tv80_core/U917  ( .A(\i_tv80_core/n764 ), .B(\i_tv80_core/n58 ), 
        .S(\i_tv80_core/n1173 ), .Z(\i_tv80_core/n646 ) );
  OAI21_X1 \i_tv80_core/U916  ( .B1(\i_tv80_core/n1033 ), .B2(
        \i_tv80_core/n673 ), .A(\i_tv80_core/n645 ), .ZN(\i_tv80_core/n1594 )
         );
  AOI22_X1 \i_tv80_core/U915  ( .A1(\i_tv80_core/ALU_Q [4]), .A2(
        \i_tv80_core/n671 ), .B1(\i_tv80_core/n682 ), .B2(di_reg[4]), .ZN(
        \i_tv80_core/n645 ) );
  AOI221_X1 \i_tv80_core/U914  ( .B1(\i_tv80_core/n246 ), .B2(
        \i_tv80_core/R [4]), .C1(\i_tv80_core/n248 ), .C2(\i_tv80_core/n1001 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n649 ) );
  NAND2_X1 \i_tv80_core/U913  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n644 ), .ZN(\i_tv80_core/n1085 ) );
  MUX2_X1 \i_tv80_core/U912  ( .A(\i_tv80_core/n970 ), .B(\i_tv80_core/n1173 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n644 ) );
  MUX2_X1 \i_tv80_core/U911  ( .A(\i_tv80_core/BusB [4]), .B(
        \i_tv80_core/N1219 ), .S(\i_tv80_core/n371 ), .Z(\i_tv80_core/n2171 )
         );
  OAI22_X1 \i_tv80_core/U910  ( .A1(\i_tv80_core/n1173 ), .A2(
        \i_tv80_core/n759 ), .B1(\i_tv80_core/n2111 ), .B2(\i_tv80_core/n758 ), 
        .ZN(\i_tv80_core/n1315 ) );
  OAI21_X1 \i_tv80_core/U909  ( .B1(\i_tv80_core/n1154 ), .B2(
        \i_tv80_core/n680 ), .A(\i_tv80_core/n643 ), .ZN(\i_tv80_core/n1321 )
         );
  AOI22_X1 \i_tv80_core/U908  ( .A1(\i_tv80_core/N159 ), .A2(
        \i_tv80_core/n213 ), .B1(\i_tv80_core/n214 ), .B2(\i_tv80_core/ACC [6]), .ZN(\i_tv80_core/n643 ) );
  NAND2_X1 \i_tv80_core/U907  ( .A1(\i_tv80_core/n760 ), .A2(
        \i_tv80_core/n2011 ), .ZN(\i_tv80_core/n680 ) );
  NAND3_X1 \i_tv80_core/U906  ( .A1(\i_tv80_core/Special_LD [0]), .A2(
        \i_tv80_core/n212 ), .A3(\i_tv80_core/Special_LD [1]), .ZN(
        \i_tv80_core/n641 ) );
  NAND2_X1 \i_tv80_core/U905  ( .A1(\i_tv80_core/n639 ), .A2(
        \i_tv80_core/n638 ), .ZN(\i_tv80_core/n1329 ) );
  AOI221_X1 \i_tv80_core/U904  ( .B1(\i_tv80_core/n252 ), .B2(
        \i_tv80_core/n1613 ), .C1(\i_tv80_core/n225 ), .C2(\i_tv80_core/n637 ), 
        .A(\i_tv80_core/n636 ), .ZN(\i_tv80_core/n638 ) );
  MUX2_X1 \i_tv80_core/U903  ( .A(\i_tv80_core/n764 ), .B(\i_tv80_core/n58 ), 
        .S(\i_tv80_core/n1171 ), .Z(\i_tv80_core/n636 ) );
  INV_X1 \i_tv80_core/U902  ( .A(\i_tv80_core/ExchangeAF ), .ZN(
        \i_tv80_core/n687 ) );
  INV_X1 \i_tv80_core/U901  ( .A(\i_tv80_core/n632 ), .ZN(\i_tv80_core/n633 )
         );
  AOI221_X1 \i_tv80_core/U900  ( .B1(\i_tv80_core/n246 ), .B2(
        \i_tv80_core/R [6]), .C1(\i_tv80_core/n248 ), .C2(\i_tv80_core/n1003 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n639 ) );
  NAND3_X1 \i_tv80_core/U899  ( .A1(\i_tv80_core/n862 ), .A2(
        \i_tv80_core/n628 ), .A3(\i_tv80_core/n275 ), .ZN(\i_tv80_core/n629 )
         );
  NAND2_X1 \i_tv80_core/U898  ( .A1(\i_tv80_core/n627 ), .A2(
        \i_tv80_core/n367 ), .ZN(\i_tv80_core/n764 ) );
  NAND3_X1 \i_tv80_core/U897  ( .A1(\i_tv80_core/n270 ), .A2(
        \i_tv80_core/n634 ), .A3(\i_tv80_core/n632 ), .ZN(\i_tv80_core/n627 )
         );
  NAND2_X1 \i_tv80_core/U896  ( .A1(\i_tv80_core/n626 ), .A2(
        \i_tv80_core/n1957 ), .ZN(\i_tv80_core/n632 ) );
  INV_X1 \i_tv80_core/U895  ( .A(\i_tv80_core/n625 ), .ZN(\i_tv80_core/n626 )
         );
  NAND3_X1 \i_tv80_core/U894  ( .A1(\i_tv80_core/I_CPL ), .A2(
        \i_tv80_core/n942 ), .A3(\i_tv80_core/n56 ), .ZN(\i_tv80_core/n624 )
         );
  NAND2_X1 \i_tv80_core/U893  ( .A1(\i_tv80_core/ExchangeAF ), .A2(
        \i_tv80_core/n942 ), .ZN(\i_tv80_core/n715 ) );
  NAND2_X1 \i_tv80_core/U892  ( .A1(reset_n), .A2(\i_tv80_core/n623 ), .ZN(
        \i_tv80_core/n1087 ) );
  MUX2_X1 \i_tv80_core/U891  ( .A(\i_tv80_core/n972 ), .B(\i_tv80_core/n1171 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n623 ) );
  OAI22_X1 \i_tv80_core/U890  ( .A1(\i_tv80_core/n1171 ), .A2(
        \i_tv80_core/n759 ), .B1(\i_tv80_core/n2127 ), .B2(\i_tv80_core/n758 ), 
        .ZN(\i_tv80_core/n1313 ) );
  OAI22_X1 \i_tv80_core/U889  ( .A1(\i_tv80_core/n1172 ), .A2(
        \i_tv80_core/n759 ), .B1(\i_tv80_core/n2119 ), .B2(\i_tv80_core/n758 ), 
        .ZN(\i_tv80_core/n1314 ) );
  NAND2_X1 \i_tv80_core/U888  ( .A1(\i_tv80_core/n367 ), .A2(
        \i_tv80_core/n758 ), .ZN(\i_tv80_core/n759 ) );
  NAND2_X1 \i_tv80_core/U887  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n622 ), .ZN(\i_tv80_core/n758 ) );
  NAND4_X1 \i_tv80_core/U886  ( .A1(\i_tv80_core/Special_LD [1]), .A2(
        \i_tv80_core/n368 ), .A3(\i_tv80_core/n640 ), .A4(\i_tv80_core/n630 ), 
        .ZN(\i_tv80_core/n622 ) );
  INV_X1 \i_tv80_core/U885  ( .A(\i_tv80_core/Special_LD [0]), .ZN(
        \i_tv80_core/n630 ) );
  NAND2_X1 \i_tv80_core/U884  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n621 ), .ZN(\i_tv80_core/n1268 ) );
  MUX2_X1 \i_tv80_core/U883  ( .A(\i_tv80_core/n620 ), .B(\i_tv80_core/n1202 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n621 ) );
  INV_X1 \i_tv80_core/U882  ( .A(\i_tv80_core/n619 ), .ZN(\i_tv80_core/n1272 )
         );
  MUX2_X1 \i_tv80_core/U881  ( .A(\i_tv80_core/n618 ), .B(\i_tv80_core/n1200 ), 
        .S(\i_tv80_core/n264 ), .Z(\i_tv80_core/n619 ) );
  AOI221_X1 \i_tv80_core/U880  ( .B1(\i_tv80_core/F_Out [7]), .B2(
        \i_tv80_core/n617 ), .C1(\i_tv80_core/n1518 ), .C2(\i_tv80_core/n717 ), 
        .A(\i_tv80_core/n616 ), .ZN(\i_tv80_core/n618 ) );
  OAI221_X1 \i_tv80_core/U879  ( .B1(\i_tv80_core/n2061 ), .B2(
        \i_tv80_core/n615 ), .C1(\i_tv80_core/n614 ), .C2(\i_tv80_core/n613 ), 
        .A(\i_tv80_core/n376 ), .ZN(\i_tv80_core/n616 ) );
  INV_X1 \i_tv80_core/U878  ( .A(di_reg[7]), .ZN(\i_tv80_core/n2061 ) );
  OAI211_X1 \i_tv80_core/U877  ( .C1(\i_tv80_core/n1630 ), .C2(
        \i_tv80_core/n1631 ), .A(\i_tv80_core/n1632 ), .B(\i_tv80_core/n1633 ), 
        .ZN(\i_tv80_core/n1518 ) );
  NAND2_X1 \i_tv80_core/U876  ( .A1(\i_tv80_core/ExchangeRp ), .A2(
        \i_tv80_core/BusB [7]), .ZN(\i_tv80_core/n1633 ) );
  NAND2_X1 \i_tv80_core/U875  ( .A1(\i_tv80_core/n682 ), .A2(di_reg[7]), .ZN(
        \i_tv80_core/n1632 ) );
  INV_X1 \i_tv80_core/U874  ( .A(\i_tv80_core/ALU_Q [7]), .ZN(
        \i_tv80_core/n1631 ) );
  MUX2_X1 \i_tv80_core/U873  ( .A(\i_tv80_core/BusB [7]), .B(
        \i_tv80_core/N1222 ), .S(\i_tv80_core/n371 ), .Z(\i_tv80_core/n2168 )
         );
  NAND2_X1 \i_tv80_core/U872  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n612 ), .ZN(\i_tv80_core/n1266 ) );
  MUX2_X1 \i_tv80_core/U871  ( .A(\i_tv80_core/n613 ), .B(\i_tv80_core/n1200 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n612 ) );
  MUX2_X1 \i_tv80_core/U870  ( .A(\i_tv80_core/n611 ), .B(\i_tv80_core/n610 ), 
        .S(tstate[1]), .Z(\i_tv80_core/n1379 ) );
  NOR3_X1 \i_tv80_core/U869  ( .A1(\i_tv80_core/n609 ), .A2(
        \i_tv80_core/n2149 ), .A3(\i_tv80_core/n608 ), .ZN(\i_tv80_core/n611 )
         );
  MUX2_X1 \i_tv80_core/U868  ( .A(\i_tv80_core/n607 ), .B(tstate[0]), .S(
        \i_tv80_core/n609 ), .Z(\i_tv80_core/n1378 ) );
  INV_X1 \i_tv80_core/U867  ( .A(\i_tv80_core/n606 ), .ZN(\i_tv80_core/n609 )
         );
  NOR2_X1 \i_tv80_core/U866  ( .A1(\i_tv80_core/n605 ), .A2(
        \i_tv80_core/n2149 ), .ZN(\i_tv80_core/n607 ) );
  INV_X1 \i_tv80_core/U865  ( .A(\i_tv80_core/n608 ), .ZN(\i_tv80_core/n605 )
         );
  NAND2_X1 \i_tv80_core/U864  ( .A1(tstate[0]), .A2(\i_tv80_core/n771 ), .ZN(
        \i_tv80_core/n608 ) );
  OAI22_X1 \i_tv80_core/U863  ( .A1(\i_tv80_core/n964 ), .A2(
        \i_tv80_core/n2148 ), .B1(\i_tv80_core/n1231 ), .B2(
        \i_tv80_core/n2149 ), .ZN(\i_tv80_core/n1220 ) );
  OAI22_X1 \i_tv80_core/U862  ( .A1(\i_tv80_core/n604 ), .A2(
        \i_tv80_core/n603 ), .B1(\i_tv80_core/n1231 ), .B2(\i_tv80_core/n2148 ), .ZN(\i_tv80_core/n1380 ) );
  AOI21_X1 \i_tv80_core/U861  ( .B1(\i_tv80_core/n1565 ), .B2(
        \i_tv80_core/n602 ), .A(iorq), .ZN(\i_tv80_core/n604 ) );
  OAI22_X1 \i_tv80_core/U860  ( .A1(\i_tv80_core/n601 ), .A2(
        \i_tv80_core/n600 ), .B1(\i_tv80_core/n1223 ), .B2(\i_tv80_core/n599 ), 
        .ZN(\i_tv80_core/n1384 ) );
  AOI221_X1 \i_tv80_core/U859  ( .B1(\i_tv80_core/n598 ), .B2(
        \i_tv80_core/n597 ), .C1(\i_tv80_core/n596 ), .C2(\i_tv80_core/n595 ), 
        .A(\i_tv80_core/n594 ), .ZN(\i_tv80_core/n601 ) );
  XOR2_X1 \i_tv80_core/U858  ( .A(\i_tv80_core/n593 ), .B(\i_tv80_core/n1226 ), 
        .Z(\i_tv80_core/n595 ) );
  NAND2_X1 \i_tv80_core/U857  ( .A1(\i_tv80_core/n1223 ), .A2(
        \i_tv80_core/n1943 ), .ZN(\i_tv80_core/n597 ) );
  OAI22_X1 \i_tv80_core/U856  ( .A1(\i_tv80_core/n1223 ), .A2(
        \i_tv80_core/n592 ), .B1(\i_tv80_core/n1226 ), .B2(\i_tv80_core/n64 ), 
        .ZN(\i_tv80_core/n1348 ) );
  OAI221_X1 \i_tv80_core/U855  ( .B1(\i_tv80_core/n590 ), .B2(
        \i_tv80_core/n600 ), .C1(\i_tv80_core/n1225 ), .C2(\i_tv80_core/n599 ), 
        .A(\i_tv80_core/n376 ), .ZN(\i_tv80_core/n1368 ) );
  AOI21_X1 \i_tv80_core/U854  ( .B1(\i_tv80_core/n589 ), .B2(
        \i_tv80_core/n126 ), .A(\i_tv80_core/n283 ), .ZN(\i_tv80_core/n590 )
         );
  MUX2_X1 \i_tv80_core/U853  ( .A(\i_tv80_core/n588 ), .B(\i_tv80_core/n1228 ), 
        .S(\i_tv80_core/n596 ), .Z(\i_tv80_core/n589 ) );
  MUX2_X1 \i_tv80_core/U852  ( .A(\i_tv80_core/n587 ), .B(\i_tv80_core/n51 ), 
        .S(\i_tv80_core/n586 ), .Z(\i_tv80_core/n1353 ) );
  NOR3_X1 \i_tv80_core/U851  ( .A1(\i_tv80_core/n585 ), .A2(
        \i_tv80_core/n1947 ), .A3(\i_tv80_core/n1066 ), .ZN(\i_tv80_core/n587 ) );
  MUX2_X1 \i_tv80_core/U850  ( .A(\i_tv80_core/n584 ), .B(\i_tv80_core/n46 ), 
        .S(\i_tv80_core/n586 ), .Z(\i_tv80_core/n1352 ) );
  INV_X1 \i_tv80_core/U849  ( .A(\i_tv80_core/n583 ), .ZN(\i_tv80_core/n586 )
         );
  OAI21_X1 \i_tv80_core/U848  ( .B1(\i_tv80_core/n2011 ), .B2(
        \i_tv80_core/n582 ), .A(\i_tv80_core/n581 ), .ZN(\i_tv80_core/n583 )
         );
  INV_X1 \i_tv80_core/U847  ( .A(\i_tv80_core/n580 ), .ZN(\i_tv80_core/n581 )
         );
  NOR3_X1 \i_tv80_core/U846  ( .A1(\i_tv80_core/n1163 ), .A2(
        \i_tv80_core/n1947 ), .A3(\i_tv80_core/n585 ), .ZN(\i_tv80_core/n584 )
         );
  MUX2_X1 \i_tv80_core/U845  ( .A(\i_tv80_core/n1992 ), .B(\i_tv80_core/n1848 ), .S(\i_tv80_core/n579 ), .Z(\i_tv80_core/n1107 ) );
  NOR2_X1 \i_tv80_core/U844  ( .A1(\i_tv80_core/n251 ), .A2(\i_tv80_core/n580 ), .ZN(\i_tv80_core/n579 ) );
  OAI21_X1 \i_tv80_core/U843  ( .B1(\i_tv80_core/Prefix [0]), .B2(
        \i_tv80_core/n2011 ), .A(\i_tv80_core/n350 ), .ZN(\i_tv80_core/n580 )
         );
  INV_X1 \i_tv80_core/U842  ( .A(\i_tv80_core/n578 ), .ZN(\i_tv80_core/n1358 )
         );
  AOI221_X1 \i_tv80_core/U841  ( .B1(\i_tv80_core/n577 ), .B2(
        \i_tv80_core/n576 ), .C1(di[1]), .C2(\i_tv80_core/n575 ), .A(
        \i_tv80_core/n284 ), .ZN(\i_tv80_core/n578 ) );
  INV_X1 \i_tv80_core/U840  ( .A(\i_tv80_core/n574 ), .ZN(\i_tv80_core/n1354 )
         );
  AOI221_X1 \i_tv80_core/U839  ( .B1(\i_tv80_core/n577 ), .B2(
        \i_tv80_core/n1066 ), .C1(di[5]), .C2(\i_tv80_core/n575 ), .A(
        \i_tv80_core/n284 ), .ZN(\i_tv80_core/n574 ) );
  INV_X1 \i_tv80_core/U838  ( .A(\i_tv80_core/n1163 ), .ZN(\i_tv80_core/n1066 ) );
  INV_X1 \i_tv80_core/U837  ( .A(\i_tv80_core/n573 ), .ZN(\i_tv80_core/n1357 )
         );
  AOI221_X1 \i_tv80_core/U836  ( .B1(\i_tv80_core/n577 ), .B2(
        \i_tv80_core/n166 ), .C1(di[2]), .C2(\i_tv80_core/n575 ), .A(
        \i_tv80_core/n284 ), .ZN(\i_tv80_core/n573 ) );
  INV_X1 \i_tv80_core/U835  ( .A(\i_tv80_core/n572 ), .ZN(\i_tv80_core/n1359 )
         );
  AOI221_X1 \i_tv80_core/U834  ( .B1(\i_tv80_core/n577 ), .B2(
        \i_tv80_core/n162 ), .C1(di[0]), .C2(\i_tv80_core/n575 ), .A(
        \i_tv80_core/n284 ), .ZN(\i_tv80_core/n572 ) );
  INV_X1 \i_tv80_core/U833  ( .A(\i_tv80_core/n571 ), .ZN(\i_tv80_core/n1356 )
         );
  AOI221_X1 \i_tv80_core/U832  ( .B1(\i_tv80_core/n577 ), .B2(
        \i_tv80_core/n570 ), .C1(di[3]), .C2(\i_tv80_core/n575 ), .A(
        \i_tv80_core/n284 ), .ZN(\i_tv80_core/n571 ) );
  INV_X1 \i_tv80_core/U831  ( .A(\i_tv80_core/n569 ), .ZN(\i_tv80_core/n1351 )
         );
  AOI221_X1 \i_tv80_core/U830  ( .B1(\i_tv80_core/n577 ), .B2(
        \i_tv80_core/n568 ), .C1(di[6]), .C2(\i_tv80_core/n575 ), .A(
        \i_tv80_core/n284 ), .ZN(\i_tv80_core/n569 ) );
  INV_X1 \i_tv80_core/U829  ( .A(\i_tv80_core/n567 ), .ZN(\i_tv80_core/n1350 )
         );
  AOI221_X1 \i_tv80_core/U828  ( .B1(di[7]), .B2(\i_tv80_core/n575 ), .C1(
        \i_tv80_core/n577 ), .C2(\i_tv80_core/n184 ), .A(\i_tv80_core/n284 ), 
        .ZN(\i_tv80_core/n567 ) );
  OAI21_X1 \i_tv80_core/U827  ( .B1(halt_n), .B2(\i_tv80_core/n566 ), .A(
        \i_tv80_core/n565 ), .ZN(\i_tv80_core/n1360 ) );
  NAND3_X1 \i_tv80_core/U826  ( .A1(\i_tv80_core/Halt ), .A2(
        \i_tv80_core/n564 ), .A3(\i_tv80_core/n563 ), .ZN(\i_tv80_core/n565 )
         );
  AOI21_X1 \i_tv80_core/U825  ( .B1(\i_tv80_core/n936 ), .B2(
        \i_tv80_core/n350 ), .A(\i_tv80_core/n2152 ), .ZN(\i_tv80_core/n566 )
         );
  INV_X1 \i_tv80_core/U824  ( .A(\i_tv80_core/n2148 ), .ZN(\i_tv80_core/n2152 ) );
  INV_X1 \i_tv80_core/U823  ( .A(\i_tv80_core/n602 ), .ZN(\i_tv80_core/n936 )
         );
  OAI22_X1 \i_tv80_core/U822  ( .A1(\i_tv80_core/n562 ), .A2(
        \i_tv80_core/n561 ), .B1(\i_tv80_core/n1137 ), .B2(\i_tv80_core/n560 ), 
        .ZN(\i_tv80_core/n1365 ) );
  OAI22_X1 \i_tv80_core/U821  ( .A1(\i_tv80_core/n582 ), .A2(
        \i_tv80_core/n561 ), .B1(\i_tv80_core/n1136 ), .B2(\i_tv80_core/n560 ), 
        .ZN(\i_tv80_core/n1364 ) );
  NAND3_X1 \i_tv80_core/U820  ( .A1(\i_tv80_core/n368 ), .A2(
        \i_tv80_core/n585 ), .A3(\i_tv80_core/n560 ), .ZN(\i_tv80_core/n561 )
         );
  NAND2_X1 \i_tv80_core/U819  ( .A1(\i_tv80_core/n223 ), .A2(
        \i_tv80_core/n559 ), .ZN(\i_tv80_core/n560 ) );
  NAND3_X1 \i_tv80_core/U818  ( .A1(\i_tv80_core/n251 ), .A2(
        \i_tv80_core/Prefix [0]), .A3(\i_tv80_core/n582 ), .ZN(
        \i_tv80_core/n559 ) );
  INV_X1 \i_tv80_core/U817  ( .A(\i_tv80_core/n1875 ), .ZN(\i_tv80_core/n1873 ) );
  NAND3_X1 \i_tv80_core/U816  ( .A1(\i_tv80_core/n1225 ), .A2(mcycle[2]), .A3(
        \i_tv80_core/n2179 ), .ZN(\i_tv80_core/n1875 ) );
  NAND2_X1 \i_tv80_core/U815  ( .A1(\i_tv80_core/Prefix [0]), .A2(
        \i_tv80_core/Prefix [1]), .ZN(\i_tv80_core/n585 ) );
  OAI22_X1 \i_tv80_core/U814  ( .A1(\i_tv80_core/n1224 ), .A2(
        \i_tv80_core/n558 ), .B1(\i_tv80_core/n557 ), .B2(\i_tv80_core/n600 ), 
        .ZN(\i_tv80_core/n1367 ) );
  NAND2_X1 \i_tv80_core/U813  ( .A1(\i_tv80_core/n2159 ), .A2(
        \i_tv80_core/n599 ), .ZN(\i_tv80_core/n600 ) );
  INV_X1 \i_tv80_core/U812  ( .A(\i_tv80_core/n126 ), .ZN(\i_tv80_core/n594 )
         );
  NOR2_X1 \i_tv80_core/U811  ( .A1(\i_tv80_core/n2179 ), .A2(
        \i_tv80_core/n554 ), .ZN(\i_tv80_core/n555 ) );
  XOR2_X1 \i_tv80_core/U810  ( .A(\i_tv80_core/n1228 ), .B(\i_tv80_core/n1227 ), .Z(\i_tv80_core/n556 ) );
  INV_X1 \i_tv80_core/U809  ( .A(\i_tv80_core/n553 ), .ZN(\i_tv80_core/n596 )
         );
  AOI21_X1 \i_tv80_core/U808  ( .B1(\i_tv80_core/n283 ), .B2(
        \i_tv80_core/n2159 ), .A(\i_tv80_core/n552 ), .ZN(\i_tv80_core/n558 )
         );
  INV_X1 \i_tv80_core/U807  ( .A(\i_tv80_core/n554 ), .ZN(\i_tv80_core/n598 )
         );
  OAI22_X1 \i_tv80_core/U806  ( .A1(\i_tv80_core/n1225 ), .A2(
        \i_tv80_core/n592 ), .B1(\i_tv80_core/n1228 ), .B2(\i_tv80_core/n64 ), 
        .ZN(\i_tv80_core/n1349 ) );
  OAI22_X1 \i_tv80_core/U805  ( .A1(\i_tv80_core/n592 ), .A2(
        \i_tv80_core/n1224 ), .B1(\i_tv80_core/n1227 ), .B2(\i_tv80_core/n64 ), 
        .ZN(\i_tv80_core/n1347 ) );
  NAND2_X1 \i_tv80_core/U804  ( .A1(\i_tv80_core/n591 ), .A2(
        \i_tv80_core/n2159 ), .ZN(\i_tv80_core/n592 ) );
  OAI22_X1 \i_tv80_core/U803  ( .A1(\i_tv80_core/n550 ), .A2(
        \i_tv80_core/n2149 ), .B1(\i_tv80_core/n2148 ), .B2(\i_tv80_core/n549 ), .ZN(\i_tv80_core/n1385 ) );
  AOI221_X1 \i_tv80_core/U802  ( .B1(\i_tv80_core/n1205 ), .B2(
        \i_tv80_core/n548 ), .C1(\i_tv80_core/n1164 ), .C2(\i_tv80_core/n769 ), 
        .A(\i_tv80_core/n547 ), .ZN(\i_tv80_core/n550 ) );
  AOI21_X1 \i_tv80_core/U801  ( .B1(\i_tv80_core/n546 ), .B2(
        \i_tv80_core/n545 ), .A(\i_tv80_core/n1201 ), .ZN(\i_tv80_core/n547 )
         );
  NAND2_X1 \i_tv80_core/U800  ( .A1(\i_tv80_core/n544 ), .A2(
        \i_tv80_core/n545 ), .ZN(\i_tv80_core/n769 ) );
  INV_X1 \i_tv80_core/U799  ( .A(\i_tv80_core/I_BTR ), .ZN(\i_tv80_core/n545 )
         );
  INV_X1 \i_tv80_core/U798  ( .A(\i_tv80_core/n543 ), .ZN(\i_tv80_core/n1277 )
         );
  OAI221_X1 \i_tv80_core/U797  ( .B1(\i_tv80_core/n617 ), .B2(
        \i_tv80_core/n542 ), .C1(\i_tv80_core/F_Out [2]), .C2(
        \i_tv80_core/n542 ), .A(\i_tv80_core/n541 ), .ZN(\i_tv80_core/n543 )
         );
  OAI22_X1 \i_tv80_core/U796  ( .A1(\i_tv80_core/n1205 ), .A2(
        \i_tv80_core/n540 ), .B1(\i_tv80_core/n539 ), .B2(\i_tv80_core/n538 ), 
        .ZN(\i_tv80_core/n541 ) );
  AOI211_X1 \i_tv80_core/U795  ( .C1(\i_tv80_core/n710 ), .C2(
        \i_tv80_core/n537 ), .A(\i_tv80_core/n536 ), .B(\i_tv80_core/n535 ), 
        .ZN(\i_tv80_core/n538 ) );
  INV_X1 \i_tv80_core/U794  ( .A(\i_tv80_core/n534 ), .ZN(\i_tv80_core/n535 )
         );
  NAND2_X1 \i_tv80_core/U793  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n548 ), .ZN(\i_tv80_core/n536 ) );
  NAND4_X1 \i_tv80_core/U792  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n534 ), .A3(\i_tv80_core/n544 ), .A4(\i_tv80_core/n533 ), 
        .ZN(\i_tv80_core/n542 ) );
  AOI221_X1 \i_tv80_core/U791  ( .B1(\i_tv80_core/n532 ), .B2(
        \i_tv80_core/n531 ), .C1(\i_tv80_core/n530 ), .C2(\i_tv80_core/n529 ), 
        .A(\i_tv80_core/n539 ), .ZN(\i_tv80_core/n533 ) );
  INV_X1 \i_tv80_core/U790  ( .A(\i_tv80_core/n540 ), .ZN(\i_tv80_core/n539 )
         );
  NAND2_X1 \i_tv80_core/U789  ( .A1(\i_tv80_core/n264 ), .A2(
        \i_tv80_core/n528 ), .ZN(\i_tv80_core/n540 ) );
  OAI21_X1 \i_tv80_core/U788  ( .B1(\i_tv80_core/n631 ), .B2(
        \i_tv80_core/n548 ), .A(\i_tv80_core/n366 ), .ZN(\i_tv80_core/n528 )
         );
  MUX2_X1 \i_tv80_core/U787  ( .A(\i_tv80_core/n986 ), .B(\i_tv80_core/n527 ), 
        .S(\i_tv80_core/n631 ), .Z(\i_tv80_core/n529 ) );
  INV_X1 \i_tv80_core/U786  ( .A(\i_tv80_core/n634 ), .ZN(\i_tv80_core/n631 )
         );
  NAND2_X1 \i_tv80_core/U785  ( .A1(\i_tv80_core/n640 ), .A2(
        \i_tv80_core/n526 ), .ZN(\i_tv80_core/n634 ) );
  INV_X1 \i_tv80_core/U784  ( .A(\i_tv80_core/Special_LD [1]), .ZN(
        \i_tv80_core/n526 ) );
  INV_X1 \i_tv80_core/U783  ( .A(\i_tv80_core/n642 ), .ZN(\i_tv80_core/n640 )
         );
  NAND2_X1 \i_tv80_core/U782  ( .A1(\i_tv80_core/Special_LD [2]), .A2(
        \i_tv80_core/n364 ), .ZN(\i_tv80_core/n642 ) );
  XOR2_X1 \i_tv80_core/U781  ( .A(\i_tv80_core/n525 ), .B(\i_tv80_core/n524 ), 
        .Z(\i_tv80_core/n531 ) );
  XOR2_X1 \i_tv80_core/U780  ( .A(di_reg[7]), .B(di_reg[6]), .Z(
        \i_tv80_core/n523 ) );
  XOR2_X1 \i_tv80_core/U779  ( .A(\i_tv80_core/n2014 ), .B(di_reg[1]), .Z(
        \i_tv80_core/n522 ) );
  INV_X1 \i_tv80_core/U778  ( .A(\i_tv80_core/n548 ), .ZN(\i_tv80_core/n544 )
         );
  NAND2_X1 \i_tv80_core/U777  ( .A1(\i_tv80_core/n546 ), .A2(
        \i_tv80_core/n521 ), .ZN(\i_tv80_core/n548 ) );
  INV_X1 \i_tv80_core/U776  ( .A(\i_tv80_core/I_BT ), .ZN(\i_tv80_core/n521 )
         );
  INV_X1 \i_tv80_core/U775  ( .A(\i_tv80_core/I_BC ), .ZN(\i_tv80_core/n546 )
         );
  NAND2_X1 \i_tv80_core/U774  ( .A1(\i_tv80_core/n717 ), .A2(
        \i_tv80_core/n1974 ), .ZN(\i_tv80_core/n534 ) );
  OAI21_X1 \i_tv80_core/U773  ( .B1(\i_tv80_core/n1031 ), .B2(
        \i_tv80_core/n673 ), .A(\i_tv80_core/n520 ), .ZN(\i_tv80_core/n1974 )
         );
  AOI22_X1 \i_tv80_core/U772  ( .A1(\i_tv80_core/ALU_Q [2]), .A2(
        \i_tv80_core/n671 ), .B1(\i_tv80_core/n682 ), .B2(di_reg[2]), .ZN(
        \i_tv80_core/n520 ) );
  INV_X1 \i_tv80_core/U771  ( .A(\i_tv80_core/n753 ), .ZN(\i_tv80_core/n717 )
         );
  INV_X1 \i_tv80_core/U770  ( .A(\i_tv80_core/n519 ), .ZN(\i_tv80_core/n617 )
         );
  NAND2_X1 \i_tv80_core/U769  ( .A1(\i_tv80_core/n350 ), .A2(
        \i_tv80_core/n518 ), .ZN(\i_tv80_core/n1270 ) );
  MUX2_X1 \i_tv80_core/U768  ( .A(\i_tv80_core/n517 ), .B(\i_tv80_core/n1205 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n518 ) );
  MUX2_X1 \i_tv80_core/U767  ( .A(\i_tv80_core/BusB [2]), .B(
        \i_tv80_core/N1217 ), .S(\i_tv80_core/n371 ), .Z(\i_tv80_core/n2173 )
         );
  INV_X1 \i_tv80_core/U766  ( .A(\i_tv80_core/n516 ), .ZN(\i_tv80_core/n1355 )
         );
  AOI221_X1 \i_tv80_core/U765  ( .B1(\i_tv80_core/n577 ), .B2(
        \i_tv80_core/n185 ), .C1(di[4]), .C2(\i_tv80_core/n575 ), .A(
        \i_tv80_core/n284 ), .ZN(\i_tv80_core/n516 ) );
  NOR3_X1 \i_tv80_core/U764  ( .A1(\i_tv80_core/n577 ), .A2(
        \i_tv80_core/n1199 ), .A3(intcycle_n), .ZN(\i_tv80_core/n515 ) );
  INV_X1 \i_tv80_core/U763  ( .A(\i_tv80_core/n514 ), .ZN(\i_tv80_core/n575 )
         );
  OAI211_X1 \i_tv80_core/U762  ( .C1(\i_tv80_core/n513 ), .C2(
        \i_tv80_core/n942 ), .A(\i_tv80_core/n367 ), .B(\i_tv80_core/n512 ), 
        .ZN(\i_tv80_core/n514 ) );
  AOI21_X1 \i_tv80_core/U761  ( .B1(\i_tv80_core/n511 ), .B2(
        \i_tv80_core/n602 ), .A(\i_tv80_core/n510 ), .ZN(\i_tv80_core/n513 )
         );
  OAI21_X1 \i_tv80_core/U760  ( .B1(\i_tv80_core/n1198 ), .B2(
        \i_tv80_core/n923 ), .A(\i_tv80_core/n1218 ), .ZN(\i_tv80_core/n511 )
         );
  NAND2_X1 \i_tv80_core/U759  ( .A1(\i_tv80_core/n223 ), .A2(
        \i_tv80_core/n509 ), .ZN(\i_tv80_core/n512 ) );
  NAND4_X1 \i_tv80_core/U758  ( .A1(\i_tv80_core/n921 ), .A2(
        \i_tv80_core/n1136 ), .A3(\i_tv80_core/n1992 ), .A4(\i_tv80_core/n508 ), .ZN(\i_tv80_core/n509 ) );
  NOR3_X1 \i_tv80_core/U757  ( .A1(\i_tv80_core/n1223 ), .A2(
        \i_tv80_core/n1137 ), .A3(\i_tv80_core/n1943 ), .ZN(\i_tv80_core/n508 ) );
  NAND2_X1 \i_tv80_core/U756  ( .A1(mcycle[0]), .A2(\i_tv80_core/n2179 ), .ZN(
        \i_tv80_core/n1943 ) );
  NAND3_X1 \i_tv80_core/U755  ( .A1(\i_tv80_core/n921 ), .A2(
        \i_tv80_core/n2070 ), .A3(\i_tv80_core/n367 ), .ZN(\i_tv80_core/n2011 ) );
  INV_X1 \i_tv80_core/U754  ( .A(\i_tv80_core/n1558 ), .ZN(\i_tv80_core/n921 )
         );
  NAND2_X1 \i_tv80_core/U753  ( .A1(wait_n), .A2(\i_tv80_core/n1827 ), .ZN(
        \i_tv80_core/n1558 ) );
  MUX2_X1 \i_tv80_core/U752  ( .A(\i_tv80_core/n507 ), .B(\i_tv80_core/n923 ), 
        .S(\i_tv80_core/n228 ), .Z(\i_tv80_core/n1375 ) );
  NOR2_X1 \i_tv80_core/U751  ( .A1(\i_tv80_core/n1947 ), .A2(
        \i_tv80_core/n506 ), .ZN(\i_tv80_core/n507 ) );
  NOR2_X1 \i_tv80_core/U750  ( .A1(\i_tv80_core/n2149 ), .A2(
        \i_tv80_core/n504 ), .ZN(\i_tv80_core/n505 ) );
  OAI22_X1 \i_tv80_core/U749  ( .A1(\i_tv80_core/n1217 ), .A2(
        \i_tv80_core/n2148 ), .B1(int_n), .B2(\i_tv80_core/n2149 ), .ZN(
        \i_tv80_core/n1386 ) );
  MUX2_X1 \i_tv80_core/U748  ( .A(\i_tv80_core/n503 ), .B(\i_tv80_core/IntE ), 
        .S(\i_tv80_core/n502 ), .Z(\i_tv80_core/n1382 ) );
  AOI221_X1 \i_tv80_core/U747  ( .B1(\i_tv80_core/n501 ), .B2(
        \i_tv80_core/n500 ), .C1(\i_tv80_core/n28 ), .C2(\i_tv80_core/n499 ), 
        .A(\i_tv80_core/n349 ), .ZN(\i_tv80_core/n502 ) );
  NOR2_X1 \i_tv80_core/U746  ( .A1(\i_tv80_core/n498 ), .A2(\i_tv80_core/n497 ), .ZN(\i_tv80_core/n499 ) );
  INV_X1 \i_tv80_core/U745  ( .A(\i_tv80_core/n496 ), .ZN(\i_tv80_core/n498 )
         );
  NAND2_X1 \i_tv80_core/U744  ( .A1(\i_tv80_core/n495 ), .A2(
        \i_tv80_core/n494 ), .ZN(\i_tv80_core/n501 ) );
  OAI21_X1 \i_tv80_core/U743  ( .B1(\i_tv80_core/I_RETN ), .B2(
        \i_tv80_core/SetEI ), .A(\i_tv80_core/n1827 ), .ZN(\i_tv80_core/n495 )
         );
  AOI221_X1 \i_tv80_core/U742  ( .B1(\i_tv80_core/n493 ), .B2(
        \i_tv80_core/n496 ), .C1(\i_tv80_core/I_RETN ), .C2(
        \i_tv80_core/n1222 ), .A(\i_tv80_core/n492 ), .ZN(\i_tv80_core/n503 )
         );
  NAND2_X1 \i_tv80_core/U741  ( .A1(\i_tv80_core/n2159 ), .A2(
        \i_tv80_core/n494 ), .ZN(\i_tv80_core/n492 ) );
  NAND2_X1 \i_tv80_core/U740  ( .A1(\i_tv80_core/n491 ), .A2(
        \i_tv80_core/n490 ), .ZN(\i_tv80_core/n496 ) );
  INV_X1 \i_tv80_core/U739  ( .A(\i_tv80_core/n2158 ), .ZN(\i_tv80_core/n493 )
         );
  NAND2_X1 \i_tv80_core/U738  ( .A1(\i_tv80_core/n282 ), .A2(
        \i_tv80_core/n554 ), .ZN(\i_tv80_core/n2158 ) );
  NAND3_X1 \i_tv80_core/U737  ( .A1(\i_tv80_core/n489 ), .A2(
        \i_tv80_core/n553 ), .A3(\i_tv80_core/n126 ), .ZN(\i_tv80_core/n554 )
         );
  INV_X1 \i_tv80_core/U736  ( .A(\i_tv80_core/n588 ), .ZN(\i_tv80_core/n489 )
         );
  MUX2_X1 \i_tv80_core/U735  ( .A(\i_tv80_core/n488 ), .B(\i_tv80_core/n527 ), 
        .S(\i_tv80_core/n487 ), .Z(\i_tv80_core/n1383 ) );
  AOI221_X1 \i_tv80_core/U734  ( .B1(\i_tv80_core/n486 ), .B2(
        \i_tv80_core/n500 ), .C1(\i_tv80_core/n28 ), .C2(\i_tv80_core/n485 ), 
        .A(\i_tv80_core/n380 ), .ZN(\i_tv80_core/n487 ) );
  NOR2_X1 \i_tv80_core/U733  ( .A1(\i_tv80_core/n497 ), .A2(\i_tv80_core/n504 ), .ZN(\i_tv80_core/n485 ) );
  NAND2_X1 \i_tv80_core/U732  ( .A1(\i_tv80_core/n484 ), .A2(
        \i_tv80_core/n497 ), .ZN(\i_tv80_core/n500 ) );
  OAI21_X1 \i_tv80_core/U731  ( .B1(\i_tv80_core/n1858 ), .B2(
        \i_tv80_core/n483 ), .A(\i_tv80_core/n494 ), .ZN(\i_tv80_core/n486 )
         );
  INV_X1 \i_tv80_core/U730  ( .A(\i_tv80_core/SetEI ), .ZN(\i_tv80_core/n483 )
         );
  AOI21_X1 \i_tv80_core/U729  ( .B1(\i_tv80_core/n482 ), .B2(
        \i_tv80_core/n484 ), .A(\i_tv80_core/n481 ), .ZN(\i_tv80_core/n488 )
         );
  INV_X1 \i_tv80_core/U728  ( .A(\i_tv80_core/n494 ), .ZN(\i_tv80_core/n481 )
         );
  NAND2_X1 \i_tv80_core/U727  ( .A1(\i_tv80_core/SetDI ), .A2(
        \i_tv80_core/n364 ), .ZN(\i_tv80_core/n494 ) );
  NAND2_X1 \i_tv80_core/U726  ( .A1(\i_tv80_core/n2159 ), .A2(
        \i_tv80_core/n49 ), .ZN(\i_tv80_core/n484 ) );
  NAND2_X1 \i_tv80_core/U725  ( .A1(\i_tv80_core/n564 ), .A2(
        \i_tv80_core/n504 ), .ZN(\i_tv80_core/n482 ) );
  NAND2_X1 \i_tv80_core/U724  ( .A1(\i_tv80_core/n480 ), .A2(
        \i_tv80_core/n490 ), .ZN(\i_tv80_core/n504 ) );
  INV_X1 \i_tv80_core/U723  ( .A(\i_tv80_core/n491 ), .ZN(\i_tv80_core/n480 )
         );
  NAND3_X1 \i_tv80_core/U722  ( .A1(\i_tv80_core/n582 ), .A2(
        \i_tv80_core/n562 ), .A3(\i_tv80_core/n479 ), .ZN(\i_tv80_core/n491 )
         );
  NOR3_X1 \i_tv80_core/U721  ( .A1(\i_tv80_core/SetEI ), .A2(
        \i_tv80_core/n1217 ), .A3(\i_tv80_core/n1232 ), .ZN(\i_tv80_core/n479 ) );
  MUX2_X1 \i_tv80_core/U720  ( .A(\i_tv80_core/n478 ), .B(\i_tv80_core/n477 ), 
        .S(\i_tv80_core/n476 ), .Z(\i_tv80_core/n1345 ) );
  AOI21_X1 \i_tv80_core/U719  ( .B1(\i_tv80_core/n2159 ), .B2(
        \i_tv80_core/n475 ), .A(\i_tv80_core/n379 ), .ZN(\i_tv80_core/n476 )
         );
  OAI21_X1 \i_tv80_core/U718  ( .B1(nmi_n), .B2(\i_tv80_core/n965 ), .A(
        \i_tv80_core/n1218 ), .ZN(\i_tv80_core/n475 ) );
  NOR2_X1 \i_tv80_core/U717  ( .A1(\i_tv80_core/n928 ), .A2(
        \i_tv80_core/n2149 ), .ZN(\i_tv80_core/n478 ) );
  OAI22_X1 \i_tv80_core/U716  ( .A1(\i_tv80_core/n965 ), .A2(
        \i_tv80_core/n2148 ), .B1(\i_tv80_core/n2149 ), .B2(\i_tv80_core/n474 ), .ZN(\i_tv80_core/n1215 ) );
  INV_X1 \i_tv80_core/U715  ( .A(nmi_n), .ZN(\i_tv80_core/n474 ) );
  OAI21_X1 \i_tv80_core/U714  ( .B1(\i_tv80_core/n2154 ), .B2(
        \i_tv80_core/n497 ), .A(\i_tv80_core/n350 ), .ZN(\i_tv80_core/n472 )
         );
  NAND2_X1 \i_tv80_core/U713  ( .A1(\i_tv80_core/n282 ), .A2(
        \i_tv80_core/n588 ), .ZN(\i_tv80_core/n2154 ) );
  OR2_X1 \i_tv80_core/U712  ( .A1(\i_tv80_core/n995 ), .A2(\i_tv80_core/n471 ), 
        .ZN(\i_tv80_core/n588 ) );
  OAI33_X1 \i_tv80_core/U711  ( .A1(\i_tv80_core/n470 ), .A2(
        \i_tv80_core/n469 ), .A3(\i_tv80_core/n468 ), .B1(\i_tv80_core/n467 ), 
        .B2(\i_tv80_core/n1208 ), .B3(\i_tv80_core/n1224 ), .ZN(
        \i_tv80_core/n471 ) );
  NAND3_X1 \i_tv80_core/U710  ( .A1(\i_tv80_core/n1223 ), .A2(
        \i_tv80_core/n1225 ), .A3(\i_tv80_core/stop ), .ZN(\i_tv80_core/n467 )
         );
  INV_X1 \i_tv80_core/U709  ( .A(\i_tv80_core/n926 ), .ZN(\i_tv80_core/n468 )
         );
  XOR2_X1 \i_tv80_core/U708  ( .A(\i_tv80_core/n2180 ), .B(\i_tv80_core/n992 ), 
        .Z(\i_tv80_core/n926 ) );
  INV_X1 \i_tv80_core/U707  ( .A(\i_tv80_core/n929 ), .ZN(\i_tv80_core/n469 )
         );
  XOR2_X1 \i_tv80_core/U706  ( .A(\i_tv80_core/n2179 ), .B(\i_tv80_core/n993 ), 
        .Z(\i_tv80_core/n929 ) );
  INV_X1 \i_tv80_core/U705  ( .A(\i_tv80_core/n927 ), .ZN(\i_tv80_core/n470 )
         );
  XOR2_X1 \i_tv80_core/U704  ( .A(mcycle[2]), .B(\i_tv80_core/n994 ), .Z(
        \i_tv80_core/n927 ) );
  OAI21_X1 \i_tv80_core/U703  ( .B1(\i_tv80_core/Set_Addr_To [1]), .B2(
        \i_tv80_core/n47 ), .A(\i_tv80_core/n466 ), .ZN(\i_tv80_core/n2005 )
         );
  NOR3_X1 \i_tv80_core/U702  ( .A1(\i_tv80_core/n465 ), .A2(
        \i_tv80_core/n1826 ), .A3(\i_tv80_core/n1848 ), .ZN(\i_tv80_core/n466 ) );
  INV_X1 \i_tv80_core/U701  ( .A(\i_tv80_core/n1998 ), .ZN(\i_tv80_core/n1826 ) );
  NAND2_X1 \i_tv80_core/U700  ( .A1(\i_tv80_core/n1196 ), .A2(
        \i_tv80_core/n1197 ), .ZN(\i_tv80_core/n1998 ) );
  OAI22_X1 \i_tv80_core/U699  ( .A1(\i_tv80_core/n47 ), .A2(
        \i_tv80_core/n2009 ), .B1(\i_tv80_core/n1995 ), .B2(\i_tv80_core/n47 ), 
        .ZN(\i_tv80_core/n465 ) );
  INV_X1 \i_tv80_core/U698  ( .A(\i_tv80_core/Set_Addr_To [2]), .ZN(
        \i_tv80_core/n1995 ) );
  INV_X1 \i_tv80_core/U697  ( .A(\i_tv80_core/Set_Addr_To [0]), .ZN(
        \i_tv80_core/n2009 ) );
  INV_X1 \i_tv80_core/U696  ( .A(\i_tv80_core/n1167 ), .ZN(\i_tv80_core/n576 )
         );
  MUX2_X1 \i_tv80_core/U695  ( .A(\i_tv80_core/n463 ), .B(\i_tv80_core/n462 ), 
        .S(\i_tv80_core/n1163 ), .Z(\i_tv80_core/n464 ) );
  NOR4_X1 \i_tv80_core/U694  ( .A1(\i_tv80_core/n461 ), .A2(
        \i_tv80_core/n1168 ), .A3(\i_tv80_core/n185 ), .A4(\i_tv80_core/n166 ), 
        .ZN(\i_tv80_core/n462 ) );
  NAND3_X1 \i_tv80_core/U693  ( .A1(\i_tv80_core/n568 ), .A2(
        \i_tv80_core/n570 ), .A3(\i_tv80_core/n184 ), .ZN(\i_tv80_core/n461 )
         );
  NOR4_X1 \i_tv80_core/U692  ( .A1(\i_tv80_core/n460 ), .A2(\i_tv80_core/n570 ), .A3(\i_tv80_core/n184 ), .A4(\i_tv80_core/n568 ), .ZN(\i_tv80_core/n463 ) );
  INV_X1 \i_tv80_core/U691  ( .A(\i_tv80_core/n1162 ), .ZN(\i_tv80_core/n568 )
         );
  NAND3_X1 \i_tv80_core/U690  ( .A1(\i_tv80_core/n1168 ), .A2(
        \i_tv80_core/n166 ), .A3(\i_tv80_core/n185 ), .ZN(\i_tv80_core/n460 )
         );
  NAND3_X1 \i_tv80_core/U689  ( .A1(\i_tv80_core/n459 ), .A2(mcycle[2]), .A3(
        \i_tv80_core/n2179 ), .ZN(\i_tv80_core/n553 ) );
  INV_X1 \i_tv80_core/U688  ( .A(\i_tv80_core/n1223 ), .ZN(mcycle[2]) );
  NAND3_X1 \i_tv80_core/U687  ( .A1(\i_tv80_core/n1136 ), .A2(
        \i_tv80_core/n1225 ), .A3(\i_tv80_core/n1944 ), .ZN(\i_tv80_core/n459 ) );
  INV_X1 \i_tv80_core/U686  ( .A(\i_tv80_core/n1137 ), .ZN(\i_tv80_core/n1944 ) );
  INV_X1 \i_tv80_core/U685  ( .A(\i_tv80_core/n1218 ), .ZN(\i_tv80_core/n928 )
         );
  NOR2_X1 \i_tv80_core/U684  ( .A1(\i_tv80_core/n2149 ), .A2(
        \i_tv80_core/n490 ), .ZN(\i_tv80_core/n473 ) );
  NAND3_X1 \i_tv80_core/U683  ( .A1(\i_tv80_core/n562 ), .A2(
        \i_tv80_core/n477 ), .A3(\i_tv80_core/n582 ), .ZN(\i_tv80_core/n490 )
         );
  INV_X1 \i_tv80_core/U682  ( .A(\i_tv80_core/Prefix [1]), .ZN(
        \i_tv80_core/n582 ) );
  INV_X1 \i_tv80_core/U681  ( .A(\i_tv80_core/Prefix [0]), .ZN(
        \i_tv80_core/n562 ) );
  MUX2_X1 \i_tv80_core/U680  ( .A(\i_tv80_core/n458 ), .B(\i_tv80_core/n925 ), 
        .S(\i_tv80_core/n228 ), .Z(\i_tv80_core/n1374 ) );
  OAI21_X1 \i_tv80_core/U679  ( .B1(\i_tv80_core/n506 ), .B2(
        \i_tv80_core/n456 ), .A(\i_tv80_core/n366 ), .ZN(\i_tv80_core/n457 )
         );
  INV_X1 \i_tv80_core/U678  ( .A(\i_tv80_core/IMode [0]), .ZN(
        \i_tv80_core/n506 ) );
  NOR2_X1 \i_tv80_core/U677  ( .A1(\i_tv80_core/n1947 ), .A2(
        \i_tv80_core/n456 ), .ZN(\i_tv80_core/n458 ) );
  INV_X1 \i_tv80_core/U676  ( .A(\i_tv80_core/IMode [1]), .ZN(
        \i_tv80_core/n456 ) );
  MUX2_X1 \i_tv80_core/U675  ( .A(\i_tv80_core/n455 ), .B(\i_tv80_core/n454 ), 
        .S(\i_tv80_core/n264 ), .Z(\i_tv80_core/n1273 ) );
  OAI21_X1 \i_tv80_core/U674  ( .B1(\i_tv80_core/n451 ), .B2(
        \i_tv80_core/n708 ), .A(\i_tv80_core/n366 ), .ZN(\i_tv80_core/n452 )
         );
  INV_X1 \i_tv80_core/U673  ( .A(\i_tv80_core/n714 ), .ZN(\i_tv80_core/n453 )
         );
  OAI211_X1 \i_tv80_core/U672  ( .C1(\i_tv80_core/n1947 ), .C2(
        \i_tv80_core/n753 ), .A(\i_tv80_core/n376 ), .B(\i_tv80_core/n450 ), 
        .ZN(\i_tv80_core/n714 ) );
  INV_X1 \i_tv80_core/U671  ( .A(\i_tv80_core/n1201 ), .ZN(\i_tv80_core/n454 )
         );
  OAI221_X1 \i_tv80_core/U670  ( .B1(\i_tv80_core/n519 ), .B2(
        \i_tv80_core/n449 ), .C1(\i_tv80_core/n1987 ), .C2(\i_tv80_core/n753 ), 
        .A(\i_tv80_core/n448 ), .ZN(\i_tv80_core/n455 ) );
  AOI221_X1 \i_tv80_core/U669  ( .B1(\i_tv80_core/n990 ), .B2(
        \i_tv80_core/n530 ), .C1(\i_tv80_core/n447 ), .C2(\i_tv80_core/n446 ), 
        .A(\i_tv80_core/n379 ), .ZN(\i_tv80_core/n448 ) );
  NOR4_X1 \i_tv80_core/U668  ( .A1(di_reg[7]), .A2(di_reg[6]), .A3(di_reg[5]), 
        .A4(di_reg[4]), .ZN(\i_tv80_core/n446 ) );
  NOR3_X1 \i_tv80_core/U667  ( .A1(\i_tv80_core/n445 ), .A2(di_reg[3]), .A3(
        di_reg[2]), .ZN(\i_tv80_core/n447 ) );
  NAND3_X1 \i_tv80_core/U666  ( .A1(\i_tv80_core/n532 ), .A2(
        \i_tv80_core/n2014 ), .A3(\i_tv80_core/n1894 ), .ZN(\i_tv80_core/n445 ) );
  INV_X1 \i_tv80_core/U665  ( .A(di_reg[1]), .ZN(\i_tv80_core/n1894 ) );
  INV_X1 \i_tv80_core/U664  ( .A(di_reg[0]), .ZN(\i_tv80_core/n2014 ) );
  INV_X1 \i_tv80_core/U663  ( .A(\i_tv80_core/n615 ), .ZN(\i_tv80_core/n532 )
         );
  NAND2_X1 \i_tv80_core/U662  ( .A1(\i_tv80_core/n451 ), .A2(
        \i_tv80_core/n710 ), .ZN(\i_tv80_core/n615 ) );
  INV_X1 \i_tv80_core/U661  ( .A(\i_tv80_core/n729 ), .ZN(\i_tv80_core/n451 )
         );
  INV_X1 \i_tv80_core/U660  ( .A(\i_tv80_core/n614 ), .ZN(\i_tv80_core/n530 )
         );
  NAND2_X1 \i_tv80_core/U659  ( .A1(\i_tv80_core/n734 ), .A2(
        \i_tv80_core/n694 ), .ZN(\i_tv80_core/n614 ) );
  INV_X1 \i_tv80_core/U658  ( .A(\i_tv80_core/n708 ), .ZN(\i_tv80_core/n694 )
         );
  NAND2_X1 \i_tv80_core/U657  ( .A1(\i_tv80_core/n866 ), .A2(
        \i_tv80_core/n1957 ), .ZN(\i_tv80_core/n753 ) );
  INV_X1 \i_tv80_core/U656  ( .A(\i_tv80_core/n628 ), .ZN(\i_tv80_core/n866 )
         );
  INV_X1 \i_tv80_core/U655  ( .A(\i_tv80_core/n1613 ), .ZN(\i_tv80_core/n1987 ) );
  OAI21_X1 \i_tv80_core/U654  ( .B1(\i_tv80_core/n1035 ), .B2(
        \i_tv80_core/n673 ), .A(\i_tv80_core/n444 ), .ZN(\i_tv80_core/n1613 )
         );
  AOI22_X1 \i_tv80_core/U653  ( .A1(\i_tv80_core/ALU_Q [6]), .A2(
        \i_tv80_core/n671 ), .B1(\i_tv80_core/n682 ), .B2(di_reg[6]), .ZN(
        \i_tv80_core/n444 ) );
  INV_X1 \i_tv80_core/U652  ( .A(\i_tv80_core/n664 ), .ZN(\i_tv80_core/n682 )
         );
  NAND2_X1 \i_tv80_core/U651  ( .A1(\i_tv80_core/n1178 ), .A2(
        \i_tv80_core/n673 ), .ZN(\i_tv80_core/n664 ) );
  INV_X1 \i_tv80_core/U650  ( .A(\i_tv80_core/n1630 ), .ZN(\i_tv80_core/n671 )
         );
  NAND2_X1 \i_tv80_core/U649  ( .A1(\i_tv80_core/n443 ), .A2(
        \i_tv80_core/n673 ), .ZN(\i_tv80_core/n1630 ) );
  INV_X1 \i_tv80_core/U648  ( .A(\i_tv80_core/ExchangeRp ), .ZN(
        \i_tv80_core/n673 ) );
  INV_X1 \i_tv80_core/U647  ( .A(\i_tv80_core/F_Out [6]), .ZN(
        \i_tv80_core/n449 ) );
  NAND2_X1 \i_tv80_core/U646  ( .A1(\i_tv80_core/n734 ), .A2(
        \i_tv80_core/n708 ), .ZN(\i_tv80_core/n519 ) );
  OAI21_X1 \i_tv80_core/U645  ( .B1(\i_tv80_core/n1178 ), .B2(
        \i_tv80_core/stop ), .A(\i_tv80_core/n442 ), .ZN(\i_tv80_core/n708 )
         );
  NAND4_X1 \i_tv80_core/U644  ( .A1(\i_tv80_core/n1127 ), .A2(
        \i_tv80_core/n1128 ), .A3(\i_tv80_core/ALU_Op_r [3]), .A4(
        \i_tv80_core/n441 ), .ZN(\i_tv80_core/n442 ) );
  INV_X1 \i_tv80_core/U643  ( .A(\i_tv80_core/n751 ), .ZN(\i_tv80_core/n734 )
         );
  NAND2_X1 \i_tv80_core/U642  ( .A1(\i_tv80_core/n710 ), .A2(
        \i_tv80_core/n729 ), .ZN(\i_tv80_core/n751 ) );
  NAND2_X1 \i_tv80_core/U641  ( .A1(\i_tv80_core/I_INRC ), .A2(
        \i_tv80_core/n57 ), .ZN(\i_tv80_core/n729 ) );
  NAND2_X1 \i_tv80_core/U640  ( .A1(\i_tv80_core/n440 ), .A2(
        \i_tv80_core/n862 ), .ZN(\i_tv80_core/n710 ) );
  INV_X1 \i_tv80_core/U639  ( .A(\i_tv80_core/n865 ), .ZN(\i_tv80_core/n440 )
         );
  NAND2_X1 \i_tv80_core/U638  ( .A1(\i_tv80_core/n275 ), .A2(
        \i_tv80_core/n625 ), .ZN(\i_tv80_core/n865 ) );
  NAND2_X1 \i_tv80_core/U637  ( .A1(\i_tv80_core/n254 ), .A2(
        \i_tv80_core/n774 ), .ZN(\i_tv80_core/n1968 ) );
  NAND2_X1 \i_tv80_core/U636  ( .A1(\i_tv80_core/n293 ), .A2(
        \i_tv80_core/n1135 ), .ZN(\i_tv80_core/n774 ) );
  NAND4_X1 \i_tv80_core/U635  ( .A1(\i_tv80_core/n1133 ), .A2(
        \i_tv80_core/n439 ), .A3(\i_tv80_core/n1561 ), .A4(\i_tv80_core/n438 ), 
        .ZN(\i_tv80_core/n628 ) );
  NAND3_X1 \i_tv80_core/U634  ( .A1(\i_tv80_core/n437 ), .A2(
        \i_tv80_core/n1132 ), .A3(\i_tv80_core/n1561 ), .ZN(\i_tv80_core/n625 ) );
  NAND2_X1 \i_tv80_core/U633  ( .A1(\i_tv80_core/n293 ), .A2(
        \i_tv80_core/n1561 ), .ZN(\i_tv80_core/n862 ) );
  NAND2_X1 \i_tv80_core/U632  ( .A1(\i_tv80_core/n294 ), .A2(
        \i_tv80_core/n437 ), .ZN(\i_tv80_core/n1961 ) );
  INV_X1 \i_tv80_core/U631  ( .A(\i_tv80_core/n1563 ), .ZN(\i_tv80_core/n437 )
         );
  NAND2_X1 \i_tv80_core/U630  ( .A1(\i_tv80_core/n436 ), .A2(
        \i_tv80_core/n438 ), .ZN(\i_tv80_core/n1563 ) );
  NAND2_X1 \i_tv80_core/U629  ( .A1(\i_tv80_core/n435 ), .A2(
        \i_tv80_core/n434 ), .ZN(\i_tv80_core/n1964 ) );
  MUX2_X1 \i_tv80_core/U628  ( .A(\i_tv80_core/n433 ), .B(\i_tv80_core/n432 ), 
        .S(\i_tv80_core/n1178 ), .Z(\i_tv80_core/n435 ) );
  INV_X1 \i_tv80_core/U627  ( .A(\i_tv80_core/n1960 ), .ZN(\i_tv80_core/n432 )
         );
  NAND3_X1 \i_tv80_core/U626  ( .A1(\i_tv80_core/n1231 ), .A2(tstate[0]), .A3(
        \i_tv80_core/n292 ), .ZN(\i_tv80_core/n1960 ) );
  NAND4_X1 \i_tv80_core/U625  ( .A1(\i_tv80_core/n982 ), .A2(
        \i_tv80_core/n441 ), .A3(\i_tv80_core/n431 ), .A4(\i_tv80_core/n430 ), 
        .ZN(\i_tv80_core/n433 ) );
  INV_X1 \i_tv80_core/U624  ( .A(\i_tv80_core/n1127 ), .ZN(\i_tv80_core/n430 )
         );
  INV_X1 \i_tv80_core/U623  ( .A(\i_tv80_core/n1129 ), .ZN(\i_tv80_core/n441 )
         );
  MUX2_X1 \i_tv80_core/U622  ( .A(\i_tv80_core/BusB [6]), .B(
        \i_tv80_core/N1221 ), .S(\i_tv80_core/n371 ), .Z(\i_tv80_core/n2169 )
         );
  OAI221_X1 \i_tv80_core/U621  ( .B1(\i_tv80_core/n1885 ), .B2(
        \i_tv80_core/n429 ), .C1(\i_tv80_core/n1134 ), .C2(\i_tv80_core/n1962 ), .A(\i_tv80_core/n428 ), .ZN(\i_tv80_core/n1372 ) );
  INV_X1 \i_tv80_core/U620  ( .A(\i_tv80_core/Set_BusA_To [1]), .ZN(
        \i_tv80_core/n1885 ) );
  OAI221_X1 \i_tv80_core/U619  ( .B1(\i_tv80_core/n1881 ), .B2(
        \i_tv80_core/n429 ), .C1(\i_tv80_core/n1133 ), .C2(\i_tv80_core/n1962 ), .A(\i_tv80_core/n428 ), .ZN(\i_tv80_core/n1371 ) );
  INV_X1 \i_tv80_core/U618  ( .A(\i_tv80_core/N1102 ), .ZN(\i_tv80_core/n1881 ) );
  OAI221_X1 \i_tv80_core/U617  ( .B1(\i_tv80_core/n1887 ), .B2(
        \i_tv80_core/n429 ), .C1(\i_tv80_core/n1135 ), .C2(\i_tv80_core/n1962 ), .A(\i_tv80_core/n428 ), .ZN(\i_tv80_core/n1373 ) );
  INV_X1 \i_tv80_core/U616  ( .A(\i_tv80_core/Set_BusA_To [0]), .ZN(
        \i_tv80_core/n1887 ) );
  OAI21_X1 \i_tv80_core/U615  ( .B1(\i_tv80_core/n1132 ), .B2(
        \i_tv80_core/n1962 ), .A(\i_tv80_core/n427 ), .ZN(\i_tv80_core/n1370 )
         );
  NAND3_X1 \i_tv80_core/U614  ( .A1(\i_tv80_core/n426 ), .A2(
        \i_tv80_core/Set_BusA_To [3]), .A3(\i_tv80_core/n425 ), .ZN(
        \i_tv80_core/n427 ) );
  INV_X1 \i_tv80_core/U613  ( .A(\i_tv80_core/Read_To_Acc ), .ZN(
        \i_tv80_core/n425 ) );
  INV_X1 \i_tv80_core/U612  ( .A(\i_tv80_core/n424 ), .ZN(\i_tv80_core/n1369 )
         );
  AOI221_X1 \i_tv80_core/U611  ( .B1(\i_tv80_core/Read_To_Reg ), .B2(
        \i_tv80_core/n426 ), .C1(\i_tv80_core/n1953 ), .C2(\i_tv80_core/n434 ), 
        .A(\i_tv80_core/n423 ), .ZN(\i_tv80_core/n424 ) );
  INV_X1 \i_tv80_core/U610  ( .A(\i_tv80_core/n428 ), .ZN(\i_tv80_core/n423 )
         );
  NAND2_X1 \i_tv80_core/U609  ( .A1(\i_tv80_core/Read_To_Acc ), .A2(
        \i_tv80_core/n426 ), .ZN(\i_tv80_core/n428 ) );
  OAI22_X1 \i_tv80_core/U608  ( .A1(\i_tv80_core/n422 ), .A2(
        \i_tv80_core/n1949 ), .B1(\i_tv80_core/n1127 ), .B2(
        \i_tv80_core/n1962 ), .ZN(\i_tv80_core/n1097 ) );
  INV_X1 \i_tv80_core/U607  ( .A(\i_tv80_core/ALU_Op [2]), .ZN(
        \i_tv80_core/n1949 ) );
  INV_X1 \i_tv80_core/U606  ( .A(\i_tv80_core/n421 ), .ZN(\i_tv80_core/n1096 )
         );
  AOI22_X1 \i_tv80_core/U605  ( .A1(\i_tv80_core/n1953 ), .A2(
        \i_tv80_core/n431 ), .B1(\i_tv80_core/ALU_Op [1]), .B2(
        \i_tv80_core/n420 ), .ZN(\i_tv80_core/n421 ) );
  INV_X1 \i_tv80_core/U604  ( .A(\i_tv80_core/n1128 ), .ZN(\i_tv80_core/n431 )
         );
  OAI22_X1 \i_tv80_core/U603  ( .A1(\i_tv80_core/n1946 ), .A2(
        \i_tv80_core/n422 ), .B1(\i_tv80_core/n1129 ), .B2(\i_tv80_core/n1962 ), .ZN(\i_tv80_core/n2176 ) );
  INV_X1 \i_tv80_core/U602  ( .A(\i_tv80_core/ALU_Op [0]), .ZN(
        \i_tv80_core/n1946 ) );
  INV_X1 \i_tv80_core/U601  ( .A(\i_tv80_core/n419 ), .ZN(\i_tv80_core/n1098 )
         );
  AOI22_X1 \i_tv80_core/U600  ( .A1(\i_tv80_core/n1953 ), .A2(
        \i_tv80_core/ALU_Op_r [3]), .B1(\i_tv80_core/ALU_Op [3]), .B2(
        \i_tv80_core/n420 ), .ZN(\i_tv80_core/n419 ) );
  NAND2_X1 \i_tv80_core/U599  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n418 ), .ZN(\i_tv80_core/n1267 ) );
  MUX2_X1 \i_tv80_core/U598  ( .A(\i_tv80_core/n417 ), .B(\i_tv80_core/n1201 ), 
        .S(\i_tv80_core/n762 ), .Z(\i_tv80_core/n418 ) );
  NAND2_X1 \i_tv80_core/U597  ( .A1(\i_tv80_core/ExchangeAF ), .A2(
        \i_tv80_core/n1992 ), .ZN(\i_tv80_core/n450 ) );
  INV_X1 \i_tv80_core/U596  ( .A(\i_tv80_core/n939 ), .ZN(\i_tv80_core/n1992 )
         );
  NAND2_X1 \i_tv80_core/U595  ( .A1(\i_tv80_core/n367 ), .A2(
        \i_tv80_core/n942 ), .ZN(\i_tv80_core/n939 ) );
  INV_X1 \i_tv80_core/U594  ( .A(\i_tv80_core/n416 ), .ZN(\i_tv80_core/n1110 )
         );
  AOI22_X1 \i_tv80_core/U593  ( .A1(\i_tv80_core/mcycles_d [2]), .A2(
        \i_tv80_core/n366 ), .B1(\i_tv80_core/n1953 ), .B2(\i_tv80_core/n52 ), 
        .ZN(\i_tv80_core/n416 ) );
  INV_X1 \i_tv80_core/U592  ( .A(\i_tv80_core/n415 ), .ZN(\i_tv80_core/n1108 )
         );
  AOI22_X1 \i_tv80_core/U591  ( .A1(\i_tv80_core/mcycles_d [0]), .A2(
        \i_tv80_core/n366 ), .B1(\i_tv80_core/n1953 ), .B2(\i_tv80_core/n414 ), 
        .ZN(\i_tv80_core/n415 ) );
  INV_X1 \i_tv80_core/U590  ( .A(\i_tv80_core/n413 ), .ZN(\i_tv80_core/n1109 )
         );
  AOI22_X1 \i_tv80_core/U589  ( .A1(\i_tv80_core/mcycles_d [1]), .A2(
        \i_tv80_core/n366 ), .B1(\i_tv80_core/n1953 ), .B2(\i_tv80_core/n412 ), 
        .ZN(\i_tv80_core/n413 ) );
  AOI221_X1 \i_tv80_core/U588  ( .B1(\i_tv80_core/n410 ), .B2(
        \i_tv80_core/n411 ), .C1(\i_tv80_core/n1208 ), .C2(\i_tv80_core/n409 ), 
        .A(\i_tv80_core/n408 ), .ZN(\i_tv80_core/n1336 ) );
  NOR3_X1 \i_tv80_core/U587  ( .A1(\i_tv80_core/n409 ), .A2(
        \i_tv80_core/F_Out [6]), .A3(\i_tv80_core/n407 ), .ZN(
        \i_tv80_core/n408 ) );
  NOR2_X1 \i_tv80_core/U586  ( .A1(\i_tv80_core/n406 ), .A2(
        \i_tv80_core/n1665 ), .ZN(\i_tv80_core/n410 ) );
  NAND4_X1 \i_tv80_core/U585  ( .A1(\i_tv80_core/n256 ), .A2(
        \i_tv80_core/n1788 ), .A3(\i_tv80_core/n1692 ), .A4(
        \i_tv80_core/n1733 ), .ZN(\i_tv80_core/n406 ) );
  INV_X1 \i_tv80_core/U584  ( .A(\i_tv80_core/n1731 ), .ZN(\i_tv80_core/n1733 ) );
  XOR2_X1 \i_tv80_core/U583  ( .A(\i_tv80_core/n372 ), .B(
        \i_tv80_core/RegBusA [12]), .Z(\i_tv80_core/n1731 ) );
  XOR2_X1 \i_tv80_core/U582  ( .A(\i_tv80_core/n200 ), .B(\i_tv80_core/n347 ), 
        .Z(\i_tv80_core/n404 ) );
  OAI221_X1 \i_tv80_core/U581  ( .B1(\i_tv80_core/n146 ), .B2(
        \i_tv80_core/n373 ), .C1(\i_tv80_core/n403 ), .C2(\i_tv80_core/n1583 ), 
        .A(\i_tv80_core/n402 ), .ZN(\i_tv80_core/n405 ) );
  INV_X1 \i_tv80_core/U580  ( .A(\i_tv80_core/n1584 ), .ZN(\i_tv80_core/n403 )
         );
  NAND2_X1 \i_tv80_core/U579  ( .A1(\i_tv80_core/n373 ), .A2(\i_tv80_core/n33 ), .ZN(\i_tv80_core/n1584 ) );
  INV_X1 \i_tv80_core/U578  ( .A(\i_tv80_core/n1790 ), .ZN(\i_tv80_core/n1788 ) );
  XOR2_X1 \i_tv80_core/U577  ( .A(\i_tv80_core/n372 ), .B(
        \i_tv80_core/RegBusA [14]), .Z(\i_tv80_core/n1790 ) );
  INV_X1 \i_tv80_core/U576  ( .A(\i_tv80_core/n1683 ), .ZN(\i_tv80_core/n1692 ) );
  XOR2_X1 \i_tv80_core/U575  ( .A(\i_tv80_core/n373 ), .B(
        \i_tv80_core/RegBusA [9]), .Z(\i_tv80_core/n1665 ) );
  INV_X1 \i_tv80_core/U574  ( .A(\i_tv80_core/n1593 ), .ZN(\i_tv80_core/n1588 ) );
  XOR2_X1 \i_tv80_core/U573  ( .A(\i_tv80_core/n351 ), .B(\i_tv80_core/n372 ), 
        .Z(\i_tv80_core/n1593 ) );
  XOR2_X1 \i_tv80_core/U572  ( .A(\i_tv80_core/n373 ), .B(\i_tv80_core/n147 ), 
        .Z(\i_tv80_core/n1745 ) );
  XOR2_X1 \i_tv80_core/U571  ( .A(\i_tv80_core/n11 ), .B(\i_tv80_core/n347 ), 
        .Z(\i_tv80_core/n400 ) );
  NAND4_X1 \i_tv80_core/U570  ( .A1(\i_tv80_core/n345 ), .A2(
        \i_tv80_core/n399 ), .A3(\i_tv80_core/n407 ), .A4(\i_tv80_core/n1609 ), 
        .ZN(\i_tv80_core/n401 ) );
  INV_X1 \i_tv80_core/U569  ( .A(\i_tv80_core/n1607 ), .ZN(\i_tv80_core/n1609 ) );
  INV_X1 \i_tv80_core/U568  ( .A(\i_tv80_core/n409 ), .ZN(\i_tv80_core/n399 )
         );
  NAND2_X1 \i_tv80_core/U567  ( .A1(\i_tv80_core/n371 ), .A2(
        \i_tv80_core/n398 ), .ZN(\i_tv80_core/n409 ) );
  OAI21_X1 \i_tv80_core/U566  ( .B1(\i_tv80_core/n1178 ), .B2(
        \i_tv80_core/n397 ), .A(\i_tv80_core/n396 ), .ZN(\i_tv80_core/n398 )
         );
  INV_X1 \i_tv80_core/U565  ( .A(\i_tv80_core/stop ), .ZN(\i_tv80_core/n397 )
         );
  INV_X1 \i_tv80_core/U564  ( .A(\i_tv80_core/n396 ), .ZN(\i_tv80_core/n407 )
         );
  NAND4_X1 \i_tv80_core/U563  ( .A1(\i_tv80_core/n155 ), .A2(
        \i_tv80_core/n1829 ), .A3(\i_tv80_core/n1864 ), .A4(\i_tv80_core/n77 ), 
        .ZN(\i_tv80_core/n396 ) );
  INV_X1 \i_tv80_core/U562  ( .A(\i_tv80_core/IncDec_16 [1]), .ZN(
        \i_tv80_core/n1828 ) );
  INV_X1 \i_tv80_core/U561  ( .A(\i_tv80_core/IncDec_16 [0]), .ZN(
        \i_tv80_core/n1864 ) );
  NAND2_X1 \i_tv80_core/U560  ( .A1(\i_tv80_core/n2156 ), .A2(
        \i_tv80_core/n1858 ), .ZN(\i_tv80_core/n1829 ) );
  INV_X1 \i_tv80_core/U559  ( .A(\i_tv80_core/n942 ), .ZN(\i_tv80_core/n2070 )
         );
  OAI21_X1 \i_tv80_core/U558  ( .B1(\i_tv80_core/n179 ), .B2(
        \i_tv80_core/n347 ), .A(\i_tv80_core/n345 ), .ZN(\i_tv80_core/n1583 )
         );
  NAND2_X1 \i_tv80_core/U557  ( .A1(\i_tv80_core/n347 ), .A2(
        \i_tv80_core/n179 ), .ZN(\i_tv80_core/n402 ) );
  INV_X1 \i_tv80_core/U556  ( .A(\i_tv80_core/n1656 ), .ZN(\i_tv80_core/n394 )
         );
  XOR2_X1 \i_tv80_core/U555  ( .A(\i_tv80_core/n372 ), .B(
        \i_tv80_core/RegBusA [8]), .Z(\i_tv80_core/n1656 ) );
  XOR2_X1 \i_tv80_core/U554  ( .A(\i_tv80_core/RegBusA [15]), .B(
        \i_tv80_core/n347 ), .Z(\i_tv80_core/n395 ) );
  INV_X1 \i_tv80_core/U553  ( .A(\i_tv80_core/n393 ), .ZN(\i_tv80_core/n1094 )
         );
  AOI22_X1 \i_tv80_core/U552  ( .A1(\i_tv80_core/n1953 ), .A2(
        \i_tv80_core/n443 ), .B1(\i_tv80_core/Save_ALU ), .B2(
        \i_tv80_core/n420 ), .ZN(\i_tv80_core/n393 ) );
  INV_X1 \i_tv80_core/U551  ( .A(\i_tv80_core/n422 ), .ZN(\i_tv80_core/n420 )
         );
  NAND2_X1 \i_tv80_core/U550  ( .A1(\i_tv80_core/n426 ), .A2(
        \i_tv80_core/n942 ), .ZN(\i_tv80_core/n422 ) );
  INV_X1 \i_tv80_core/U549  ( .A(\i_tv80_core/n429 ), .ZN(\i_tv80_core/n426 )
         );
  NAND2_X1 \i_tv80_core/U548  ( .A1(\i_tv80_core/n367 ), .A2(\i_tv80_core/n56 ), .ZN(\i_tv80_core/n429 ) );
  INV_X1 \i_tv80_core/U547  ( .A(\i_tv80_core/n1962 ), .ZN(\i_tv80_core/n1953 ) );
  NAND2_X1 \i_tv80_core/U546  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n1947 ), .ZN(\i_tv80_core/n1962 ) );
  OAI33_X1 \i_tv80_core/U545  ( .A1(\i_tv80_core/n1216 ), .A2(
        \i_tv80_core/n391 ), .A3(\i_tv80_core/n2149 ), .B1(\i_tv80_core/n564 ), 
        .B2(\i_tv80_core/n379 ), .B3(busak_n), .ZN(\i_tv80_core/n1376 ) );
  OAI22_X1 \i_tv80_core/U544  ( .A1(\i_tv80_core/n390 ), .A2(
        \i_tv80_core/n603 ), .B1(\i_tv80_core/n389 ), .B2(\i_tv80_core/n2151 ), 
        .ZN(\i_tv80_core/n1377 ) );
  INV_X1 \i_tv80_core/U543  ( .A(\i_tv80_core/n610 ), .ZN(\i_tv80_core/n389 )
         );
  OAI21_X1 \i_tv80_core/U542  ( .B1(tstate[0]), .B2(\i_tv80_core/n603 ), .A(
        \i_tv80_core/n606 ), .ZN(\i_tv80_core/n610 ) );
  NAND2_X1 \i_tv80_core/U541  ( .A1(\i_tv80_core/n2159 ), .A2(
        \i_tv80_core/n771 ), .ZN(\i_tv80_core/n603 ) );
  AOI22_X1 \i_tv80_core/U540  ( .A1(\i_tv80_core/n364 ), .A2(
        \i_tv80_core/n606 ), .B1(tstate[2]), .B2(\i_tv80_core/n154 ), .ZN(
        \i_tv80_core/n390 ) );
  NAND2_X1 \i_tv80_core/U539  ( .A1(\i_tv80_core/n552 ), .A2(
        \i_tv80_core/n388 ), .ZN(\i_tv80_core/n606 ) );
  OAI211_X1 \i_tv80_core/U538  ( .C1(\i_tv80_core/n50 ), .C2(
        \i_tv80_core/n387 ), .A(\i_tv80_core/n386 ), .B(\i_tv80_core/n385 ), 
        .ZN(\i_tv80_core/n388 ) );
  AOI211_X1 \i_tv80_core/U537  ( .C1(\i_tv80_core/n384 ), .C2(
        \i_tv80_core/n602 ), .A(\i_tv80_core/n57 ), .B(\i_tv80_core/n497 ), 
        .ZN(\i_tv80_core/n385 ) );
  NAND2_X1 \i_tv80_core/U536  ( .A1(\i_tv80_core/n1218 ), .A2(intcycle_n), 
        .ZN(\i_tv80_core/n602 ) );
  NOR2_X1 \i_tv80_core/U535  ( .A1(\i_tv80_core/n392 ), .A2(\i_tv80_core/n48 ), 
        .ZN(\i_tv80_core/n384 ) );
  NAND3_X1 \i_tv80_core/U534  ( .A1(\i_tv80_core/n1224 ), .A2(
        \i_tv80_core/n1223 ), .A3(\i_tv80_core/n2180 ), .ZN(\i_tv80_core/n392 ) );
  INV_X1 \i_tv80_core/U533  ( .A(iorq), .ZN(\i_tv80_core/n387 ) );
  INV_X1 \i_tv80_core/U532  ( .A(\i_tv80_core/n599 ), .ZN(\i_tv80_core/n552 )
         );
  NAND2_X1 \i_tv80_core/U531  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n551 ), .ZN(\i_tv80_core/n599 ) );
  NAND3_X1 \i_tv80_core/U530  ( .A1(\i_tv80_core/n564 ), .A2(
        \i_tv80_core/n1216 ), .A3(\i_tv80_core/n563 ), .ZN(\i_tv80_core/n551 )
         );
  INV_X1 \i_tv80_core/U529  ( .A(\i_tv80_core/n391 ), .ZN(\i_tv80_core/n563 )
         );
  NAND2_X1 \i_tv80_core/U528  ( .A1(\i_tv80_core/n57 ), .A2(\i_tv80_core/n386 ), .ZN(\i_tv80_core/n391 ) );
  NAND2_X1 \i_tv80_core/U527  ( .A1(\i_tv80_core/n1827 ), .A2(
        \i_tv80_core/n2155 ), .ZN(\i_tv80_core/n386 ) );
  INV_X1 \i_tv80_core/U526  ( .A(wait_n), .ZN(\i_tv80_core/n2155 ) );
  INV_X1 \i_tv80_core/U525  ( .A(\i_tv80_core/n1858 ), .ZN(\i_tv80_core/n1827 ) );
  NAND3_X1 \i_tv80_core/U524  ( .A1(tstate[1]), .A2(\i_tv80_core/n2151 ), .A3(
        \i_tv80_core/n36 ), .ZN(\i_tv80_core/n1858 ) );
  NAND3_X1 \i_tv80_core/U523  ( .A1(\i_tv80_core/n383 ), .A2(
        \i_tv80_core/n382 ), .A3(\i_tv80_core/n381 ), .ZN(\i_tv80_core/n771 )
         );
  XOR2_X1 \i_tv80_core/U522  ( .A(\i_tv80_core/n154 ), .B(
        \i_tv80_core/tstates [1]), .Z(\i_tv80_core/n382 ) );
  XOR2_X1 \i_tv80_core/U521  ( .A(\i_tv80_core/n2151 ), .B(
        \i_tv80_core/tstates [2]), .Z(\i_tv80_core/n383 ) );
  INV_X1 \i_tv80_core/U520  ( .A(\i_tv80_core/n497 ), .ZN(\i_tv80_core/n564 )
         );
  OAI21_X1 \i_tv80_core/U519  ( .B1(\i_tv80_core/n1216 ), .B2(busak_n), .A(
        \i_tv80_core/n2159 ), .ZN(\i_tv80_core/n497 ) );
  INV_X1 \i_tv80_core/U518  ( .A(\i_tv80_core/n2149 ), .ZN(\i_tv80_core/n2159 ) );
  INV_X1 \i_tv80_core/U517  ( .A(\i_tv80_core/n842 ), .ZN(\i_tv80_core/n1566 )
         );
  OAI22_X1 \i_tv80_core/U516  ( .A1(\i_tv80_core/n1216 ), .A2(
        \i_tv80_core/n2148 ), .B1(busrq_n), .B2(\i_tv80_core/n2149 ), .ZN(
        \i_tv80_core/n1387 ) );
  NAND2_X1 \i_tv80_core/U515  ( .A1(\i_tv80_core/n376 ), .A2(
        \i_tv80_core/n2149 ), .ZN(\i_tv80_core/n2148 ) );
  NAND2_X1 \i_tv80_core/U514  ( .A1(1'b1), .A2(\i_tv80_core/n350 ), .ZN(
        \i_tv80_core/n2149 ) );
  INV_X2 \i_tv80_core/U513  ( .A(\i_tv80_core/n450 ), .ZN(\i_tv80_core/n762 )
         );
  NAND2_X1 \i_tv80_core/U512  ( .A1(\i_tv80_core/RegBusA [8]), .A2(
        \i_tv80_core/n352 ), .ZN(\i_tv80_core/n1779 ) );
  OAI21_X1 \i_tv80_core/U511  ( .B1(\i_tv80_core/n1780 ), .B2(
        \i_tv80_core/n1779 ), .A(\i_tv80_core/n372 ), .ZN(\i_tv80_core/n1782 )
         );
  INV_X2 \i_tv80_core/U510  ( .A(\i_tv80_core/n1857 ), .ZN(\i_tv80_core/n1841 ) );
  OAI21_X1 \i_tv80_core/U509  ( .B1(\i_tv80_core/n181 ), .B2(
        \i_tv80_core/n109 ), .A(\i_tv80_core/n372 ), .ZN(\i_tv80_core/n1781 )
         );
  NAND2_X1 \i_tv80_core/U508  ( .A1(\i_tv80_core/n358 ), .A2(\i_tv80_core/n30 ), .ZN(\i_tv80_core/n1780 ) );
  INV_X1 \i_tv80_core/U507  ( .A(\i_tv80_core/n361 ), .ZN(\i_tv80_core/n362 )
         );
  INV_X1 \i_tv80_core/U506  ( .A(\i_tv80_core/n1509 ), .ZN(\i_tv80_core/n361 )
         );
  INV_X1 \i_tv80_core/U505  ( .A(\i_tv80_core/IncDec_16 [0]), .ZN(
        \i_tv80_core/n360 ) );
  NAND3_X2 \i_tv80_core/U504  ( .A1(tstate[0]), .A2(tstate[1]), .A3(
        \i_tv80_core/n2151 ), .ZN(\i_tv80_core/n842 ) );
  INV_X2 \i_tv80_core/U503  ( .A(\i_tv80_core/n1165 ), .ZN(\i_tv80_core/n570 )
         );
  OAI21_X1 \i_tv80_core/U502  ( .B1(\i_tv80_core/n1625 ), .B2(
        \i_tv80_core/n1624 ), .A(\i_tv80_core/n1623 ), .ZN(\i_tv80_core/n1626 ) );
  NAND2_X1 \i_tv80_core/U501  ( .A1(\i_tv80_core/n1619 ), .A2(
        \i_tv80_core/n1622 ), .ZN(\i_tv80_core/n1624 ) );
  NAND4_X1 \i_tv80_core/U500  ( .A1(\i_tv80_core/n1782 ), .A2(
        \i_tv80_core/n1781 ), .A3(\i_tv80_core/n1672 ), .A4(
        \i_tv80_core/n1783 ), .ZN(\i_tv80_core/n1786 ) );
  AOI21_X1 \i_tv80_core/U499  ( .B1(\i_tv80_core/n136 ), .B2(
        \i_tv80_core/n1639 ), .A(\i_tv80_core/n1734 ), .ZN(\i_tv80_core/n1615 ) );
  INV_X1 \i_tv80_core/U498  ( .A(\i_tv80_core/n1511 ), .ZN(\i_tv80_core/n1509 ) );
  BUF_X2 \i_tv80_core/U497  ( .A(\i_tv80_core/RegBusA [6]), .Z(
        \i_tv80_core/n358 ) );
  NAND2_X1 \i_tv80_core/U496  ( .A1(\i_tv80_core/n1776 ), .A2(
        \i_tv80_core/n1775 ), .ZN(\i_tv80_core/n1777 ) );
  INV_X1 \i_tv80_core/U495  ( .A(\i_tv80_core/IncDec_16 [2]), .ZN(
        \i_tv80_core/n357 ) );
  INV_X1 \i_tv80_core/U494  ( .A(\i_tv80_core/IncDec_16 [2]), .ZN(
        \i_tv80_core/n356 ) );
  NAND3_X1 \i_tv80_core/U493  ( .A1(\i_tv80_core/n1869 ), .A2(
        \i_tv80_core/n1868 ), .A3(\i_tv80_core/n1867 ), .ZN(
        \i_tv80_core/RegAddrA [2]) );
  AND2_X1 \i_tv80_core/U492  ( .A1(\i_tv80_core/n158 ), .A2(\i_tv80_core/n129 ), .ZN(\i_tv80_core/n355 ) );
  INV_X1 \i_tv80_core/U491  ( .A(\i_tv80_core/IncDec_16 [2]), .ZN(
        \i_tv80_core/n354 ) );
  INV_X1 \i_tv80_core/U490  ( .A(\i_tv80_core/n355 ), .ZN(\i_tv80_core/n1482 )
         );
  CLKBUF_X1 \i_tv80_core/U489  ( .A(\i_tv80_core/n2179 ), .Z(mcycle[1]) );
  AOI21_X1 \i_tv80_core/U488  ( .B1(\i_tv80_core/n1774 ), .B2(
        \i_tv80_core/n1905 ), .A(\i_tv80_core/n372 ), .ZN(\i_tv80_core/n1778 )
         );
  INV_X1 \i_tv80_core/U487  ( .A(\i_tv80_core/N1107 ), .ZN(\i_tv80_core/n344 )
         );
  NAND2_X1 \i_tv80_core/U486  ( .A1(\i_tv80_core/N1107 ), .A2(
        \i_tv80_core/Set_BusB_To [1]), .ZN(\i_tv80_core/n343 ) );
  INV_X1 \i_tv80_core/U485  ( .A(\i_tv80_core/Set_BusB_To [3]), .ZN(
        \i_tv80_core/n342 ) );
  AOI22_X1 \i_tv80_core/U484  ( .A1(\i_tv80_core/SP [15]), .A2(
        \i_tv80_core/n268 ), .B1(\i_tv80_core/n1099 ), .B2(\i_tv80_core/n242 ), 
        .ZN(\i_tv80_core/n338 ) );
  INV_X1 \i_tv80_core/U483  ( .A(\i_tv80_core/Set_BusB_To [0]), .ZN(
        \i_tv80_core/n312 ) );
  AOI22_X1 \i_tv80_core/U482  ( .A1(di_reg[7]), .A2(\i_tv80_core/n234 ), .B1(
        \i_tv80_core/PC [7]), .B2(\i_tv80_core/n239 ), .ZN(\i_tv80_core/n339 )
         );
  AOI22_X1 \i_tv80_core/U481  ( .A1(\i_tv80_core/ACC [7]), .A2(
        \i_tv80_core/n263 ), .B1(\i_tv80_core/PC [15]), .B2(\i_tv80_core/n265 ), .ZN(\i_tv80_core/n340 ) );
  AOI22_X1 \i_tv80_core/U480  ( .A1(\i_tv80_core/F [7]), .A2(
        \i_tv80_core/n269 ), .B1(\i_tv80_core/SP [7]), .B2(\i_tv80_core/n243 ), 
        .ZN(\i_tv80_core/n341 ) );
  NAND4_X1 \i_tv80_core/U479  ( .A1(\i_tv80_core/n338 ), .A2(
        \i_tv80_core/n339 ), .A3(\i_tv80_core/n340 ), .A4(\i_tv80_core/n341 ), 
        .ZN(\i_tv80_core/N1222 ) );
  AOI22_X1 \i_tv80_core/U478  ( .A1(\i_tv80_core/SP [14]), .A2(
        \i_tv80_core/n268 ), .B1(\i_tv80_core/n1100 ), .B2(\i_tv80_core/n242 ), 
        .ZN(\i_tv80_core/n334 ) );
  AOI22_X1 \i_tv80_core/U477  ( .A1(di_reg[6]), .A2(\i_tv80_core/n234 ), .B1(
        \i_tv80_core/PC [6]), .B2(\i_tv80_core/n239 ), .ZN(\i_tv80_core/n335 )
         );
  AOI22_X1 \i_tv80_core/U476  ( .A1(\i_tv80_core/ACC [6]), .A2(
        \i_tv80_core/n263 ), .B1(\i_tv80_core/PC [14]), .B2(\i_tv80_core/n265 ), .ZN(\i_tv80_core/n336 ) );
  AOI22_X1 \i_tv80_core/U475  ( .A1(\i_tv80_core/F [6]), .A2(
        \i_tv80_core/n269 ), .B1(\i_tv80_core/SP [6]), .B2(\i_tv80_core/n243 ), 
        .ZN(\i_tv80_core/n337 ) );
  NAND4_X1 \i_tv80_core/U474  ( .A1(\i_tv80_core/n334 ), .A2(
        \i_tv80_core/n335 ), .A3(\i_tv80_core/n336 ), .A4(\i_tv80_core/n337 ), 
        .ZN(\i_tv80_core/N1221 ) );
  AOI22_X1 \i_tv80_core/U473  ( .A1(\i_tv80_core/SP [13]), .A2(
        \i_tv80_core/n268 ), .B1(\i_tv80_core/n1101 ), .B2(\i_tv80_core/n242 ), 
        .ZN(\i_tv80_core/n330 ) );
  AOI22_X1 \i_tv80_core/U472  ( .A1(di_reg[5]), .A2(\i_tv80_core/n234 ), .B1(
        \i_tv80_core/PC [5]), .B2(\i_tv80_core/n239 ), .ZN(\i_tv80_core/n331 )
         );
  AOI22_X1 \i_tv80_core/U471  ( .A1(\i_tv80_core/ACC [5]), .A2(
        \i_tv80_core/n263 ), .B1(\i_tv80_core/PC [13]), .B2(\i_tv80_core/n265 ), .ZN(\i_tv80_core/n332 ) );
  AOI22_X1 \i_tv80_core/U470  ( .A1(\i_tv80_core/F [5]), .A2(
        \i_tv80_core/n269 ), .B1(\i_tv80_core/SP [5]), .B2(\i_tv80_core/n243 ), 
        .ZN(\i_tv80_core/n333 ) );
  NAND4_X1 \i_tv80_core/U469  ( .A1(\i_tv80_core/n330 ), .A2(
        \i_tv80_core/n331 ), .A3(\i_tv80_core/n332 ), .A4(\i_tv80_core/n333 ), 
        .ZN(\i_tv80_core/N1220 ) );
  AOI22_X1 \i_tv80_core/U468  ( .A1(\i_tv80_core/SP [12]), .A2(
        \i_tv80_core/n268 ), .B1(\i_tv80_core/n1102 ), .B2(\i_tv80_core/n242 ), 
        .ZN(\i_tv80_core/n326 ) );
  AOI22_X1 \i_tv80_core/U467  ( .A1(di_reg[4]), .A2(\i_tv80_core/n234 ), .B1(
        \i_tv80_core/PC [4]), .B2(\i_tv80_core/n239 ), .ZN(\i_tv80_core/n327 )
         );
  AOI22_X1 \i_tv80_core/U466  ( .A1(\i_tv80_core/ACC [4]), .A2(
        \i_tv80_core/n263 ), .B1(\i_tv80_core/PC [12]), .B2(\i_tv80_core/n265 ), .ZN(\i_tv80_core/n328 ) );
  AOI22_X1 \i_tv80_core/U465  ( .A1(\i_tv80_core/F [4]), .A2(
        \i_tv80_core/n269 ), .B1(\i_tv80_core/SP [4]), .B2(\i_tv80_core/n243 ), 
        .ZN(\i_tv80_core/n329 ) );
  NAND4_X1 \i_tv80_core/U464  ( .A1(\i_tv80_core/n326 ), .A2(
        \i_tv80_core/n327 ), .A3(\i_tv80_core/n328 ), .A4(\i_tv80_core/n329 ), 
        .ZN(\i_tv80_core/N1219 ) );
  AOI22_X1 \i_tv80_core/U463  ( .A1(\i_tv80_core/SP [11]), .A2(
        \i_tv80_core/n268 ), .B1(\i_tv80_core/n1103 ), .B2(\i_tv80_core/n242 ), 
        .ZN(\i_tv80_core/n322 ) );
  AOI22_X1 \i_tv80_core/U462  ( .A1(di_reg[3]), .A2(\i_tv80_core/n234 ), .B1(
        \i_tv80_core/PC [3]), .B2(\i_tv80_core/n239 ), .ZN(\i_tv80_core/n323 )
         );
  AOI22_X1 \i_tv80_core/U461  ( .A1(\i_tv80_core/ACC [3]), .A2(
        \i_tv80_core/n263 ), .B1(\i_tv80_core/PC [11]), .B2(\i_tv80_core/n265 ), .ZN(\i_tv80_core/n324 ) );
  AOI22_X1 \i_tv80_core/U460  ( .A1(\i_tv80_core/F [3]), .A2(
        \i_tv80_core/n269 ), .B1(\i_tv80_core/SP [3]), .B2(\i_tv80_core/n243 ), 
        .ZN(\i_tv80_core/n325 ) );
  NAND4_X1 \i_tv80_core/U459  ( .A1(\i_tv80_core/n322 ), .A2(
        \i_tv80_core/n323 ), .A3(\i_tv80_core/n324 ), .A4(\i_tv80_core/n325 ), 
        .ZN(\i_tv80_core/N1218 ) );
  AOI22_X1 \i_tv80_core/U458  ( .A1(\i_tv80_core/SP [10]), .A2(
        \i_tv80_core/n268 ), .B1(\i_tv80_core/n1104 ), .B2(\i_tv80_core/n242 ), 
        .ZN(\i_tv80_core/n318 ) );
  AOI22_X1 \i_tv80_core/U457  ( .A1(di_reg[2]), .A2(\i_tv80_core/n234 ), .B1(
        \i_tv80_core/PC [2]), .B2(\i_tv80_core/n239 ), .ZN(\i_tv80_core/n319 )
         );
  AOI22_X1 \i_tv80_core/U456  ( .A1(\i_tv80_core/ACC [2]), .A2(
        \i_tv80_core/n263 ), .B1(\i_tv80_core/PC [10]), .B2(\i_tv80_core/n265 ), .ZN(\i_tv80_core/n320 ) );
  AOI22_X1 \i_tv80_core/U455  ( .A1(\i_tv80_core/F [2]), .A2(
        \i_tv80_core/n269 ), .B1(\i_tv80_core/SP [2]), .B2(\i_tv80_core/n243 ), 
        .ZN(\i_tv80_core/n321 ) );
  NAND4_X1 \i_tv80_core/U454  ( .A1(\i_tv80_core/n318 ), .A2(
        \i_tv80_core/n319 ), .A3(\i_tv80_core/n320 ), .A4(\i_tv80_core/n321 ), 
        .ZN(\i_tv80_core/N1217 ) );
  AOI22_X1 \i_tv80_core/U453  ( .A1(\i_tv80_core/SP [9]), .A2(
        \i_tv80_core/n268 ), .B1(\i_tv80_core/n1105 ), .B2(\i_tv80_core/n242 ), 
        .ZN(\i_tv80_core/n314 ) );
  AOI22_X1 \i_tv80_core/U452  ( .A1(di_reg[1]), .A2(\i_tv80_core/n234 ), .B1(
        \i_tv80_core/PC [1]), .B2(\i_tv80_core/n239 ), .ZN(\i_tv80_core/n315 )
         );
  AOI22_X1 \i_tv80_core/U451  ( .A1(\i_tv80_core/ACC [1]), .A2(
        \i_tv80_core/n263 ), .B1(\i_tv80_core/PC [9]), .B2(\i_tv80_core/n265 ), 
        .ZN(\i_tv80_core/n316 ) );
  AOI22_X1 \i_tv80_core/U450  ( .A1(\i_tv80_core/F [1]), .A2(
        \i_tv80_core/n269 ), .B1(\i_tv80_core/SP [1]), .B2(\i_tv80_core/n243 ), 
        .ZN(\i_tv80_core/n317 ) );
  NAND4_X1 \i_tv80_core/U449  ( .A1(\i_tv80_core/n314 ), .A2(
        \i_tv80_core/n315 ), .A3(\i_tv80_core/n316 ), .A4(\i_tv80_core/n317 ), 
        .ZN(\i_tv80_core/N1216 ) );
  NAND3_X1 \i_tv80_core/U448  ( .A1(\i_tv80_core/n308 ), .A2(
        \i_tv80_core/n309 ), .A3(\i_tv80_core/n310 ), .ZN(\i_tv80_core/n304 )
         );
  NAND3_X1 \i_tv80_core/U447  ( .A1(\i_tv80_core/n301 ), .A2(
        \i_tv80_core/n302 ), .A3(\i_tv80_core/n303 ), .ZN(\i_tv80_core/N1215 )
         );
  OR2_X1 \i_tv80_core/U441  ( .A1(\i_tv80_core/n1227 ), .A2(
        \i_tv80_core/n1228 ), .ZN(\i_tv80_core/n593 ) );
  AND2_X1 \i_tv80_core/U440  ( .A1(\i_tv80_core/n371 ), .A2(
        \i_tv80_core/n1008 ), .ZN(\i_tv80_core/n295 ) );
  AND2_X1 \i_tv80_core/U439  ( .A1(\i_tv80_core/n1135 ), .A2(
        \i_tv80_core/n1132 ), .ZN(\i_tv80_core/n294 ) );
  AND3_X1 \i_tv80_core/U438  ( .A1(\i_tv80_core/n1134 ), .A2(
        \i_tv80_core/n1133 ), .A3(\i_tv80_core/n439 ), .ZN(\i_tv80_core/n293 )
         );
  AND2_X1 \i_tv80_core/U437  ( .A1(\i_tv80_core/n154 ), .A2(
        \i_tv80_core/n2151 ), .ZN(\i_tv80_core/n292 ) );
  OR2_X1 \i_tv80_core/U436  ( .A1(\i_tv80_core/Set_Addr_To [1]), .A2(
        \i_tv80_core/n1877 ), .ZN(\i_tv80_core/n291 ) );
  MUX2_X1 \i_tv80_core/U435  ( .A(\i_tv80_core/RegAddrC [1]), .B(
        \i_tv80_core/n291 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n290 ) );
  OR2_X1 \i_tv80_core/U434  ( .A1(\i_tv80_core/n1873 ), .A2(
        \i_tv80_core/n1872 ), .ZN(\i_tv80_core/n289 ) );
  MUX2_X1 \i_tv80_core/U433  ( .A(\i_tv80_core/RegAddrC [0]), .B(
        \i_tv80_core/n289 ), .S(\i_tv80_core/n370 ), .Z(\i_tv80_core/n288 ) );
  MUX2_X1 \i_tv80_core/U432  ( .A(\i_tv80_core/F_Out [0]), .B(
        \i_tv80_core/n709 ), .S(\i_tv80_core/n713 ), .Z(\i_tv80_core/n711 ) );
  AND2_X1 \i_tv80_core/U431  ( .A1(\i_tv80_core/SP [0]), .A2(
        \i_tv80_core/n312 ), .ZN(\i_tv80_core/n287 ) );
  OAI21_X1 \i_tv80_core/U430  ( .B1(\i_tv80_core/F [0]), .B2(
        \i_tv80_core/n312 ), .A(\i_tv80_core/Set_BusB_To [1]), .ZN(
        \i_tv80_core/n313 ) );
  INV_X1 \i_tv80_core/U429  ( .A(\i_tv80_core/n313 ), .ZN(\i_tv80_core/n311 )
         );
  XNOR2_X1 \i_tv80_core/U428  ( .A(\i_tv80_core/n1015 ), .B(
        \i_tv80_core/PC [2]), .ZN(\i_tv80_core/n286 ) );
  XOR2_X1 \i_tv80_core/U427  ( .A(\i_tv80_core/n286 ), .B(\i_tv80_core/n90 ), 
        .Z(\i_tv80_core/n962 ) );
  OAI221_X1 \i_tv80_core/U426  ( .B1(\i_tv80_core/n2032 ), .B2(
        \i_tv80_core/n1122 ), .C1(\i_tv80_core/n1165 ), .C2(
        \i_tv80_core/n1013 ), .A(\i_tv80_core/n1011 ), .ZN(\i_tv80_core/n1292 ) );
  OR2_X1 \i_tv80_core/U425  ( .A1(\i_tv80_core/n1166 ), .A2(
        \i_tv80_core/PC [6]), .ZN(\i_tv80_core/n1390 ) );
  AND2_X1 \i_tv80_core/U424  ( .A1(\i_tv80_core/PC [9]), .A2(
        \i_tv80_core/n1530 ), .ZN(\i_tv80_core/n285 ) );
  XOR2_X1 \i_tv80_core/U423  ( .A(\i_tv80_core/n946 ), .B(\i_tv80_core/n947 ), 
        .Z(\i_tv80_core/n944 ) );
  AND4_X1 \i_tv80_core/U422  ( .A1(\i_tv80_core/n2070 ), .A2(
        \i_tv80_core/n1198 ), .A3(\i_tv80_core/n367 ), .A4(\i_tv80_core/n515 ), 
        .ZN(\i_tv80_core/n284 ) );
  NAND2_X1 \i_tv80_core/U421  ( .A1(\i_tv80_core/PC [8]), .A2(
        \i_tv80_core/n265 ), .ZN(\i_tv80_core/n310 ) );
  AND2_X1 \i_tv80_core/U420  ( .A1(\i_tv80_core/n598 ), .A2(
        \i_tv80_core/n1225 ), .ZN(\i_tv80_core/n283 ) );
  AND4_X1 \i_tv80_core/U419  ( .A1(\i_tv80_core/n1216 ), .A2(
        \i_tv80_core/n553 ), .A3(\i_tv80_core/n563 ), .A4(\i_tv80_core/n126 ), 
        .ZN(\i_tv80_core/n282 ) );
  NAND2_X1 \i_tv80_core/U418  ( .A1(\i_tv80_core/ACC [0]), .A2(
        \i_tv80_core/n263 ), .ZN(\i_tv80_core/n309 ) );
  NAND2_X1 \i_tv80_core/U417  ( .A1(\i_tv80_core/SP [8]), .A2(
        \i_tv80_core/n268 ), .ZN(\i_tv80_core/n302 ) );
  OAI21_X1 \i_tv80_core/U416  ( .B1(\i_tv80_core/n311 ), .B2(
        \i_tv80_core/n287 ), .A(\i_tv80_core/n267 ), .ZN(\i_tv80_core/n301 )
         );
  NAND2_X1 \i_tv80_core/U415  ( .A1(\i_tv80_core/PC [0]), .A2(
        \i_tv80_core/n239 ), .ZN(\i_tv80_core/n308 ) );
  NAND2_X1 \i_tv80_core/U414  ( .A1(\i_tv80_core/n306 ), .A2(
        \i_tv80_core/n307 ), .ZN(\i_tv80_core/n305 ) );
  NOR2_X1 \i_tv80_core/U413  ( .A1(\i_tv80_core/n304 ), .A2(\i_tv80_core/n305 ), .ZN(\i_tv80_core/n303 ) );
  NAND2_X1 \i_tv80_core/U412  ( .A1(di_reg[0]), .A2(\i_tv80_core/n234 ), .ZN(
        \i_tv80_core/n307 ) );
  NOR2_X1 \i_tv80_core/U411  ( .A1(\i_tv80_core/n1123 ), .A2(
        \i_tv80_core/PC [5]), .ZN(\i_tv80_core/n281 ) );
  AND2_X1 \i_tv80_core/U410  ( .A1(1'b1), .A2(busak_n), .ZN(\i_tv80_core/n280 ) );
  AND2_X1 \i_tv80_core/U409  ( .A1(\i_tv80_core/n1963 ), .A2(
        \i_tv80_core/n1962 ), .ZN(\i_tv80_core/n279 ) );
  CLKBUF_X2 \i_tv80_core/U408  ( .A(\i_tv80_core/n369 ), .Z(\i_tv80_core/n370 ) );
  AND2_X1 \i_tv80_core/U407  ( .A1(\i_tv80_core/n708 ), .A2(\i_tv80_core/n742 ), .ZN(\i_tv80_core/n278 ) );
  AND3_X1 \i_tv80_core/U406  ( .A1(\i_tv80_core/n694 ), .A2(
        \i_tv80_core/ExchangeAF ), .A3(\i_tv80_core/n742 ), .ZN(
        \i_tv80_core/n277 ) );
  AND2_X1 \i_tv80_core/U405  ( .A1(\i_tv80_core/n625 ), .A2(\i_tv80_core/n628 ), .ZN(\i_tv80_core/n276 ) );
  AND4_X1 \i_tv80_core/U404  ( .A1(\i_tv80_core/n1957 ), .A2(
        \i_tv80_core/n1961 ), .A3(\i_tv80_core/n1968 ), .A4(\i_tv80_core/n774 ), .ZN(\i_tv80_core/n275 ) );
  INV_X1 \i_tv80_core/U403  ( .A(\i_tv80_core/n1964 ), .ZN(\i_tv80_core/n1957 ) );
  AND2_X1 \i_tv80_core/U402  ( .A1(\i_tv80_core/n1843 ), .A2(
        \i_tv80_core/n1560 ), .ZN(\i_tv80_core/n274 ) );
  AND2_X1 \i_tv80_core/U401  ( .A1(\i_tv80_core/n227 ), .A2(
        \i_tv80_core/n1594 ), .ZN(\i_tv80_core/n273 ) );
  XNOR2_X1 \i_tv80_core/U400  ( .A(\i_tv80_core/n793 ), .B(\i_tv80_core/n790 ), 
        .ZN(\i_tv80_core/n272 ) );
  XNOR2_X1 \i_tv80_core/U399  ( .A(\i_tv80_core/n791 ), .B(\i_tv80_core/n272 ), 
        .ZN(\i_tv80_core/n954 ) );
  AND2_X1 \i_tv80_core/U398  ( .A1(\i_tv80_core/n837 ), .A2(\i_tv80_core/n817 ), .ZN(\i_tv80_core/n271 ) );
  AND2_X1 \i_tv80_core/U397  ( .A1(\i_tv80_core/n67 ), .A2(\i_tv80_core/n629 ), 
        .ZN(\i_tv80_core/n635 ) );
  NAND2_X1 \i_tv80_core/U396  ( .A1(\i_tv80_core/n1106 ), .A2(
        \i_tv80_core/n242 ), .ZN(\i_tv80_core/n306 ) );
  INV_X1 \i_tv80_core/U395  ( .A(\i_tv80_core/n512 ), .ZN(\i_tv80_core/n577 )
         );
  AND3_X1 \i_tv80_core/U394  ( .A1(\i_tv80_core/N1107 ), .A2(
        \i_tv80_core/Set_BusB_To [3]), .A3(\i_tv80_core/n1821 ), .ZN(
        \i_tv80_core/n266 ) );
  AND2_X1 \i_tv80_core/U393  ( .A1(\i_tv80_core/n266 ), .A2(
        \i_tv80_core/Set_BusB_To [0]), .ZN(\i_tv80_core/n265 ) );
  AND2_X1 \i_tv80_core/U392  ( .A1(\i_tv80_core/n453 ), .A2(\i_tv80_core/n452 ), .ZN(\i_tv80_core/n264 ) );
  AND2_X1 \i_tv80_core/U391  ( .A1(\i_tv80_core/n828 ), .A2(\i_tv80_core/n837 ), .ZN(\i_tv80_core/n261 ) );
  AND3_X1 \i_tv80_core/U390  ( .A1(\i_tv80_core/n1070 ), .A2(
        \i_tv80_core/n1071 ), .A3(\i_tv80_core/n1072 ), .ZN(\i_tv80_core/n260 ) );
  AND2_X1 \i_tv80_core/U389  ( .A1(\i_tv80_core/n956 ), .A2(
        \i_tv80_core/n1161 ), .ZN(\i_tv80_core/n259 ) );
  XNOR2_X1 \i_tv80_core/U388  ( .A(\i_tv80_core/n900 ), .B(\i_tv80_core/n901 ), 
        .ZN(\i_tv80_core/n257 ) );
  NOR2_X1 \i_tv80_core/U387  ( .A1(\i_tv80_core/RegBusA [9]), .A2(
        \i_tv80_core/RegBusA [8]), .ZN(\i_tv80_core/n1774 ) );
  XNOR2_X1 \i_tv80_core/U386  ( .A(\i_tv80_core/n405 ), .B(\i_tv80_core/n404 ), 
        .ZN(\i_tv80_core/n256 ) );
  INV_X1 \i_tv80_core/U385  ( .A(\i_tv80_core/n1620 ), .ZN(\i_tv80_core/n1619 ) );
  OAI21_X1 \i_tv80_core/U384  ( .B1(\i_tv80_core/n1847 ), .B2(
        \i_tv80_core/n1846 ), .A(\i_tv80_core/n1845 ), .ZN(
        \i_tv80_core/RegAddrA [1]) );
  OAI21_X1 \i_tv80_core/U383  ( .B1(\i_tv80_core/RegBusA [11]), .B2(
        \i_tv80_core/RegBusA [12]), .A(\i_tv80_core/n347 ), .ZN(
        \i_tv80_core/n1776 ) );
  NAND2_X1 \i_tv80_core/U382  ( .A1(\i_tv80_core/n1621 ), .A2(
        \i_tv80_core/n1641 ), .ZN(\i_tv80_core/n1625 ) );
  NOR2_X1 \i_tv80_core/U381  ( .A1(\i_tv80_core/n1615 ), .A2(
        \i_tv80_core/n1620 ), .ZN(\i_tv80_core/n1627 ) );
  INV_X1 \i_tv80_core/U380  ( .A(\i_tv80_core/RegBusA [2]), .ZN(
        \i_tv80_core/n1904 ) );
  INV_X1 \i_tv80_core/U379  ( .A(\i_tv80_core/RegBusA [3]), .ZN(
        \i_tv80_core/n1909 ) );
  INV_X1 \i_tv80_core/U378  ( .A(reset_n), .ZN(\i_tv80_core/n380 ) );
  XNOR2_X1 \i_tv80_core/U377  ( .A(\i_tv80_core/n785 ), .B(\i_tv80_core/n784 ), 
        .ZN(\i_tv80_core/n920 ) );
  AND3_X1 \i_tv80_core/U376  ( .A1(\i_tv80_core/n862 ), .A2(
        \i_tv80_core/n1961 ), .A3(\i_tv80_core/n276 ), .ZN(\i_tv80_core/n254 )
         );
  AND3_X1 \i_tv80_core/U375  ( .A1(\i_tv80_core/Set_BusA_To [3]), .A2(
        \i_tv80_core/n1887 ), .A3(\i_tv80_core/n1885 ), .ZN(\i_tv80_core/n253 ) );
  AND2_X1 \i_tv80_core/U374  ( .A1(\i_tv80_core/n1873 ), .A2(
        \i_tv80_core/n1992 ), .ZN(\i_tv80_core/n251 ) );
  XNOR2_X1 \i_tv80_core/U373  ( .A(\i_tv80_core/n76 ), .B(\i_tv80_core/n832 ), 
        .ZN(\i_tv80_core/n249 ) );
  XNOR2_X1 \i_tv80_core/U372  ( .A(\i_tv80_core/n249 ), .B(\i_tv80_core/n823 ), 
        .ZN(\i_tv80_core/n914 ) );
  AND3_X1 \i_tv80_core/U371  ( .A1(\i_tv80_core/n631 ), .A2(\i_tv80_core/n635 ), .A3(\i_tv80_core/n630 ), .ZN(\i_tv80_core/n248 ) );
  AND3_X1 \i_tv80_core/U370  ( .A1(\i_tv80_core/Special_LD [0]), .A2(
        \i_tv80_core/n631 ), .A3(\i_tv80_core/n635 ), .ZN(\i_tv80_core/n246 )
         );
  XNOR2_X1 \i_tv80_core/U369  ( .A(\i_tv80_core/n872 ), .B(\i_tv80_core/n858 ), 
        .ZN(\i_tv80_core/n911 ) );
  AND2_X1 \i_tv80_core/U368  ( .A1(\i_tv80_core/n2078 ), .A2(
        \i_tv80_core/n2080 ), .ZN(\i_tv80_core/n245 ) );
  AND2_X1 \i_tv80_core/U367  ( .A1(\i_tv80_core/n635 ), .A2(\i_tv80_core/n634 ), .ZN(\i_tv80_core/n244 ) );
  AND2_X1 \i_tv80_core/U366  ( .A1(\i_tv80_core/n343 ), .A2(\i_tv80_core/n342 ), .ZN(\i_tv80_core/n242 ) );
  AND3_X1 \i_tv80_core/U365  ( .A1(\i_tv80_core/Set_Addr_To [1]), .A2(
        \i_tv80_core/Set_Addr_To [2]), .A3(\i_tv80_core/n2009 ), .ZN(
        \i_tv80_core/n241 ) );
  AND2_X1 \i_tv80_core/U364  ( .A1(\i_tv80_core/n2080 ), .A2(
        \i_tv80_core/n2079 ), .ZN(\i_tv80_core/n240 ) );
  NAND2_X1 \i_tv80_core/U363  ( .A1(\i_tv80_core/n2012 ), .A2(
        \i_tv80_core/n2011 ), .ZN(\i_tv80_core/n2137 ) );
  AND2_X1 \i_tv80_core/U362  ( .A1(\i_tv80_core/n266 ), .A2(\i_tv80_core/n312 ), .ZN(\i_tv80_core/n239 ) );
  XNOR2_X1 \i_tv80_core/U361  ( .A(\i_tv80_core/n879 ), .B(\i_tv80_core/n102 ), 
        .ZN(\i_tv80_core/n238 ) );
  XNOR2_X1 \i_tv80_core/U360  ( .A(\i_tv80_core/n174 ), .B(\i_tv80_core/n882 ), 
        .ZN(\i_tv80_core/n237 ) );
  XNOR2_X1 \i_tv80_core/U359  ( .A(\i_tv80_core/n876 ), .B(\i_tv80_core/n237 ), 
        .ZN(\i_tv80_core/n1408 ) );
  NAND2_X1 \i_tv80_core/U358  ( .A1(\i_tv80_core/n371 ), .A2(
        \i_tv80_core/n350 ), .ZN(\i_tv80_core/n1947 ) );
  XNOR2_X1 \i_tv80_core/U357  ( .A(\i_tv80_core/n174 ), .B(\i_tv80_core/n1477 ), .ZN(\i_tv80_core/n233 ) );
  XNOR2_X1 \i_tv80_core/U356  ( .A(\i_tv80_core/n892 ), .B(\i_tv80_core/n233 ), 
        .ZN(\i_tv80_core/n1424 ) );
  AND3_X1 \i_tv80_core/U355  ( .A1(\i_tv80_core/n169 ), .A2(
        \i_tv80_core/n1772 ), .A3(\i_tv80_core/n1771 ), .ZN(\i_tv80_core/n232 ) );
  AND3_X1 \i_tv80_core/U354  ( .A1(\i_tv80_core/n1803 ), .A2(
        \i_tv80_core/n1797 ), .A3(\i_tv80_core/n1796 ), .ZN(\i_tv80_core/n231 ) );
  NOR2_X1 \i_tv80_core/U353  ( .A1(\i_tv80_core/n1777 ), .A2(
        \i_tv80_core/n1778 ), .ZN(\i_tv80_core/n1787 ) );
  AND2_X1 \i_tv80_core/U352  ( .A1(\i_tv80_core/n1959 ), .A2(
        \i_tv80_core/n1958 ), .ZN(\i_tv80_core/n230 ) );
  AND2_X1 \i_tv80_core/U351  ( .A1(\i_tv80_core/I_RLD ), .A2(
        \i_tv80_core/n1959 ), .ZN(\i_tv80_core/n229 ) );
  AND2_X1 \i_tv80_core/U350  ( .A1(\i_tv80_core/n377 ), .A2(\i_tv80_core/n457 ), .ZN(\i_tv80_core/n228 ) );
  AND2_X1 \i_tv80_core/U349  ( .A1(\i_tv80_core/n1843 ), .A2(
        \i_tv80_core/n1569 ), .ZN(\i_tv80_core/n227 ) );
  NAND2_X1 \i_tv80_core/U348  ( .A1(\i_tv80_core/n215 ), .A2(
        \i_tv80_core/n907 ), .ZN(\i_tv80_core/n1525 ) );
  AND2_X1 \i_tv80_core/U347  ( .A1(\i_tv80_core/n350 ), .A2(\i_tv80_core/n641 ), .ZN(\i_tv80_core/n760 ) );
  AND2_X1 \i_tv80_core/U346  ( .A1(\i_tv80_core/n244 ), .A2(
        \i_tv80_core/ExchangeAF ), .ZN(\i_tv80_core/n225 ) );
  OR2_X1 \i_tv80_core/U345  ( .A1(\i_tv80_core/Call ), .A2(\i_tv80_core/RstP ), 
        .ZN(\i_tv80_core/n930 ) );
  AND2_X1 \i_tv80_core/U344  ( .A1(\i_tv80_core/n377 ), .A2(
        \i_tv80_core/n2011 ), .ZN(\i_tv80_core/n223 ) );
  AND2_X1 \i_tv80_core/U343  ( .A1(\i_tv80_core/n2075 ), .A2(
        \i_tv80_core/n2067 ), .ZN(\i_tv80_core/n222 ) );
  AND2_X1 \i_tv80_core/U342  ( .A1(\i_tv80_core/n2020 ), .A2(
        \i_tv80_core/n2080 ), .ZN(\i_tv80_core/n221 ) );
  NAND2_X1 \i_tv80_core/U341  ( .A1(\i_tv80_core/n22 ), .A2(
        \i_tv80_core/n1997 ), .ZN(\i_tv80_core/n1548 ) );
  INV_X1 \i_tv80_core/U340  ( .A(\i_tv80_core/n1947 ), .ZN(\i_tv80_core/n2068 ) );
  AND2_X1 \i_tv80_core/U339  ( .A1(\i_tv80_core/n1789 ), .A2(
        \i_tv80_core/n232 ), .ZN(\i_tv80_core/n218 ) );
  INV_X1 \i_tv80_core/U338  ( .A(\i_tv80_core/n378 ), .ZN(\i_tv80_core/n377 )
         );
  INV_X1 \i_tv80_core/U337  ( .A(\i_tv80_core/n379 ), .ZN(\i_tv80_core/n350 )
         );
  INV_X1 \i_tv80_core/U336  ( .A(\i_tv80_core/n378 ), .ZN(\i_tv80_core/n376 )
         );
  AND2_X1 \i_tv80_core/U335  ( .A1(\i_tv80_core/n1871 ), .A2(
        \i_tv80_core/n1870 ), .ZN(\i_tv80_core/n216 ) );
  BUF_X1 \i_tv80_core/U334  ( .A(\i_tv80_core/n2068 ), .Z(\i_tv80_core/n368 )
         );
  AND2_X1 \i_tv80_core/U333  ( .A1(\i_tv80_core/n906 ), .A2(\i_tv80_core/n366 ), .ZN(\i_tv80_core/n215 ) );
  AND2_X1 \i_tv80_core/U332  ( .A1(\i_tv80_core/n212 ), .A2(\i_tv80_core/n680 ), .ZN(\i_tv80_core/n214 ) );
  AND3_X1 \i_tv80_core/U331  ( .A1(\i_tv80_core/n368 ), .A2(\i_tv80_core/n642 ), .A3(\i_tv80_core/n680 ), .ZN(\i_tv80_core/n213 ) );
  BUF_X1 \i_tv80_core/U330  ( .A(\i_tv80_core/n2068 ), .Z(\i_tv80_core/n366 )
         );
  INV_X1 \i_tv80_core/U329  ( .A(\i_tv80_core/n2060 ), .ZN(\i_tv80_core/n2141 ) );
  INV_X1 \i_tv80_core/U328  ( .A(\i_tv80_core/n2051 ), .ZN(\i_tv80_core/n2134 ) );
  INV_X1 \i_tv80_core/U327  ( .A(reset_n), .ZN(\i_tv80_core/n349 ) );
  AND2_X1 \i_tv80_core/U326  ( .A1(\i_tv80_core/n640 ), .A2(\i_tv80_core/n366 ), .ZN(\i_tv80_core/n212 ) );
  AND3_X1 \i_tv80_core/U325  ( .A1(\i_tv80_core/n209 ), .A2(\i_tv80_core/n210 ), .A3(\i_tv80_core/n211 ), .ZN(\i_tv80_core/n1754 ) );
  INV_X1 \i_tv80_core/U324  ( .A(\i_tv80_core/n1751 ), .ZN(\i_tv80_core/n211 )
         );
  NAND2_X1 \i_tv80_core/U323  ( .A1(\i_tv80_core/n1752 ), .A2(
        \i_tv80_core/n156 ), .ZN(\i_tv80_core/n210 ) );
  NAND2_X1 \i_tv80_core/U322  ( .A1(\i_tv80_core/n1770 ), .A2(
        \i_tv80_core/n1753 ), .ZN(\i_tv80_core/n209 ) );
  XOR2_X1 \i_tv80_core/U321  ( .A(di_reg[5]), .B(di_reg[4]), .Z(
        \i_tv80_core/n208 ) );
  XOR2_X1 \i_tv80_core/U320  ( .A(\i_tv80_core/n523 ), .B(\i_tv80_core/n208 ), 
        .Z(\i_tv80_core/n524 ) );
  XOR2_X1 \i_tv80_core/U319  ( .A(di_reg[3]), .B(di_reg[2]), .Z(
        \i_tv80_core/n207 ) );
  XOR2_X1 \i_tv80_core/U318  ( .A(\i_tv80_core/n522 ), .B(\i_tv80_core/n207 ), 
        .Z(\i_tv80_core/n525 ) );
  XOR2_X1 \i_tv80_core/U317  ( .A(\i_tv80_core/n1166 ), .B(\i_tv80_core/PC [6]), .Z(\i_tv80_core/n206 ) );
  XNOR2_X1 \i_tv80_core/U316  ( .A(\i_tv80_core/n206 ), .B(\i_tv80_core/n1214 ), .ZN(\i_tv80_core/n1141 ) );
  XOR2_X1 \i_tv80_core/U315  ( .A(\i_tv80_core/n347 ), .B(\i_tv80_core/n133 ), 
        .Z(\i_tv80_core/n205 ) );
  NAND2_X1 \i_tv80_core/U314  ( .A1(\i_tv80_core/n402 ), .A2(
        \i_tv80_core/n1583 ), .ZN(\i_tv80_core/n204 ) );
  XNOR2_X1 \i_tv80_core/U313  ( .A(\i_tv80_core/n204 ), .B(\i_tv80_core/n205 ), 
        .ZN(\i_tv80_core/n258 ) );
  CLKBUF_X1 \i_tv80_core/U312  ( .A(\i_tv80_core/n1566 ), .Z(
        \i_tv80_core/n364 ) );
  CLKBUF_X1 \i_tv80_core/U311  ( .A(\i_tv80_core/n1566 ), .Z(
        \i_tv80_core/n363 ) );
  XOR2_X1 \i_tv80_core/U310  ( .A(\i_tv80_core/n800 ), .B(\i_tv80_core/n806 ), 
        .Z(\i_tv80_core/n203 ) );
  XOR2_X1 \i_tv80_core/U309  ( .A(\i_tv80_core/n203 ), .B(\i_tv80_core/n81 ), 
        .Z(\i_tv80_core/n963 ) );
  XOR2_X1 \i_tv80_core/U308  ( .A(\i_tv80_core/n851 ), .B(\i_tv80_core/n852 ), 
        .Z(\i_tv80_core/n202 ) );
  XOR2_X1 \i_tv80_core/U307  ( .A(\i_tv80_core/n839 ), .B(\i_tv80_core/n202 ), 
        .Z(\i_tv80_core/n1119 ) );
  XOR2_X1 \i_tv80_core/U306  ( .A(\i_tv80_core/n833 ), .B(\i_tv80_core/n261 ), 
        .Z(\i_tv80_core/n201 ) );
  XOR2_X1 \i_tv80_core/U305  ( .A(\i_tv80_core/n825 ), .B(\i_tv80_core/n201 ), 
        .Z(\i_tv80_core/n1064 ) );
  BUF_X2 \i_tv80_core/U304  ( .A(\i_tv80_core/n1566 ), .Z(\i_tv80_core/n365 )
         );
  BUF_X1 \i_tv80_core/U303  ( .A(\i_tv80_core/n380 ), .Z(\i_tv80_core/n378 )
         );
  BUF_X1 \i_tv80_core/U302  ( .A(\i_tv80_core/n380 ), .Z(\i_tv80_core/n379 )
         );
  CLKBUF_X3 \i_tv80_core/U301  ( .A(\i_tv80_core/n369 ), .Z(\i_tv80_core/n371 ) );
  AOI221_X4 \i_tv80_core/U300  ( .B1(\i_tv80_core/n1766 ), .B2(
        \i_tv80_core/n1765 ), .C1(\i_tv80_core/n1764 ), .C2(
        \i_tv80_core/n1763 ), .A(\i_tv80_core/n1762 ), .ZN(\i_tv80_core/n2167 ) );
  AOI221_X4 \i_tv80_core/U299  ( .B1(\i_tv80_core/n1611 ), .B2(
        \i_tv80_core/n1734 ), .C1(\i_tv80_core/n1610 ), .C2(
        \i_tv80_core/n1609 ), .A(\i_tv80_core/n1608 ), .ZN(\i_tv80_core/n2166 ) );
  AND3_X1 \i_tv80_core/U298  ( .A1(\i_tv80_core/n197 ), .A2(\i_tv80_core/n198 ), .A3(\i_tv80_core/n199 ), .ZN(\i_tv80_core/n1681 ) );
  INV_X1 \i_tv80_core/U297  ( .A(\i_tv80_core/n1677 ), .ZN(\i_tv80_core/n199 )
         );
  NAND2_X1 \i_tv80_core/U296  ( .A1(\i_tv80_core/n1679 ), .A2(
        \i_tv80_core/n1678 ), .ZN(\i_tv80_core/n198 ) );
  NAND2_X1 \i_tv80_core/U295  ( .A1(\i_tv80_core/n1689 ), .A2(
        \i_tv80_core/n1680 ), .ZN(\i_tv80_core/n197 ) );
  NOR2_X1 \i_tv80_core/U294  ( .A1(\i_tv80_core/n1828 ), .A2(
        \i_tv80_core/n196 ), .ZN(\i_tv80_core/n1837 ) );
  NAND2_X2 \i_tv80_core/U293  ( .A1(\i_tv80_core/n1568 ), .A2(
        \i_tv80_core/n1843 ), .ZN(\i_tv80_core/n1734 ) );
  NOR2_X1 \i_tv80_core/U292  ( .A1(\i_tv80_core/n1645 ), .A2(
        \i_tv80_core/n1734 ), .ZN(\i_tv80_core/n195 ) );
  INV_X1 \i_tv80_core/U291  ( .A(\i_tv80_core/n360 ), .ZN(\i_tv80_core/n194 )
         );
  INV_X2 \i_tv80_core/U290  ( .A(\i_tv80_core/n348 ), .ZN(\i_tv80_core/n373 )
         );
  AOI21_X1 \i_tv80_core/U289  ( .B1(\i_tv80_core/RegBusA [10]), .B2(
        \i_tv80_core/RegBusA [9]), .A(\i_tv80_core/n23 ), .ZN(
        \i_tv80_core/n193 ) );
  NAND3_X1 \i_tv80_core/U288  ( .A1(\i_tv80_core/n152 ), .A2(\i_tv80_core/n34 ), .A3(\i_tv80_core/n38 ), .ZN(\i_tv80_core/n1758 ) );
  NAND2_X1 \i_tv80_core/U287  ( .A1(\i_tv80_core/n1672 ), .A2(
        \i_tv80_core/n192 ), .ZN(\i_tv80_core/n1640 ) );
  OR2_X1 \i_tv80_core/U286  ( .A1(\i_tv80_core/n351 ), .A2(\i_tv80_core/n347 ), 
        .ZN(\i_tv80_core/n192 ) );
  INV_X1 \i_tv80_core/U285  ( .A(\i_tv80_core/n193 ), .ZN(\i_tv80_core/n1773 )
         );
  BUF_X2 \i_tv80_core/U284  ( .A(\i_tv80_core/IncDec_16 [3]), .Z(
        \i_tv80_core/n375 ) );
  INV_X1 \i_tv80_core/U283  ( .A(\i_tv80_core/n1628 ), .ZN(\i_tv80_core/n1644 ) );
  AND3_X1 \i_tv80_core/U282  ( .A1(\i_tv80_core/n1642 ), .A2(
        \i_tv80_core/n138 ), .A3(\i_tv80_core/n195 ), .ZN(\i_tv80_core/n1646 )
         );
  NAND2_X2 \i_tv80_core/U281  ( .A1(\i_tv80_core/n365 ), .A2(
        \i_tv80_core/ExchangeDH ), .ZN(\i_tv80_core/n1857 ) );
  INV_X1 \i_tv80_core/U280  ( .A(\i_tv80_core/n1618 ), .ZN(\i_tv80_core/n191 )
         );
  AND2_X1 \i_tv80_core/U279  ( .A1(\i_tv80_core/n192 ), .A2(
        \i_tv80_core/n1672 ), .ZN(\i_tv80_core/n190 ) );
  AND2_X1 \i_tv80_core/U278  ( .A1(\i_tv80_core/n191 ), .A2(\i_tv80_core/n190 ), .ZN(\i_tv80_core/n189 ) );
  NAND3_X1 \i_tv80_core/U277  ( .A1(\i_tv80_core/n189 ), .A2(
        \i_tv80_core/n136 ), .A3(\i_tv80_core/n1619 ), .ZN(\i_tv80_core/n1623 ) );
  NAND4_X1 \i_tv80_core/U276  ( .A1(\i_tv80_core/n1909 ), .A2(
        \i_tv80_core/n1892 ), .A3(\i_tv80_core/n1904 ), .A4(
        \i_tv80_core/n1898 ), .ZN(\i_tv80_core/n187 ) );
  OAI21_X1 \i_tv80_core/U275  ( .B1(\i_tv80_core/n352 ), .B2(
        \i_tv80_core/n358 ), .A(\i_tv80_core/n347 ), .ZN(\i_tv80_core/n186 )
         );
  NAND3_X2 \i_tv80_core/U274  ( .A1(\i_tv80_core/n1792 ), .A2(
        \i_tv80_core/n1791 ), .A3(\i_tv80_core/n39 ), .ZN(
        \i_tv80_core/RegDIH [6]) );
  AOI221_X4 \i_tv80_core/U273  ( .B1(\i_tv80_core/n1801 ), .B2(
        \i_tv80_core/n1654 ), .C1(\i_tv80_core/RegBusB [8]), .C2(
        \i_tv80_core/n1841 ), .A(\i_tv80_core/n1653 ), .ZN(\i_tv80_core/n1663 ) );
  INV_X1 \i_tv80_core/U272  ( .A(\i_tv80_core/n1164 ), .ZN(\i_tv80_core/n185 )
         );
  INV_X1 \i_tv80_core/U271  ( .A(\i_tv80_core/n183 ), .ZN(\i_tv80_core/n184 )
         );
  AOI21_X1 \i_tv80_core/U270  ( .B1(\i_tv80_core/RegBusA [10]), .B2(
        \i_tv80_core/RegBusA [9]), .A(\i_tv80_core/n23 ), .ZN(
        \i_tv80_core/n182 ) );
  INV_X1 \i_tv80_core/U269  ( .A(\i_tv80_core/n200 ), .ZN(\i_tv80_core/n181 )
         );
  CLKBUF_X1 \i_tv80_core/U268  ( .A(\i_tv80_core/n1726 ), .Z(
        \i_tv80_core/n180 ) );
  INV_X1 \i_tv80_core/U267  ( .A(\i_tv80_core/n122 ), .ZN(\i_tv80_core/n178 )
         );
  NAND3_X2 \i_tv80_core/U266  ( .A1(\i_tv80_core/n1660 ), .A2(
        \i_tv80_core/n1661 ), .A3(\i_tv80_core/n41 ), .ZN(
        \i_tv80_core/RegDIH [0]) );
  OR2_X1 \i_tv80_core/U265  ( .A1(\i_tv80_core/n1726 ), .A2(
        \i_tv80_core/n1727 ), .ZN(\i_tv80_core/n1756 ) );
  OR2_X1 \i_tv80_core/U264  ( .A1(\i_tv80_core/n1726 ), .A2(
        \i_tv80_core/n1727 ), .ZN(\i_tv80_core/n177 ) );
  OAI22_X1 \i_tv80_core/U263  ( .A1(\i_tv80_core/n364 ), .A2(
        \i_tv80_core/n374 ), .B1(\i_tv80_core/n2061 ), .B2(\i_tv80_core/n842 ), 
        .ZN(\i_tv80_core/n1511 ) );
  BUF_X1 \i_tv80_core/U262  ( .A(\i_tv80_core/n1509 ), .Z(\i_tv80_core/n174 )
         );
  AND3_X1 \i_tv80_core/U261  ( .A1(\i_tv80_core/n171 ), .A2(\i_tv80_core/n172 ), .A3(\i_tv80_core/n173 ), .ZN(\i_tv80_core/n1526 ) );
  INV_X1 \i_tv80_core/U260  ( .A(\i_tv80_core/n1514 ), .ZN(\i_tv80_core/n173 )
         );
  NAND2_X1 \i_tv80_core/U259  ( .A1(\i_tv80_core/n1516 ), .A2(
        \i_tv80_core/n1515 ), .ZN(\i_tv80_core/n172 ) );
  NAND2_X1 \i_tv80_core/U258  ( .A1(\i_tv80_core/n93 ), .A2(
        \i_tv80_core/n1517 ), .ZN(\i_tv80_core/n171 ) );
  INV_X1 \i_tv80_core/U257  ( .A(\i_tv80_core/n182 ), .ZN(\i_tv80_core/n169 )
         );
  XNOR2_X1 \i_tv80_core/U256  ( .A(\i_tv80_core/RegBusA [10]), .B(
        \i_tv80_core/n347 ), .ZN(\i_tv80_core/n1683 ) );
  INV_X1 \i_tv80_core/U255  ( .A(\i_tv80_core/n1629 ), .ZN(\i_tv80_core/n168 )
         );
  CLKBUF_X1 \i_tv80_core/U254  ( .A(\i_tv80_core/n1866 ), .Z(
        \i_tv80_core/n167 ) );
  NAND4_X2 \i_tv80_core/U253  ( .A1(tstate[2]), .A2(\i_tv80_core/ExchangeDH ), 
        .A3(\i_tv80_core/n36 ), .A4(\i_tv80_core/n154 ), .ZN(
        \i_tv80_core/n1839 ) );
  INV_X1 \i_tv80_core/U252  ( .A(\i_tv80_core/n165 ), .ZN(\i_tv80_core/n166 )
         );
  AND2_X1 \i_tv80_core/U251  ( .A1(\i_tv80_core/RegBusB [15]), .A2(
        \i_tv80_core/n1841 ), .ZN(\i_tv80_core/n164 ) );
  AND2_X1 \i_tv80_core/U250  ( .A1(\i_tv80_core/n1801 ), .A2(
        \i_tv80_core/n1800 ), .ZN(\i_tv80_core/n163 ) );
  XNOR2_X1 \i_tv80_core/U249  ( .A(\i_tv80_core/n348 ), .B(\i_tv80_core/n346 ), 
        .ZN(\i_tv80_core/n1628 ) );
  BUF_X2 \i_tv80_core/U248  ( .A(\i_tv80_core/IncDec_16 [3]), .Z(
        \i_tv80_core/n348 ) );
  INV_X1 \i_tv80_core/U247  ( .A(\i_tv80_core/n1168 ), .ZN(\i_tv80_core/n162 )
         );
  NAND2_X1 \i_tv80_core/U246  ( .A1(\i_tv80_core/n161 ), .A2(
        \i_tv80_core/n1460 ), .ZN(\i_tv80_core/n1282 ) );
  OR2_X1 \i_tv80_core/U245  ( .A1(\i_tv80_core/n1917 ), .A2(
        \i_tv80_core/n1528 ), .ZN(\i_tv80_core/n161 ) );
  INV_X1 \i_tv80_core/U244  ( .A(\i_tv80_core/n1905 ), .ZN(\i_tv80_core/n160 )
         );
  BUF_X1 \i_tv80_core/U243  ( .A(\i_tv80_core/n1760 ), .Z(\i_tv80_core/n159 )
         );
  XNOR2_X1 \i_tv80_core/U242  ( .A(\i_tv80_core/n21 ), .B(
        \i_tv80_core/RegBusA [15]), .ZN(\i_tv80_core/n1795 ) );
  OAI221_X1 \i_tv80_core/U241  ( .B1(\i_tv80_core/n887 ), .B2(
        \i_tv80_core/n63 ), .C1(\i_tv80_core/n886 ), .C2(\i_tv80_core/n63 ), 
        .A(\i_tv80_core/n25 ), .ZN(\i_tv80_core/n158 ) );
  OR2_X1 \i_tv80_core/U240  ( .A1(\i_tv80_core/n806 ), .A2(\i_tv80_core/n262 ), 
        .ZN(\i_tv80_core/n157 ) );
  XNOR2_X1 \i_tv80_core/U239  ( .A(\i_tv80_core/n372 ), .B(\i_tv80_core/n147 ), 
        .ZN(\i_tv80_core/n156 ) );
  INV_X1 \i_tv80_core/U238  ( .A(\i_tv80_core/n354 ), .ZN(\i_tv80_core/n155 )
         );
  OR2_X2 \i_tv80_core/U237  ( .A1(\i_tv80_core/n942 ), .A2(\i_tv80_core/n154 ), 
        .ZN(\i_tv80_core/n2156 ) );
  INV_X1 \i_tv80_core/U236  ( .A(\i_tv80_core/n1225 ), .ZN(mcycle[0]) );
  AND2_X1 \i_tv80_core/U235  ( .A1(\i_tv80_core/n1773 ), .A2(
        \i_tv80_core/n1772 ), .ZN(\i_tv80_core/n152 ) );
  AND2_X1 \i_tv80_core/U234  ( .A1(\i_tv80_core/n347 ), .A2(\i_tv80_core/n31 ), 
        .ZN(\i_tv80_core/n151 ) );
  INV_X2 \i_tv80_core/U233  ( .A(\i_tv80_core/n1734 ), .ZN(\i_tv80_core/n1796 ) );
  AND2_X1 \i_tv80_core/U232  ( .A1(\i_tv80_core/n1796 ), .A2(
        \i_tv80_core/n1683 ), .ZN(\i_tv80_core/n150 ) );
  BUF_X1 \i_tv80_core/U231  ( .A(\i_tv80_core/n191 ), .Z(\i_tv80_core/n359 )
         );
  INV_X1 \i_tv80_core/U230  ( .A(\i_tv80_core/n346 ), .ZN(\i_tv80_core/n149 )
         );
  INV_X1 \i_tv80_core/U229  ( .A(\i_tv80_core/n356 ), .ZN(\i_tv80_core/n148 )
         );
  NOR2_X1 \i_tv80_core/U228  ( .A1(\i_tv80_core/n1827 ), .A2(
        \i_tv80_core/IncDec_16 [2]), .ZN(\i_tv80_core/n196 ) );
  AND2_X1 \i_tv80_core/U227  ( .A1(\i_tv80_core/IncDec_16 [2]), .A2(
        \i_tv80_core/n1866 ), .ZN(\i_tv80_core/n1834 ) );
  CLKBUF_X1 \i_tv80_core/U226  ( .A(\i_tv80_core/n1904 ), .Z(
        \i_tv80_core/n146 ) );
  NAND3_X2 \i_tv80_core/U225  ( .A1(\i_tv80_core/n1694 ), .A2(
        \i_tv80_core/n1693 ), .A3(\i_tv80_core/n1695 ), .ZN(
        \i_tv80_core/n2164 ) );
  AND2_X1 \i_tv80_core/U224  ( .A1(\i_tv80_core/n1801 ), .A2(
        \i_tv80_core/n1686 ), .ZN(\i_tv80_core/n145 ) );
  AND2_X1 \i_tv80_core/U223  ( .A1(\i_tv80_core/RegBusB [10]), .A2(
        \i_tv80_core/n1841 ), .ZN(\i_tv80_core/n144 ) );
  NAND3_X2 \i_tv80_core/U222  ( .A1(\i_tv80_core/n1813 ), .A2(
        \i_tv80_core/n1812 ), .A3(\i_tv80_core/n1814 ), .ZN(
        \i_tv80_core/RegDIH [7]) );
  AND3_X1 \i_tv80_core/U221  ( .A1(\i_tv80_core/n141 ), .A2(\i_tv80_core/n142 ), .A3(\i_tv80_core/n143 ), .ZN(\i_tv80_core/n1814 ) );
  INV_X1 \i_tv80_core/U220  ( .A(\i_tv80_core/n1805 ), .ZN(\i_tv80_core/n143 )
         );
  NAND2_X1 \i_tv80_core/U219  ( .A1(\i_tv80_core/n1806 ), .A2(
        \i_tv80_core/n231 ), .ZN(\i_tv80_core/n142 ) );
  NAND2_X1 \i_tv80_core/U218  ( .A1(\i_tv80_core/n1807 ), .A2(
        \i_tv80_core/n1811 ), .ZN(\i_tv80_core/n141 ) );
  NOR3_X1 \i_tv80_core/U217  ( .A1(\i_tv80_core/n1712 ), .A2(
        \i_tv80_core/n1713 ), .A3(\i_tv80_core/n40 ), .ZN(\i_tv80_core/n1720 )
         );
  NOR2_X1 \i_tv80_core/U216  ( .A1(\i_tv80_core/n401 ), .A2(\i_tv80_core/n138 ), .ZN(\i_tv80_core/n139 ) );
  BUF_X1 \i_tv80_core/U215  ( .A(\i_tv80_core/n1628 ), .Z(\i_tv80_core/n138 )
         );
  OR2_X1 \i_tv80_core/U214  ( .A1(\i_tv80_core/n871 ), .A2(\i_tv80_core/n129 ), 
        .ZN(\i_tv80_core/n137 ) );
  NAND3_X1 \i_tv80_core/U213  ( .A1(\i_tv80_core/n1738 ), .A2(
        \i_tv80_core/n1739 ), .A3(\i_tv80_core/n37 ), .ZN(
        \i_tv80_core/RegDIH [4]) );
  XNOR2_X1 \i_tv80_core/U212  ( .A(\i_tv80_core/n373 ), .B(\i_tv80_core/n170 ), 
        .ZN(\i_tv80_core/n136 ) );
  INV_X1 \i_tv80_core/U211  ( .A(\i_tv80_core/n94 ), .ZN(\i_tv80_core/n134 )
         );
  BUF_X2 \i_tv80_core/U210  ( .A(\i_tv80_core/RegBusA [13]), .Z(
        \i_tv80_core/n147 ) );
  INV_X1 \i_tv80_core/U209  ( .A(\i_tv80_core/n1904 ), .ZN(\i_tv80_core/n133 )
         );
  BUF_X1 \i_tv80_core/U208  ( .A(\i_tv80_core/n1689 ), .Z(\i_tv80_core/n135 )
         );
  NOR3_X1 \i_tv80_core/U207  ( .A1(\i_tv80_core/n1456 ), .A2(
        \i_tv80_core/n132 ), .A3(\i_tv80_core/n131 ), .ZN(\i_tv80_core/n1460 )
         );
  AND2_X1 \i_tv80_core/U206  ( .A1(\i_tv80_core/n1458 ), .A2(
        \i_tv80_core/n1457 ), .ZN(\i_tv80_core/n132 ) );
  AND2_X1 \i_tv80_core/U205  ( .A1(\i_tv80_core/n1459 ), .A2(
        \i_tv80_core/TmpAddr [13]), .ZN(\i_tv80_core/n131 ) );
  OAI22_X1 \i_tv80_core/U204  ( .A1(\i_tv80_core/n364 ), .A2(
        \i_tv80_core/n374 ), .B1(\i_tv80_core/n2061 ), .B2(\i_tv80_core/n842 ), 
        .ZN(\i_tv80_core/n130 ) );
  INV_X1 \i_tv80_core/U203  ( .A(\i_tv80_core/n85 ), .ZN(\i_tv80_core/n128 )
         );
  BUF_X2 \i_tv80_core/U202  ( .A(\i_tv80_core/RegBusA [5]), .Z(
        \i_tv80_core/n352 ) );
  XOR2_X1 \i_tv80_core/U201  ( .A(\i_tv80_core/n1513 ), .B(\i_tv80_core/n99 ), 
        .Z(\i_tv80_core/n127 ) );
  XNOR2_X1 \i_tv80_core/U200  ( .A(\i_tv80_core/n93 ), .B(\i_tv80_core/n127 ), 
        .ZN(\i_tv80_core/n255 ) );
  INV_X1 \i_tv80_core/U199  ( .A(\i_tv80_core/n392 ), .ZN(\i_tv80_core/n1565 )
         );
  OR2_X2 \i_tv80_core/U198  ( .A1(\i_tv80_core/n392 ), .A2(tstate[2]), .ZN(
        \i_tv80_core/n942 ) );
  NOR2_X1 \i_tv80_core/U197  ( .A1(\i_tv80_core/n1799 ), .A2(\i_tv80_core/n42 ), .ZN(\i_tv80_core/n1802 ) );
  BUF_X1 \i_tv80_core/U196  ( .A(\i_tv80_core/RegBusA [4]), .Z(
        \i_tv80_core/n351 ) );
  INV_X1 \i_tv80_core/U195  ( .A(\i_tv80_core/n112 ), .ZN(\i_tv80_core/n125 )
         );
  BUF_X1 \i_tv80_core/U194  ( .A(\i_tv80_core/IncDec_16 [1]), .Z(
        \i_tv80_core/n188 ) );
  INV_X1 \i_tv80_core/U193  ( .A(\i_tv80_core/n179 ), .ZN(\i_tv80_core/n124 )
         );
  INV_X1 \i_tv80_core/U192  ( .A(\i_tv80_core/n1839 ), .ZN(\i_tv80_core/n1801 ) );
  OR2_X1 \i_tv80_core/U191  ( .A1(\i_tv80_core/n23 ), .A2(\i_tv80_core/n176 ), 
        .ZN(\i_tv80_core/n1643 ) );
  INV_X1 \i_tv80_core/U190  ( .A(\i_tv80_core/n11 ), .ZN(\i_tv80_core/n123 )
         );
  NAND2_X1 \i_tv80_core/U189  ( .A1(\i_tv80_core/n169 ), .A2(
        \i_tv80_core/n1772 ), .ZN(\i_tv80_core/n122 ) );
  AND2_X1 \i_tv80_core/U188  ( .A1(\i_tv80_core/n805 ), .A2(\i_tv80_core/n157 ), .ZN(\i_tv80_core/n121 ) );
  AND2_X1 \i_tv80_core/U187  ( .A1(\i_tv80_core/n805 ), .A2(\i_tv80_core/n157 ), .ZN(\i_tv80_core/n120 ) );
  NOR3_X1 \i_tv80_core/U186  ( .A1(\i_tv80_core/n1499 ), .A2(
        \i_tv80_core/n119 ), .A3(\i_tv80_core/n118 ), .ZN(\i_tv80_core/n1503 )
         );
  AND2_X1 \i_tv80_core/U185  ( .A1(\i_tv80_core/n1501 ), .A2(
        \i_tv80_core/n1500 ), .ZN(\i_tv80_core/n119 ) );
  AND2_X1 \i_tv80_core/U184  ( .A1(\i_tv80_core/n1502 ), .A2(
        \i_tv80_core/PC [14]), .ZN(\i_tv80_core/n118 ) );
  NAND3_X1 \i_tv80_core/U183  ( .A1(\i_tv80_core/n116 ), .A2(
        \i_tv80_core/n117 ), .A3(\i_tv80_core/n1396 ), .ZN(\i_tv80_core/n1399 ) );
  OR2_X1 \i_tv80_core/U182  ( .A1(\i_tv80_core/n1398 ), .A2(
        \i_tv80_core/n1397 ), .ZN(\i_tv80_core/n117 ) );
  OR2_X1 \i_tv80_core/U181  ( .A1(\i_tv80_core/PC [7]), .A2(
        \i_tv80_core/n1530 ), .ZN(\i_tv80_core/n116 ) );
  XNOR2_X1 \i_tv80_core/U180  ( .A(\i_tv80_core/n352 ), .B(\i_tv80_core/n21 ), 
        .ZN(\i_tv80_core/n1607 ) );
  BUF_X1 \i_tv80_core/U179  ( .A(\i_tv80_core/RegBusA [3]), .Z(
        \i_tv80_core/n200 ) );
  INV_X1 \i_tv80_core/U178  ( .A(\i_tv80_core/n1207 ), .ZN(\i_tv80_core/n114 )
         );
  CLKBUF_X1 \i_tv80_core/U177  ( .A(\i_tv80_core/n351 ), .Z(\i_tv80_core/n112 ) );
  BUF_X1 \i_tv80_core/U176  ( .A(\i_tv80_core/n1784 ), .Z(\i_tv80_core/n140 )
         );
  NAND2_X1 \i_tv80_core/U175  ( .A1(\i_tv80_core/n186 ), .A2(
        \i_tv80_core/n140 ), .ZN(\i_tv80_core/n111 ) );
  INV_X1 \i_tv80_core/U174  ( .A(\i_tv80_core/n1163 ), .ZN(\i_tv80_core/n110 )
         );
  BUF_X1 \i_tv80_core/U173  ( .A(\i_tv80_core/n1915 ), .Z(\i_tv80_core/n109 )
         );
  BUF_X1 \i_tv80_core/U172  ( .A(\i_tv80_core/n362 ), .Z(\i_tv80_core/n175 )
         );
  CLKBUF_X1 \i_tv80_core/U171  ( .A(\i_tv80_core/n107 ), .Z(\i_tv80_core/n108 ) );
  INV_X1 \i_tv80_core/U170  ( .A(\i_tv80_core/n1511 ), .ZN(\i_tv80_core/n107 )
         );
  INV_X1 \i_tv80_core/U169  ( .A(\i_tv80_core/n104 ), .ZN(\i_tv80_core/n106 )
         );
  INV_X1 \i_tv80_core/U168  ( .A(\i_tv80_core/n104 ), .ZN(\i_tv80_core/n105 )
         );
  INV_X1 \i_tv80_core/U167  ( .A(\i_tv80_core/n175 ), .ZN(\i_tv80_core/n104 )
         );
  INV_X1 \i_tv80_core/U166  ( .A(\i_tv80_core/n174 ), .ZN(\i_tv80_core/n103 )
         );
  INV_X1 \i_tv80_core/U165  ( .A(\i_tv80_core/n100 ), .ZN(\i_tv80_core/n102 )
         );
  INV_X1 \i_tv80_core/U164  ( .A(\i_tv80_core/n100 ), .ZN(\i_tv80_core/n101 )
         );
  INV_X1 \i_tv80_core/U163  ( .A(\i_tv80_core/n362 ), .ZN(\i_tv80_core/n100 )
         );
  INV_X1 \i_tv80_core/U162  ( .A(\i_tv80_core/n97 ), .ZN(\i_tv80_core/n99 ) );
  INV_X1 \i_tv80_core/U161  ( .A(\i_tv80_core/n97 ), .ZN(\i_tv80_core/n98 ) );
  INV_X1 \i_tv80_core/U160  ( .A(\i_tv80_core/n1509 ), .ZN(\i_tv80_core/n97 )
         );
  BUF_X1 \i_tv80_core/U159  ( .A(\i_tv80_core/n358 ), .Z(\i_tv80_core/n170 )
         );
  BUF_X1 \i_tv80_core/U158  ( .A(\i_tv80_core/n1746 ), .Z(\i_tv80_core/n96 )
         );
  OAI21_X1 \i_tv80_core/U157  ( .B1(\i_tv80_core/n847 ), .B2(
        \i_tv80_core/n846 ), .A(\i_tv80_core/n845 ), .ZN(\i_tv80_core/n886 )
         );
  CLKBUF_X1 \i_tv80_core/U156  ( .A(\i_tv80_core/n2009 ), .Z(\i_tv80_core/n95 ) );
  AND2_X1 \i_tv80_core/U155  ( .A1(\i_tv80_core/n186 ), .A2(
        \i_tv80_core/n1784 ), .ZN(\i_tv80_core/n94 ) );
  INV_X1 \i_tv80_core/U154  ( .A(\i_tv80_core/n136 ), .ZN(\i_tv80_core/n1621 )
         );
  CLKBUF_X1 \i_tv80_core/U153  ( .A(\i_tv80_core/n1995 ), .Z(\i_tv80_core/n92 ) );
  OAI211_X1 \i_tv80_core/U152  ( .C1(\i_tv80_core/n940 ), .C2(
        \i_tv80_core/n939 ), .A(\i_tv80_core/n376 ), .B(\i_tv80_core/n938 ), 
        .ZN(\i_tv80_core/n1547 ) );
  CLKBUF_X1 \i_tv80_core/U151  ( .A(\i_tv80_core/n1547 ), .Z(\i_tv80_core/n91 ) );
  OAI21_X1 \i_tv80_core/U150  ( .B1(\i_tv80_core/n259 ), .B2(
        \i_tv80_core/n959 ), .A(\i_tv80_core/n12 ), .ZN(\i_tv80_core/n90 ) );
  AND4_X1 \i_tv80_core/U149  ( .A1(\i_tv80_core/n258 ), .A2(\i_tv80_core/n394 ), .A3(\i_tv80_core/n395 ), .A4(\i_tv80_core/n136 ), .ZN(\i_tv80_core/n89 ) );
  AND4_X1 \i_tv80_core/U148  ( .A1(\i_tv80_core/n400 ), .A2(\i_tv80_core/n34 ), 
        .A3(\i_tv80_core/n1575 ), .A4(\i_tv80_core/n1588 ), .ZN(
        \i_tv80_core/n88 ) );
  AND3_X1 \i_tv80_core/U147  ( .A1(\i_tv80_core/n88 ), .A2(\i_tv80_core/n89 ), 
        .A3(\i_tv80_core/n139 ), .ZN(\i_tv80_core/n411 ) );
  AND3_X2 \i_tv80_core/U146  ( .A1(\i_tv80_core/Inc_WZ ), .A2(
        \i_tv80_core/n241 ), .A3(\i_tv80_core/n2010 ), .ZN(\i_tv80_core/n219 )
         );
  AND2_X1 \i_tv80_core/U145  ( .A1(\i_tv80_core/n824 ), .A2(\i_tv80_core/n802 ), .ZN(\i_tv80_core/n262 ) );
  AND2_X1 \i_tv80_core/U144  ( .A1(\i_tv80_core/n375 ), .A2(\i_tv80_core/n842 ), .ZN(\i_tv80_core/n87 ) );
  OAI211_X1 \i_tv80_core/U143  ( .C1(\i_tv80_core/n85 ), .C2(
        \i_tv80_core/n880 ), .A(\i_tv80_core/n878 ), .B(\i_tv80_core/n879 ), 
        .ZN(\i_tv80_core/n86 ) );
  OAI22_X1 \i_tv80_core/U142  ( .A1(\i_tv80_core/n364 ), .A2(
        \i_tv80_core/n374 ), .B1(\i_tv80_core/n2061 ), .B2(\i_tv80_core/n842 ), 
        .ZN(\i_tv80_core/n85 ) );
  INV_X1 \i_tv80_core/U141  ( .A(\i_tv80_core/n1498 ), .ZN(\i_tv80_core/n84 )
         );
  XNOR2_X1 \i_tv80_core/U140  ( .A(\i_tv80_core/n345 ), .B(\i_tv80_core/n372 ), 
        .ZN(\i_tv80_core/n83 ) );
  XNOR2_X1 \i_tv80_core/U139  ( .A(\i_tv80_core/n83 ), .B(\i_tv80_core/n53 ), 
        .ZN(\i_tv80_core/n1575 ) );
  AOI221_X1 \i_tv80_core/U138  ( .B1(\i_tv80_core/n596 ), .B2(
        \i_tv80_core/n556 ), .C1(\i_tv80_core/n555 ), .C2(mcycle[0]), .A(
        \i_tv80_core/n594 ), .ZN(\i_tv80_core/n557 ) );
  MUX2_X1 \i_tv80_core/U137  ( .A(\i_tv80_core/IntCycle ), .B(
        \i_tv80_core/n505 ), .S(\i_tv80_core/n472 ), .Z(\i_tv80_core/n1381 )
         );
  MUX2_X1 \i_tv80_core/U136  ( .A(\i_tv80_core/n928 ), .B(\i_tv80_core/n473 ), 
        .S(\i_tv80_core/n472 ), .Z(\i_tv80_core/n1361 ) );
  CLKBUF_X1 \i_tv80_core/U135  ( .A(\i_tv80_core/n895 ), .Z(\i_tv80_core/n82 )
         );
  AND2_X1 \i_tv80_core/U134  ( .A1(\i_tv80_core/n824 ), .A2(\i_tv80_core/n802 ), .ZN(\i_tv80_core/n81 ) );
  AND2_X2 \i_tv80_core/U133  ( .A1(\i_tv80_core/n2010 ), .A2(
        \i_tv80_core/n2007 ), .ZN(\i_tv80_core/n236 ) );
  AND2_X2 \i_tv80_core/U132  ( .A1(\i_tv80_core/n235 ), .A2(\i_tv80_core/n312 ), .ZN(\i_tv80_core/n234 ) );
  AND2_X2 \i_tv80_core/U131  ( .A1(\i_tv80_core/n235 ), .A2(
        \i_tv80_core/Set_BusB_To [0]), .ZN(\i_tv80_core/n263 ) );
  AOI221_X1 \i_tv80_core/U130  ( .B1(\i_tv80_core/n236 ), .B2(
        \i_tv80_core/PC [4]), .C1(\i_tv80_core/n2134 ), .C2(
        \i_tv80_core/SP [4]), .A(\i_tv80_core/n2038 ), .ZN(\i_tv80_core/n2039 ) );
  INV_X1 \i_tv80_core/U129  ( .A(\i_tv80_core/n2004 ), .ZN(\i_tv80_core/n79 )
         );
  BUF_X1 \i_tv80_core/U128  ( .A(\i_tv80_core/n864 ), .Z(\i_tv80_core/n78 ) );
  INV_X1 \i_tv80_core/U127  ( .A(\i_tv80_core/n188 ), .ZN(\i_tv80_core/n77 )
         );
  NOR2_X1 \i_tv80_core/U126  ( .A1(\i_tv80_core/n343 ), .A2(
        \i_tv80_core/Set_BusB_To [3]), .ZN(\i_tv80_core/n235 ) );
  AND3_X1 \i_tv80_core/U125  ( .A1(\i_tv80_core/n843 ), .A2(\i_tv80_core/n836 ), .A3(\i_tv80_core/n844 ), .ZN(\i_tv80_core/n845 ) );
  BUF_X1 \i_tv80_core/U124  ( .A(\i_tv80_core/n849 ), .Z(\i_tv80_core/n76 ) );
  BUF_X4 \i_tv80_core/U123  ( .A(\i_tv80_core/n375 ), .Z(\i_tv80_core/n347 )
         );
  BUF_X1 \i_tv80_core/U122  ( .A(\i_tv80_core/n2144 ), .Z(\i_tv80_core/n75 )
         );
  BUF_X1 \i_tv80_core/U121  ( .A(\i_tv80_core/n2144 ), .Z(\i_tv80_core/n74 )
         );
  XNOR2_X1 \i_tv80_core/U120  ( .A(\i_tv80_core/n1462 ), .B(
        \i_tv80_core/n1439 ), .ZN(\i_tv80_core/n1440 ) );
  AND4_X2 \i_tv80_core/U119  ( .A1(\i_tv80_core/n1481 ), .A2(
        \i_tv80_core/n1483 ), .A3(\i_tv80_core/n1482 ), .A4(
        \i_tv80_core/n1484 ), .ZN(\i_tv80_core/n93 ) );
  BUF_X1 \i_tv80_core/U118  ( .A(\i_tv80_core/n1548 ), .Z(\i_tv80_core/n73 )
         );
  INV_X1 \i_tv80_core/U117  ( .A(\i_tv80_core/n355 ), .ZN(\i_tv80_core/n72 )
         );
  AND3_X1 \i_tv80_core/U116  ( .A1(\i_tv80_core/n1448 ), .A2(
        \i_tv80_core/n1483 ), .A3(\i_tv80_core/n1484 ), .ZN(\i_tv80_core/n71 )
         );
  OAI21_X1 \i_tv80_core/U115  ( .B1(\i_tv80_core/n1432 ), .B2(
        \i_tv80_core/n1431 ), .A(\i_tv80_core/n1430 ), .ZN(\i_tv80_core/n70 )
         );
  OR2_X2 \i_tv80_core/U114  ( .A1(\i_tv80_core/n1886 ), .A2(
        \i_tv80_core/Set_BusA_To [0]), .ZN(\i_tv80_core/n1931 ) );
  INV_X1 \i_tv80_core/U113  ( .A(\i_tv80_core/n2067 ), .ZN(\i_tv80_core/n69 )
         );
  INV_X1 \i_tv80_core/U112  ( .A(\i_tv80_core/n1881 ), .ZN(\i_tv80_core/n68 )
         );
  BUF_X2 \i_tv80_core/U111  ( .A(\i_tv80_core/n2068 ), .Z(\i_tv80_core/n367 )
         );
  AND2_X1 \i_tv80_core/U110  ( .A1(\i_tv80_core/n627 ), .A2(\i_tv80_core/n367 ), .ZN(\i_tv80_core/n67 ) );
  AND3_X1 \i_tv80_core/U109  ( .A1(\i_tv80_core/n931 ), .A2(
        \i_tv80_core/n1871 ), .A3(\i_tv80_core/n2067 ), .ZN(\i_tv80_core/n220 ) );
  NAND2_X1 \i_tv80_core/U108  ( .A1(\i_tv80_core/n932 ), .A2(
        \i_tv80_core/n220 ), .ZN(\i_tv80_core/n65 ) );
  OAI21_X1 \i_tv80_core/U107  ( .B1(\i_tv80_core/n126 ), .B2(
        \i_tv80_core/n551 ), .A(\i_tv80_core/n350 ), .ZN(\i_tv80_core/n591 )
         );
  BUF_X1 \i_tv80_core/U106  ( .A(\i_tv80_core/n591 ), .Z(\i_tv80_core/n64 ) );
  INV_X1 \i_tv80_core/U105  ( .A(\i_tv80_core/n66 ), .ZN(\i_tv80_core/n1549 )
         );
  NAND2_X1 \i_tv80_core/U104  ( .A1(\i_tv80_core/n1888 ), .A2(
        \i_tv80_core/Set_BusA_To [0]), .ZN(\i_tv80_core/n1932 ) );
  NAND2_X1 \i_tv80_core/U103  ( .A1(\i_tv80_core/n1888 ), .A2(
        \i_tv80_core/Set_BusA_To [0]), .ZN(\i_tv80_core/n62 ) );
  INV_X2 \i_tv80_core/U102  ( .A(\i_tv80_core/n1882 ), .ZN(\i_tv80_core/n1935 ) );
  NAND4_X2 \i_tv80_core/U101  ( .A1(\i_tv80_core/n1935 ), .A2(
        \i_tv80_core/Set_BusA_To [0]), .A3(\i_tv80_core/n1886 ), .A4(
        \i_tv80_core/n1883 ), .ZN(\i_tv80_core/n1940 ) );
  XNOR2_X1 \i_tv80_core/U100  ( .A(\i_tv80_core/tstates [0]), .B(tstate[0]), 
        .ZN(\i_tv80_core/n381 ) );
  XNOR2_X1 \i_tv80_core/U99  ( .A(\i_tv80_core/n871 ), .B(\i_tv80_core/n103 ), 
        .ZN(\i_tv80_core/n858 ) );
  OAI21_X1 \i_tv80_core/U98  ( .B1(\i_tv80_core/n869 ), .B2(\i_tv80_core/n872 ), .A(\i_tv80_core/n137 ), .ZN(\i_tv80_core/n61 ) );
  INV_X1 \i_tv80_core/U97  ( .A(\i_tv80_core/n780 ), .ZN(\i_tv80_core/n860 )
         );
  INV_X2 \i_tv80_core/U96  ( .A(\i_tv80_core/n59 ), .ZN(\i_tv80_core/n60 ) );
  INV_X1 \i_tv80_core/U95  ( .A(\i_tv80_core/n860 ), .ZN(\i_tv80_core/n59 ) );
  AND2_X1 \i_tv80_core/U94  ( .A1(\i_tv80_core/n244 ), .A2(\i_tv80_core/n687 ), 
        .ZN(\i_tv80_core/n224 ) );
  AND3_X1 \i_tv80_core/U93  ( .A1(\i_tv80_core/n381 ), .A2(\i_tv80_core/n382 ), 
        .A3(\i_tv80_core/n383 ), .ZN(\i_tv80_core/n80 ) );
  AND2_X1 \i_tv80_core/U92  ( .A1(\i_tv80_core/n244 ), .A2(\i_tv80_core/n687 ), 
        .ZN(\i_tv80_core/n58 ) );
  AND3_X1 \i_tv80_core/U91  ( .A1(\i_tv80_core/n381 ), .A2(\i_tv80_core/n382 ), 
        .A3(\i_tv80_core/n383 ), .ZN(\i_tv80_core/n57 ) );
  AND3_X1 \i_tv80_core/U90  ( .A1(\i_tv80_core/n381 ), .A2(\i_tv80_core/n382 ), 
        .A3(\i_tv80_core/n383 ), .ZN(\i_tv80_core/n56 ) );
  AND3_X2 \i_tv80_core/U89  ( .A1(\i_tv80_core/n1966 ), .A2(
        \i_tv80_core/n1957 ), .A3(\i_tv80_core/n860 ), .ZN(\i_tv80_core/n250 )
         );
  BUF_X1 \i_tv80_core/U88  ( .A(\i_tv80_core/n1572 ), .Z(\i_tv80_core/n54 ) );
  AND2_X2 \i_tv80_core/U87  ( .A1(\i_tv80_core/n633 ), .A2(\i_tv80_core/n67 ), 
        .ZN(\i_tv80_core/n252 ) );
  AND2_X1 \i_tv80_core/U86  ( .A1(\i_tv80_core/n247 ), .A2(\i_tv80_core/n1870 ), .ZN(\i_tv80_core/n226 ) );
  INV_X1 \i_tv80_core/U85  ( .A(\i_tv80_core/n124 ), .ZN(\i_tv80_core/n53 ) );
  AND2_X1 \i_tv80_core/U84  ( .A1(\i_tv80_core/n247 ), .A2(\i_tv80_core/n1870 ), .ZN(\i_tv80_core/n55 ) );
  AND3_X1 \i_tv80_core/U83  ( .A1(\i_tv80_core/n1565 ), .A2(\i_tv80_core/n464 ), .A3(\i_tv80_core/n576 ), .ZN(\i_tv80_core/n47 ) );
  AND2_X1 \i_tv80_core/U82  ( .A1(\i_tv80_core/n851 ), .A2(\i_tv80_core/n850 ), 
        .ZN(\i_tv80_core/n43 ) );
  OR2_X1 \i_tv80_core/U81  ( .A1(\i_tv80_core/n164 ), .A2(\i_tv80_core/n163 ), 
        .ZN(\i_tv80_core/n42 ) );
  AND2_X1 \i_tv80_core/U80  ( .A1(\i_tv80_core/n1662 ), .A2(
        \i_tv80_core/n1663 ), .ZN(\i_tv80_core/n41 ) );
  OR2_X1 \i_tv80_core/U79  ( .A1(\i_tv80_core/n1711 ), .A2(\i_tv80_core/n1710 ), .ZN(\i_tv80_core/n40 ) );
  AND2_X1 \i_tv80_core/U78  ( .A1(\i_tv80_core/n1793 ), .A2(
        \i_tv80_core/n1794 ), .ZN(\i_tv80_core/n39 ) );
  AND2_X1 \i_tv80_core/U77  ( .A1(\i_tv80_core/n1757 ), .A2(
        \i_tv80_core/n1764 ), .ZN(\i_tv80_core/n38 ) );
  AND2_X1 \i_tv80_core/U76  ( .A1(\i_tv80_core/n1740 ), .A2(
        \i_tv80_core/n1741 ), .ZN(\i_tv80_core/n37 ) );
  BUF_X1 \i_tv80_core/U75  ( .A(\i_tv80_core/n2005 ), .Z(\i_tv80_core/n126 )
         );
  OAI21_X1 \i_tv80_core/U74  ( .B1(\i_tv80_core/n1659 ), .B2(
        \i_tv80_core/n1658 ), .A(\i_tv80_core/n1657 ), .ZN(\i_tv80_core/n1660 ) );
  NOR2_X1 \i_tv80_core/U73  ( .A1(\i_tv80_core/n1626 ), .A2(
        \i_tv80_core/n1627 ), .ZN(\i_tv80_core/n2163 ) );
  NOR3_X1 \i_tv80_core/U72  ( .A1(\i_tv80_core/n144 ), .A2(\i_tv80_core/n145 ), 
        .A3(\i_tv80_core/n1685 ), .ZN(\i_tv80_core/n1695 ) );
  BUF_X1 \i_tv80_core/U71  ( .A(\i_tv80_core/n280 ), .Z(\i_tv80_core/n369 ) );
  AND2_X1 \i_tv80_core/U70  ( .A1(\i_tv80_core/n715 ), .A2(\i_tv80_core/n624 ), 
        .ZN(\i_tv80_core/n270 ) );
  OR2_X1 \i_tv80_core/U69  ( .A1(\i_tv80_core/n130 ), .A2(\i_tv80_core/n871 ), 
        .ZN(\i_tv80_core/n878 ) );
  OAI211_X2 \i_tv80_core/U68  ( .C1(\i_tv80_core/n359 ), .C2(
        \i_tv80_core/n1651 ), .A(\i_tv80_core/n1650 ), .B(\i_tv80_core/n1649 ), 
        .ZN(\i_tv80_core/RegDIL [7]) );
  INV_X1 \i_tv80_core/U67  ( .A(\i_tv80_core/n1618 ), .ZN(\i_tv80_core/n35 )
         );
  XNOR2_X1 \i_tv80_core/U66  ( .A(\i_tv80_core/n372 ), .B(\i_tv80_core/n147 ), 
        .ZN(\i_tv80_core/n34 ) );
  AND2_X1 \i_tv80_core/U65  ( .A1(\i_tv80_core/n140 ), .A2(\i_tv80_core/n186 ), 
        .ZN(\i_tv80_core/n1785 ) );
  CLKBUF_X1 \i_tv80_core/U64  ( .A(\i_tv80_core/n1904 ), .Z(\i_tv80_core/n33 )
         );
  BUF_X1 \i_tv80_core/U63  ( .A(\i_tv80_core/RegBusA [6]), .Z(
        \i_tv80_core/n176 ) );
  INV_X1 \i_tv80_core/U62  ( .A(\i_tv80_core/n1715 ), .ZN(\i_tv80_core/n32 )
         );
  BUF_X1 \i_tv80_core/U61  ( .A(\i_tv80_core/RegBusA [7]), .Z(
        \i_tv80_core/n346 ) );
  BUF_X1 \i_tv80_core/U60  ( .A(\i_tv80_core/RegBusA [7]), .Z(
        \i_tv80_core/n31 ) );
  BUF_X1 \i_tv80_core/U59  ( .A(\i_tv80_core/RegBusA [7]), .Z(
        \i_tv80_core/n30 ) );
  CLKBUF_X1 \i_tv80_core/U58  ( .A(\i_tv80_core/RegBusA [5]), .Z(
        \i_tv80_core/n115 ) );
  BUF_X1 \i_tv80_core/U57  ( .A(\i_tv80_core/RegBusA [1]), .Z(
        \i_tv80_core/n179 ) );
  AND3_X1 \i_tv80_core/U56  ( .A1(\i_tv80_core/n1697 ), .A2(
        \i_tv80_core/n1698 ), .A3(\i_tv80_core/n1699 ), .ZN(\i_tv80_core/n217 ) );
  BUF_X1 \i_tv80_core/U55  ( .A(\i_tv80_core/Set_Addr_To [2]), .Z(
        \i_tv80_core/n29 ) );
  AND2_X1 \i_tv80_core/U54  ( .A1(\i_tv80_core/n282 ), .A2(\i_tv80_core/n588 ), 
        .ZN(\i_tv80_core/n28 ) );
  OAI21_X1 \i_tv80_core/U53  ( .B1(\i_tv80_core/n2002 ), .B2(
        \i_tv80_core/n2001 ), .A(\i_tv80_core/n2010 ), .ZN(\i_tv80_core/n2049 ) );
  OAI21_X1 \i_tv80_core/U52  ( .B1(\i_tv80_core/n2002 ), .B2(
        \i_tv80_core/n2001 ), .A(\i_tv80_core/n2010 ), .ZN(\i_tv80_core/n27 )
         );
  OAI21_X1 \i_tv80_core/U51  ( .B1(\i_tv80_core/n2002 ), .B2(
        \i_tv80_core/n2001 ), .A(\i_tv80_core/n2010 ), .ZN(\i_tv80_core/n26 )
         );
  INV_X2 \i_tv80_core/U50  ( .A(\i_tv80_core/n128 ), .ZN(\i_tv80_core/n129 )
         );
  AOI21_X1 \i_tv80_core/U49  ( .B1(\i_tv80_core/n884 ), .B2(\i_tv80_core/n129 ), .A(\i_tv80_core/n883 ), .ZN(\i_tv80_core/n25 ) );
  AND2_X1 \i_tv80_core/U48  ( .A1(\i_tv80_core/n86 ), .A2(\i_tv80_core/n108 ), 
        .ZN(\i_tv80_core/n63 ) );
  INV_X1 \i_tv80_core/U47  ( .A(\i_tv80_core/n1492 ), .ZN(\i_tv80_core/n24 )
         );
  INV_X2 \i_tv80_core/U46  ( .A(\i_tv80_core/n348 ), .ZN(\i_tv80_core/n374 )
         );
  INV_X1 \i_tv80_core/U45  ( .A(\i_tv80_core/n374 ), .ZN(\i_tv80_core/n23 ) );
  AND3_X2 \i_tv80_core/U44  ( .A1(\i_tv80_core/n1992 ), .A2(\i_tv80_core/n16 ), 
        .A3(\i_tv80_core/n1547 ), .ZN(\i_tv80_core/n22 ) );
  INV_X2 \i_tv80_core/U43  ( .A(\i_tv80_core/n348 ), .ZN(\i_tv80_core/n372 )
         );
  INV_X1 \i_tv80_core/U42  ( .A(\i_tv80_core/n372 ), .ZN(\i_tv80_core/n21 ) );
  INV_X1 \i_tv80_core/U41  ( .A(\i_tv80_core/JumpE ), .ZN(\i_tv80_core/n20 )
         );
  INV_X1 \i_tv80_core/U40  ( .A(\i_tv80_core/JumpE ), .ZN(\i_tv80_core/n19 )
         );
  BUF_X1 \i_tv80_core/U39  ( .A(\i_tv80_core/n1521 ), .Z(\i_tv80_core/n18 ) );
  AND2_X1 \i_tv80_core/U38  ( .A1(\i_tv80_core/n1455 ), .A2(
        \i_tv80_core/n1473 ), .ZN(\i_tv80_core/n17 ) );
  XNOR2_X1 \i_tv80_core/U37  ( .A(\i_tv80_core/n17 ), .B(\i_tv80_core/n1457 ), 
        .ZN(\i_tv80_core/n1451 ) );
  INV_X1 \i_tv80_core/U36  ( .A(\i_tv80_core/n22 ), .ZN(\i_tv80_core/n1140 )
         );
  AND2_X2 \i_tv80_core/U35  ( .A1(\i_tv80_core/n22 ), .A2(\i_tv80_core/n2069 ), 
        .ZN(\i_tv80_core/n66 ) );
  OAI21_X1 \i_tv80_core/U34  ( .B1(\i_tv80_core/Inc_PC ), .B2(
        \i_tv80_core/n922 ), .A(\i_tv80_core/n921 ), .ZN(\i_tv80_core/n16 ) );
  AND2_X1 \i_tv80_core/U33  ( .A1(\i_tv80_core/n833 ), .A2(\i_tv80_core/n261 ), 
        .ZN(\i_tv80_core/n15 ) );
  XNOR2_X1 \i_tv80_core/U32  ( .A(\i_tv80_core/n238 ), .B(\i_tv80_core/n61 ), 
        .ZN(\i_tv80_core/n14 ) );
  AOI221_X1 \i_tv80_core/U31  ( .B1(\i_tv80_core/n1470 ), .B2(
        \i_tv80_core/n1469 ), .C1(\i_tv80_core/n1543 ), .C2(di_reg[5]), .A(
        \i_tv80_core/n1468 ), .ZN(\i_tv80_core/n1471 ) );
  AND3_X2 \i_tv80_core/U30  ( .A1(\i_tv80_core/Set_BusB_To [1]), .A2(
        \i_tv80_core/Set_BusB_To [0]), .A3(\i_tv80_core/n267 ), .ZN(
        \i_tv80_core/n269 ) );
  AND2_X2 \i_tv80_core/U29  ( .A1(\i_tv80_core/Set_BusB_To [3]), .A2(
        \i_tv80_core/n344 ), .ZN(\i_tv80_core/n267 ) );
  AND3_X2 \i_tv80_core/U28  ( .A1(\i_tv80_core/n267 ), .A2(\i_tv80_core/n312 ), 
        .A3(\i_tv80_core/n1821 ), .ZN(\i_tv80_core/n243 ) );
  AND3_X2 \i_tv80_core/U27  ( .A1(\i_tv80_core/n267 ), .A2(
        \i_tv80_core/Set_BusB_To [0]), .A3(\i_tv80_core/n1821 ), .ZN(
        \i_tv80_core/n268 ) );
  INV_X4 \i_tv80_core/U26  ( .A(\i_tv80_core/n13 ), .ZN(\i_tv80_core/n1524 )
         );
  AND2_X2 \i_tv80_core/U25  ( .A1(\i_tv80_core/n868 ), .A2(\i_tv80_core/n1870 ), .ZN(\i_tv80_core/n13 ) );
  BUF_X1 \i_tv80_core/U24  ( .A(\i_tv80_core/n958 ), .Z(\i_tv80_core/n12 ) );
  NAND4_X1 \i_tv80_core/U23  ( .A1(\i_tv80_core/n1935 ), .A2(
        \i_tv80_core/n1886 ), .A3(\i_tv80_core/n1883 ), .A4(
        \i_tv80_core/n1887 ), .ZN(\i_tv80_core/n1942 ) );
  OR2_X2 \i_tv80_core/U22  ( .A1(\i_tv80_core/n1169 ), .A2(\i_tv80_core/JumpE ), .ZN(\i_tv80_core/n1161 ) );
  BUF_X1 \i_tv80_core/U21  ( .A(\i_tv80_core/RegBusA [11]), .Z(
        \i_tv80_core/n11 ) );
  NAND3_X1 \i_tv80_core/U20  ( .A1(\i_tv80_core/n1547 ), .A2(
        \i_tv80_core/n368 ), .A3(\i_tv80_core/n1529 ), .ZN(\i_tv80_core/n1495 ) );
  INV_X1 \i_tv80_core/U19  ( .A(\i_tv80_core/n1495 ), .ZN(\i_tv80_core/n10 )
         );
  BUF_X1 \i_tv80_core/U18  ( .A(\i_tv80_core/n1495 ), .Z(\i_tv80_core/n9 ) );
  BUF_X1 \i_tv80_core/U17  ( .A(\i_tv80_core/n1495 ), .Z(\i_tv80_core/n8 ) );
  INV_X1 \i_tv80_core/U16  ( .A(\i_tv80_core/n14 ), .ZN(\i_tv80_core/n7 ) );
  OR2_X1 \i_tv80_core/U15  ( .A1(\i_tv80_core/n77 ), .A2(\i_tv80_core/n354 ), 
        .ZN(\i_tv80_core/n775 ) );
  OAI21_X4 \i_tv80_core/U14  ( .B1(\i_tv80_core/n2061 ), .B2(\i_tv80_core/n20 ), .A(\i_tv80_core/n1161 ), .ZN(\i_tv80_core/n1530 ) );
  INV_X1 \i_tv80_core/U13  ( .A(\i_tv80_core/n1549 ), .ZN(\i_tv80_core/n6 ) );
  AND2_X2 \i_tv80_core/U12  ( .A1(\i_tv80_core/n860 ), .A2(\i_tv80_core/n781 ), 
        .ZN(\i_tv80_core/n247 ) );
  NAND2_X2 \i_tv80_core/U11  ( .A1(\i_tv80_core/n247 ), .A2(
        \i_tv80_core/LDSPHL ), .ZN(\i_tv80_core/n861 ) );
  BUF_X2 \i_tv80_core/U10  ( .A(\i_tv80_core/n91 ), .Z(\i_tv80_core/n5 ) );
  BUF_X1 \i_tv80_core/U9  ( .A(\i_tv80_core/n91 ), .Z(\i_tv80_core/n4 ) );
  CLKBUF_X1 \i_tv80_core/U8  ( .A(\i_tv80_core/n1905 ), .Z(\i_tv80_core/n113 )
         );
  INV_X1 \i_tv80_core/U7  ( .A(\i_tv80_core/n113 ), .ZN(\i_tv80_core/n3 ) );
  INV_X1 \i_tv80_core/U6  ( .A(\i_tv80_core/n1 ), .ZN(\i_tv80_core/n2 ) );
  NAND3_X1 \i_tv80_core/U5  ( .A1(\i_tv80_core/n1808 ), .A2(
        \i_tv80_core/n1788 ), .A3(\i_tv80_core/n2 ), .ZN(\i_tv80_core/n1792 )
         );
  NAND2_X1 \i_tv80_core/U4  ( .A1(\i_tv80_core/n1809 ), .A2(
        \i_tv80_core/n1796 ), .ZN(\i_tv80_core/n1 ) );
  CLKBUF_X1 \i_tv80_core/U3  ( .A(\i_tv80_core/RegBusA [0]), .Z(
        \i_tv80_core/n345 ) );
  DFF_X1 \i_tv80_core/BusA_reg[0]  ( .D(\i_tv80_core/n1344 ), .CK(clk), .Q(
        \i_tv80_core/BusA [0]), .QN(\i_tv80_core/n1212 ) );
  DFF_X1 \i_tv80_core/BusA_reg[3]  ( .D(\i_tv80_core/n1341 ), .CK(clk), .Q(
        \i_tv80_core/BusA [3]), .QN(\i_tv80_core/n1209 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[13]  ( .D(\i_tv80_core/n1282 ), .CK(clk), 
        .Q(\i_tv80_core/TmpAddr [13]) );
  DFF_X1 \i_tv80_core/SP_reg[15]  ( .D(\i_tv80_core/n1296 ), .CK(clk), .Q(
        \i_tv80_core/SP [15]) );
  DFF_X1 \i_tv80_core/SP_reg[14]  ( .D(\i_tv80_core/n1297 ), .CK(clk), .Q(
        \i_tv80_core/SP [14]) );
  DFF_X1 \i_tv80_core/SP_reg[13]  ( .D(\i_tv80_core/n1298 ), .CK(clk), .Q(
        \i_tv80_core/SP [13]) );
  DFF_X1 \i_tv80_core/SP_reg[12]  ( .D(\i_tv80_core/n1299 ), .CK(clk), .Q(
        \i_tv80_core/SP [12]) );
  DFF_X1 \i_tv80_core/A_reg[0]  ( .D(\i_tv80_core/n1248 ), .CK(clk), .Q(A[0])
         );
  DFF_X1 \i_tv80_core/A_reg[3]  ( .D(\i_tv80_core/n1245 ), .CK(clk), .Q(A[3])
         );
  DFF_X1 \i_tv80_core/A_reg[4]  ( .D(\i_tv80_core/n1244 ), .CK(clk), .Q(A[4])
         );
  DFF_X1 \i_tv80_core/A_reg[7]  ( .D(\i_tv80_core/n1241 ), .CK(clk), .Q(A[7])
         );
  DFF_X1 \i_tv80_core/PC_reg[13]  ( .D(\i_tv80_core/n1251 ), .CK(clk), .Q(
        \i_tv80_core/PC [13]) );
  DFF_X1 \i_tv80_core/BusA_reg[4]  ( .D(\i_tv80_core/n1340 ), .CK(clk), .Q(
        \i_tv80_core/BusA [4]), .QN(\i_tv80_core/n1913 ) );
  DFF_X1 \i_tv80_core/BusA_reg[5]  ( .D(\i_tv80_core/n1339 ), .CK(clk), .Q(
        \i_tv80_core/BusA [5]), .QN(\i_tv80_core/n1920 ) );
  DFF_X1 \i_tv80_core/BusA_reg[6]  ( .D(\i_tv80_core/n1338 ), .CK(clk), .Q(
        \i_tv80_core/BusA [6]), .QN(\i_tv80_core/n1927 ) );
  DFF_X1 \i_tv80_core/BusA_reg[7]  ( .D(\i_tv80_core/n1337 ), .CK(clk), .Q(
        \i_tv80_core/BusA [7]), .QN(\i_tv80_core/n1937 ) );
  DFF_X1 \i_tv80_core/m1_n_reg  ( .D(\i_tv80_core/n1346 ), .CK(clk), .Q(m1_n), 
        .QN(\i_tv80_core/n2161 ) );
  DFF_X1 \i_tv80_core/RegAddrC_reg[0]  ( .D(\i_tv80_core/n288 ), .CK(clk), .Q(
        \i_tv80_core/RegAddrC [0]) );
  DFF_X1 \i_tv80_core/IntE_FF2_reg  ( .D(\i_tv80_core/n1383 ), .CK(clk), .Q(
        \i_tv80_core/n527 ), .QN(\i_tv80_core/n1222 ) );
  DFF_X1 \i_tv80_core/Pre_XY_F_M_reg[0]  ( .D(\i_tv80_core/n1349 ), .CK(clk), 
        .QN(\i_tv80_core/n1228 ) );
  DFF_X1 \i_tv80_core/Pre_XY_F_M_reg[1]  ( .D(\i_tv80_core/n1347 ), .CK(clk), 
        .QN(\i_tv80_core/n1227 ) );
  DFF_X1 \i_tv80_core/Pre_XY_F_M_reg[2]  ( .D(\i_tv80_core/n1348 ), .CK(clk), 
        .QN(\i_tv80_core/n1226 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[15]  ( .D(\i_tv80_core/n1063 ), .CK(clk), 
        .Q(\i_tv80_core/n1800 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[10]  ( .D(\i_tv80_core/n1058 ), .CK(clk), 
        .Q(\i_tv80_core/n1686 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[1]  ( .D(\i_tv80_core/n1049 ), .CK(clk), 
        .Q(\i_tv80_core/n1573 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[6]  ( .D(\i_tv80_core/n1054 ), .CK(clk), 
        .Q(\i_tv80_core/n1612 ), .QN(\i_tv80_core/n1020 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[11]  ( .D(\i_tv80_core/n1059 ), .CK(clk), 
        .Q(\i_tv80_core/n1696 ), .QN(\i_tv80_core/n1025 ) );
  DFF_X1 \i_tv80_core/RegAddrB_r_reg[2]  ( .D(\i_tv80_core/n1043 ), .CK(clk), 
        .Q(\i_tv80_core/n1824 ), .QN(\i_tv80_core/n1009 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[4]  ( .D(\i_tv80_core/n1052 ), .CK(clk), 
        .Q(\i_tv80_core/n1595 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[13]  ( .D(\i_tv80_core/n1061 ), .CK(clk), 
        .Q(\i_tv80_core/n1742 ), .QN(\i_tv80_core/n1027 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[2]  ( .D(\i_tv80_core/n1050 ), .CK(clk), 
        .Q(\i_tv80_core/n1577 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[0]  ( .D(\i_tv80_core/n1048 ), .CK(clk), 
        .Q(\i_tv80_core/n1570 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[5]  ( .D(\i_tv80_core/n1053 ), .CK(clk), 
        .Q(\i_tv80_core/n1598 ), .QN(\i_tv80_core/n1019 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[7]  ( .D(\i_tv80_core/n1055 ), .CK(clk), 
        .Q(\i_tv80_core/n1638 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[3]  ( .D(\i_tv80_core/n1051 ), .CK(clk), 
        .Q(\i_tv80_core/n1581 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[14]  ( .D(\i_tv80_core/n1062 ), .CK(clk), 
        .Q(\i_tv80_core/n1769 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[8]  ( .D(\i_tv80_core/n1056 ), .CK(clk), 
        .Q(\i_tv80_core/n1654 ) );
  DFF_X1 \i_tv80_core/RegAddrB_r_reg[0]  ( .D(\i_tv80_core/n1042 ), .CK(clk), 
        .QN(\i_tv80_core/n1007 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[9]  ( .D(\i_tv80_core/n1057 ), .CK(clk), 
        .Q(\i_tv80_core/n1664 ), .QN(\i_tv80_core/n1023 ) );
  DFF_X1 \i_tv80_core/RegAddrB_r_reg[1]  ( .D(\i_tv80_core/n1046 ), .CK(clk), 
        .Q(\i_tv80_core/n1816 ), .QN(\i_tv80_core/n1012 ) );
  DFF_X1 \i_tv80_core/RegAddrA_r_reg[2]  ( .D(\i_tv80_core/n1041 ), .CK(clk), 
        .QN(\i_tv80_core/n1006 ) );
  DFF_X1 \i_tv80_core/RegBusA_r_reg[12]  ( .D(\i_tv80_core/n1060 ), .CK(clk), 
        .Q(\i_tv80_core/n1721 ) );
  DFF_X1 \i_tv80_core/Save_ALU_r_reg  ( .D(\i_tv80_core/n1094 ), .CK(clk), .Q(
        \i_tv80_core/n443 ), .QN(\i_tv80_core/n1178 ) );
  DFF_X1 \i_tv80_core/Read_To_Reg_r_reg[4]  ( .D(\i_tv80_core/n1369 ), .CK(clk), .Q(\i_tv80_core/n434 ) );
  DFF_X1 \i_tv80_core/Read_To_Reg_r_reg[2]  ( .D(\i_tv80_core/n1371 ), .CK(clk), .Q(\i_tv80_core/n436 ), .QN(\i_tv80_core/n1133 ) );
  DFF_X1 \i_tv80_core/A_reg[13]  ( .D(\i_tv80_core/n1235 ), .CK(clk), .Q(A[13]), .QN(\i_tv80_core/n2118 ) );
  DFF_X1 \i_tv80_core/A_reg[14]  ( .D(\i_tv80_core/n1234 ), .CK(clk), .Q(A[14]), .QN(\i_tv80_core/n2126 ) );
  DFF_X1 \i_tv80_core/A_reg[15]  ( .D(\i_tv80_core/n1233 ), .CK(clk), .Q(A[15]), .QN(\i_tv80_core/n2136 ) );
  DFF_X1 \i_tv80_core/SP_reg[8]  ( .D(\i_tv80_core/n1303 ), .CK(clk), .Q(
        \i_tv80_core/SP [8]), .QN(\i_tv80_core/n1145 ) );
  DFF_X1 \i_tv80_core/SP_reg[9]  ( .D(\i_tv80_core/n1302 ), .CK(clk), .Q(
        \i_tv80_core/SP [9]), .QN(\i_tv80_core/n1144 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[11]  ( .D(\i_tv80_core/n1284 ), .CK(clk), 
        .Q(\i_tv80_core/TmpAddr [11]), .QN(\i_tv80_core/n1184 ) );
  DFF_X1 \i_tv80_core/BusB_reg[1]  ( .D(\i_tv80_core/n2174 ), .CK(clk), .Q(
        \i_tv80_core/BusB [1]), .QN(\i_tv80_core/n1030 ) );
  DFF_X1 \i_tv80_core/BusB_reg[3]  ( .D(\i_tv80_core/n2172 ), .CK(clk), .Q(
        \i_tv80_core/BusB [3]), .QN(\i_tv80_core/n1032 ) );
  DFF_X1 \i_tv80_core/BusB_reg[5]  ( .D(\i_tv80_core/n2170 ), .CK(clk), .Q(
        \i_tv80_core/BusB [5]) );
  DFF_X1 \i_tv80_core/BusB_reg[2]  ( .D(\i_tv80_core/n2173 ), .CK(clk), .Q(
        \i_tv80_core/BusB [2]), .QN(\i_tv80_core/n1031 ) );
  DFF_X1 \i_tv80_core/BusB_reg[4]  ( .D(\i_tv80_core/n2171 ), .CK(clk), .Q(
        \i_tv80_core/BusB [4]), .QN(\i_tv80_core/n1033 ) );
  DFF_X1 \i_tv80_core/BusB_reg[6]  ( .D(\i_tv80_core/n2169 ), .CK(clk), .Q(
        \i_tv80_core/BusB [6]), .QN(\i_tv80_core/n1035 ) );
  DFF_X1 \i_tv80_core/BusB_reg[7]  ( .D(\i_tv80_core/n2168 ), .CK(clk), .Q(
        \i_tv80_core/BusB [7]) );
  DFF_X1 \i_tv80_core/SP_reg[10]  ( .D(\i_tv80_core/n1301 ), .CK(clk), .Q(
        \i_tv80_core/SP [10]), .QN(\i_tv80_core/n1143 ) );
  DFF_X1 \i_tv80_core/PC_reg[8]  ( .D(\i_tv80_core/n1256 ), .CK(clk), .Q(
        \i_tv80_core/PC [8]), .QN(\i_tv80_core/n1410 ) );
  DFF_X1 \i_tv80_core/PC_reg[9]  ( .D(\i_tv80_core/n1255 ), .CK(clk), .Q(
        \i_tv80_core/PC [9]), .QN(\i_tv80_core/n1417 ) );
  DFF_X1 \i_tv80_core/PC_reg[10]  ( .D(\i_tv80_core/n1254 ), .CK(clk), .Q(
        \i_tv80_core/PC [10]) );
  DFF_X1 \i_tv80_core/PC_reg[11]  ( .D(\i_tv80_core/n1253 ), .CK(clk), .Q(
        \i_tv80_core/PC [11]) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[9]  ( .D(\i_tv80_core/n1286 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [9]), .QN(\i_tv80_core/n1186 ) );
  DFF_X1 \i_tv80_core/ACC_reg[1]  ( .D(\i_tv80_core/n1334 ), .CK(clk), .Q(
        \i_tv80_core/ACC [1]), .QN(\i_tv80_core/n1176 ) );
  DFF_X1 \i_tv80_core/ACC_reg[3]  ( .D(\i_tv80_core/n1332 ), .CK(clk), .Q(
        \i_tv80_core/ACC [3]), .QN(\i_tv80_core/n1174 ) );
  DFF_X1 \i_tv80_core/ACC_reg[0]  ( .D(\i_tv80_core/n1335 ), .CK(clk), .Q(
        \i_tv80_core/ACC [0]), .QN(\i_tv80_core/n1177 ) );
  DFF_X1 \i_tv80_core/ACC_reg[2]  ( .D(\i_tv80_core/n1333 ), .CK(clk), .Q(
        \i_tv80_core/ACC [2]), .QN(\i_tv80_core/n1175 ) );
  DFF_X1 \i_tv80_core/ACC_reg[5]  ( .D(\i_tv80_core/n1330 ), .CK(clk), .Q(
        \i_tv80_core/ACC [5]), .QN(\i_tv80_core/n1172 ) );
  DFF_X1 \i_tv80_core/ACC_reg[7]  ( .D(\i_tv80_core/n1328 ), .CK(clk), .Q(
        \i_tv80_core/ACC [7]), .QN(\i_tv80_core/n1170 ) );
  DFF_X1 \i_tv80_core/ACC_reg[4]  ( .D(\i_tv80_core/n1331 ), .CK(clk), .Q(
        \i_tv80_core/ACC [4]), .QN(\i_tv80_core/n1173 ) );
  DFF_X1 \i_tv80_core/ACC_reg[6]  ( .D(\i_tv80_core/n1329 ), .CK(clk), .Q(
        \i_tv80_core/ACC [6]), .QN(\i_tv80_core/n1171 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[10]  ( .D(\i_tv80_core/n1285 ), .CK(clk), 
        .Q(\i_tv80_core/TmpAddr [10]), .QN(\i_tv80_core/n1185 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[8]  ( .D(\i_tv80_core/n1287 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [8]), .QN(\i_tv80_core/n1187 ) );
  DFF_X1 \i_tv80_core/PC_reg[0]  ( .D(\i_tv80_core/n1264 ), .CK(clk), .Q(
        \i_tv80_core/PC [0]), .QN(\i_tv80_core/n946 ) );
  DFF_X1 \i_tv80_core/PC_reg[3]  ( .D(\i_tv80_core/n1261 ), .CK(clk), .Q(
        \i_tv80_core/PC [3]), .QN(\i_tv80_core/n1024 ) );
  DFF_X1 \i_tv80_core/PC_reg[4]  ( .D(\i_tv80_core/n1260 ), .CK(clk), .Q(
        \i_tv80_core/PC [4]) );
  DFF_X1 \i_tv80_core/PC_reg[7]  ( .D(\i_tv80_core/n1257 ), .CK(clk), .Q(
        \i_tv80_core/PC [7]), .QN(\i_tv80_core/n1401 ) );
  DFF_X1 \i_tv80_core/SP_reg[7]  ( .D(\i_tv80_core/n1304 ), .CK(clk), .Q(
        \i_tv80_core/SP [7]), .QN(\i_tv80_core/n1146 ) );
  DFF_X1 \i_tv80_core/SP_reg[1]  ( .D(\i_tv80_core/n1310 ), .CK(clk), .Q(
        \i_tv80_core/SP [1]), .QN(\i_tv80_core/n1152 ) );
  DFF_X1 \i_tv80_core/SP_reg[3]  ( .D(\i_tv80_core/n1308 ), .CK(clk), .Q(
        \i_tv80_core/SP [3]), .QN(\i_tv80_core/n1150 ) );
  DFF_X1 \i_tv80_core/SP_reg[0]  ( .D(\i_tv80_core/n1311 ), .CK(clk), .Q(
        \i_tv80_core/SP [0]), .QN(\i_tv80_core/n1153 ) );
  DFF_X1 \i_tv80_core/SP_reg[2]  ( .D(\i_tv80_core/n1309 ), .CK(clk), .Q(
        \i_tv80_core/SP [2]), .QN(\i_tv80_core/n1151 ) );
  DFF_X1 \i_tv80_core/SP_reg[4]  ( .D(\i_tv80_core/n1307 ), .CK(clk), .Q(
        \i_tv80_core/SP [4]), .QN(\i_tv80_core/n1149 ) );
  DFF_X1 \i_tv80_core/SP_reg[5]  ( .D(\i_tv80_core/n1306 ), .CK(clk), .Q(
        \i_tv80_core/SP [5]), .QN(\i_tv80_core/n1148 ) );
  DFF_X1 \i_tv80_core/SP_reg[6]  ( .D(\i_tv80_core/n1305 ), .CK(clk), .Q(
        \i_tv80_core/SP [6]), .QN(\i_tv80_core/n1147 ) );
  DFF_X1 \i_tv80_core/F_reg[1]  ( .D(\i_tv80_core/n1278 ), .CK(clk), .Q(
        \i_tv80_core/F [1]), .QN(\i_tv80_core/n1206 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[7]  ( .D(\i_tv80_core/n1288 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [7]), .QN(\i_tv80_core/n1188 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[3]  ( .D(\i_tv80_core/n1292 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [3]), .QN(\i_tv80_core/n1192 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[5]  ( .D(\i_tv80_core/n1290 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [5]), .QN(\i_tv80_core/n1190 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[6]  ( .D(\i_tv80_core/n1289 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [6]), .QN(\i_tv80_core/n1189 ) );
  DFF_X1 \i_tv80_core/Z16_r_reg  ( .D(\i_tv80_core/n1363 ), .CK(clk), .Q(
        \i_tv80_core/Z16_r ), .QN(\i_tv80_core/n1130 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[2]  ( .D(\i_tv80_core/n1293 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [2]), .QN(\i_tv80_core/n1193 ) );
  DFF_X1 \i_tv80_core/PC_reg[1]  ( .D(\i_tv80_core/n1263 ), .CK(clk), .Q(
        \i_tv80_core/PC [1]), .QN(\i_tv80_core/n959 ) );
  DFF_X1 \i_tv80_core/PC_reg[2]  ( .D(\i_tv80_core/n1262 ), .CK(clk), .Q(
        \i_tv80_core/PC [2]), .QN(\i_tv80_core/n1124 ) );
  DFF_X1 \i_tv80_core/PC_reg[5]  ( .D(\i_tv80_core/n1259 ), .CK(clk), .Q(
        \i_tv80_core/PC [5]), .QN(\i_tv80_core/n1121 ) );
  DFF_X1 \i_tv80_core/PC_reg[6]  ( .D(\i_tv80_core/n1258 ), .CK(clk), .Q(
        \i_tv80_core/PC [6]), .QN(\i_tv80_core/n1120 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[4]  ( .D(\i_tv80_core/n1291 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [4]), .QN(\i_tv80_core/n1191 ) );
  DFF_X1 \i_tv80_core/d_o_reg[7]  ( .D(\i_tv80_core/n1073 ), .CK(clk), .Q(
        d_o[7]), .QN(\i_tv80_core/n981 ) );
  DFF_X1 \i_tv80_core/d_o_reg[6]  ( .D(\i_tv80_core/n1074 ), .CK(clk), .Q(
        d_o[6]), .QN(\i_tv80_core/n980 ) );
  DFF_X1 \i_tv80_core/F_reg[5]  ( .D(\i_tv80_core/n1274 ), .CK(clk), .Q(
        \i_tv80_core/F [5]), .QN(\i_tv80_core/n1202 ) );
  DFF_X1 \i_tv80_core/F_reg[3]  ( .D(\i_tv80_core/n1276 ), .CK(clk), .Q(
        \i_tv80_core/F [3]), .QN(\i_tv80_core/n1204 ) );
  DFF_X1 \i_tv80_core/d_o_reg[2]  ( .D(\i_tv80_core/n1078 ), .CK(clk), .Q(
        d_o[2]), .QN(\i_tv80_core/n976 ) );
  DFF_X1 \i_tv80_core/d_o_reg[5]  ( .D(\i_tv80_core/n1075 ), .CK(clk), .Q(
        d_o[5]), .QN(\i_tv80_core/n979 ) );
  DFF_X1 \i_tv80_core/ALU_Op_r_reg[3]  ( .D(\i_tv80_core/n1098 ), .CK(clk), 
        .Q(\i_tv80_core/ALU_Op_r [3]), .QN(\i_tv80_core/n982 ) );
  DFF_X1 \i_tv80_core/d_o_reg[1]  ( .D(\i_tv80_core/n1079 ), .CK(clk), .Q(
        d_o[1]), .QN(\i_tv80_core/n975 ) );
  DFF_X1 \i_tv80_core/d_o_reg[4]  ( .D(\i_tv80_core/n1076 ), .CK(clk), .Q(
        d_o[4]), .QN(\i_tv80_core/n978 ) );
  DFF_X1 \i_tv80_core/No_BTR_reg  ( .D(\i_tv80_core/n1385 ), .CK(clk), .Q(
        \i_tv80_core/n995 ), .QN(\i_tv80_core/n549 ) );
  DFF_X1 \i_tv80_core/d_o_reg[0]  ( .D(\i_tv80_core/n1080 ), .CK(clk), .Q(
        d_o[0]), .QN(\i_tv80_core/n974 ) );
  DFF_X1 \i_tv80_core/d_o_reg[3]  ( .D(\i_tv80_core/n1077 ), .CK(clk), .Q(
        d_o[3]), .QN(\i_tv80_core/n977 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[1]  ( .D(\i_tv80_core/n1294 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [1]), .QN(\i_tv80_core/n1194 ) );
  DFF_X1 \i_tv80_core/R_reg[0]  ( .D(\i_tv80_core/n1327 ), .CK(clk), .Q(
        \i_tv80_core/R [0]), .QN(\i_tv80_core/n1160 ) );
  DFF_X1 \i_tv80_core/R_reg[1]  ( .D(\i_tv80_core/n1326 ), .CK(clk), .Q(
        \i_tv80_core/R [1]), .QN(\i_tv80_core/n1159 ) );
  DFF_X1 \i_tv80_core/R_reg[2]  ( .D(\i_tv80_core/n1325 ), .CK(clk), .Q(
        \i_tv80_core/R [2]), .QN(\i_tv80_core/n1158 ) );
  DFF_X1 \i_tv80_core/R_reg[3]  ( .D(\i_tv80_core/n1324 ), .CK(clk), .Q(
        \i_tv80_core/R [3]), .QN(\i_tv80_core/n1157 ) );
  DFF_X1 \i_tv80_core/R_reg[4]  ( .D(\i_tv80_core/n1323 ), .CK(clk), .Q(
        \i_tv80_core/R [4]), .QN(\i_tv80_core/n1156 ) );
  DFF_X1 \i_tv80_core/R_reg[5]  ( .D(\i_tv80_core/n1322 ), .CK(clk), .Q(
        \i_tv80_core/R [5]), .QN(\i_tv80_core/n1155 ) );
  DFF_X1 \i_tv80_core/R_reg[6]  ( .D(\i_tv80_core/n1321 ), .CK(clk), .Q(
        \i_tv80_core/R [6]), .QN(\i_tv80_core/n1154 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[0]  ( .D(\i_tv80_core/n1295 ), .CK(clk), .Q(
        \i_tv80_core/TmpAddr [0]), .QN(\i_tv80_core/n1195 ) );
  DFF_X1 \i_tv80_core/rfsh_n_reg  ( .D(\i_tv80_core/n1366 ), .CK(clk), .Q(
        rfsh_n), .QN(\i_tv80_core/n1213 ) );
  DFF_X1 \i_tv80_core/IStatus_reg[0]  ( .D(\i_tv80_core/n1375 ), .CK(clk), .Q(
        \i_tv80_core/n923 ), .QN(\i_tv80_core/n1199 ) );
  DFF_X1 \i_tv80_core/IStatus_reg[1]  ( .D(\i_tv80_core/n1374 ), .CK(clk), .Q(
        \i_tv80_core/n925 ), .QN(\i_tv80_core/n1198 ) );
  DFF_X1 \i_tv80_core/RegAddrA_r_reg[0]  ( .D(\i_tv80_core/n1040 ), .CK(clk), 
        .Q(\i_tv80_core/n1831 ), .QN(\i_tv80_core/n1005 ) );
  DFF_X1 \i_tv80_core/RegAddrA_r_reg[1]  ( .D(\i_tv80_core/n1045 ), .CK(clk), 
        .Q(\i_tv80_core/n1842 ) );
  DFF_X1 \i_tv80_core/Read_To_Reg_r_reg[0]  ( .D(\i_tv80_core/n1373 ), .CK(clk), .Q(\i_tv80_core/n1561 ), .QN(\i_tv80_core/n1135 ) );
  DFF_X1 \i_tv80_core/Read_To_Reg_r_reg[1]  ( .D(\i_tv80_core/n1372 ), .CK(clk), .Q(\i_tv80_core/n438 ), .QN(\i_tv80_core/n1134 ) );
  DFF_X1 \i_tv80_core/Read_To_Reg_r_reg[3]  ( .D(\i_tv80_core/n1370 ), .CK(clk), .Q(\i_tv80_core/n439 ), .QN(\i_tv80_core/n1132 ) );
  DFF_X1 \i_tv80_core/mcycles_reg[0]  ( .D(\i_tv80_core/n1108 ), .CK(clk), .Q(
        \i_tv80_core/n414 ), .QN(\i_tv80_core/n992 ) );
  DFF_X1 \i_tv80_core/Halt_FF_reg  ( .D(\i_tv80_core/n1360 ), .CK(clk), .Q(
        \i_tv80_core/n510 ), .QN(halt_n) );
  DFF_X1 \i_tv80_core/Fp_reg[1]  ( .D(\i_tv80_core/n1089 ), .CK(clk), .Q(
        \i_tv80_core/n750 ), .QN(\i_tv80_core/n985 ) );
  DFF_X1 \i_tv80_core/Ap_reg[0]  ( .D(\i_tv80_core/n1081 ), .CK(clk), .Q(
        \i_tv80_core/n675 ), .QN(\i_tv80_core/n966 ) );
  DFF_X1 \i_tv80_core/Ap_reg[1]  ( .D(\i_tv80_core/n1082 ), .CK(clk), .Q(
        \i_tv80_core/n666 ), .QN(\i_tv80_core/n967 ) );
  DFF_X1 \i_tv80_core/Ap_reg[2]  ( .D(\i_tv80_core/n1083 ), .CK(clk), .Q(
        \i_tv80_core/n659 ), .QN(\i_tv80_core/n968 ) );
  DFF_X1 \i_tv80_core/Ap_reg[3]  ( .D(\i_tv80_core/n1084 ), .CK(clk), .Q(
        \i_tv80_core/n653 ), .QN(\i_tv80_core/n969 ) );
  DFF_X1 \i_tv80_core/Ap_reg[4]  ( .D(\i_tv80_core/n1085 ), .CK(clk), .Q(
        \i_tv80_core/n647 ), .QN(\i_tv80_core/n970 ) );
  DFF_X1 \i_tv80_core/Ap_reg[5]  ( .D(\i_tv80_core/n1086 ), .CK(clk), .Q(
        \i_tv80_core/n684 ), .QN(\i_tv80_core/n971 ) );
  DFF_X1 \i_tv80_core/Ap_reg[6]  ( .D(\i_tv80_core/n1087 ), .CK(clk), .Q(
        \i_tv80_core/n637 ), .QN(\i_tv80_core/n972 ) );
  DFF_X1 \i_tv80_core/Ap_reg[7]  ( .D(\i_tv80_core/n1088 ), .CK(clk), .Q(
        \i_tv80_core/n766 ), .QN(\i_tv80_core/n973 ) );
  DFF_X1 \i_tv80_core/Fp_reg[4]  ( .D(\i_tv80_core/n1090 ), .CK(clk), .Q(
        \i_tv80_core/n727 ), .QN(\i_tv80_core/n988 ) );
  DFF_X1 \i_tv80_core/mcycles_reg[1]  ( .D(\i_tv80_core/n1109 ), .CK(clk), .Q(
        \i_tv80_core/n412 ), .QN(\i_tv80_core/n993 ) );
  DFF_X1 \i_tv80_core/XY_Ind_reg  ( .D(\i_tv80_core/n1107 ), .CK(clk), .Q(
        \i_tv80_core/n1848 ), .QN(\i_tv80_core/n1008 ) );
  DFF_X1 \i_tv80_core/PreserveC_r_reg  ( .D(\i_tv80_core/n1093 ), .CK(clk), 
        .Q(\i_tv80_core/n702 ), .QN(\i_tv80_core/n983 ) );
  DFF_X1 \i_tv80_core/NMI_s_reg  ( .D(\i_tv80_core/n1345 ), .CK(clk), .Q(
        \i_tv80_core/n477 ) );
  DFF_X1 \i_tv80_core/Oldnmi_n_reg  ( .D(\i_tv80_core/n1215 ), .CK(clk), .QN(
        \i_tv80_core/n965 ) );
  DFF_X2 \i_tv80_core/TmpAddr_reg[15]  ( .D(\i_tv80_core/n1280 ), .CK(clk), 
        .Q(\i_tv80_core/TmpAddr [15]), .QN(\i_tv80_core/n1180 ) );
  DFF_X1 \i_tv80_core/IR_reg[3]  ( .D(\i_tv80_core/n1356 ), .CK(clk), .Q(
        \i_tv80_core/IR [3]), .QN(\i_tv80_core/n1165 ) );
  DFF_X1 \i_tv80_core/IR_reg[2]  ( .D(\i_tv80_core/n1357 ), .CK(clk), .Q(
        \i_tv80_core/IR [2]), .QN(\i_tv80_core/n165 ) );
  SDFF_X1 \i_tv80_core/mcycle_reg[0]  ( .D(\i_tv80_core/n1368 ), .SI(1'b0), 
        .SE(1'b0), .CK(clk), .Q(\i_tv80_core/n2180 ), .QN(\i_tv80_core/n1225 )
         );
  SDFF_X1 \i_tv80_core/IR_reg[5]  ( .D(\i_tv80_core/n1354 ), .SI(1'b0), .SE(
        1'b0), .CK(clk), .Q(\i_tv80_core/IR [5]), .QN(\i_tv80_core/n1163 ) );
  SDFF_X1 \i_tv80_core/IR_reg[4]  ( .D(\i_tv80_core/n1355 ), .SI(1'b0), .SE(
        1'b0), .CK(clk), .Q(\i_tv80_core/IR [4]), .QN(\i_tv80_core/n1164 ) );
  SDFF_X1 \i_tv80_core/IR_reg[0]  ( .D(\i_tv80_core/n1359 ), .SI(1'b0), .SE(
        1'b0), .CK(clk), .Q(\i_tv80_core/IR [0]), .QN(\i_tv80_core/n1168 ) );
  SDFF_X2 \i_tv80_core/mcycle_reg[1]  ( .D(\i_tv80_core/n1367 ), .SI(1'b0), 
        .SE(1'b0), .CK(clk), .Q(\i_tv80_core/n2179 ), .QN(\i_tv80_core/n1224 )
         );
  DFF_X1 \i_tv80_core/tstate_reg[2]  ( .D(\i_tv80_core/n1377 ), .CK(clk), .Q(
        tstate[2]), .QN(\i_tv80_core/n2151 ) );
  DFF_X1 \i_tv80_core/IR_reg[7]  ( .D(\i_tv80_core/n1350 ), .CK(clk), .Q(
        \i_tv80_core/IR [7]), .QN(\i_tv80_core/n183 ) );
  DFF_X1 \i_tv80_core/F_reg[2]  ( .D(\i_tv80_core/n1277 ), .CK(clk), .Q(
        \i_tv80_core/F [2]), .QN(\i_tv80_core/n1205 ) );
  DFF_X1 \i_tv80_core/IntCycle_reg  ( .D(\i_tv80_core/n1381 ), .CK(clk), .Q(
        \i_tv80_core/IntCycle ), .QN(intcycle_n) );
  DFF_X1 \i_tv80_core/IncDecZ_reg  ( .D(\i_tv80_core/n1336 ), .CK(clk), .Q(
        \i_tv80_core/n537 ), .QN(\i_tv80_core/n1208 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[14]  ( .D(\i_tv80_core/n1281 ), .CK(clk), 
        .Q(\i_tv80_core/TmpAddr [14]), .QN(\i_tv80_core/n1181 ) );
  DFF_X1 \i_tv80_core/TmpAddr_reg[12]  ( .D(\i_tv80_core/n1283 ), .CK(clk), 
        .Q(\i_tv80_core/TmpAddr [12]), .QN(\i_tv80_core/n1183 ) );
  DFF_X1 \i_tv80_core/SP_reg[11]  ( .D(\i_tv80_core/n1300 ), .CK(clk), .Q(
        \i_tv80_core/SP [11]), .QN(\i_tv80_core/n1142 ) );
  DFF_X1 \i_tv80_core/PC_reg[14]  ( .D(\i_tv80_core/n1250 ), .CK(clk), .Q(
        \i_tv80_core/PC [14]), .QN(\i_tv80_core/n1538 ) );
  DFF_X1 \i_tv80_core/PC_reg[12]  ( .D(\i_tv80_core/n1252 ), .CK(clk), .Q(
        \i_tv80_core/PC [12]), .QN(\i_tv80_core/n1461 ) );
  DFF_X1 \i_tv80_core/PC_reg[15]  ( .D(\i_tv80_core/n1249 ), .CK(clk), .Q(
        \i_tv80_core/PC [15]), .QN(\i_tv80_core/n1111 ) );
  DFF_X1 \i_tv80_core/A_reg[8]  ( .D(\i_tv80_core/n1240 ), .CK(clk), .Q(A[8]), 
        .QN(\i_tv80_core/n2071 ) );
  DFF_X1 \i_tv80_core/A_reg[9]  ( .D(\i_tv80_core/n1239 ), .CK(clk), .Q(A[9]), 
        .QN(\i_tv80_core/n2086 ) );
  DFF_X1 \i_tv80_core/A_reg[10]  ( .D(\i_tv80_core/n1238 ), .CK(clk), .Q(A[10]), .QN(\i_tv80_core/n2094 ) );
  DFF_X1 \i_tv80_core/A_reg[11]  ( .D(\i_tv80_core/n1237 ), .CK(clk), .Q(A[11]), .QN(\i_tv80_core/n2102 ) );
  DFF_X1 \i_tv80_core/A_reg[12]  ( .D(\i_tv80_core/n1236 ), .CK(clk), .Q(A[12]), .QN(\i_tv80_core/n2110 ) );
  DFF_X1 \i_tv80_core/A_reg[1]  ( .D(\i_tv80_core/n1247 ), .CK(clk), .Q(A[1]), 
        .QN(\i_tv80_core/n2021 ) );
  DFF_X1 \i_tv80_core/A_reg[2]  ( .D(\i_tv80_core/n1246 ), .CK(clk), .Q(A[2]), 
        .QN(\i_tv80_core/n2027 ) );
  DFF_X1 \i_tv80_core/A_reg[5]  ( .D(\i_tv80_core/n1243 ), .CK(clk), .Q(A[5]), 
        .QN(\i_tv80_core/n2043 ) );
  DFF_X1 \i_tv80_core/A_reg[6]  ( .D(\i_tv80_core/n1242 ), .CK(clk), .Q(A[6]), 
        .QN(\i_tv80_core/n2052 ) );
  DFF_X2 \i_tv80_core/tstate_reg[0]  ( .D(\i_tv80_core/n1378 ), .CK(clk), .Q(
        tstate[0]), .QN(\i_tv80_core/n36 ) );
  DFF_X1 \i_tv80_core/BTR_r_reg  ( .D(\i_tv80_core/n1265 ), .CK(clk), .Q(
        \i_tv80_core/n45 ), .QN(\i_tv80_core/n1169 ) );
  DFF_X1 \i_tv80_core/I_reg[7]  ( .D(\i_tv80_core/n1312 ), .CK(clk), .Q(
        \i_tv80_core/n1004 ), .QN(\i_tv80_core/n2138 ) );
  DFF_X1 \i_tv80_core/R_reg[7]  ( .D(\i_tv80_core/n1320 ), .CK(clk), .Q(
        \i_tv80_core/n996 ) );
  DFF_X1 \i_tv80_core/BusA_reg[2]  ( .D(\i_tv80_core/n1342 ), .CK(clk), .Q(
        \i_tv80_core/BusA [2]), .QN(\i_tv80_core/n1210 ) );
  DFF_X1 \i_tv80_core/BusA_reg[1]  ( .D(\i_tv80_core/n1343 ), .CK(clk), .Q(
        \i_tv80_core/BusA [1]), .QN(\i_tv80_core/n1211 ) );
  DFF_X1 \i_tv80_core/Fp_reg[7]  ( .D(\i_tv80_core/n1266 ), .CK(clk), .QN(
        \i_tv80_core/n613 ) );
  DFF_X1 \i_tv80_core/mcycles_reg[2]  ( .D(\i_tv80_core/n1110 ), .CK(clk), .Q(
        \i_tv80_core/n52 ), .QN(\i_tv80_core/n994 ) );
  DFF_X1 \i_tv80_core/Fp_reg[2]  ( .D(\i_tv80_core/n1270 ), .CK(clk), .Q(
        \i_tv80_core/n986 ), .QN(\i_tv80_core/n517 ) );
  DFF_X1 \i_tv80_core/Auto_Wait_t2_reg  ( .D(\i_tv80_core/n1220 ), .CK(clk), 
        .Q(\i_tv80_core/n48 ), .QN(\i_tv80_core/n964 ) );
  DFF_X1 \i_tv80_core/I_reg[6]  ( .D(\i_tv80_core/n1313 ), .CK(clk), .Q(
        \i_tv80_core/n1003 ), .QN(\i_tv80_core/n2127 ) );
  DFF_X1 \i_tv80_core/I_reg[5]  ( .D(\i_tv80_core/n1314 ), .CK(clk), .Q(
        \i_tv80_core/n1002 ), .QN(\i_tv80_core/n2119 ) );
  DFF_X1 \i_tv80_core/Fp_reg[5]  ( .D(\i_tv80_core/n1268 ), .CK(clk), .Q(
        \i_tv80_core/n989 ), .QN(\i_tv80_core/n620 ) );
  DFF_X1 \i_tv80_core/I_reg[4]  ( .D(\i_tv80_core/n1315 ), .CK(clk), .Q(
        \i_tv80_core/n1001 ), .QN(\i_tv80_core/n2111 ) );
  DFF_X1 \i_tv80_core/I_reg[3]  ( .D(\i_tv80_core/n1316 ), .CK(clk), .Q(
        \i_tv80_core/n1000 ), .QN(\i_tv80_core/n2103 ) );
  DFF_X1 \i_tv80_core/Fp_reg[3]  ( .D(\i_tv80_core/n1269 ), .CK(clk), .Q(
        \i_tv80_core/n987 ), .QN(\i_tv80_core/n737 ) );
  DFF_X1 \i_tv80_core/I_reg[2]  ( .D(\i_tv80_core/n1317 ), .CK(clk), .Q(
        \i_tv80_core/n999 ), .QN(\i_tv80_core/n2095 ) );
  DFF_X1 \i_tv80_core/I_reg[1]  ( .D(\i_tv80_core/n1318 ), .CK(clk), .Q(
        \i_tv80_core/n998 ), .QN(\i_tv80_core/n2087 ) );
  DFF_X1 \i_tv80_core/I_reg[0]  ( .D(\i_tv80_core/n1319 ), .CK(clk), .Q(
        \i_tv80_core/n997 ), .QN(\i_tv80_core/n2072 ) );
  DFF_X1 \i_tv80_core/Fp_reg[6]  ( .D(\i_tv80_core/n1267 ), .CK(clk), .Q(
        \i_tv80_core/n990 ), .QN(\i_tv80_core/n417 ) );
  DFF_X1 \i_tv80_core/F_reg[6]  ( .D(\i_tv80_core/n1273 ), .CK(clk), .Q(
        \i_tv80_core/F [6]), .QN(\i_tv80_core/n1201 ) );
  DFF_X1 \i_tv80_core/F_reg[4]  ( .D(\i_tv80_core/n1275 ), .CK(clk), .Q(
        \i_tv80_core/F [4]), .QN(\i_tv80_core/n1203 ) );
  DFF_X1 \i_tv80_core/Fp_reg[0]  ( .D(\i_tv80_core/n1271 ), .CK(clk), .Q(
        \i_tv80_core/n984 ), .QN(\i_tv80_core/n704 ) );
  DFF_X1 \i_tv80_core/F_reg[0]  ( .D(\i_tv80_core/n1279 ), .CK(clk), .Q(
        \i_tv80_core/F [0]), .QN(\i_tv80_core/n1207 ) );
  DFF_X1 \i_tv80_core/Auto_Wait_t1_reg  ( .D(\i_tv80_core/n1380 ), .CK(clk), 
        .Q(\i_tv80_core/n50 ), .QN(\i_tv80_core/n1231 ) );
  DFF_X1 \i_tv80_core/NMICycle_reg  ( .D(\i_tv80_core/n1361 ), .CK(clk), .Q(
        \i_tv80_core/NMICycle ), .QN(\i_tv80_core/n1218 ) );
  DFF_X1 \i_tv80_core/IR_reg[1]  ( .D(\i_tv80_core/n1358 ), .CK(clk), .Q(
        \i_tv80_core/IR [1]), .QN(\i_tv80_core/n1167 ) );
  DFF_X1 \i_tv80_core/XY_State_reg[0]  ( .D(\i_tv80_core/n1353 ), .CK(clk), 
        .Q(\i_tv80_core/n51 ), .QN(\i_tv80_core/n1197 ) );
  DFF_X1 \i_tv80_core/RegAddrC_reg[2]  ( .D(\i_tv80_core/n1044 ), .CK(clk), 
        .Q(\i_tv80_core/RegAddrC [2]), .QN(\i_tv80_core/n1010 ) );
  DFF_X1 \i_tv80_core/XY_State_reg[1]  ( .D(\i_tv80_core/n1352 ), .CK(clk), 
        .Q(\i_tv80_core/n46 ), .QN(\i_tv80_core/n1196 ) );
  DFF_X1 \i_tv80_core/IR_reg[6]  ( .D(\i_tv80_core/n1351 ), .CK(clk), .Q(
        \i_tv80_core/IR [6]), .QN(\i_tv80_core/n1162 ) );
  DFF_X1 \i_tv80_core/ISet_reg[0]  ( .D(\i_tv80_core/n1365 ), .CK(clk), .Q(
        \i_tv80_core/ISet [0]), .QN(\i_tv80_core/n1137 ) );
  DFF_X1 \i_tv80_core/ISet_reg[1]  ( .D(\i_tv80_core/n1364 ), .CK(clk), .Q(
        \i_tv80_core/ISet [1]), .QN(\i_tv80_core/n1136 ) );
  DFF_X1 \i_tv80_core/Alternate_reg  ( .D(\i_tv80_core/n1362 ), .CK(clk), .Q(
        \i_tv80_core/n44 ), .QN(\i_tv80_core/n1179 ) );
  DFF_X1 \i_tv80_core/ALU_Op_r_reg[0]  ( .D(\i_tv80_core/n2176 ), .CK(clk), 
        .Q(\i_tv80_core/ALU_Op_r [0]), .QN(\i_tv80_core/n1129 ) );
  DFF_X1 \i_tv80_core/ALU_Op_r_reg[1]  ( .D(\i_tv80_core/n1096 ), .CK(clk), 
        .Q(\i_tv80_core/ALU_Op_r [1]), .QN(\i_tv80_core/n1128 ) );
  DFF_X1 \i_tv80_core/ALU_Op_r_reg[2]  ( .D(\i_tv80_core/n1097 ), .CK(clk), 
        .Q(\i_tv80_core/ALU_Op_r [2]), .QN(\i_tv80_core/n1127 ) );
  DFF_X1 \i_tv80_core/Arith16_r_reg  ( .D(\i_tv80_core/n2177 ), .CK(clk), .Q(
        \i_tv80_core/Arith16_r ) );
  DFF_X1 \i_tv80_core/RegAddrC_reg[1]  ( .D(\i_tv80_core/n290 ), .CK(clk), .Q(
        \i_tv80_core/RegAddrC [1]) );
  DFF_X1 \i_tv80_core/BusB_reg[0]  ( .D(\i_tv80_core/n2175 ), .CK(clk), .Q(
        \i_tv80_core/BusB [0]), .QN(\i_tv80_core/n1037 ) );
  DFF_X1 \i_tv80_core/BusAck_reg  ( .D(\i_tv80_core/n1376 ), .CK(clk), .QN(
        busak_n) );
  DFF_X1 \i_tv80_core/tstate_reg[1]  ( .D(\i_tv80_core/n1379 ), .CK(clk), .Q(
        tstate[1]), .QN(\i_tv80_core/n154 ) );
  DFF_X1 \i_tv80_core/IntE_FF1_reg  ( .D(\i_tv80_core/n1382 ), .CK(clk), .Q(
        \i_tv80_core/IntE ), .QN(\i_tv80_core/n1232 ) );
  DFF_X1 \i_tv80_core/F_reg[7]  ( .D(\i_tv80_core/n1272 ), .CK(clk), .Q(
        \i_tv80_core/F [7]), .QN(\i_tv80_core/n1200 ) );
  DFF_X1 \i_tv80_core/mcycle_reg[2]  ( .D(\i_tv80_core/n1384 ), .CK(clk), .Q(
        \i_tv80_core/n2178 ), .QN(\i_tv80_core/n1223 ) );
  DFF_X1 \i_tv80_core/INT_s_reg  ( .D(\i_tv80_core/n1386 ), .CK(clk), .QN(
        \i_tv80_core/n1217 ) );
  DFF_X1 \i_tv80_core/BusReq_s_reg  ( .D(\i_tv80_core/n1387 ), .CK(clk), .Q(
        \i_tv80_core/n49 ), .QN(\i_tv80_core/n1216 ) );
  OAI222_X1 \i_tv80_core/i_mcode/U953  ( .A1(\i_tv80_core/i_mcode/n887 ), .A2(
        \i_tv80_core/i_mcode/n181 ), .B1(\i_tv80_core/i_mcode/n886 ), .B2(
        \i_tv80_core/i_mcode/n885 ), .C1(\i_tv80_core/i_mcode/n119 ), .C2(
        \i_tv80_core/i_mcode/n185 ), .ZN(\i_tv80_core/mcycles_d [2]) );
  AOI211_X1 \i_tv80_core/i_mcode/U952  ( .C1(\i_tv80_core/i_mcode/n884 ), .C2(
        \i_tv80_core/i_mcode/n883 ), .A(\i_tv80_core/i_mcode/n882 ), .B(
        \i_tv80_core/i_mcode/n881 ), .ZN(\i_tv80_core/i_mcode/n887 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U951  ( .A1(\i_tv80_core/i_mcode/n123 ), .A2(
        \i_tv80_core/i_mcode/n880 ), .A3(\i_tv80_core/i_mcode/n879 ), .ZN(
        \i_tv80_core/i_mcode/n882 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U950  ( .A1(\i_tv80_core/i_mcode/n878 ), .A2(
        \i_tv80_core/i_mcode/n83 ), .ZN(\i_tv80_core/i_mcode/n883 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U949  ( .B1(\i_tv80_core/i_mcode/n876 ), .B2(
        \i_tv80_core/i_mcode/n185 ), .C1(\i_tv80_core/i_mcode/n875 ), .C2(
        \i_tv80_core/i_mcode/n181 ), .A(\i_tv80_core/i_mcode/n874 ), .ZN(
        \i_tv80_core/mcycles_d [1]) );
  OAI21_X1 \i_tv80_core/i_mcode/U948  ( .B1(\i_tv80_core/i_mcode/n126 ), .B2(
        \i_tv80_core/i_mcode/n873 ), .A(\i_tv80_core/i_mcode/n872 ), .ZN(
        \i_tv80_core/i_mcode/n874 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U947  ( .A1(\i_tv80_core/i_mcode/n871 ), .A2(
        \i_tv80_core/i_mcode/n870 ), .A3(\i_tv80_core/i_mcode/n869 ), .A4(
        \i_tv80_core/i_mcode/n7 ), .ZN(\i_tv80_core/i_mcode/n875 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U946  ( .B1(\i_tv80_core/i_mcode/n77 ), .B2(
        \i_tv80_core/i_mcode/n113 ), .A(\i_tv80_core/i_mcode/n866 ), .ZN(
        \i_tv80_core/i_mcode/n870 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U945  ( .B1(\i_tv80_core/i_mcode/n865 ), .B2(
        \i_tv80_core/i_mcode/n864 ), .A(\i_tv80_core/i_mcode/n863 ), .ZN(
        \i_tv80_core/i_mcode/n866 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U944  ( .A1(\i_tv80_core/i_mcode/n862 ), .A2(
        \i_tv80_core/i_mcode/n861 ), .A3(\i_tv80_core/i_mcode/n128 ), .A4(
        \i_tv80_core/i_mcode/n117 ), .ZN(\i_tv80_core/i_mcode/n871 ) );
  INV_X1 \i_tv80_core/i_mcode/U943  ( .A(\i_tv80_core/i_mcode/n860 ), .ZN(
        \i_tv80_core/i_mcode/n861 ) );
  INV_X1 \i_tv80_core/i_mcode/U942  ( .A(\i_tv80_core/i_mcode/n859 ), .ZN(
        \i_tv80_core/i_mcode/n862 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U941  ( .A1(\i_tv80_core/i_mcode/n858 ), .A2(
        \i_tv80_core/i_mcode/n857 ), .A3(\i_tv80_core/i_mcode/n856 ), .ZN(
        \i_tv80_core/i_mcode/n876 ) );
  OAI222_X1 \i_tv80_core/i_mcode/U940  ( .A1(\i_tv80_core/i_mcode/n122 ), .A2(
        \i_tv80_core/i_mcode/n185 ), .B1(\i_tv80_core/i_mcode/n855 ), .B2(
        \i_tv80_core/i_mcode/n181 ), .C1(\i_tv80_core/i_mcode/n126 ), .C2(
        \i_tv80_core/i_mcode/n854 ), .ZN(\i_tv80_core/mcycles_d [0]) );
  NOR4_X1 \i_tv80_core/i_mcode/U939  ( .A1(\i_tv80_core/i_mcode/n853 ), .A2(
        \i_tv80_core/i_mcode/n852 ), .A3(\i_tv80_core/i_mcode/n851 ), .A4(
        \i_tv80_core/i_mcode/n850 ), .ZN(\i_tv80_core/i_mcode/n855 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U938  ( .A1(\i_tv80_core/i_mcode/n849 ), .A2(
        \i_tv80_core/i_mcode/n848 ), .A3(\i_tv80_core/i_mcode/n115 ), .ZN(
        \i_tv80_core/i_mcode/n852 ) );
  INV_X1 \i_tv80_core/i_mcode/U937  ( .A(\i_tv80_core/i_mcode/n847 ), .ZN(
        \i_tv80_core/i_mcode/n849 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U936  ( .B1(\i_tv80_core/i_mcode/n846 ), .B2(
        \i_tv80_core/i_mcode/n845 ), .C1(\i_tv80_core/i_mcode/n844 ), .C2(
        \i_tv80_core/i_mcode/n843 ), .A(\i_tv80_core/i_mcode/n842 ), .ZN(
        \i_tv80_core/i_mcode/n853 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U935  ( .C1(\i_tv80_core/i_mcode/n841 ), .C2(
        \i_tv80_core/i_mcode/n840 ), .A(\i_tv80_core/i_mcode/n839 ), .B(
        \i_tv80_core/i_mcode/n838 ), .ZN(\i_tv80_core/i_mcode/n842 ) );
  INV_X1 \i_tv80_core/i_mcode/U934  ( .A(\i_tv80_core/i_mcode/n837 ), .ZN(
        \i_tv80_core/i_mcode/n838 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U933  ( .A1(\i_tv80_core/i_mcode/n836 ), .A2(
        \i_tv80_core/i_mcode/n835 ), .ZN(\i_tv80_core/i_mcode/n841 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U932  ( .B1(\i_tv80_core/F [6]), .B2(
        \i_tv80_core/i_mcode/n834 ), .C1(\i_tv80_core/n114 ), .C2(
        \i_tv80_core/i_mcode/n49 ), .A(\i_tv80_core/i_mcode/n6 ), .ZN(
        \i_tv80_core/i_mcode/n844 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U931  ( .A1(\i_tv80_core/i_mcode/n49 ), .A2(
        \i_tv80_core/i_mcode/n832 ), .B1(\i_tv80_core/i_mcode/n834 ), .B2(
        \i_tv80_core/i_mcode/n831 ), .ZN(\i_tv80_core/i_mcode/n846 ) );
  INV_X1 \i_tv80_core/i_mcode/U930  ( .A(\i_tv80_core/F [6]), .ZN(
        \i_tv80_core/i_mcode/n831 ) );
  INV_X1 \i_tv80_core/i_mcode/U929  ( .A(\i_tv80_core/n114 ), .ZN(
        \i_tv80_core/i_mcode/n832 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U928  ( .A1(\i_tv80_core/tstates [2]), .A2(
        \i_tv80_core/i_mcode/n830 ), .ZN(\i_tv80_core/tstates [1]) );
  OAI21_X1 \i_tv80_core/i_mcode/U927  ( .B1(\i_tv80_core/LDSPHL ), .B2(
        \i_tv80_core/i_mcode/n829 ), .A(\i_tv80_core/i_mcode/n828 ), .ZN(
        \i_tv80_core/i_mcode/n830 ) );
  INV_X1 \i_tv80_core/i_mcode/U926  ( .A(\i_tv80_core/i_mcode/n827 ), .ZN(
        \i_tv80_core/i_mcode/n829 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U925  ( .B1(\i_tv80_core/i_mcode/n825 ), .B2(
        \i_tv80_core/i_mcode/n826 ), .A(\i_tv80_core/i_mcode/n824 ), .ZN(
        \i_tv80_core/tstates [0]) );
  NAND2_X1 \i_tv80_core/i_mcode/U924  ( .A1(\i_tv80_core/i_mcode/n164 ), .A2(
        \i_tv80_core/i_mcode/n823 ), .ZN(\i_tv80_core/i_mcode/n825 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U923  ( .A1(\i_tv80_core/i_mcode/n820 ), .A2(
        \i_tv80_core/i_mcode/n821 ), .A3(\i_tv80_core/i_mcode/n822 ), .ZN(
        \i_tv80_core/i_mcode/n823 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U922  ( .A1(\i_tv80_core/i_mcode/n7 ), .A2(
        \i_tv80_core/i_mcode/n148 ), .A3(\i_tv80_core/i_mcode/n819 ), .ZN(
        \i_tv80_core/i_mcode/n820 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U921  ( .C1(\i_tv80_core/i_mcode/n818 ), .C2(
        \i_tv80_core/i_mcode/n160 ), .A(\i_tv80_core/Special_LD [2]), .B(
        \i_tv80_core/i_mcode/n817 ), .ZN(\i_tv80_core/i_mcode/n826 ) );
  INV_X1 \i_tv80_core/i_mcode/U920  ( .A(\i_tv80_core/tstates [2]), .ZN(
        \i_tv80_core/i_mcode/n817 ) );
  INV_X1 \i_tv80_core/i_mcode/U919  ( .A(\i_tv80_core/i_mcode/n816 ), .ZN(
        \i_tv80_core/i_mcode/n818 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U918  ( .A1(\i_tv80_core/i_mcode/n828 ), .A2(
        \i_tv80_core/i_mcode/n81 ), .ZN(\i_tv80_core/tstates [2]) );
  AOI21_X1 \i_tv80_core/i_mcode/U917  ( .B1(\i_tv80_core/i_mcode/n815 ), .B2(
        \i_tv80_core/i_mcode/n814 ), .A(\i_tv80_core/i_mcode/n181 ), .ZN(
        \i_tv80_core/Prefix [1]) );
  NAND2_X1 \i_tv80_core/i_mcode/U916  ( .A1(\i_tv80_core/i_mcode/n813 ), .A2(
        \i_tv80_core/i_mcode/n63 ), .ZN(\i_tv80_core/i_mcode/n815 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U915  ( .A1(\i_tv80_core/i_mcode/n124 ), .A2(
        \i_tv80_core/i_mcode/n159 ), .ZN(\i_tv80_core/Prefix [0]) );
  NAND3_X1 \i_tv80_core/i_mcode/U914  ( .A1(\i_tv80_core/i_mcode/n810 ), .A2(
        \i_tv80_core/i_mcode/n828 ), .A3(\i_tv80_core/i_mcode/n811 ), .ZN(
        \i_tv80_core/Inc_PC ) );
  AOI22_X1 \i_tv80_core/i_mcode/U913  ( .A1(\i_tv80_core/i_mcode/n163 ), .A2(
        \i_tv80_core/i_mcode/n809 ), .B1(\i_tv80_core/i_mcode/n808 ), .B2(
        \i_tv80_core/i_mcode/n807 ), .ZN(\i_tv80_core/i_mcode/n810 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U912  ( .B1(\i_tv80_core/i_mcode/n806 ), .B2(
        \i_tv80_core/i_mcode/n805 ), .C1(\i_tv80_core/i_mcode/n128 ), .C2(
        \i_tv80_core/i_mcode/n47 ), .A(\i_tv80_core/i_mcode/n803 ), .ZN(
        \i_tv80_core/i_mcode/n809 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U911  ( .A1(\i_tv80_core/i_mcode/n801 ), .A2(
        \i_tv80_core/i_mcode/n802 ), .B1(\i_tv80_core/i_mcode/n881 ), .B2(
        \i_tv80_core/i_mcode/n106 ), .ZN(\i_tv80_core/i_mcode/n803 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U910  ( .A1(\i_tv80_core/i_mcode/n799 ), .A2(
        \i_tv80_core/i_mcode/n798 ), .A3(\i_tv80_core/i_mcode/n797 ), .ZN(
        \i_tv80_core/i_mcode/n806 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U909  ( .B1(\i_tv80_core/i_mcode/n872 ), .B2(
        \i_tv80_core/i_mcode/n796 ), .A(\i_tv80_core/i_mcode/n795 ), .ZN(
        \i_tv80_core/i_mcode/n811 ) );
  INV_X1 \i_tv80_core/i_mcode/U908  ( .A(\i_tv80_core/i_mcode/n794 ), .ZN(
        \i_tv80_core/i_mcode/n796 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U907  ( .B1(\i_tv80_core/i_mcode/n793 ), .B2(
        \i_tv80_core/i_mcode/n792 ), .A(\i_tv80_core/i_mcode/n791 ), .ZN(
        \i_tv80_core/Inc_WZ ) );
  NAND3_X1 \i_tv80_core/i_mcode/U906  ( .A1(\i_tv80_core/i_mcode/n851 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .A3(\i_tv80_core/i_mcode/n106 ), .ZN(
        \i_tv80_core/i_mcode/n791 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U905  ( .A1(\i_tv80_core/i_mcode/n779 ), .A2(
        \i_tv80_core/i_mcode/n780 ), .A3(\i_tv80_core/i_mcode/n781 ), .ZN(
        \i_tv80_core/i_mcode/n782 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U904  ( .A1(\i_tv80_core/i_mcode/n21 ), .A2(
        \i_tv80_core/i_mcode/n167 ), .A3(\i_tv80_core/i_mcode/n778 ), .ZN(
        \i_tv80_core/i_mcode/n779 ) );
  INV_X1 \i_tv80_core/i_mcode/U903  ( .A(\i_tv80_core/i_mcode/n777 ), .ZN(
        \i_tv80_core/i_mcode/n778 ) );
  INV_X1 \i_tv80_core/i_mcode/U902  ( .A(\i_tv80_core/i_mcode/n776 ), .ZN(
        \i_tv80_core/i_mcode/n784 ) );
  INV_X1 \i_tv80_core/i_mcode/U901  ( .A(\i_tv80_core/i_mcode/n775 ), .ZN(
        \i_tv80_core/i_mcode/n785 ) );
  INV_X1 \i_tv80_core/i_mcode/U900  ( .A(\i_tv80_core/i_mcode/n787 ), .ZN(
        \i_tv80_core/i_mcode/n789 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U899  ( .A1(\i_tv80_core/i_mcode/n771 ), .A2(
        \i_tv80_core/i_mcode/n54 ), .A3(\i_tv80_core/i_mcode/n81 ), .ZN(
        \i_tv80_core/i_mcode/n772 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U898  ( .C1(\i_tv80_core/i_mcode/n770 ), .C2(
        \i_tv80_core/i_mcode/n769 ), .A(\i_tv80_core/i_mcode/n768 ), .B(
        \i_tv80_core/i_mcode/n59 ), .ZN(\i_tv80_core/i_mcode/n790 ) );
  OAI222_X1 \i_tv80_core/i_mcode/U897  ( .A1(\i_tv80_core/i_mcode/n767 ), .A2(
        \i_tv80_core/i_mcode/n766 ), .B1(\i_tv80_core/i_mcode/n835 ), .B2(
        \i_tv80_core/i_mcode/n765 ), .C1(\i_tv80_core/i_mcode/n764 ), .C2(
        \i_tv80_core/i_mcode/n766 ), .ZN(\i_tv80_core/i_mcode/n769 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U896  ( .A1(\i_tv80_core/i_mcode/n805 ), .A2(
        \i_tv80_core/i_mcode/n763 ), .A3(\i_tv80_core/i_mcode/n54 ), .ZN(
        \i_tv80_core/i_mcode/n770 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U895  ( .C1(\i_tv80_core/i_mcode/n163 ), .C2(
        \i_tv80_core/i_mcode/n759 ), .A(\i_tv80_core/i_mcode/n757 ), .B(
        \i_tv80_core/i_mcode/n758 ), .ZN(\i_tv80_core/i_mcode/n760 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U894  ( .C1(\i_tv80_core/i_mcode/n756 ), .C2(
        \i_tv80_core/i_mcode/n755 ), .A(\i_tv80_core/i_mcode/n23 ), .B(
        \i_tv80_core/i_mcode/n180 ), .ZN(\i_tv80_core/i_mcode/n757 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U893  ( .A1(\i_tv80_core/i_mcode/n753 ), .A2(
        \i_tv80_core/i_mcode/n168 ), .A3(\i_tv80_core/i_mcode/n752 ), .A4(
        \i_tv80_core/i_mcode/n68 ), .ZN(\i_tv80_core/i_mcode/n756 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U892  ( .A1(\i_tv80_core/i_mcode/n309 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .A3(\i_tv80_core/i_mcode/n99 ), .ZN(
        \i_tv80_core/i_mcode/n752 ) );
  INV_X1 \i_tv80_core/i_mcode/U891  ( .A(\i_tv80_core/i_mcode/n750 ), .ZN(
        \i_tv80_core/i_mcode/n753 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U890  ( .A1(\i_tv80_core/i_mcode/n747 ), .A2(
        \i_tv80_core/i_mcode/n748 ), .A3(\i_tv80_core/i_mcode/n749 ), .ZN(
        \i_tv80_core/i_mcode/n758 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U889  ( .A1(\i_tv80_core/i_mcode/n746 ), .A2(
        \i_tv80_core/i_mcode/n745 ), .A3(\i_tv80_core/i_mcode/n807 ), .ZN(
        \i_tv80_core/i_mcode/n747 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U888  ( .A1(\i_tv80_core/i_mcode/n744 ), .A2(
        \i_tv80_core/i_mcode/n743 ), .A3(\i_tv80_core/i_mcode/n742 ), .ZN(
        \i_tv80_core/i_mcode/n746 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U887  ( .A1(\i_tv80_core/i_mcode/n186 ), .A2(
        \i_tv80_core/i_mcode/n804 ), .B1(\i_tv80_core/i_mcode/n54 ), .B2(
        \i_tv80_core/i_mcode/n80 ), .ZN(\i_tv80_core/i_mcode/n741 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U886  ( .A1(\i_tv80_core/i_mcode/n740 ), .A2(
        \i_tv80_core/i_mcode/n160 ), .A3(\i_tv80_core/i_mcode/n96 ), .ZN(
        \i_tv80_core/i_mcode/n749 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U885  ( .B1(\i_tv80_core/i_mcode/n867 ), .B2(
        \i_tv80_core/i_mcode/n56 ), .A(\i_tv80_core/i_mcode/n771 ), .ZN(
        \i_tv80_core/i_mcode/n740 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U884  ( .A1(\i_tv80_core/i_mcode/n154 ), .A2(
        \i_tv80_core/i_mcode/n168 ), .ZN(\i_tv80_core/i_mcode/n771 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U883  ( .A1(\i_tv80_core/i_mcode/n738 ), .A2(
        \i_tv80_core/i_mcode/n737 ), .A3(\i_tv80_core/i_mcode/n736 ), .ZN(
        \i_tv80_core/i_mcode/n759 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U882  ( .A1(\i_tv80_core/i_mcode/n802 ), .A2(
        \i_tv80_core/i_mcode/n101 ), .A3(\i_tv80_core/i_mcode/n75 ), .ZN(
        \i_tv80_core/i_mcode/n736 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U881  ( .A1(\i_tv80_core/i_mcode/n802 ), .A2(
        \i_tv80_core/i_mcode/n734 ), .A3(\i_tv80_core/i_mcode/n158 ), .ZN(
        \i_tv80_core/i_mcode/n737 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U880  ( .A1(\i_tv80_core/i_mcode/n143 ), .A2(
        \i_tv80_core/i_mcode/n85 ), .A3(\i_tv80_core/i_mcode/n733 ), .A4(
        \i_tv80_core/i_mcode/n162 ), .ZN(\i_tv80_core/i_mcode/n738 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U879  ( .B1(\i_tv80_core/i_mcode/n729 ), .B2(
        \i_tv80_core/i_mcode/n728 ), .C1(\i_tv80_core/i_mcode/n727 ), .C2(
        \i_tv80_core/i_mcode/n726 ), .A(\i_tv80_core/i_mcode/n725 ), .ZN(
        \i_tv80_core/i_mcode/n730 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U878  ( .C1(\i_tv80_core/i_mcode/n764 ), .C2(
        \i_tv80_core/i_mcode/n767 ), .A(\i_tv80_core/i_mcode/n766 ), .B(
        \i_tv80_core/i_mcode/n724 ), .ZN(\i_tv80_core/i_mcode/n725 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U877  ( .A1(\i_tv80_core/i_mcode/n723 ), .A2(
        \i_tv80_core/i_mcode/n722 ), .ZN(\i_tv80_core/i_mcode/n726 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U876  ( .C1(\i_tv80_core/i_mcode/n721 ), .C2(
        \i_tv80_core/i_mcode/n162 ), .A(\i_tv80_core/i_mcode/n720 ), .B(
        \i_tv80_core/i_mcode/n719 ), .ZN(\i_tv80_core/i_mcode/n731 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U875  ( .C1(\i_tv80_core/i_mcode/n47 ), .C2(
        \i_tv80_core/i_mcode/n718 ), .A(\i_tv80_core/i_mcode/n717 ), .B(
        \i_tv80_core/i_mcode/n716 ), .ZN(\i_tv80_core/i_mcode/n719 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U874  ( .A1(\i_tv80_core/i_mcode/n63 ), .A2(
        \i_tv80_core/i_mcode/n173 ), .A3(\i_tv80_core/i_mcode/n68 ), .ZN(
        \i_tv80_core/i_mcode/n716 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U873  ( .A1(\i_tv80_core/i_mcode/n802 ), .A2(
        \i_tv80_core/i_mcode/n733 ), .A3(\i_tv80_core/i_mcode/n715 ), .ZN(
        \i_tv80_core/i_mcode/n717 ) );
  INV_X1 \i_tv80_core/i_mcode/U872  ( .A(\i_tv80_core/i_mcode/n112 ), .ZN(
        \i_tv80_core/i_mcode/n721 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U871  ( .A1(\i_tv80_core/i_mcode/n713 ), .A2(
        \i_tv80_core/i_mcode/n159 ), .ZN(\i_tv80_core/i_mcode/n728 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U870  ( .A1(\i_tv80_core/i_mcode/n712 ), .A2(
        \i_tv80_core/i_mcode/n711 ), .ZN(\i_tv80_core/i_mcode/n827 ) );
  INV_X1 \i_tv80_core/i_mcode/U869  ( .A(\i_tv80_core/i_mcode/n710 ), .ZN(
        \i_tv80_core/i_mcode/n712 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U868  ( .B1(\i_tv80_core/i_mcode/n103 ), .B2(
        \i_tv80_core/i_mcode/n181 ), .A(\i_tv80_core/i_mcode/n709 ), .ZN(
        \i_tv80_core/IncDec_16 [0]) );
  NOR3_X1 \i_tv80_core/i_mcode/U867  ( .A1(\i_tv80_core/i_mcode/n708 ), .A2(
        \i_tv80_core/i_mcode/n707 ), .A3(\i_tv80_core/i_mcode/n720 ), .ZN(
        \i_tv80_core/i_mcode/n709 ) );
  OAI33_X1 \i_tv80_core/i_mcode/U866  ( .A1(\i_tv80_core/i_mcode/n159 ), .A2(
        \i_tv80_core/i_mcode/n706 ), .A3(\i_tv80_core/i_mcode/n879 ), .B1(
        \i_tv80_core/i_mcode/n766 ), .B2(\i_tv80_core/i_mcode/n724 ), .B3(
        \i_tv80_core/i_mcode/n835 ), .ZN(\i_tv80_core/i_mcode/n707 ) );
  INV_X1 \i_tv80_core/i_mcode/U865  ( .A(\i_tv80_core/i_mcode/n713 ), .ZN(
        \i_tv80_core/i_mcode/n720 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U864  ( .A1(\i_tv80_core/i_mcode/n807 ), .A2(
        \i_tv80_core/i_mcode/n745 ), .A3(\i_tv80_core/i_mcode/n705 ), .ZN(
        \i_tv80_core/i_mcode/n713 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U863  ( .A1(\i_tv80_core/i_mcode/n742 ), .A2(
        \i_tv80_core/i_mcode/n744 ), .A3(\i_tv80_core/i_mcode/n743 ), .ZN(
        \i_tv80_core/i_mcode/n705 ) );
  INV_X1 \i_tv80_core/i_mcode/U862  ( .A(\i_tv80_core/i_mcode/n765 ), .ZN(
        \i_tv80_core/i_mcode/n807 ) );
  OAI33_X1 \i_tv80_core/i_mcode/U861  ( .A1(\i_tv80_core/i_mcode/n704 ), .A2(
        \i_tv80_core/i_mcode/n710 ), .A3(\i_tv80_core/i_mcode/n169 ), .B1(
        \i_tv80_core/i_mcode/n107 ), .B2(\i_tv80_core/i_mcode/n181 ), .B3(
        \i_tv80_core/i_mcode/n47 ), .ZN(\i_tv80_core/i_mcode/n708 ) );
  INV_X1 \i_tv80_core/i_mcode/U860  ( .A(\i_tv80_core/i_mcode/n711 ), .ZN(
        \i_tv80_core/i_mcode/n704 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U859  ( .A1(\i_tv80_core/i_mcode/n164 ), .A2(
        \i_tv80_core/i_mcode/n754 ), .ZN(\i_tv80_core/i_mcode/n710 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U858  ( .A1(\i_tv80_core/i_mcode/n700 ), .A2(
        \i_tv80_core/i_mcode/n699 ), .ZN(\i_tv80_core/i_mcode/n754 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U857  ( .A1(\i_tv80_core/i_mcode/n762 ), .A2(
        \i_tv80_core/i_mcode/n761 ), .ZN(\i_tv80_core/i_mcode/n729 ) );
  INV_X1 \i_tv80_core/i_mcode/U856  ( .A(\i_tv80_core/i_mcode/n689 ), .ZN(
        \i_tv80_core/i_mcode/n761 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U855  ( .C1(\i_tv80_core/i_mcode/n776 ), .C2(
        \i_tv80_core/i_mcode/n688 ), .A(\i_tv80_core/i_mcode/n777 ), .B(
        \i_tv80_core/i_mcode/n687 ), .ZN(\i_tv80_core/i_mcode/n689 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U854  ( .A1(\i_tv80_core/i_mcode/n96 ), .A2(
        \i_tv80_core/i_mcode/n733 ), .ZN(\i_tv80_core/i_mcode/n776 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U853  ( .A1(\i_tv80_core/i_mcode/n683 ), .A2(
        \i_tv80_core/i_mcode/n682 ), .A3(\i_tv80_core/i_mcode/n681 ), .ZN(
        \i_tv80_core/Read_To_Reg ) );
  NOR3_X1 \i_tv80_core/i_mcode/U852  ( .A1(\i_tv80_core/i_mcode/n678 ), .A2(
        \i_tv80_core/i_mcode/n679 ), .A3(\i_tv80_core/i_mcode/n680 ), .ZN(
        \i_tv80_core/i_mcode/n681 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U851  ( .C1(\i_tv80_core/i_mcode/n677 ), .C2(
        \i_tv80_core/i_mcode/n676 ), .A(\i_tv80_core/i_mcode/n675 ), .B(
        \i_tv80_core/i_mcode/n674 ), .ZN(\i_tv80_core/Read_To_Acc ) );
  NAND3_X1 \i_tv80_core/i_mcode/U850  ( .A1(\i_tv80_core/i_mcode/n673 ), .A2(
        \i_tv80_core/i_mcode/n40 ), .A3(\i_tv80_core/i_mcode/n672 ), .ZN(
        \i_tv80_core/i_mcode/n675 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U849  ( .A1(\i_tv80_core/i_mcode/n671 ), .A2(
        \i_tv80_core/i_mcode/n106 ), .B1(\i_tv80_core/i_mcode/n670 ), .B2(
        \i_tv80_core/i_mcode/n669 ), .ZN(\i_tv80_core/i_mcode/n677 ) );
  INV_X1 \i_tv80_core/i_mcode/U848  ( .A(\i_tv80_core/i_mcode/n668 ), .ZN(
        \i_tv80_core/i_mcode/n671 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U847  ( .B1(\i_tv80_core/i_mcode/n667 ), .B2(
        \i_tv80_core/i_mcode/n666 ), .A(\i_tv80_core/i_mcode/n674 ), .ZN(
        \i_tv80_core/Set_BusA_To [3]) );
  NAND4_X1 \i_tv80_core/i_mcode/U846  ( .A1(\i_tv80_core/i_mcode/n662 ), .A2(
        \i_tv80_core/i_mcode/n664 ), .A3(\i_tv80_core/i_mcode/n663 ), .A4(
        \i_tv80_core/i_mcode/n665 ), .ZN(\i_tv80_core/N1102 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U845  ( .B1(\i_tv80_core/i_mcode/n872 ), .B2(
        \i_tv80_core/i_mcode/n58 ), .C1(\i_tv80_core/i_mcode/n168 ), .C2(
        \i_tv80_core/i_mcode/n661 ), .A(\i_tv80_core/i_mcode/n660 ), .ZN(
        \i_tv80_core/i_mcode/n662 ) );
  INV_X1 \i_tv80_core/i_mcode/U844  ( .A(\i_tv80_core/i_mcode/n683 ), .ZN(
        \i_tv80_core/i_mcode/n660 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U843  ( .B1(\i_tv80_core/i_mcode/n659 ), .B2(
        \i_tv80_core/i_mcode/n658 ), .A(\i_tv80_core/i_mcode/n163 ), .ZN(
        \i_tv80_core/i_mcode/n683 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U842  ( .B1(\i_tv80_core/i_mcode/n805 ), .B2(
        \i_tv80_core/i_mcode/n83 ), .A(\i_tv80_core/i_mcode/n879 ), .ZN(
        \i_tv80_core/i_mcode/n658 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U841  ( .A1(\i_tv80_core/i_mcode/n657 ), .A2(
        \i_tv80_core/i_mcode/n656 ), .A3(\i_tv80_core/i_mcode/n676 ), .ZN(
        \i_tv80_core/i_mcode/n659 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U840  ( .B1(\i_tv80_core/i_mcode/n655 ), .B2(
        \i_tv80_core/i_mcode/n667 ), .C1(\i_tv80_core/i_mcode/n885 ), .C2(
        \i_tv80_core/i_mcode/n654 ), .A(\i_tv80_core/i_mcode/n31 ), .ZN(
        \i_tv80_core/i_mcode/n661 ) );
  INV_X1 \i_tv80_core/i_mcode/U839  ( .A(\i_tv80_core/i_mcode/n652 ), .ZN(
        \i_tv80_core/i_mcode/n667 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U838  ( .B1(\i_tv80_core/i_mcode/n651 ), .B2(
        \i_tv80_core/i_mcode/n182 ), .A(\i_tv80_core/i_mcode/n650 ), .ZN(
        \i_tv80_core/i_mcode/n652 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U837  ( .A1(\i_tv80_core/i_mcode/n649 ), .A2(
        \i_tv80_core/i_mcode/n162 ), .B1(\i_tv80_core/i_mcode/n839 ), .B2(
        \i_tv80_core/i_mcode/n836 ), .ZN(\i_tv80_core/i_mcode/n651 ) );
  INV_X1 \i_tv80_core/i_mcode/U836  ( .A(\i_tv80_core/i_mcode/n648 ), .ZN(
        \i_tv80_core/i_mcode/n665 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U835  ( .C1(\i_tv80_core/i_mcode/n647 ), .C2(
        \i_tv80_core/i_mcode/n169 ), .A(\i_tv80_core/i_mcode/n646 ), .B(
        \i_tv80_core/i_mcode/n645 ), .ZN(\i_tv80_core/Set_BusA_To [1]) );
  AOI21_X1 \i_tv80_core/i_mcode/U834  ( .B1(\i_tv80_core/i_mcode/n872 ), .B2(
        \i_tv80_core/i_mcode/n95 ), .A(\i_tv80_core/i_mcode/n644 ), .ZN(
        \i_tv80_core/i_mcode/n645 ) );
  INV_X1 \i_tv80_core/i_mcode/U833  ( .A(\i_tv80_core/i_mcode/n643 ), .ZN(
        \i_tv80_core/i_mcode/n644 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U832  ( .C1(\i_tv80_core/i_mcode/n679 ), .C2(
        \i_tv80_core/i_mcode/n666 ), .A(\i_tv80_core/i_mcode/n642 ), .B(
        \i_tv80_core/i_mcode/n653 ), .ZN(\i_tv80_core/i_mcode/n647 ) );
  INV_X1 \i_tv80_core/i_mcode/U831  ( .A(\i_tv80_core/i_mcode/n682 ), .ZN(
        \i_tv80_core/i_mcode/n642 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U830  ( .A1(\i_tv80_core/i_mcode/n839 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .A3(\i_tv80_core/i_mcode/n162 ), .ZN(
        \i_tv80_core/i_mcode/n682 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U829  ( .A1(\i_tv80_core/i_mcode/n650 ), .A2(
        \i_tv80_core/i_mcode/n641 ), .ZN(\i_tv80_core/i_mcode/n679 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U828  ( .A1(\i_tv80_core/i_mcode/n649 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .A3(\i_tv80_core/i_mcode/n802 ), .ZN(
        \i_tv80_core/i_mcode/n641 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U827  ( .A1(\i_tv80_core/i_mcode/n640 ), .A2(
        \i_tv80_core/i_mcode/n639 ), .A3(\i_tv80_core/i_mcode/n638 ), .ZN(
        \i_tv80_core/i_mcode/n650 ) );
  INV_X1 \i_tv80_core/i_mcode/U826  ( .A(\i_tv80_core/i_mcode/n637 ), .ZN(
        \i_tv80_core/i_mcode/n638 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U825  ( .A1(\i_tv80_core/i_mcode/n636 ), .A2(
        \i_tv80_core/i_mcode/n635 ), .ZN(\i_tv80_core/Set_BusA_To [0]) );
  OAI22_X1 \i_tv80_core/i_mcode/U824  ( .A1(\i_tv80_core/i_mcode/n632 ), .A2(
        \i_tv80_core/i_mcode/n854 ), .B1(\i_tv80_core/i_mcode/n631 ), .B2(
        \i_tv80_core/i_mcode/n630 ), .ZN(\i_tv80_core/i_mcode/n633 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U823  ( .A1(\i_tv80_core/i_mcode/n629 ), .A2(
        \i_tv80_core/i_mcode/n628 ), .ZN(\i_tv80_core/i_mcode/n653 ) );
  INV_X1 \i_tv80_core/i_mcode/U822  ( .A(\i_tv80_core/i_mcode/n680 ), .ZN(
        \i_tv80_core/i_mcode/n629 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U821  ( .B1(\i_tv80_core/i_mcode/n627 ), .B2(
        \i_tv80_core/i_mcode/n182 ), .A(\i_tv80_core/i_mcode/n626 ), .ZN(
        \i_tv80_core/i_mcode/n680 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U820  ( .A1(\i_tv80_core/i_mcode/n625 ), .A2(
        \i_tv80_core/i_mcode/n161 ), .A3(\i_tv80_core/i_mcode/n836 ), .A4(
        \i_tv80_core/i_mcode/n624 ), .ZN(\i_tv80_core/i_mcode/n626 ) );
  INV_X1 \i_tv80_core/i_mcode/U819  ( .A(\i_tv80_core/i_mcode/n623 ), .ZN(
        \i_tv80_core/i_mcode/n625 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U818  ( .B1(\i_tv80_core/i_mcode/n836 ), .B2(
        \i_tv80_core/i_mcode/n622 ), .A(\i_tv80_core/i_mcode/n621 ), .ZN(
        \i_tv80_core/i_mcode/n627 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U817  ( .A1(\i_tv80_core/i_mcode/n620 ), .A2(
        \i_tv80_core/i_mcode/n619 ), .A3(\i_tv80_core/i_mcode/n618 ), .A4(
        \i_tv80_core/i_mcode/n617 ), .ZN(\i_tv80_core/i_mcode/n622 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U816  ( .A1(\i_tv80_core/i_mcode/n616 ), .A2(
        \i_tv80_core/i_mcode/n879 ), .A3(\i_tv80_core/i_mcode/n615 ), .ZN(
        \i_tv80_core/i_mcode/n634 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U815  ( .B1(\i_tv80_core/i_mcode/n649 ), .B2(
        \i_tv80_core/i_mcode/n666 ), .A(\i_tv80_core/i_mcode/n839 ), .ZN(
        \i_tv80_core/i_mcode/n615 ) );
  INV_X1 \i_tv80_core/i_mcode/U814  ( .A(\i_tv80_core/i_mcode/n614 ), .ZN(
        \i_tv80_core/i_mcode/n649 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U813  ( .A1(\i_tv80_core/i_mcode/n613 ), .A2(
        \i_tv80_core/i_mcode/n612 ), .A3(\i_tv80_core/i_mcode/n611 ), .A4(
        \i_tv80_core/i_mcode/n648 ), .ZN(\i_tv80_core/i_mcode/n636 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U812  ( .A1(\i_tv80_core/i_mcode/n643 ), .A2(
        \i_tv80_core/i_mcode/n610 ), .ZN(\i_tv80_core/i_mcode/n648 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U811  ( .A1(\i_tv80_core/i_mcode/n164 ), .A2(
        \i_tv80_core/i_mcode/n609 ), .ZN(\i_tv80_core/i_mcode/n643 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U810  ( .A1(\i_tv80_core/i_mcode/n637 ), .A2(
        \i_tv80_core/i_mcode/n608 ), .A3(\i_tv80_core/i_mcode/n607 ), .ZN(
        \i_tv80_core/i_mcode/n611 ) );
  MUX2_X1 \i_tv80_core/i_mcode/U809  ( .A(\i_tv80_core/i_mcode/n83 ), .B(
        \i_tv80_core/i_mcode/n606 ), .S(\i_tv80_core/i_mcode/n655 ), .Z(
        \i_tv80_core/i_mcode/n607 ) );
  INV_X1 \i_tv80_core/i_mcode/U808  ( .A(\i_tv80_core/i_mcode/n18 ), .ZN(
        \i_tv80_core/i_mcode/n608 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U807  ( .A1(\i_tv80_core/i_mcode/n672 ), .A2(
        \i_tv80_core/i_mcode/n161 ), .ZN(\i_tv80_core/i_mcode/n637 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U806  ( .A1(\i_tv80_core/i_mcode/n656 ), .A2(
        \i_tv80_core/i_mcode/n83 ), .A3(\i_tv80_core/i_mcode/n159 ), .A4(
        \i_tv80_core/i_mcode/n676 ), .ZN(\i_tv80_core/i_mcode/n613 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U805  ( .A1(\i_tv80_core/i_mcode/n605 ), .A2(
        \i_tv80_core/i_mcode/n604 ), .ZN(\i_tv80_core/Set_BusB_To [3]) );
  AOI22_X1 \i_tv80_core/i_mcode/U804  ( .A1(\i_tv80_core/i_mcode/n161 ), .A2(
        \i_tv80_core/i_mcode/n603 ), .B1(\i_tv80_core/i_mcode/n164 ), .B2(
        \i_tv80_core/i_mcode/n602 ), .ZN(\i_tv80_core/i_mcode/n605 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U803  ( .C1(\i_tv80_core/i_mcode/n601 ), .C2(
        \i_tv80_core/i_mcode/n666 ), .A(\i_tv80_core/i_mcode/n600 ), .B(
        \i_tv80_core/i_mcode/n599 ), .ZN(\i_tv80_core/i_mcode/n602 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U802  ( .B1(\i_tv80_core/i_mcode/n14 ), .B2(
        \i_tv80_core/i_mcode/n836 ), .A(\i_tv80_core/i_mcode/n597 ), .ZN(
        \i_tv80_core/i_mcode/n601 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U801  ( .B1(\i_tv80_core/i_mcode/n596 ), .B2(
        \i_tv80_core/i_mcode/n666 ), .C1(\i_tv80_core/i_mcode/n624 ), .C2(
        \i_tv80_core/i_mcode/n595 ), .A(\i_tv80_core/i_mcode/n594 ), .ZN(
        \i_tv80_core/i_mcode/n603 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U800  ( .B1(\i_tv80_core/i_mcode/n593 ), .B2(
        \i_tv80_core/i_mcode/n592 ), .A(\i_tv80_core/i_mcode/n591 ), .ZN(
        \i_tv80_core/i_mcode/n596 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U799  ( .A1(\i_tv80_core/i_mcode/n646 ), .A2(
        \i_tv80_core/i_mcode/n590 ), .A3(\i_tv80_core/i_mcode/n589 ), .A4(
        \i_tv80_core/i_mcode/n588 ), .ZN(\i_tv80_core/N1107 ) );
  AOI222_X1 \i_tv80_core/i_mcode/U798  ( .A1(\i_tv80_core/i_mcode/n727 ), .A2(
        \i_tv80_core/i_mcode/n587 ), .B1(\i_tv80_core/i_mcode/n58 ), .B2(
        \i_tv80_core/i_mcode/n586 ), .C1(\i_tv80_core/i_mcode/n585 ), .C2(
        \i_tv80_core/i_mcode/n164 ), .ZN(\i_tv80_core/i_mcode/n588 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U797  ( .A1(\i_tv80_core/i_mcode/n584 ), .A2(
        \i_tv80_core/i_mcode/n600 ), .A3(\i_tv80_core/i_mcode/n583 ), .A4(
        \i_tv80_core/i_mcode/n582 ), .ZN(\i_tv80_core/i_mcode/n585 ) );
  AOI222_X1 \i_tv80_core/i_mcode/U796  ( .A1(\i_tv80_core/i_mcode/n581 ), .A2(
        \i_tv80_core/i_mcode/n106 ), .B1(\i_tv80_core/i_mcode/n580 ), .B2(
        \i_tv80_core/i_mcode/n592 ), .C1(\i_tv80_core/i_mcode/n579 ), .C2(
        \i_tv80_core/i_mcode/n58 ), .ZN(\i_tv80_core/i_mcode/n582 ) );
  INV_X1 \i_tv80_core/i_mcode/U795  ( .A(\i_tv80_core/i_mcode/n578 ), .ZN(
        \i_tv80_core/i_mcode/n580 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U794  ( .B1(\i_tv80_core/i_mcode/n577 ), .B2(
        \i_tv80_core/i_mcode/n576 ), .A(\i_tv80_core/i_mcode/n168 ), .ZN(
        \i_tv80_core/i_mcode/n583 ) );
  INV_X1 \i_tv80_core/i_mcode/U793  ( .A(\i_tv80_core/i_mcode/n575 ), .ZN(
        \i_tv80_core/i_mcode/n576 ) );
  INV_X1 \i_tv80_core/i_mcode/U792  ( .A(\i_tv80_core/i_mcode/n574 ), .ZN(
        \i_tv80_core/i_mcode/n577 ) );
  INV_X1 \i_tv80_core/i_mcode/U791  ( .A(\i_tv80_core/i_mcode/n573 ), .ZN(
        \i_tv80_core/i_mcode/n600 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U790  ( .C1(\i_tv80_core/i_mcode/n706 ), .C2(
        \i_tv80_core/i_mcode/n886 ), .A(\i_tv80_core/i_mcode/n45 ), .B(
        \i_tv80_core/i_mcode/n572 ), .ZN(\i_tv80_core/i_mcode/n573 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U789  ( .B1(\i_tv80_core/i_mcode/n96 ), .B2(
        \i_tv80_core/i_mcode/n571 ), .A(\i_tv80_core/i_mcode/n570 ), .ZN(
        \i_tv80_core/i_mcode/n572 ) );
  INV_X1 \i_tv80_core/i_mcode/U788  ( .A(\i_tv80_core/i_mcode/n781 ), .ZN(
        \i_tv80_core/i_mcode/n570 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U787  ( .A1(\i_tv80_core/i_mcode/n106 ), .A2(
        \i_tv80_core/i_mcode/n569 ), .A3(\i_tv80_core/i_mcode/n733 ), .ZN(
        \i_tv80_core/i_mcode/n781 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U786  ( .A1(\i_tv80_core/i_mcode/n868 ), .A2(
        \i_tv80_core/i_mcode/n67 ), .A3(\i_tv80_core/i_mcode/n101 ), .A4(
        \i_tv80_core/i_mcode/n565 ), .ZN(\i_tv80_core/i_mcode/n567 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U785  ( .A1(\i_tv80_core/n2179 ), .A2(
        \i_tv80_core/n2180 ), .A3(\i_tv80_core/i_mcode/n564 ), .ZN(
        \i_tv80_core/i_mcode/n568 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U784  ( .B1(\i_tv80_core/i_mcode/n581 ), .B2(
        \i_tv80_core/i_mcode/n563 ), .A(\i_tv80_core/i_mcode/n670 ), .ZN(
        \i_tv80_core/i_mcode/n589 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U783  ( .A1(\i_tv80_core/i_mcode/n821 ), .A2(
        \i_tv80_core/i_mcode/n732 ), .A3(\i_tv80_core/i_mcode/n655 ), .ZN(
        \i_tv80_core/i_mcode/n563 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U782  ( .A1(\i_tv80_core/i_mcode/n161 ), .A2(
        \i_tv80_core/i_mcode/n168 ), .A3(\i_tv80_core/i_mcode/n562 ), .ZN(
        \i_tv80_core/i_mcode/n590 ) );
  INV_X1 \i_tv80_core/i_mcode/U781  ( .A(\i_tv80_core/i_mcode/n561 ), .ZN(
        \i_tv80_core/i_mcode/n646 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U780  ( .A1(\i_tv80_core/i_mcode/n560 ), .A2(
        \i_tv80_core/i_mcode/n604 ), .B1(\i_tv80_core/i_mcode/n559 ), .B2(
        \i_tv80_core/i_mcode/n44 ), .ZN(\i_tv80_core/Set_BusB_To [1]) );
  INV_X1 \i_tv80_core/i_mcode/U779  ( .A(\i_tv80_core/i_mcode/n586 ), .ZN(
        \i_tv80_core/i_mcode/n559 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U778  ( .B1(\i_tv80_core/i_mcode/n164 ), .B2(
        \i_tv80_core/i_mcode/n557 ), .C1(\i_tv80_core/i_mcode/n160 ), .C2(
        \i_tv80_core/i_mcode/n556 ), .A(\i_tv80_core/i_mcode/n561 ), .ZN(
        \i_tv80_core/i_mcode/n560 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U777  ( .A1(\i_tv80_core/i_mcode/n610 ), .A2(
        \i_tv80_core/i_mcode/n674 ), .ZN(\i_tv80_core/i_mcode/n561 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U776  ( .A1(\i_tv80_core/i_mcode/n160 ), .A2(
        \i_tv80_core/i_mcode/n555 ), .ZN(\i_tv80_core/i_mcode/n610 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U775  ( .A1(\i_tv80_core/i_mcode/n116 ), .A2(
        \i_tv80_core/i_mcode/n805 ), .B1(\i_tv80_core/i_mcode/n554 ), .B2(
        \i_tv80_core/i_mcode/n706 ), .ZN(\i_tv80_core/i_mcode/n555 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U774  ( .A1(\i_tv80_core/i_mcode/n553 ), .A2(
        \i_tv80_core/i_mcode/n552 ), .B1(\i_tv80_core/i_mcode/n551 ), .B2(
        \i_tv80_core/i_mcode/n169 ), .ZN(\i_tv80_core/i_mcode/n556 ) );
  INV_X1 \i_tv80_core/i_mcode/U773  ( .A(\i_tv80_core/i_mcode/n562 ), .ZN(
        \i_tv80_core/i_mcode/n551 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U772  ( .C1(\i_tv80_core/i_mcode/n550 ), .C2(
        \i_tv80_core/i_mcode/n549 ), .A(\i_tv80_core/i_mcode/n548 ), .B(
        \i_tv80_core/i_mcode/n595 ), .ZN(\i_tv80_core/i_mcode/n562 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U771  ( .A1(\i_tv80_core/i_mcode/n593 ), .A2(
        \i_tv80_core/i_mcode/n666 ), .A3(\i_tv80_core/i_mcode/n592 ), .ZN(
        \i_tv80_core/i_mcode/n548 ) );
  INV_X1 \i_tv80_core/i_mcode/U770  ( .A(\i_tv80_core/i_mcode/n547 ), .ZN(
        \i_tv80_core/i_mcode/n593 ) );
  INV_X1 \i_tv80_core/i_mcode/U769  ( .A(\i_tv80_core/i_mcode/n546 ), .ZN(
        \i_tv80_core/i_mcode/n550 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U768  ( .A1(\i_tv80_core/i_mcode/n584 ), .A2(
        \i_tv80_core/i_mcode/n599 ), .A3(\i_tv80_core/i_mcode/n545 ), .ZN(
        \i_tv80_core/i_mcode/n557 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U767  ( .A1(\i_tv80_core/i_mcode/n176 ), .A2(
        \i_tv80_core/i_mcode/n544 ), .B1(\i_tv80_core/i_mcode/n95 ), .B2(
        \i_tv80_core/i_mcode/n579 ), .ZN(\i_tv80_core/i_mcode/n545 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U766  ( .A1(\i_tv80_core/i_mcode/n575 ), .A2(
        \i_tv80_core/i_mcode/n69 ), .ZN(\i_tv80_core/i_mcode/n544 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U765  ( .A1(\i_tv80_core/i_mcode/n598 ), .A2(
        \i_tv80_core/i_mcode/n96 ), .ZN(\i_tv80_core/i_mcode/n780 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U764  ( .A1(\i_tv80_core/i_mcode/n543 ), .A2(
        \i_tv80_core/i_mcode/n162 ), .ZN(\i_tv80_core/i_mcode/n575 ) );
  INV_X1 \i_tv80_core/i_mcode/U763  ( .A(\i_tv80_core/i_mcode/n542 ), .ZN(
        \i_tv80_core/i_mcode/n543 ) );
  INV_X1 \i_tv80_core/i_mcode/U762  ( .A(\i_tv80_core/i_mcode/n541 ), .ZN(
        \i_tv80_core/i_mcode/n584 ) );
  NAND2_X2 \i_tv80_core/i_mcode/U761  ( .A1(\i_tv80_core/i_mcode/n540 ), .A2(
        \i_tv80_core/i_mcode/n539 ), .ZN(\i_tv80_core/Set_BusB_To [0]) );
  NAND2_X1 \i_tv80_core/i_mcode/U760  ( .A1(\i_tv80_core/i_mcode/n538 ), .A2(
        \i_tv80_core/i_mcode/n854 ), .ZN(\i_tv80_core/i_mcode/n586 ) );
  INV_X1 \i_tv80_core/i_mcode/U759  ( .A(\i_tv80_core/i_mcode/n604 ), .ZN(
        \i_tv80_core/i_mcode/n538 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U758  ( .B1(\i_tv80_core/i_mcode/n528 ), .B2(
        \i_tv80_core/i_mcode/n696 ), .A(\i_tv80_core/i_mcode/n822 ), .ZN(
        \i_tv80_core/i_mcode/n571 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U757  ( .A1(\i_tv80_core/i_mcode/n9 ), .A2(
        \i_tv80_core/i_mcode/n134 ), .A3(\i_tv80_core/i_mcode/n526 ), .ZN(
        \i_tv80_core/i_mcode/n579 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U756  ( .A1(\i_tv80_core/i_mcode/n525 ), .A2(
        \i_tv80_core/i_mcode/n529 ), .B1(\i_tv80_core/i_mcode/n524 ), .B2(
        \i_tv80_core/i_mcode/n836 ), .ZN(\i_tv80_core/i_mcode/n526 ) );
  INV_X1 \i_tv80_core/i_mcode/U755  ( .A(\i_tv80_core/i_mcode/n523 ), .ZN(
        \i_tv80_core/i_mcode/n525 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U754  ( .A1(\i_tv80_core/i_mcode/n598 ), .A2(
        \i_tv80_core/i_mcode/n529 ), .ZN(\i_tv80_core/i_mcode/n574 ) );
  INV_X1 \i_tv80_core/i_mcode/U753  ( .A(\i_tv80_core/i_mcode/n821 ), .ZN(
        \i_tv80_core/i_mcode/n598 ) );
  OAI222_X1 \i_tv80_core/i_mcode/U752  ( .A1(\i_tv80_core/i_mcode/n706 ), .A2(
        \i_tv80_core/i_mcode/n522 ), .B1(\i_tv80_core/i_mcode/n81 ), .B2(
        \i_tv80_core/i_mcode/n521 ), .C1(\i_tv80_core/i_mcode/n805 ), .C2(
        \i_tv80_core/i_mcode/n520 ), .ZN(\i_tv80_core/i_mcode/n541 ) );
  INV_X1 \i_tv80_core/i_mcode/U751  ( .A(\i_tv80_core/i_mcode/n518 ), .ZN(
        \i_tv80_core/i_mcode/n670 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U750  ( .A1(\i_tv80_core/i_mcode/n869 ), .A2(
        \i_tv80_core/i_mcode/n517 ), .ZN(\i_tv80_core/i_mcode/n542 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U749  ( .A1(\i_tv80_core/i_mcode/n516 ), .A2(
        \i_tv80_core/i_mcode/n515 ), .A3(\i_tv80_core/i_mcode/n514 ), .ZN(
        \i_tv80_core/i_mcode/n517 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U748  ( .A1(\i_tv80_core/i_mcode/n880 ), .A2(
        \i_tv80_core/i_mcode/n886 ), .A3(\i_tv80_core/i_mcode/n578 ), .ZN(
        \i_tv80_core/i_mcode/n512 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U747  ( .A1(\i_tv80_core/i_mcode/n865 ), .A2(
        \i_tv80_core/i_mcode/n884 ), .ZN(\i_tv80_core/i_mcode/n886 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U746  ( .A1(\i_tv80_core/i_mcode/n505 ), .A2(
        \i_tv80_core/i_mcode/n529 ), .ZN(\i_tv80_core/i_mcode/n595 ) );
  INV_X1 \i_tv80_core/i_mcode/U745  ( .A(\i_tv80_core/i_mcode/n504 ), .ZN(
        \i_tv80_core/i_mcode/n505 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U744  ( .A1(\i_tv80_core/i_mcode/n19 ), .A2(
        \i_tv80_core/i_mcode/n84 ), .ZN(\i_tv80_core/i_mcode/n546 ) );
  MUX2_X1 \i_tv80_core/i_mcode/U743  ( .A(\i_tv80_core/i_mcode/n706 ), .B(
        \i_tv80_core/i_mcode/n83 ), .S(\i_tv80_core/i_mcode/n655 ), .Z(
        \i_tv80_core/i_mcode/n503 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U742  ( .A1(\i_tv80_core/i_mcode/n502 ), .A2(
        \i_tv80_core/i_mcode/n828 ), .ZN(\i_tv80_core/i_mcode/n604 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U741  ( .B1(\i_tv80_core/i_mcode/n501 ), .B2(
        \i_tv80_core/i_mcode/n854 ), .C1(\i_tv80_core/i_mcode/n500 ), .C2(
        \i_tv80_core/i_mcode/n181 ), .A(\i_tv80_core/i_mcode/n499 ), .ZN(
        \i_tv80_core/ALU_Op [3]) );
  OAI221_X1 \i_tv80_core/i_mcode/U740  ( .B1(\i_tv80_core/i_mcode/n498 ), .B2(
        \i_tv80_core/i_mcode/n732 ), .C1(\i_tv80_core/i_mcode/n182 ), .C2(
        \i_tv80_core/i_mcode/n497 ), .A(\i_tv80_core/i_mcode/n496 ), .ZN(
        \i_tv80_core/ALU_Op [2]) );
  AOI221_X1 \i_tv80_core/i_mcode/U739  ( .B1(\i_tv80_core/i_mcode/n872 ), .B2(
        \i_tv80_core/i_mcode/n495 ), .C1(\i_tv80_core/i_mcode/n118 ), .C2(
        \i_tv80_core/i_mcode/n47 ), .A(\i_tv80_core/i_mcode/n494 ), .ZN(
        \i_tv80_core/i_mcode/n498 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U738  ( .B1(\i_tv80_core/i_mcode/n529 ), .B2(
        \i_tv80_core/i_mcode/n17 ), .A(\i_tv80_core/i_mcode/n493 ), .ZN(
        \i_tv80_core/i_mcode/n495 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U737  ( .B1(\i_tv80_core/i_mcode/n491 ), .B2(
        \i_tv80_core/i_mcode/n185 ), .C1(\i_tv80_core/i_mcode/n766 ), .C2(
        \i_tv80_core/i_mcode/n490 ), .A(\i_tv80_core/i_mcode/n489 ), .ZN(
        \i_tv80_core/ALU_Op [1]) );
  AOI221_X1 \i_tv80_core/i_mcode/U736  ( .B1(\i_tv80_core/i_mcode/n872 ), .B2(
        \i_tv80_core/i_mcode/n488 ), .C1(\i_tv80_core/i_mcode/n163 ), .C2(
        \i_tv80_core/i_mcode/n487 ), .A(\i_tv80_core/i_mcode/n486 ), .ZN(
        \i_tv80_core/i_mcode/n489 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U735  ( .A1(\i_tv80_core/i_mcode/n485 ), .A2(
        \i_tv80_core/i_mcode/n179 ), .B1(\i_tv80_core/i_mcode/n137 ), .B2(
        \i_tv80_core/i_mcode/n169 ), .ZN(\i_tv80_core/i_mcode/n487 ) );
  INV_X1 \i_tv80_core/i_mcode/U734  ( .A(\i_tv80_core/i_mcode/n484 ), .ZN(
        \i_tv80_core/i_mcode/n485 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U733  ( .A1(\i_tv80_core/i_mcode/n121 ), .A2(
        \i_tv80_core/i_mcode/n482 ), .A3(\i_tv80_core/i_mcode/n477 ), .ZN(
        \i_tv80_core/i_mcode/n478 ) );
  INV_X1 \i_tv80_core/i_mcode/U732  ( .A(\i_tv80_core/i_mcode/n476 ), .ZN(
        \i_tv80_core/i_mcode/n481 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U731  ( .A1(\i_tv80_core/i_mcode/n594 ), .A2(
        \i_tv80_core/i_mcode/n508 ), .ZN(\i_tv80_core/i_mcode/n473 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U730  ( .A1(\i_tv80_core/i_mcode/n802 ), .A2(
        \i_tv80_core/i_mcode/n553 ), .A3(\i_tv80_core/i_mcode/n472 ), .ZN(
        \i_tv80_core/i_mcode/n474 ) );
  INV_X1 \i_tv80_core/i_mcode/U729  ( .A(\i_tv80_core/i_mcode/n471 ), .ZN(
        \i_tv80_core/i_mcode/n472 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U728  ( .A1(\i_tv80_core/i_mcode/n470 ), .A2(
        \i_tv80_core/i_mcode/n47 ), .ZN(\i_tv80_core/i_mcode/n475 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U727  ( .B1(\i_tv80_core/i_mcode/n469 ), .B2(
        \i_tv80_core/i_mcode/n67 ), .C1(\i_tv80_core/i_mcode/n885 ), .C2(
        \i_tv80_core/i_mcode/n616 ), .A(\i_tv80_core/i_mcode/n468 ), .ZN(
        \i_tv80_core/ALU_Op [0]) );
  AOI211_X1 \i_tv80_core/i_mcode/U726  ( .C1(\i_tv80_core/i_mcode/n872 ), .C2(
        \i_tv80_core/i_mcode/n467 ), .A(\i_tv80_core/i_mcode/n466 ), .B(
        \i_tv80_core/i_mcode/n486 ), .ZN(\i_tv80_core/i_mcode/n468 ) );
  INV_X1 \i_tv80_core/i_mcode/U725  ( .A(\i_tv80_core/i_mcode/n496 ), .ZN(
        \i_tv80_core/i_mcode/n486 ) );
  INV_X1 \i_tv80_core/i_mcode/U724  ( .A(\i_tv80_core/i_mcode/n664 ), .ZN(
        \i_tv80_core/i_mcode/n466 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U723  ( .C1(\i_tv80_core/i_mcode/n81 ), .C2(
        \i_tv80_core/i_mcode/n15 ), .A(\i_tv80_core/i_mcode/n501 ), .B(
        \i_tv80_core/i_mcode/n464 ), .ZN(\i_tv80_core/i_mcode/n467 ) );
  INV_X1 \i_tv80_core/i_mcode/U722  ( .A(\i_tv80_core/i_mcode/n463 ), .ZN(
        \i_tv80_core/i_mcode/n501 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U721  ( .B1(\i_tv80_core/i_mcode/n462 ), .B2(
        \i_tv80_core/i_mcode/n81 ), .A(\i_tv80_core/i_mcode/n461 ), .ZN(
        \i_tv80_core/i_mcode/n463 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U720  ( .C1(\i_tv80_core/i_mcode/n872 ), .C2(
        \i_tv80_core/i_mcode/n460 ), .A(\i_tv80_core/i_mcode/n118 ), .B(
        \i_tv80_core/i_mcode/n494 ), .ZN(\i_tv80_core/i_mcode/n469 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U719  ( .A1(\i_tv80_core/i_mcode/n137 ), .A2(
        \i_tv80_core/i_mcode/n181 ), .B1(\i_tv80_core/i_mcode/n459 ), .B2(
        \i_tv80_core/i_mcode/n185 ), .ZN(\i_tv80_core/i_mcode/n494 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U718  ( .C1(\i_tv80_core/i_mcode/n458 ), .C2(
        \i_tv80_core/i_mcode/n587 ), .A(\i_tv80_core/i_mcode/n457 ), .B(
        \i_tv80_core/i_mcode/n471 ), .ZN(\i_tv80_core/i_mcode/n459 ) );
  OR4_X1 \i_tv80_core/i_mcode/U717  ( .A1(\i_tv80_core/i_mcode/n456 ), .A2(
        \i_tv80_core/i_mcode/n856 ), .A3(\i_tv80_core/i_mcode/n455 ), .A4(
        \i_tv80_core/i_mcode/n454 ), .ZN(\i_tv80_core/i_mcode/n471 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U716  ( .B1(\i_tv80_core/i_mcode/n116 ), .B2(
        \i_tv80_core/i_mcode/n81 ), .C1(\i_tv80_core/i_mcode/n116 ), .C2(
        \i_tv80_core/i_mcode/n453 ), .A(\i_tv80_core/i_mcode/n793 ), .ZN(
        \i_tv80_core/i_mcode/n454 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U715  ( .A1(\i_tv80_core/i_mcode/n450 ), .A2(
        \i_tv80_core/i_mcode/n449 ), .A3(\i_tv80_core/i_mcode/n448 ), .A4(
        \i_tv80_core/i_mcode/n129 ), .ZN(\i_tv80_core/i_mcode/n451 ) );
  INV_X1 \i_tv80_core/i_mcode/U714  ( .A(\i_tv80_core/i_mcode/n447 ), .ZN(
        \i_tv80_core/i_mcode/n448 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U713  ( .A1(\i_tv80_core/i_mcode/n124 ), .A2(
        \i_tv80_core/i_mcode/n446 ), .A3(\i_tv80_core/i_mcode/n445 ), .ZN(
        \i_tv80_core/i_mcode/n449 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U712  ( .A1(\i_tv80_core/i_mcode/n443 ), .A2(
        \i_tv80_core/i_mcode/n444 ), .A3(\i_tv80_core/i_mcode/n442 ), .A4(
        \i_tv80_core/i_mcode/n441 ), .ZN(\i_tv80_core/i_mcode/n450 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U711  ( .A1(\i_tv80_core/i_mcode/n440 ), .A2(
        \i_tv80_core/i_mcode/n439 ), .A3(\i_tv80_core/i_mcode/n799 ), .A4(
        \i_tv80_core/i_mcode/n438 ), .ZN(\i_tv80_core/i_mcode/n452 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U710  ( .A1(\i_tv80_core/i_mcode/n437 ), .A2(
        \i_tv80_core/i_mcode/n123 ), .A3(\i_tv80_core/i_mcode/n117 ), .ZN(
        \i_tv80_core/i_mcode/n439 ) );
  INV_X1 \i_tv80_core/i_mcode/U709  ( .A(\i_tv80_core/i_mcode/n434 ), .ZN(
        \i_tv80_core/i_mcode/n436 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U708  ( .A1(\i_tv80_core/i_mcode/n9 ), .A2(
        \i_tv80_core/i_mcode/n128 ), .A3(\i_tv80_core/i_mcode/n433 ), .ZN(
        \i_tv80_core/i_mcode/n440 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U707  ( .A1(\i_tv80_core/i_mcode/n850 ), .A2(
        \i_tv80_core/i_mcode/n152 ), .B1(\i_tv80_core/i_mcode/n869 ), .B2(
        \i_tv80_core/i_mcode/n47 ), .ZN(\i_tv80_core/i_mcode/n433 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U706  ( .A1(\i_tv80_core/i_mcode/n493 ), .A2(
        \i_tv80_core/i_mcode/n15 ), .A3(\i_tv80_core/i_mcode/n431 ), .A4(
        \i_tv80_core/i_mcode/n462 ), .ZN(\i_tv80_core/i_mcode/n460 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U705  ( .B1(\i_tv80_core/i_mcode/n430 ), .B2(
        \i_tv80_core/i_mcode/n429 ), .A(\i_tv80_core/i_mcode/n81 ), .ZN(
        \i_tv80_core/i_mcode/n431 ) );
  INV_X1 \i_tv80_core/i_mcode/U704  ( .A(\i_tv80_core/i_mcode/n428 ), .ZN(
        \i_tv80_core/i_mcode/n430 ) );
  INV_X1 \i_tv80_core/i_mcode/U703  ( .A(\i_tv80_core/i_mcode/n427 ), .ZN(
        \i_tv80_core/i_mcode/n493 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U702  ( .B1(\i_tv80_core/i_mcode/n426 ), .B2(
        \i_tv80_core/i_mcode/n425 ), .A(\i_tv80_core/i_mcode/n477 ), .ZN(
        \i_tv80_core/i_mcode/n427 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U701  ( .A1(\i_tv80_core/i_mcode/n126 ), .A2(
        \i_tv80_core/i_mcode/n805 ), .ZN(\i_tv80_core/i_mcode/n477 ) );
  INV_X1 \i_tv80_core/i_mcode/U700  ( .A(\i_tv80_core/i_mcode/n480 ), .ZN(
        \i_tv80_core/i_mcode/n425 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U699  ( .A1(\i_tv80_core/i_mcode/n706 ), .A2(
        \i_tv80_core/i_mcode/n564 ), .A3(\i_tv80_core/i_mcode/n424 ), .A4(
        \i_tv80_core/i_mcode/n81 ), .ZN(\i_tv80_core/i_mcode/n480 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U698  ( .A1(\i_tv80_core/i_mcode/n423 ), .A2(
        \i_tv80_core/i_mcode/n496 ), .A3(\i_tv80_core/i_mcode/n674 ), .ZN(
        \i_tv80_core/Save_ALU ) );
  NAND2_X1 \i_tv80_core/i_mcode/U697  ( .A1(\i_tv80_core/i_mcode/n422 ), .A2(
        \i_tv80_core/i_mcode/n161 ), .ZN(\i_tv80_core/i_mcode/n674 ) );
  INV_X1 \i_tv80_core/i_mcode/U696  ( .A(\i_tv80_core/i_mcode/n678 ), .ZN(
        \i_tv80_core/i_mcode/n423 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U695  ( .A1(\i_tv80_core/i_mcode/n499 ), .A2(
        \i_tv80_core/i_mcode/n664 ), .A3(\i_tv80_core/i_mcode/n421 ), .ZN(
        \i_tv80_core/i_mcode/n678 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U694  ( .B1(\i_tv80_core/i_mcode/n163 ), .B2(
        \i_tv80_core/i_mcode/n420 ), .A(\i_tv80_core/i_mcode/n419 ), .ZN(
        \i_tv80_core/i_mcode/n421 ) );
  INV_X1 \i_tv80_core/i_mcode/U693  ( .A(\i_tv80_core/i_mcode/n594 ), .ZN(
        \i_tv80_core/i_mcode/n419 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U692  ( .A1(\i_tv80_core/i_mcode/n529 ), .A2(
        \i_tv80_core/i_mcode/n587 ), .ZN(\i_tv80_core/i_mcode/n594 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U691  ( .A1(\i_tv80_core/i_mcode/n418 ), .A2(
        \i_tv80_core/i_mcode/n599 ), .A3(\i_tv80_core/i_mcode/n417 ), .ZN(
        \i_tv80_core/i_mcode/n420 ) );
  INV_X1 \i_tv80_core/i_mcode/U690  ( .A(\i_tv80_core/i_mcode/n416 ), .ZN(
        \i_tv80_core/i_mcode/n599 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U689  ( .B1(\i_tv80_core/i_mcode/n81 ), .B2(
        \i_tv80_core/i_mcode/n415 ), .A(\i_tv80_core/i_mcode/n414 ), .ZN(
        \i_tv80_core/i_mcode/n416 ) );
  INV_X1 \i_tv80_core/i_mcode/U688  ( .A(\i_tv80_core/i_mcode/n413 ), .ZN(
        \i_tv80_core/i_mcode/n414 ) );
  INV_X1 \i_tv80_core/i_mcode/U687  ( .A(\i_tv80_core/i_mcode/n609 ), .ZN(
        \i_tv80_core/i_mcode/n418 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U686  ( .A1(\i_tv80_core/i_mcode/n34 ), .A2(
        \i_tv80_core/i_mcode/n500 ), .ZN(\i_tv80_core/i_mcode/n609 ) );
  INV_X1 \i_tv80_core/i_mcode/U685  ( .A(\i_tv80_core/i_mcode/n412 ), .ZN(
        \i_tv80_core/i_mcode/n500 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U684  ( .A1(\i_tv80_core/i_mcode/n410 ), .A2(
        \i_tv80_core/i_mcode/n836 ), .ZN(\i_tv80_core/i_mcode/n464 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U683  ( .A1(\i_tv80_core/i_mcode/n836 ), .A2(
        \i_tv80_core/i_mcode/n733 ), .A3(\i_tv80_core/i_mcode/n409 ), .ZN(
        \i_tv80_core/i_mcode/n411 ) );
  INV_X1 \i_tv80_core/i_mcode/U682  ( .A(\i_tv80_core/i_mcode/n408 ), .ZN(
        \i_tv80_core/i_mcode/n499 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U681  ( .A1(\i_tv80_core/i_mcode/n554 ), .A2(
        \i_tv80_core/i_mcode/n766 ), .B1(\i_tv80_core/i_mcode/n407 ), .B2(
        \i_tv80_core/i_mcode/n854 ), .ZN(\i_tv80_core/i_mcode/n408 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U680  ( .A1(\i_tv80_core/i_mcode/n529 ), .A2(
        \i_tv80_core/i_mcode/n406 ), .B1(\i_tv80_core/i_mcode/n836 ), .B2(
        \i_tv80_core/i_mcode/n873 ), .ZN(\i_tv80_core/i_mcode/n407 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U679  ( .A1(\i_tv80_core/i_mcode/n41 ), .A2(
        \i_tv80_core/i_mcode/n121 ), .ZN(\i_tv80_core/i_mcode/n406 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U678  ( .A1(\i_tv80_core/i_mcode/n628 ), .A2(
        \i_tv80_core/i_mcode/n496 ), .ZN(\i_tv80_core/PreserveC ) );
  NAND2_X1 \i_tv80_core/i_mcode/U677  ( .A1(\i_tv80_core/i_mcode/n120 ), .A2(
        \i_tv80_core/i_mcode/n836 ), .ZN(\i_tv80_core/i_mcode/n496 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U676  ( .A1(\i_tv80_core/i_mcode/n164 ), .A2(
        \i_tv80_core/i_mcode/n413 ), .ZN(\i_tv80_core/i_mcode/n628 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U675  ( .B1(\i_tv80_core/i_mcode/n805 ), .B2(
        \i_tv80_core/i_mcode/n404 ), .A(\i_tv80_core/i_mcode/n403 ), .ZN(
        \i_tv80_core/i_mcode/n413 ) );
  INV_X1 \i_tv80_core/i_mcode/U674  ( .A(\i_tv80_core/i_mcode/n402 ), .ZN(
        \i_tv80_core/i_mcode/n403 ) );
  INV_X1 \i_tv80_core/i_mcode/U673  ( .A(\i_tv80_core/i_mcode/n663 ), .ZN(
        \i_tv80_core/Arith16 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U672  ( .A1(\i_tv80_core/i_mcode/n401 ), .A2(
        \i_tv80_core/i_mcode/n144 ), .ZN(\i_tv80_core/Set_Addr_To [2]) );
  NAND4_X1 \i_tv80_core/i_mcode/U671  ( .A1(\i_tv80_core/i_mcode/n399 ), .A2(
        \i_tv80_core/i_mcode/n828 ), .A3(\i_tv80_core/i_mcode/n400 ), .A4(
        \i_tv80_core/i_mcode/n398 ), .ZN(\i_tv80_core/i_mcode/n401 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U670  ( .A1(\i_tv80_core/i_mcode/n397 ), .A2(
        \i_tv80_core/i_mcode/n396 ), .A3(\i_tv80_core/i_mcode/n395 ), .ZN(
        \i_tv80_core/i_mcode/n398 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U669  ( .C1(\i_tv80_core/i_mcode/n524 ), .C2(
        \i_tv80_core/i_mcode/n805 ), .A(\i_tv80_core/i_mcode/n839 ), .B(
        \i_tv80_core/i_mcode/n394 ), .ZN(\i_tv80_core/i_mcode/n395 ) );
  INV_X1 \i_tv80_core/i_mcode/U668  ( .A(\i_tv80_core/i_mcode/n654 ), .ZN(
        \i_tv80_core/i_mcode/n839 ) );
  INV_X1 \i_tv80_core/i_mcode/U667  ( .A(\i_tv80_core/i_mcode/n393 ), .ZN(
        \i_tv80_core/i_mcode/n396 ) );
  INV_X1 \i_tv80_core/i_mcode/U666  ( .A(\i_tv80_core/i_mcode/n390 ), .ZN(
        \i_tv80_core/i_mcode/n391 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U665  ( .B1(\i_tv80_core/i_mcode/n389 ), .B2(
        \i_tv80_core/i_mcode/n185 ), .A(\i_tv80_core/i_mcode/n159 ), .ZN(
        \i_tv80_core/i_mcode/n399 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U664  ( .B1(\i_tv80_core/i_mcode/n388 ), .B2(
        \i_tv80_core/i_mcode/n387 ), .C1(\i_tv80_core/i_mcode/n386 ), .C2(
        \i_tv80_core/i_mcode/n458 ), .A(\i_tv80_core/i_mcode/n385 ), .ZN(
        \i_tv80_core/i_mcode/n389 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U663  ( .A1(\i_tv80_core/i_mcode/n122 ), .A2(
        \i_tv80_core/i_mcode/n384 ), .ZN(\i_tv80_core/i_mcode/n385 ) );
  INV_X1 \i_tv80_core/i_mcode/U662  ( .A(\i_tv80_core/i_mcode/n383 ), .ZN(
        \i_tv80_core/i_mcode/n384 ) );
  INV_X1 \i_tv80_core/i_mcode/U661  ( .A(\i_tv80_core/i_mcode/n508 ), .ZN(
        \i_tv80_core/i_mcode/n422 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U660  ( .B1(\i_tv80_core/i_mcode/n382 ), .B2(
        \i_tv80_core/i_mcode/n182 ), .A(\i_tv80_core/i_mcode/n381 ), .ZN(
        \i_tv80_core/Set_Addr_To [1]) );
  AOI211_X1 \i_tv80_core/i_mcode/U659  ( .C1(\i_tv80_core/i_mcode/n161 ), .C2(
        \i_tv80_core/i_mcode/n380 ), .A(\i_tv80_core/i_mcode/n872 ), .B(
        \i_tv80_core/i_mcode/n379 ), .ZN(\i_tv80_core/i_mcode/n381 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U658  ( .A1(\i_tv80_core/i_mcode/n378 ), .A2(
        \i_tv80_core/i_mcode/n377 ), .A3(\i_tv80_core/i_mcode/n376 ), .A4(
        \i_tv80_core/i_mcode/n375 ), .ZN(\i_tv80_core/i_mcode/n379 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U657  ( .B1(\i_tv80_core/i_mcode/n374 ), .B2(
        \i_tv80_core/i_mcode/n373 ), .C1(\i_tv80_core/i_mcode/n394 ), .C2(
        \i_tv80_core/i_mcode/n805 ), .A(\i_tv80_core/i_mcode/n125 ), .ZN(
        \i_tv80_core/i_mcode/n375 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U656  ( .A1(\i_tv80_core/i_mcode/n372 ), .A2(
        \i_tv80_core/i_mcode/n864 ), .B1(\i_tv80_core/i_mcode/n881 ), .B2(
        \i_tv80_core/i_mcode/n173 ), .ZN(\i_tv80_core/i_mcode/n376 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U655  ( .B1(\i_tv80_core/i_mcode/n371 ), .B2(
        \i_tv80_core/i_mcode/n640 ), .A(\i_tv80_core/i_mcode/n2 ), .ZN(
        \i_tv80_core/i_mcode/n377 ) );
  INV_X1 \i_tv80_core/i_mcode/U654  ( .A(\i_tv80_core/i_mcode/n527 ), .ZN(
        \i_tv80_core/i_mcode/n371 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U653  ( .B1(\i_tv80_core/i_mcode/n860 ), .B2(
        \i_tv80_core/i_mcode/n702 ), .A(\i_tv80_core/i_mcode/n370 ), .ZN(
        \i_tv80_core/i_mcode/n378 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U652  ( .B1(\i_tv80_core/i_mcode/n143 ), .B2(
        \i_tv80_core/i_mcode/n138 ), .A(\i_tv80_core/i_mcode/n75 ), .ZN(
        \i_tv80_core/i_mcode/n718 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U651  ( .B1(\i_tv80_core/i_mcode/n369 ), .B2(
        \i_tv80_core/i_mcode/n368 ), .A(\i_tv80_core/i_mcode/n367 ), .ZN(
        \i_tv80_core/i_mcode/n860 ) );
  INV_X1 \i_tv80_core/i_mcode/U650  ( .A(\i_tv80_core/i_mcode/n854 ), .ZN(
        \i_tv80_core/i_mcode/n872 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U649  ( .A1(\i_tv80_core/i_mcode/n135 ), .A2(
        \i_tv80_core/i_mcode/n793 ), .A3(\i_tv80_core/i_mcode/n366 ), .A4(
        \i_tv80_core/i_mcode/n365 ), .ZN(\i_tv80_core/i_mcode/n380 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U648  ( .C1(\i_tv80_core/i_mcode/n529 ), .C2(
        \i_tv80_core/i_mcode/n364 ), .A(\i_tv80_core/i_mcode/n363 ), .B(
        \i_tv80_core/i_mcode/n386 ), .ZN(\i_tv80_core/i_mcode/n365 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U647  ( .B1(\i_tv80_core/i_mcode/n805 ), .B2(
        \i_tv80_core/i_mcode/n362 ), .A(\i_tv80_core/i_mcode/n361 ), .ZN(
        \i_tv80_core/i_mcode/n363 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U646  ( .A1(\i_tv80_core/i_mcode/n722 ), .A2(
        \i_tv80_core/i_mcode/n816 ), .ZN(\i_tv80_core/i_mcode/n364 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U645  ( .A1(\i_tv80_core/i_mcode/n360 ), .A2(
        \i_tv80_core/i_mcode/n457 ), .A3(\i_tv80_core/i_mcode/n370 ), .ZN(
        \i_tv80_core/i_mcode/n366 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U644  ( .A1(\i_tv80_core/i_mcode/n359 ), .A2(
        \i_tv80_core/i_mcode/n847 ), .A3(\i_tv80_core/i_mcode/n859 ), .A4(
        \i_tv80_core/i_mcode/n358 ), .ZN(\i_tv80_core/i_mcode/n382 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U643  ( .A1(\i_tv80_core/i_mcode/n837 ), .A2(
        \i_tv80_core/i_mcode/n357 ), .A3(\i_tv80_core/i_mcode/n390 ), .A4(
        \i_tv80_core/i_mcode/n356 ), .ZN(\i_tv80_core/i_mcode/n358 ) );
  INV_X1 \i_tv80_core/i_mcode/U642  ( .A(\i_tv80_core/i_mcode/n392 ), .ZN(
        \i_tv80_core/i_mcode/n356 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U641  ( .A1(\i_tv80_core/i_mcode/n355 ), .A2(
        \i_tv80_core/i_mcode/n123 ), .ZN(\i_tv80_core/i_mcode/n392 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U640  ( .A1(\i_tv80_core/i_mcode/n354 ), .A2(
        \i_tv80_core/i_mcode/n864 ), .ZN(\i_tv80_core/i_mcode/n390 ) );
  INV_X1 \i_tv80_core/i_mcode/U639  ( .A(\i_tv80_core/i_mcode/n353 ), .ZN(
        \i_tv80_core/i_mcode/n354 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U638  ( .A1(\i_tv80_core/i_mcode/n114 ), .A2(
        \i_tv80_core/i_mcode/n437 ), .A3(\i_tv80_core/i_mcode/n352 ), .A4(
        \i_tv80_core/i_mcode/n404 ), .ZN(\i_tv80_core/i_mcode/n859 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U637  ( .A1(\i_tv80_core/i_mcode/n351 ), .A2(
        \i_tv80_core/i_mcode/n884 ), .A3(\i_tv80_core/i_mcode/n53 ), .ZN(
        \i_tv80_core/i_mcode/n352 ) );
  INV_X1 \i_tv80_core/i_mcode/U636  ( .A(\i_tv80_core/i_mcode/n350 ), .ZN(
        \i_tv80_core/i_mcode/n884 ) );
  INV_X1 \i_tv80_core/i_mcode/U635  ( .A(\i_tv80_core/i_mcode/n349 ), .ZN(
        \i_tv80_core/i_mcode/n437 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U634  ( .A1(\i_tv80_core/i_mcode/n348 ), .A2(
        \i_tv80_core/i_mcode/n92 ), .A3(\i_tv80_core/i_mcode/n347 ), .ZN(
        \i_tv80_core/i_mcode/n359 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U633  ( .A1(\i_tv80_core/i_mcode/n351 ), .A2(
        \i_tv80_core/i_mcode/n152 ), .A3(\i_tv80_core/i_mcode/n863 ), .ZN(
        \i_tv80_core/i_mcode/n347 ) );
  INV_X1 \i_tv80_core/i_mcode/U632  ( .A(\i_tv80_core/i_mcode/n346 ), .ZN(
        \i_tv80_core/i_mcode/n863 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U631  ( .B1(\i_tv80_core/i_mcode/n144 ), .B2(
        \i_tv80_core/i_mcode/n345 ), .A(\i_tv80_core/i_mcode/n344 ), .ZN(
        \i_tv80_core/Set_Addr_To [0]) );
  NAND2_X1 \i_tv80_core/i_mcode/U630  ( .A1(\i_tv80_core/i_mcode/n343 ), .A2(
        \i_tv80_core/i_mcode/n828 ), .ZN(\i_tv80_core/i_mcode/n345 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U629  ( .A1(\i_tv80_core/i_mcode/n342 ), .A2(
        \i_tv80_core/i_mcode/n181 ), .B1(\i_tv80_core/i_mcode/n341 ), .B2(
        \i_tv80_core/i_mcode/n185 ), .ZN(\i_tv80_core/i_mcode/n343 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U628  ( .A1(\i_tv80_core/i_mcode/n360 ), .A2(
        \i_tv80_core/i_mcode/n383 ), .A3(\i_tv80_core/i_mcode/n455 ), .A4(
        \i_tv80_core/i_mcode/n340 ), .ZN(\i_tv80_core/i_mcode/n341 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U627  ( .A1(\i_tv80_core/i_mcode/n135 ), .A2(
        \i_tv80_core/i_mcode/n339 ), .ZN(\i_tv80_core/i_mcode/n455 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U626  ( .B1(\i_tv80_core/i_mcode/n554 ), .B2(
        \i_tv80_core/i_mcode/n336 ), .A(\i_tv80_core/i_mcode/n361 ), .ZN(
        \i_tv80_core/i_mcode/n383 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U625  ( .A1(\i_tv80_core/i_mcode/n864 ), .A2(
        \i_tv80_core/i_mcode/n856 ), .ZN(\i_tv80_core/i_mcode/n361 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U624  ( .B1(\i_tv80_core/i_mcode/n335 ), .B2(
        \i_tv80_core/i_mcode/n805 ), .A(\i_tv80_core/i_mcode/n106 ), .ZN(
        \i_tv80_core/i_mcode/n336 ) );
  OAI222_X1 \i_tv80_core/i_mcode/U623  ( .A1(\i_tv80_core/i_mcode/n553 ), .A2(
        \i_tv80_core/i_mcode/n453 ), .B1(\i_tv80_core/i_mcode/n116 ), .B2(
        \i_tv80_core/i_mcode/n334 ), .C1(\i_tv80_core/i_mcode/n878 ), .C2(
        \i_tv80_core/i_mcode/n793 ), .ZN(\i_tv80_core/i_mcode/n340 ) );
  INV_X1 \i_tv80_core/i_mcode/U622  ( .A(\i_tv80_core/i_mcode/n458 ), .ZN(
        \i_tv80_core/i_mcode/n334 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U621  ( .A1(\i_tv80_core/i_mcode/n453 ), .A2(
        \i_tv80_core/i_mcode/n805 ), .ZN(\i_tv80_core/i_mcode/n458 ) );
  INV_X1 \i_tv80_core/i_mcode/U620  ( .A(\i_tv80_core/i_mcode/n387 ), .ZN(
        \i_tv80_core/i_mcode/n453 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U619  ( .A1(\i_tv80_core/i_mcode/n335 ), .A2(
        \i_tv80_core/i_mcode/n564 ), .A3(\i_tv80_core/i_mcode/n348 ), .ZN(
        \i_tv80_core/i_mcode/n387 ) );
  MUX2_X1 \i_tv80_core/i_mcode/U618  ( .A(\i_tv80_core/i_mcode/n424 ), .B(
        \i_tv80_core/i_mcode/n110 ), .S(\i_tv80_core/i_mcode/n99 ), .Z(
        \i_tv80_core/i_mcode/n348 ) );
  INV_X1 \i_tv80_core/i_mcode/U617  ( .A(\i_tv80_core/i_mcode/n592 ), .ZN(
        \i_tv80_core/i_mcode/n335 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U616  ( .A1(\i_tv80_core/i_mcode/n847 ), .A2(
        \i_tv80_core/i_mcode/n393 ), .A3(\i_tv80_core/i_mcode/n434 ), .A4(
        \i_tv80_core/i_mcode/n332 ), .ZN(\i_tv80_core/i_mcode/n342 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U615  ( .A1(\i_tv80_core/i_mcode/n329 ), .A2(
        \i_tv80_core/i_mcode/n330 ), .A3(\i_tv80_core/i_mcode/n331 ), .ZN(
        \i_tv80_core/i_mcode/n847 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U614  ( .A1(\i_tv80_core/i_mcode/n328 ), .A2(
        \i_tv80_core/i_mcode/n327 ), .A3(\i_tv80_core/i_mcode/n326 ), .ZN(
        \i_tv80_core/i_mcode/n329 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U613  ( .A1(\i_tv80_core/i_mcode/n124 ), .A2(
        \i_tv80_core/i_mcode/n441 ), .A3(\i_tv80_core/i_mcode/n442 ), .A4(
        \i_tv80_core/i_mcode/n616 ), .ZN(\i_tv80_core/i_mcode/n326 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U612  ( .A1(\i_tv80_core/i_mcode/n325 ), .A2(
        \i_tv80_core/i_mcode/n834 ), .ZN(\i_tv80_core/i_mcode/n442 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U611  ( .A1(\i_tv80_core/i_mcode/n158 ), .A2(
        \i_tv80_core/i_mcode/n673 ), .ZN(\i_tv80_core/i_mcode/n441 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U610  ( .B1(\i_tv80_core/i_mcode/n673 ), .B2(
        \i_tv80_core/i_mcode/n323 ), .A(\i_tv80_core/i_mcode/n813 ), .ZN(
        \i_tv80_core/i_mcode/n814 ) );
  INV_X1 \i_tv80_core/i_mcode/U609  ( .A(\i_tv80_core/i_mcode/n443 ), .ZN(
        \i_tv80_core/i_mcode/n327 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U608  ( .A1(\i_tv80_core/i_mcode/n322 ), .A2(
        \i_tv80_core/i_mcode/n321 ), .ZN(\i_tv80_core/i_mcode/n443 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U607  ( .A1(\i_tv80_core/i_mcode/n320 ), .A2(
        \i_tv80_core/i_mcode/n614 ), .A3(\i_tv80_core/i_mcode/n432 ), .A4(
        \i_tv80_core/i_mcode/n447 ), .ZN(\i_tv80_core/i_mcode/n328 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U606  ( .A1(\i_tv80_core/i_mcode/n319 ), .A2(
        \i_tv80_core/i_mcode/n63 ), .ZN(\i_tv80_core/i_mcode/n447 ) );
  INV_X1 \i_tv80_core/i_mcode/U605  ( .A(\i_tv80_core/i_mcode/n318 ), .ZN(
        \i_tv80_core/i_mcode/n432 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U604  ( .A1(\i_tv80_core/i_mcode/n715 ), .A2(
        \i_tv80_core/i_mcode/n484 ), .ZN(\i_tv80_core/i_mcode/n614 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U603  ( .A1(\i_tv80_core/i_mcode/n36 ), .A2(
        \i_tv80_core/i_mcode/n317 ), .A3(\i_tv80_core/i_mcode/n7 ), .A4(
        \i_tv80_core/i_mcode/n316 ), .ZN(\i_tv80_core/i_mcode/n330 ) );
  INV_X1 \i_tv80_core/i_mcode/U602  ( .A(\i_tv80_core/i_mcode/n444 ), .ZN(
        \i_tv80_core/i_mcode/n316 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U601  ( .A1(\i_tv80_core/i_mcode/n49 ), .A2(
        \i_tv80_core/i_mcode/n4 ), .ZN(\i_tv80_core/i_mcode/n444 ) );
  INV_X1 \i_tv80_core/i_mcode/U600  ( .A(\i_tv80_core/i_mcode/n445 ), .ZN(
        \i_tv80_core/i_mcode/n317 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U599  ( .A1(\i_tv80_core/i_mcode/n129 ), .A2(
        \i_tv80_core/i_mcode/n402 ), .A3(\i_tv80_core/i_mcode/n315 ), .A4(
        \i_tv80_core/i_mcode/n412 ), .ZN(\i_tv80_core/i_mcode/n331 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U598  ( .B1(\i_tv80_core/i_mcode/n30 ), .B2(
        \i_tv80_core/i_mcode/n701 ), .A(\i_tv80_core/i_mcode/n497 ), .ZN(
        \i_tv80_core/i_mcode/n412 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U597  ( .A1(\i_tv80_core/i_mcode/n686 ), .A2(
        \i_tv80_core/i_mcode/n834 ), .ZN(\i_tv80_core/i_mcode/n497 ) );
  INV_X1 \i_tv80_core/i_mcode/U596  ( .A(\i_tv80_core/i_mcode/n669 ), .ZN(
        \i_tv80_core/i_mcode/n701 ) );
  INV_X1 \i_tv80_core/i_mcode/U595  ( .A(\i_tv80_core/i_mcode/n314 ), .ZN(
        \i_tv80_core/i_mcode/n315 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U594  ( .B1(\i_tv80_core/i_mcode/n136 ), .B2(
        \i_tv80_core/i_mcode/n147 ), .A(\i_tv80_core/i_mcode/n313 ), .ZN(
        \i_tv80_core/i_mcode/n402 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U593  ( .B1(\i_tv80_core/i_mcode/n813 ), .B2(
        \i_tv80_core/i_mcode/n150 ), .A(\i_tv80_core/i_mcode/n49 ), .ZN(
        \i_tv80_core/i_mcode/n313 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U592  ( .A1(\i_tv80_core/i_mcode/n355 ), .A2(
        \i_tv80_core/i_mcode/n654 ), .A3(\i_tv80_core/i_mcode/n353 ), .ZN(
        \i_tv80_core/i_mcode/n434 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U591  ( .A1(\i_tv80_core/i_mcode/n6 ), .A2(
        \i_tv80_core/i_mcode/n311 ), .ZN(\i_tv80_core/i_mcode/n353 ) );
  INV_X1 \i_tv80_core/i_mcode/U590  ( .A(\i_tv80_core/i_mcode/n798 ), .ZN(
        \i_tv80_core/i_mcode/n355 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U589  ( .B1(\i_tv80_core/i_mcode/n310 ), .B2(
        \i_tv80_core/i_mcode/n309 ), .A(\i_tv80_core/i_mcode/n620 ), .ZN(
        \i_tv80_core/i_mcode/n798 ) );
  INV_X1 \i_tv80_core/i_mcode/U588  ( .A(\i_tv80_core/i_mcode/n308 ), .ZN(
        \i_tv80_core/i_mcode/n620 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U587  ( .A1(\i_tv80_core/i_mcode/n310 ), .A2(
        \i_tv80_core/i_mcode/n136 ), .B1(\i_tv80_core/i_mcode/n33 ), .B2(
        \i_tv80_core/i_mcode/n619 ), .ZN(\i_tv80_core/i_mcode/n308 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U586  ( .A1(\i_tv80_core/i_mcode/n306 ), .A2(
        \i_tv80_core/i_mcode/n114 ), .A3(\i_tv80_core/i_mcode/n305 ), .ZN(
        \i_tv80_core/i_mcode/n393 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U585  ( .B1(\i_tv80_core/i_mcode/n372 ), .B2(
        \i_tv80_core/i_mcode/n349 ), .A(\i_tv80_core/i_mcode/n864 ), .ZN(
        \i_tv80_core/i_mcode/n305 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U584  ( .A1(\i_tv80_core/i_mcode/n304 ), .A2(
        \i_tv80_core/n2180 ), .ZN(\i_tv80_core/i_mcode/n864 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U583  ( .A1(\i_tv80_core/i_mcode/n618 ), .A2(
        \i_tv80_core/i_mcode/n523 ), .A3(\i_tv80_core/i_mcode/n303 ), .ZN(
        \i_tv80_core/i_mcode/n349 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U582  ( .A1(\i_tv80_core/i_mcode/n302 ), .A2(
        \i_tv80_core/i_mcode/n301 ), .A3(\i_tv80_core/i_mcode/n410 ), .ZN(
        \i_tv80_core/i_mcode/n303 ) );
  INV_X1 \i_tv80_core/i_mcode/U581  ( .A(\i_tv80_core/i_mcode/n300 ), .ZN(
        \i_tv80_core/i_mcode/n410 ) );
  INV_X1 \i_tv80_core/i_mcode/U580  ( .A(\i_tv80_core/i_mcode/n619 ), .ZN(
        \i_tv80_core/i_mcode/n301 ) );
  INV_X1 \i_tv80_core/i_mcode/U579  ( .A(\i_tv80_core/i_mcode/n617 ), .ZN(
        \i_tv80_core/i_mcode/n302 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U578  ( .A1(\i_tv80_core/i_mcode/n299 ), .A2(
        \i_tv80_core/i_mcode/n409 ), .ZN(\i_tv80_core/i_mcode/n617 ) );
  INV_X1 \i_tv80_core/i_mcode/U577  ( .A(\i_tv80_core/i_mcode/n743 ), .ZN(
        \i_tv80_core/i_mcode/n299 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U576  ( .A1(\i_tv80_core/i_mcode/n298 ), .A2(
        \i_tv80_core/i_mcode/n409 ), .ZN(\i_tv80_core/i_mcode/n618 ) );
  INV_X1 \i_tv80_core/i_mcode/U575  ( .A(\i_tv80_core/i_mcode/n744 ), .ZN(
        \i_tv80_core/i_mcode/n298 ) );
  INV_X1 \i_tv80_core/i_mcode/U574  ( .A(\i_tv80_core/i_mcode/n435 ), .ZN(
        \i_tv80_core/i_mcode/n372 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U573  ( .A1(\i_tv80_core/i_mcode/n697 ), .A2(
        \i_tv80_core/i_mcode/n311 ), .ZN(\i_tv80_core/i_mcode/n435 ) );
  INV_X1 \i_tv80_core/i_mcode/U572  ( .A(\i_tv80_core/i_mcode/n438 ), .ZN(
        \i_tv80_core/i_mcode/n306 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U571  ( .C1(\i_tv80_core/i_mcode/n304 ), .C2(
        \i_tv80_core/i_mcode/n404 ), .A(\i_tv80_core/i_mcode/n115 ), .B(
        \i_tv80_core/i_mcode/n837 ), .ZN(\i_tv80_core/i_mcode/n438 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U570  ( .A1(\i_tv80_core/i_mcode/n484 ), .A2(
        \i_tv80_core/i_mcode/n312 ), .ZN(\i_tv80_core/i_mcode/n837 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U569  ( .A1(\i_tv80_core/i_mcode/n125 ), .A2(
        \i_tv80_core/i_mcode/n581 ), .A3(\i_tv80_core/i_mcode/n2 ), .ZN(
        \i_tv80_core/i_mcode/n296 ) );
  INV_X1 \i_tv80_core/i_mcode/U568  ( .A(\i_tv80_core/i_mcode/n295 ), .ZN(
        \i_tv80_core/i_mcode/n367 ) );
  INV_X1 \i_tv80_core/i_mcode/U567  ( .A(\i_tv80_core/i_mcode/n370 ), .ZN(
        \i_tv80_core/i_mcode/n304 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U566  ( .A1(\i_tv80_core/i_mcode/n424 ), .A2(
        \i_tv80_core/i_mcode/n564 ), .A3(\i_tv80_core/i_mcode/n750 ), .ZN(
        \i_tv80_core/i_mcode/n370 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U565  ( .A1(\i_tv80_core/n2179 ), .A2(
        \i_tv80_core/n2180 ), .ZN(\i_tv80_core/i_mcode/n750 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U564  ( .A1(\i_tv80_core/i_mcode/n105 ), .A2(
        \i_tv80_core/i_mcode/n110 ), .ZN(\i_tv80_core/i_mcode/n424 ) );
  OAI222_X1 \i_tv80_core/i_mcode/U563  ( .A1(\i_tv80_core/i_mcode/n836 ), .A2(
        \i_tv80_core/i_mcode/n848 ), .B1(\i_tv80_core/i_mcode/n173 ), .B2(
        \i_tv80_core/i_mcode/n293 ), .C1(\i_tv80_core/i_mcode/n878 ), .C2(
        \i_tv80_core/i_mcode/n292 ), .ZN(\i_tv80_core/i_mcode/n332 ) );
  INV_X1 \i_tv80_core/i_mcode/U562  ( .A(\i_tv80_core/i_mcode/n373 ), .ZN(
        \i_tv80_core/i_mcode/n878 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U561  ( .A1(\i_tv80_core/i_mcode/n805 ), .A2(
        \i_tv80_core/i_mcode/n606 ), .A3(\i_tv80_core/i_mcode/n291 ), .ZN(
        \i_tv80_core/i_mcode/n373 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U560  ( .B1(\i_tv80_core/i_mcode/n79 ), .B2(
        \i_tv80_core/i_mcode/n564 ), .A(\i_tv80_core/i_mcode/n47 ), .ZN(
        \i_tv80_core/i_mcode/n291 ) );
  INV_X1 \i_tv80_core/i_mcode/U559  ( .A(\i_tv80_core/i_mcode/n797 ), .ZN(
        \i_tv80_core/i_mcode/n848 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U558  ( .A1(\i_tv80_core/i_mcode/n290 ), .A2(
        \i_tv80_core/i_mcode/n357 ), .ZN(\i_tv80_core/i_mcode/n797 ) );
  INV_X1 \i_tv80_core/i_mcode/U557  ( .A(\i_tv80_core/i_mcode/n828 ), .ZN(
        \i_tv80_core/i_mcode/n824 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U556  ( .A1(\i_tv80_core/i_mcode/n156 ), .A2(
        \i_tv80_core/i_mcode/n105 ), .ZN(\i_tv80_core/i_mcode/n828 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U555  ( .A1(\i_tv80_core/i_mcode/n672 ), .A2(
        \i_tv80_core/i_mcode/n76 ), .ZN(\i_tv80_core/i_mcode/n324 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U554  ( .C1(\i_tv80_core/i_mcode/n552 ), .C2(
        \i_tv80_core/i_mcode/n502 ), .A(\i_tv80_core/i_mcode/n288 ), .B(
        \i_tv80_core/i_mcode/n492 ), .ZN(\i_tv80_core/i_mcode/n289 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U553  ( .A1(\i_tv80_core/i_mcode/n16 ), .A2(
        \i_tv80_core/i_mcode/n121 ), .ZN(\i_tv80_core/i_mcode/n492 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U552  ( .A1(\i_tv80_core/i_mcode/n287 ), .A2(
        \i_tv80_core/i_mcode/n321 ), .ZN(\i_tv80_core/i_mcode/n465 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U551  ( .A1(\i_tv80_core/i_mcode/n733 ), .A2(
        \i_tv80_core/i_mcode/n287 ), .ZN(\i_tv80_core/i_mcode/n428 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U550  ( .A1(\i_tv80_core/i_mcode/n405 ), .A2(
        \i_tv80_core/i_mcode/n462 ), .ZN(\i_tv80_core/i_mcode/n479 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U549  ( .A1(\i_tv80_core/i_mcode/n287 ), .A2(
        \i_tv80_core/i_mcode/n639 ), .ZN(\i_tv80_core/i_mcode/n462 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U548  ( .A1(\i_tv80_core/i_mcode/n286 ), .A2(
        \i_tv80_core/i_mcode/n835 ), .A3(\i_tv80_core/i_mcode/n30 ), .ZN(
        \i_tv80_core/i_mcode/n287 ) );
  INV_X1 \i_tv80_core/i_mcode/U547  ( .A(\i_tv80_core/i_mcode/n285 ), .ZN(
        \i_tv80_core/i_mcode/n286 ) );
  INV_X1 \i_tv80_core/i_mcode/U546  ( .A(\i_tv80_core/i_mcode/n429 ), .ZN(
        \i_tv80_core/i_mcode/n405 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U545  ( .A1(\i_tv80_core/i_mcode/n284 ), .A2(
        \i_tv80_core/i_mcode/n369 ), .A3(\i_tv80_core/i_mcode/n283 ), .A4(
        \i_tv80_core/i_mcode/n445 ), .ZN(\i_tv80_core/i_mcode/n429 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U544  ( .B1(\i_tv80_core/i_mcode/n285 ), .B2(
        \i_tv80_core/i_mcode/n783 ), .A(\i_tv80_core/i_mcode/n484 ), .ZN(
        \i_tv80_core/i_mcode/n283 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U543  ( .A1(\i_tv80_core/i_mcode/n147 ), .A2(
        \i_tv80_core/i_mcode/n767 ), .A3(\i_tv80_core/i_mcode/n764 ), .A4(
        \i_tv80_core/i_mcode/n763 ), .ZN(\i_tv80_core/i_mcode/n285 ) );
  INV_X1 \i_tv80_core/i_mcode/U542  ( .A(\i_tv80_core/i_mcode/n312 ), .ZN(
        \i_tv80_core/i_mcode/n764 ) );
  INV_X1 \i_tv80_core/i_mcode/U541  ( .A(\i_tv80_core/i_mcode/n773 ), .ZN(
        \i_tv80_core/i_mcode/n763 ) );
  INV_X1 \i_tv80_core/i_mcode/U540  ( .A(\i_tv80_core/i_mcode/n799 ), .ZN(
        \i_tv80_core/i_mcode/n284 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U539  ( .A1(\i_tv80_core/i_mcode/n114 ), .A2(
        \i_tv80_core/i_mcode/n415 ), .ZN(\i_tv80_core/i_mcode/n799 ) );
  INV_X1 \i_tv80_core/i_mcode/U538  ( .A(\i_tv80_core/i_mcode/n461 ), .ZN(
        \i_tv80_core/i_mcode/n288 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U537  ( .A1(\i_tv80_core/i_mcode/n126 ), .A2(
        \i_tv80_core/i_mcode/n836 ), .ZN(\i_tv80_core/i_mcode/n461 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U536  ( .B1(\i_tv80_core/i_mcode/n290 ), .B2(
        \i_tv80_core/i_mcode/n885 ), .C1(\i_tv80_core/i_mcode/n816 ), .C2(
        \i_tv80_core/i_mcode/n766 ), .A(\i_tv80_core/i_mcode/n280 ), .ZN(iorq)
         );
  OAI21_X1 \i_tv80_core/i_mcode/U535  ( .B1(\i_tv80_core/i_mcode/n279 ), .B2(
        \i_tv80_core/i_mcode/n856 ), .A(\i_tv80_core/i_mcode/n727 ), .ZN(
        \i_tv80_core/i_mcode/n280 ) );
  INV_X1 \i_tv80_core/i_mcode/U534  ( .A(\i_tv80_core/i_mcode/n362 ), .ZN(
        \i_tv80_core/i_mcode/n279 ) );
  INV_X1 \i_tv80_core/i_mcode/U533  ( .A(\i_tv80_core/i_mcode/n394 ), .ZN(
        \i_tv80_core/i_mcode/n290 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U532  ( .B1(\i_tv80_core/i_mcode/n278 ), .B2(
        \i_tv80_core/i_mcode/n700 ), .A(\i_tv80_core/i_mcode/n520 ), .ZN(
        \i_tv80_core/i_mcode/n394 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U531  ( .C1(\i_tv80_core/i_mcode/n277 ), .C2(
        \i_tv80_core/i_mcode/n276 ), .A(\i_tv80_core/i_mcode/n275 ), .B(
        \i_tv80_core/i_mcode/n274 ), .ZN(\i_tv80_core/Jump ) );
  NAND3_X1 \i_tv80_core/i_mcode/U530  ( .A1(\i_tv80_core/i_mcode/n40 ), .A2(
        \i_tv80_core/i_mcode/n273 ), .A3(\i_tv80_core/i_mcode/n272 ), .ZN(
        \i_tv80_core/i_mcode/n275 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U529  ( .C1(\i_tv80_core/i_mcode/n351 ), .C2(
        \i_tv80_core/i_mcode/n309 ), .A(\i_tv80_core/i_mcode/n1 ), .B(
        \i_tv80_core/i_mcode/n271 ), .ZN(\i_tv80_core/i_mcode/n272 ) );
  INV_X1 \i_tv80_core/i_mcode/U528  ( .A(\i_tv80_core/i_mcode/n865 ), .ZN(
        \i_tv80_core/i_mcode/n351 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U527  ( .A1(\i_tv80_core/i_mcode/n270 ), .A2(
        \i_tv80_core/i_mcode/n94 ), .A3(\i_tv80_core/i_mcode/n695 ), .ZN(
        \i_tv80_core/i_mcode/n865 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U526  ( .A1(\i_tv80_core/i_mcode/n691 ), .A2(
        \i_tv80_core/i_mcode/n24 ), .A3(\i_tv80_core/i_mcode/n690 ), .ZN(
        \i_tv80_core/i_mcode/n270 ) );
  INV_X1 \i_tv80_core/i_mcode/U525  ( .A(\i_tv80_core/F [7]), .ZN(
        \i_tv80_core/i_mcode/n268 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U524  ( .A1(\i_tv80_core/i_mcode/n271 ), .A2(
        \i_tv80_core/i_mcode/n767 ), .A3(\i_tv80_core/i_mcode/n1 ), .ZN(
        \i_tv80_core/i_mcode/n273 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U523  ( .A1(\i_tv80_core/i_mcode/n265 ), .A2(
        \i_tv80_core/i_mcode/n264 ), .ZN(\i_tv80_core/JumpXY ) );
  NOR2_X1 \i_tv80_core/i_mcode/U522  ( .A1(\i_tv80_core/i_mcode/n297 ), .A2(
        \i_tv80_core/i_mcode/n276 ), .ZN(\i_tv80_core/Call ) );
  NAND2_X1 \i_tv80_core/i_mcode/U521  ( .A1(\i_tv80_core/i_mcode/n62 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .ZN(\i_tv80_core/i_mcode/n276 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U520  ( .A1(\i_tv80_core/i_mcode/n885 ), .A2(
        \i_tv80_core/i_mcode/n822 ), .ZN(\i_tv80_core/RstP ) );
  OAI211_X1 \i_tv80_core/i_mcode/U519  ( .C1(\i_tv80_core/i_mcode/n263 ), .C2(
        \i_tv80_core/i_mcode/n518 ), .A(\i_tv80_core/i_mcode/n262 ), .B(
        \i_tv80_core/i_mcode/n261 ), .ZN(\i_tv80_core/LDZ ) );
  OAI211_X1 \i_tv80_core/i_mcode/U518  ( .C1(\i_tv80_core/i_mcode/n106 ), .C2(
        \i_tv80_core/i_mcode/n529 ), .A(\i_tv80_core/i_mcode/n881 ), .B(
        \i_tv80_core/i_mcode/n163 ), .ZN(\i_tv80_core/i_mcode/n261 ) );
  INV_X1 \i_tv80_core/i_mcode/U517  ( .A(\i_tv80_core/i_mcode/n277 ), .ZN(
        \i_tv80_core/i_mcode/n881 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U516  ( .A1(\i_tv80_core/IntCycle ), .A2(
        \i_tv80_core/i_mcode/n2 ), .A3(\i_tv80_core/i_mcode/n368 ), .ZN(
        \i_tv80_core/i_mcode/n277 ) );
  INV_X1 \i_tv80_core/i_mcode/U515  ( .A(\i_tv80_core/i_mcode/n81 ), .ZN(
        \i_tv80_core/i_mcode/n529 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U514  ( .B1(\i_tv80_core/i_mcode/n808 ), .B2(
        \i_tv80_core/i_mcode/n858 ), .A(\i_tv80_core/i_mcode/n727 ), .ZN(
        \i_tv80_core/i_mcode/n262 ) );
  INV_X1 \i_tv80_core/i_mcode/U513  ( .A(\i_tv80_core/i_mcode/n793 ), .ZN(
        \i_tv80_core/i_mcode/n808 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U512  ( .A1(\i_tv80_core/i_mcode/n836 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .ZN(\i_tv80_core/i_mcode/n518 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U511  ( .A1(\i_tv80_core/i_mcode/n801 ), .A2(
        \i_tv80_core/i_mcode/n318 ), .A3(\i_tv80_core/i_mcode/n819 ), .ZN(
        \i_tv80_core/i_mcode/n263 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U510  ( .A1(\i_tv80_core/i_mcode/n112 ), .A2(
        \i_tv80_core/i_mcode/n346 ), .ZN(\i_tv80_core/i_mcode/n819 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U509  ( .A1(\i_tv80_core/i_mcode/n774 ), .A2(
        \i_tv80_core/i_mcode/n733 ), .ZN(\i_tv80_core/i_mcode/n346 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U508  ( .A1(\i_tv80_core/i_mcode/n37 ), .A2(
        \i_tv80_core/i_mcode/n734 ), .ZN(\i_tv80_core/i_mcode/n714 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U507  ( .B1(\i_tv80_core/i_mcode/n309 ), .B2(
        \i_tv80_core/i_mcode/n767 ), .A(\i_tv80_core/i_mcode/n271 ), .ZN(
        \i_tv80_core/i_mcode/n318 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U506  ( .A1(\i_tv80_core/i_mcode/n68 ), .A2(
        \i_tv80_core/i_mcode/n734 ), .ZN(\i_tv80_core/i_mcode/n271 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U505  ( .A1(\i_tv80_core/i_mcode/n297 ), .A2(
        \i_tv80_core/i_mcode/n123 ), .ZN(\i_tv80_core/i_mcode/n801 ) );
  INV_X1 \i_tv80_core/i_mcode/U504  ( .A(\i_tv80_core/i_mcode/n260 ), .ZN(
        \i_tv80_core/i_mcode/n293 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U503  ( .B1(\i_tv80_core/i_mcode/n33 ), .B2(
        \i_tv80_core/i_mcode/n676 ), .A(\i_tv80_core/i_mcode/n522 ), .ZN(
        \i_tv80_core/i_mcode/n260 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U502  ( .B1(\i_tv80_core/i_mcode/n793 ), .B2(
        \i_tv80_core/i_mcode/n766 ), .A(\i_tv80_core/i_mcode/n259 ), .ZN(
        \i_tv80_core/LDW ) );
  OAI21_X1 \i_tv80_core/i_mcode/U501  ( .B1(\i_tv80_core/i_mcode/n851 ), .B2(
        \i_tv80_core/i_mcode/n374 ), .A(\i_tv80_core/i_mcode/n40 ), .ZN(
        \i_tv80_core/i_mcode/n259 ) );
  INV_X1 \i_tv80_core/i_mcode/U500  ( .A(\i_tv80_core/i_mcode/n292 ), .ZN(
        \i_tv80_core/i_mcode/n851 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U499  ( .A1(\i_tv80_core/i_mcode/n834 ), .A2(
        \i_tv80_core/i_mcode/n311 ), .ZN(\i_tv80_core/i_mcode/n292 ) );
  INV_X1 \i_tv80_core/i_mcode/U498  ( .A(\i_tv80_core/i_mcode/n257 ), .ZN(
        \i_tv80_core/i_mcode/n323 ) );
  INV_X1 \i_tv80_core/i_mcode/U497  ( .A(\i_tv80_core/i_mcode/n264 ), .ZN(
        \i_tv80_core/i_mcode/n258 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U496  ( .A1(\i_tv80_core/i_mcode/n185 ), .A2(
        \i_tv80_core/i_mcode/n255 ), .ZN(\i_tv80_core/Special_LD [1]) );
  AOI211_X1 \i_tv80_core/i_mcode/U495  ( .C1(\i_tv80_core/i_mcode/n254 ), .C2(
        \i_tv80_core/i_mcode/n51 ), .A(\i_tv80_core/i_mcode/n253 ), .B(
        \i_tv80_core/i_mcode/n185 ), .ZN(\i_tv80_core/Special_LD [0]) );
  NAND3_X1 \i_tv80_core/i_mcode/U494  ( .A1(\i_tv80_core/i_mcode/n101 ), .A2(
        \i_tv80_core/i_mcode/n251 ), .A3(\i_tv80_core/i_mcode/n250 ), .ZN(
        \i_tv80_core/i_mcode/n252 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U493  ( .A1(\i_tv80_core/i_mcode/n9 ), .A2(
        \i_tv80_core/i_mcode/n159 ), .ZN(\i_tv80_core/ExchangeRp ) );
  NAND2_X1 \i_tv80_core/i_mcode/U492  ( .A1(\i_tv80_core/i_mcode/n314 ), .A2(
        \i_tv80_core/i_mcode/n320 ), .ZN(\i_tv80_core/i_mcode/n621 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U491  ( .A1(\i_tv80_core/i_mcode/n248 ), .A2(
        \i_tv80_core/i_mcode/n249 ), .ZN(\i_tv80_core/i_mcode/n320 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U490  ( .A1(\i_tv80_core/i_mcode/n247 ), .A2(
        \i_tv80_core/i_mcode/n253 ), .A3(\i_tv80_core/i_mcode/n843 ), .ZN(
        \i_tv80_core/i_mcode/n248 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U489  ( .A1(\i_tv80_core/i_mcode/n319 ), .A2(
        \i_tv80_core/i_mcode/n150 ), .A3(\i_tv80_core/i_mcode/n35 ), .ZN(
        \i_tv80_core/i_mcode/n247 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U488  ( .A1(\i_tv80_core/i_mcode/n133 ), .A2(
        \i_tv80_core/i_mcode/n113 ), .ZN(\i_tv80_core/i_mcode/n319 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U487  ( .A1(\i_tv80_core/i_mcode/n322 ), .A2(
        \i_tv80_core/i_mcode/n246 ), .ZN(\i_tv80_core/i_mcode/n314 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U486  ( .A1(\i_tv80_core/i_mcode/n244 ), .A2(
        \i_tv80_core/i_mcode/n149 ), .A3(\i_tv80_core/i_mcode/n245 ), .A4(
        \i_tv80_core/i_mcode/n133 ), .ZN(\i_tv80_core/i_mcode/n322 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U485  ( .A1(\i_tv80_core/i_mcode/n243 ), .A2(
        \i_tv80_core/i_mcode/n715 ), .A3(\i_tv80_core/i_mcode/n35 ), .A4(
        \i_tv80_core/i_mcode/n325 ), .ZN(\i_tv80_core/i_mcode/n244 ) );
  INV_X1 \i_tv80_core/i_mcode/U484  ( .A(\i_tv80_core/i_mcode/n56 ), .ZN(
        \i_tv80_core/i_mcode/n715 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U483  ( .A1(\i_tv80_core/i_mcode/n157 ), .A2(
        \i_tv80_core/i_mcode/n774 ), .A3(\i_tv80_core/i_mcode/n150 ), .ZN(
        \i_tv80_core/i_mcode/n245 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U482  ( .A1(\i_tv80_core/i_mcode/n159 ), .A2(
        \i_tv80_core/i_mcode/n445 ), .ZN(\i_tv80_core/ExchangeAF ) );
  NAND2_X1 \i_tv80_core/i_mcode/U481  ( .A1(\i_tv80_core/i_mcode/n241 ), .A2(
        \i_tv80_core/i_mcode/n697 ), .ZN(\i_tv80_core/i_mcode/n445 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U480  ( .A1(\i_tv80_core/i_mcode/n278 ), .A2(
        \i_tv80_core/i_mcode/n264 ), .ZN(\i_tv80_core/ExchangeRS ) );
  NAND2_X1 \i_tv80_core/i_mcode/U479  ( .A1(\i_tv80_core/i_mcode/n157 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .ZN(\i_tv80_core/i_mcode/n264 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U478  ( .A1(\i_tv80_core/i_mcode/n552 ), .A2(
        \i_tv80_core/i_mcode/n159 ), .A3(\i_tv80_core/i_mcode/n415 ), .ZN(
        \i_tv80_core/stop ) );
  NOR3_X1 \i_tv80_core/i_mcode/U477  ( .A1(\i_tv80_core/i_mcode/n656 ), .A2(
        \i_tv80_core/i_mcode/n159 ), .A3(\i_tv80_core/i_mcode/n253 ), .ZN(
        \i_tv80_core/I_CPL ) );
  NOR2_X1 \i_tv80_core/i_mcode/U476  ( .A1(\i_tv80_core/i_mcode/n253 ), .A2(
        \i_tv80_core/i_mcode/n668 ), .ZN(\i_tv80_core/I_CCF ) );
  NOR2_X1 \i_tv80_core/i_mcode/U475  ( .A1(\i_tv80_core/i_mcode/n240 ), .A2(
        \i_tv80_core/i_mcode/n668 ), .ZN(\i_tv80_core/I_SCF ) );
  NAND2_X1 \i_tv80_core/i_mcode/U474  ( .A1(\i_tv80_core/i_mcode/n49 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .ZN(\i_tv80_core/i_mcode/n668 ) );
  INV_X1 \i_tv80_core/i_mcode/U473  ( .A(\i_tv80_core/i_mcode/n274 ), .ZN(
        \i_tv80_core/I_RETN ) );
  NAND2_X1 \i_tv80_core/i_mcode/U472  ( .A1(\i_tv80_core/i_mcode/n858 ), .A2(
        \i_tv80_core/i_mcode/n239 ), .ZN(\i_tv80_core/i_mcode/n274 ) );
  INV_X1 \i_tv80_core/i_mcode/U471  ( .A(\i_tv80_core/i_mcode/n339 ), .ZN(
        \i_tv80_core/i_mcode/n858 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U470  ( .A1(\i_tv80_core/i_mcode/n766 ), .A2(
        \i_tv80_core/i_mcode/n723 ), .ZN(\i_tv80_core/I_BC ) );
  NOR2_X1 \i_tv80_core/i_mcode/U469  ( .A1(\i_tv80_core/i_mcode/n792 ), .A2(
        \i_tv80_core/i_mcode/n238 ), .ZN(\i_tv80_core/I_RLD ) );
  NOR2_X1 \i_tv80_core/i_mcode/U468  ( .A1(\i_tv80_core/i_mcode/n792 ), .A2(
        \i_tv80_core/i_mcode/n490 ), .ZN(\i_tv80_core/I_RRD ) );
  NOR2_X1 \i_tv80_core/i_mcode/U467  ( .A1(\i_tv80_core/i_mcode/n631 ), .A2(
        \i_tv80_core/i_mcode/n623 ), .ZN(\i_tv80_core/I_INRC ) );
  NOR3_X1 \i_tv80_core/i_mcode/U466  ( .A1(\i_tv80_core/i_mcode/n237 ), .A2(
        \i_tv80_core/i_mcode/n159 ), .A3(\i_tv80_core/i_mcode/n257 ), .ZN(
        \i_tv80_core/SetDI ) );
  NOR2_X1 \i_tv80_core/i_mcode/U465  ( .A1(\i_tv80_core/i_mcode/n257 ), .A2(
        \i_tv80_core/i_mcode/n775 ), .ZN(\i_tv80_core/SetEI ) );
  NAND2_X1 \i_tv80_core/i_mcode/U464  ( .A1(\i_tv80_core/i_mcode/n672 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .ZN(\i_tv80_core/i_mcode/n775 ) );
  INV_X1 \i_tv80_core/i_mcode/U463  ( .A(\i_tv80_core/i_mcode/n700 ), .ZN(
        \i_tv80_core/i_mcode/n672 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U462  ( .A1(\i_tv80_core/i_mcode/n168 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .A3(\i_tv80_core/i_mcode/n236 ), .ZN(
        \i_tv80_core/i_mcode/n257 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U461  ( .A1(\i_tv80_core/i_mcode/n119 ), .A2(
        \i_tv80_core/i_mcode/n338 ), .A3(\i_tv80_core/i_mcode/n151 ), .ZN(
        \i_tv80_core/IMode [1]) );
  INV_X1 \i_tv80_core/i_mcode/U460  ( .A(\i_tv80_core/i_mcode/n235 ), .ZN(
        \i_tv80_core/i_mcode/n338 ) );
  OAI22_X1 \i_tv80_core/i_mcode/U459  ( .A1(\i_tv80_core/i_mcode/n743 ), .A2(
        \i_tv80_core/i_mcode/n619 ), .B1(\i_tv80_core/i_mcode/n240 ), .B2(
        \i_tv80_core/i_mcode/n742 ), .ZN(\i_tv80_core/i_mcode/n235 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U458  ( .A1(\i_tv80_core/i_mcode/n119 ), .A2(
        \i_tv80_core/i_mcode/n337 ), .A3(\i_tv80_core/i_mcode/n151 ), .ZN(
        \i_tv80_core/IMode [0]) );
  NOR3_X1 \i_tv80_core/i_mcode/U457  ( .A1(\i_tv80_core/i_mcode/n360 ), .A2(
        \i_tv80_core/i_mcode/n856 ), .A3(\i_tv80_core/i_mcode/n163 ), .ZN(
        \i_tv80_core/i_mcode/n234 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U456  ( .A1(\i_tv80_core/i_mcode/n43 ), .A2(
        \i_tv80_core/i_mcode/n630 ), .A3(\i_tv80_core/i_mcode/n508 ), .ZN(
        \i_tv80_core/i_mcode/n360 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U455  ( .A1(\i_tv80_core/i_mcode/n569 ), .A2(
        \i_tv80_core/i_mcode/n639 ), .ZN(\i_tv80_core/i_mcode/n508 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U454  ( .A1(\i_tv80_core/i_mcode/n231 ), .A2(
        \i_tv80_core/i_mcode/n309 ), .A3(\i_tv80_core/i_mcode/n232 ), .A4(
        \i_tv80_core/i_mcode/n233 ), .ZN(\i_tv80_core/i_mcode/n456 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U453  ( .B1(\i_tv80_core/i_mcode/n768 ), .B2(
        \i_tv80_core/i_mcode/n230 ), .C1(\i_tv80_core/i_mcode/n249 ), .C2(
        \i_tv80_core/i_mcode/n229 ), .A(\i_tv80_core/i_mcode/n228 ), .ZN(
        \i_tv80_core/i_mcode/n231 ) );
  INV_X1 \i_tv80_core/i_mcode/U452  ( .A(\i_tv80_core/i_mcode/n227 ), .ZN(
        \i_tv80_core/i_mcode/n228 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U451  ( .A1(\i_tv80_core/i_mcode/n619 ), .A2(
        \i_tv80_core/i_mcode/n253 ), .ZN(\i_tv80_core/i_mcode/n229 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U450  ( .A1(\i_tv80_core/i_mcode/n147 ), .A2(
        \i_tv80_core/i_mcode/n30 ), .A3(\i_tv80_core/i_mcode/n310 ), .ZN(
        \i_tv80_core/i_mcode/n230 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U449  ( .A1(\i_tv80_core/i_mcode/n225 ), .A2(
        \i_tv80_core/i_mcode/n834 ), .A3(\i_tv80_core/i_mcode/n697 ), .ZN(
        \i_tv80_core/i_mcode/n232 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U448  ( .A1(\i_tv80_core/i_mcode/n224 ), .A2(
        \i_tv80_core/i_mcode/n33 ), .A3(\i_tv80_core/i_mcode/n5 ), .ZN(
        \i_tv80_core/i_mcode/n225 ) );
  INV_X1 \i_tv80_core/i_mcode/U447  ( .A(\i_tv80_core/i_mcode/n256 ), .ZN(
        \i_tv80_core/i_mcode/n233 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U446  ( .B1(\i_tv80_core/i_mcode/n30 ), .B2(
        \i_tv80_core/i_mcode/n51 ), .A(\i_tv80_core/i_mcode/n255 ), .ZN(
        \i_tv80_core/i_mcode/n256 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U445  ( .A1(\i_tv80_core/i_mcode/n222 ), .A2(
        \i_tv80_core/i_mcode/n4 ), .ZN(\i_tv80_core/i_mcode/n255 ) );
  INV_X1 \i_tv80_core/i_mcode/U444  ( .A(\i_tv80_core/i_mcode/n254 ), .ZN(
        \i_tv80_core/i_mcode/n222 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U443  ( .A1(\i_tv80_core/i_mcode/n109 ), .A2(
        \i_tv80_core/i_mcode/n171 ), .ZN(\i_tv80_core/i_mcode/n254 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U442  ( .A1(\i_tv80_core/i_mcode/n623 ), .A2(
        \i_tv80_core/i_mcode/n504 ), .ZN(\i_tv80_core/i_mcode/n856 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U441  ( .A1(\i_tv80_core/i_mcode/n32 ), .A2(
        \i_tv80_core/i_mcode/n639 ), .ZN(\i_tv80_core/i_mcode/n623 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U440  ( .A1(\i_tv80_core/i_mcode/n639 ), .A2(
        \i_tv80_core/i_mcode/n745 ), .ZN(\i_tv80_core/i_mcode/n339 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U439  ( .A1(\i_tv80_core/i_mcode/n221 ), .A2(
        \i_tv80_core/i_mcode/n242 ), .ZN(\i_tv80_core/i_mcode/n745 ) );
  INV_X1 \i_tv80_core/i_mcode/U438  ( .A(\i_tv80_core/i_mcode/n220 ), .ZN(
        \i_tv80_core/i_mcode/n337 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U437  ( .B1(\i_tv80_core/i_mcode/n51 ), .B2(
        \i_tv80_core/i_mcode/n219 ), .A(\i_tv80_core/i_mcode/n446 ), .ZN(
        \i_tv80_core/i_mcode/n220 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U436  ( .A1(\i_tv80_core/i_mcode/n639 ), .A2(
        \i_tv80_core/i_mcode/n312 ), .ZN(\i_tv80_core/i_mcode/n793 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U435  ( .A1(\i_tv80_core/i_mcode/n159 ), .A2(
        \i_tv80_core/i_mcode/n446 ), .ZN(\i_tv80_core/Halt ) );
  NAND2_X1 \i_tv80_core/i_mcode/U434  ( .A1(\i_tv80_core/i_mcode/n218 ), .A2(
        \i_tv80_core/i_mcode/n249 ), .ZN(\i_tv80_core/i_mcode/n446 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U433  ( .A1(\i_tv80_core/i_mcode/n663 ), .A2(
        \i_tv80_core/i_mcode/n664 ), .A3(\i_tv80_core/i_mcode/n217 ), .A4(
        \i_tv80_core/i_mcode/n216 ), .ZN(no_read) );
  AOI222_X1 \i_tv80_core/i_mcode/U432  ( .A1(\i_tv80_core/i_mcode/n215 ), .A2(
        \i_tv80_core/i_mcode/n727 ), .B1(\i_tv80_core/i_mcode/n214 ), .B2(
        \i_tv80_core/i_mcode/n388 ), .C1(\i_tv80_core/i_mcode/n344 ), .C2(
        \i_tv80_core/i_mcode/n794 ), .ZN(\i_tv80_core/i_mcode/n216 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U431  ( .A1(\i_tv80_core/i_mcode/n155 ), .A2(
        \i_tv80_core/i_mcode/n58 ), .A3(\i_tv80_core/i_mcode/n213 ), .A4(
        \i_tv80_core/i_mcode/n8 ), .ZN(\i_tv80_core/i_mcode/n794 ) );
  INV_X1 \i_tv80_core/i_mcode/U430  ( .A(\i_tv80_core/i_mcode/n624 ), .ZN(
        \i_tv80_core/i_mcode/n213 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U429  ( .A1(\i_tv80_core/i_mcode/n655 ), .A2(
        \i_tv80_core/i_mcode/n172 ), .ZN(\i_tv80_core/i_mcode/n624 ) );
  INV_X1 \i_tv80_core/i_mcode/U428  ( .A(\i_tv80_core/i_mcode/n666 ), .ZN(
        \i_tv80_core/i_mcode/n655 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U427  ( .A1(\i_tv80_core/i_mcode/n168 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .ZN(\i_tv80_core/i_mcode/n666 ) );
  INV_X1 \i_tv80_core/i_mcode/U426  ( .A(\i_tv80_core/i_mcode/n400 ), .ZN(
        \i_tv80_core/i_mcode/n344 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U425  ( .A1(\i_tv80_core/i_mcode/n795 ), .A2(
        \i_tv80_core/i_mcode/n854 ), .ZN(\i_tv80_core/i_mcode/n400 ) );
  INV_X1 \i_tv80_core/i_mcode/U424  ( .A(\i_tv80_core/i_mcode/n502 ), .ZN(
        \i_tv80_core/i_mcode/n795 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U423  ( .A1(\i_tv80_core/i_mcode/n156 ), .A2(
        \i_tv80_core/n2180 ), .ZN(\i_tv80_core/i_mcode/n502 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U422  ( .A1(\i_tv80_core/i_mcode/n553 ), .A2(
        \i_tv80_core/i_mcode/n722 ), .ZN(\i_tv80_core/i_mcode/n388 ) );
  INV_X1 \i_tv80_core/i_mcode/U421  ( .A(\i_tv80_core/i_mcode/n587 ), .ZN(
        \i_tv80_core/i_mcode/n553 ) );
  INV_X1 \i_tv80_core/i_mcode/U420  ( .A(\i_tv80_core/i_mcode/n792 ), .ZN(
        \i_tv80_core/i_mcode/n214 ) );
  INV_X1 \i_tv80_core/i_mcode/U419  ( .A(\i_tv80_core/i_mcode/n631 ), .ZN(
        \i_tv80_core/i_mcode/n727 ) );
  INV_X1 \i_tv80_core/i_mcode/U418  ( .A(\i_tv80_core/i_mcode/n238 ), .ZN(
        \i_tv80_core/i_mcode/n215 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U417  ( .B1(\i_tv80_core/i_mcode/n120 ), .B2(
        \i_tv80_core/i_mcode/n592 ), .A(\i_tv80_core/JumpE ), .ZN(
        \i_tv80_core/i_mcode/n217 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U416  ( .A1(\i_tv80_core/i_mcode/n281 ), .A2(
        \i_tv80_core/i_mcode/n282 ), .A3(\i_tv80_core/i_mcode/n415 ), .ZN(
        \i_tv80_core/i_mcode/n212 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U415  ( .A1(\i_tv80_core/i_mcode/n833 ), .A2(
        \i_tv80_core/i_mcode/n170 ), .ZN(\i_tv80_core/i_mcode/n415 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U414  ( .A1(\i_tv80_core/i_mcode/n774 ), .A2(
        \i_tv80_core/i_mcode/n840 ), .ZN(\i_tv80_core/i_mcode/n282 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U413  ( .A1(\i_tv80_core/i_mcode/n307 ), .A2(
        \i_tv80_core/i_mcode/n656 ), .ZN(\i_tv80_core/i_mcode/n840 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U412  ( .A1(\i_tv80_core/i_mcode/n833 ), .A2(
        \i_tv80_core/i_mcode/n241 ), .ZN(\i_tv80_core/i_mcode/n281 ) );
  INV_X1 \i_tv80_core/i_mcode/U411  ( .A(\i_tv80_core/i_mcode/n843 ), .ZN(
        \i_tv80_core/i_mcode/n241 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U410  ( .A1(\i_tv80_core/i_mcode/n138 ), .A2(
        \i_tv80_core/i_mcode/n139 ), .ZN(\i_tv80_core/i_mcode/n843 ) );
  INV_X1 \i_tv80_core/i_mcode/U409  ( .A(\i_tv80_core/i_mcode/n223 ), .ZN(
        \i_tv80_core/i_mcode/n833 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U408  ( .A1(\i_tv80_core/i_mcode/n164 ), .A2(
        \i_tv80_core/i_mcode/n173 ), .ZN(\i_tv80_core/i_mcode/n885 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U407  ( .A1(\i_tv80_core/i_mcode/n50 ), .A2(
        \i_tv80_core/i_mcode/n706 ), .ZN(\i_tv80_core/i_mcode/n592 ) );
  INV_X1 \i_tv80_core/i_mcode/U406  ( .A(\i_tv80_core/i_mcode/n723 ), .ZN(
        \i_tv80_core/i_mcode/n386 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U405  ( .A1(\i_tv80_core/i_mcode/n768 ), .A2(
        \i_tv80_core/i_mcode/n773 ), .ZN(\i_tv80_core/i_mcode/n723 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U404  ( .A1(\i_tv80_core/i_mcode/n591 ), .A2(
        \i_tv80_core/i_mcode/n160 ), .ZN(\i_tv80_core/i_mcode/n664 ) );
  INV_X1 \i_tv80_core/i_mcode/U403  ( .A(\i_tv80_core/i_mcode/n549 ), .ZN(
        \i_tv80_core/i_mcode/n591 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U402  ( .A1(\i_tv80_core/i_mcode/n857 ), .A2(
        \i_tv80_core/i_mcode/n802 ), .ZN(\i_tv80_core/i_mcode/n549 ) );
  INV_X1 \i_tv80_core/i_mcode/U401  ( .A(\i_tv80_core/i_mcode/n630 ), .ZN(
        \i_tv80_core/i_mcode/n857 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U400  ( .A1(\i_tv80_core/i_mcode/n311 ), .A2(
        \i_tv80_core/i_mcode/n639 ), .ZN(\i_tv80_core/i_mcode/n630 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U399  ( .A1(\i_tv80_core/i_mcode/n597 ), .A2(
        \i_tv80_core/i_mcode/n163 ), .ZN(\i_tv80_core/i_mcode/n663 ) );
  INV_X1 \i_tv80_core/i_mcode/U398  ( .A(\i_tv80_core/i_mcode/n417 ), .ZN(
        \i_tv80_core/i_mcode/n597 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U397  ( .A1(\i_tv80_core/i_mcode/n869 ), .A2(
        \i_tv80_core/i_mcode/n802 ), .ZN(\i_tv80_core/i_mcode/n417 ) );
  INV_X1 \i_tv80_core/i_mcode/U396  ( .A(\i_tv80_core/i_mcode/n616 ), .ZN(
        \i_tv80_core/i_mcode/n869 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U395  ( .A1(\i_tv80_core/i_mcode/n484 ), .A2(
        \i_tv80_core/i_mcode/n158 ), .ZN(\i_tv80_core/i_mcode/n616 ) );
  OR4_X1 \i_tv80_core/i_mcode/U394  ( .A1(\i_tv80_core/I_BT ), .A2(
        \i_tv80_core/I_BTR ), .A3(\i_tv80_core/i_mcode/n211 ), .A4(
        \i_tv80_core/i_mcode/n210 ), .ZN(write) );
  OAI222_X1 \i_tv80_core/i_mcode/U393  ( .A1(\i_tv80_core/i_mcode/n209 ), .A2(
        \i_tv80_core/i_mcode/n181 ), .B1(\i_tv80_core/i_mcode/n554 ), .B2(
        \i_tv80_core/i_mcode/n792 ), .C1(\i_tv80_core/i_mcode/n631 ), .C2(
        \i_tv80_core/i_mcode/n504 ), .ZN(\i_tv80_core/i_mcode/n210 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U392  ( .A1(\i_tv80_core/i_mcode/n639 ), .A2(
        \i_tv80_core/i_mcode/n773 ), .ZN(\i_tv80_core/i_mcode/n504 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U391  ( .A1(\i_tv80_core/i_mcode/n867 ), .A2(
        \i_tv80_core/i_mcode/n56 ), .ZN(\i_tv80_core/i_mcode/n773 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U390  ( .A1(\i_tv80_core/i_mcode/n82 ), .A2(
        \i_tv80_core/i_mcode/n101 ), .A3(\i_tv80_core/i_mcode/n73 ), .ZN(
        \i_tv80_core/i_mcode/n867 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U389  ( .A1(\i_tv80_core/i_mcode/n46 ), .A2(
        \i_tv80_core/i_mcode/n160 ), .ZN(\i_tv80_core/i_mcode/n631 ) );
  INV_X1 \i_tv80_core/i_mcode/U388  ( .A(\i_tv80_core/i_mcode/n805 ), .ZN(
        \i_tv80_core/i_mcode/n836 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U387  ( .A1(\i_tv80_core/i_mcode/n106 ), .A2(
        \i_tv80_core/i_mcode/n160 ), .ZN(\i_tv80_core/i_mcode/n792 ) );
  INV_X1 \i_tv80_core/i_mcode/U386  ( .A(\i_tv80_core/i_mcode/n457 ), .ZN(
        \i_tv80_core/i_mcode/n554 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U385  ( .A1(\i_tv80_core/i_mcode/n238 ), .A2(
        \i_tv80_core/i_mcode/n490 ), .ZN(\i_tv80_core/i_mcode/n457 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U384  ( .A1(\i_tv80_core/i_mcode/n686 ), .A2(
        \i_tv80_core/i_mcode/n208 ), .A3(\i_tv80_core/i_mcode/n109 ), .ZN(
        \i_tv80_core/i_mcode/n490 ) );
  INV_X1 \i_tv80_core/i_mcode/U383  ( .A(\i_tv80_core/i_mcode/n3 ), .ZN(
        \i_tv80_core/i_mcode/n686 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U382  ( .A1(\i_tv80_core/i_mcode/n109 ), .A2(
        \i_tv80_core/i_mcode/n208 ), .A3(\i_tv80_core/i_mcode/n325 ), .ZN(
        \i_tv80_core/i_mcode/n238 ) );
  INV_X1 \i_tv80_core/i_mcode/U381  ( .A(\i_tv80_core/i_mcode/n253 ), .ZN(
        \i_tv80_core/i_mcode/n325 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U380  ( .A1(\i_tv80_core/i_mcode/n153 ), .A2(
        \i_tv80_core/i_mcode/n250 ), .ZN(\i_tv80_core/i_mcode/n253 ) );
  INV_X1 \i_tv80_core/i_mcode/U379  ( .A(\i_tv80_core/i_mcode/n22 ), .ZN(
        \i_tv80_core/i_mcode/n208 ) );
  INV_X1 \i_tv80_core/i_mcode/U378  ( .A(\i_tv80_core/ISet [0]), .ZN(
        \i_tv80_core/i_mcode/n251 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U377  ( .A1(\i_tv80_core/i_mcode/n207 ), .A2(
        \i_tv80_core/i_mcode/n206 ), .A3(\i_tv80_core/i_mcode/n21 ), .A4(
        \i_tv80_core/i_mcode/n205 ), .ZN(\i_tv80_core/i_mcode/n209 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U376  ( .B1(\i_tv80_core/i_mcode/n521 ), .B2(
        \i_tv80_core/i_mcode/n523 ), .A(\i_tv80_core/i_mcode/n805 ), .ZN(
        \i_tv80_core/i_mcode/n205 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U375  ( .A1(\i_tv80_core/i_mcode/n249 ), .A2(
        \i_tv80_core/i_mcode/n204 ), .ZN(\i_tv80_core/i_mcode/n523 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U374  ( .A1(\i_tv80_core/i_mcode/n203 ), .A2(
        \i_tv80_core/i_mcode/n149 ), .A3(\i_tv80_core/i_mcode/n845 ), .A4(
        \i_tv80_core/i_mcode/n56 ), .ZN(\i_tv80_core/i_mcode/n204 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U373  ( .A1(\i_tv80_core/i_mcode/n101 ), .A2(
        \i_tv80_core/i_mcode/n172 ), .A3(\i_tv80_core/i_mcode/n82 ), .ZN(
        \i_tv80_core/i_mcode/n739 ) );
  INV_X1 \i_tv80_core/i_mcode/U372  ( .A(\i_tv80_core/i_mcode/n243 ), .ZN(
        \i_tv80_core/i_mcode/n203 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U371  ( .A1(\i_tv80_core/i_mcode/n202 ), .A2(
        \i_tv80_core/i_mcode/n699 ), .A3(\i_tv80_core/i_mcode/n470 ), .ZN(
        \i_tv80_core/i_mcode/n243 ) );
  INV_X1 \i_tv80_core/i_mcode/U370  ( .A(\i_tv80_core/i_mcode/n742 ), .ZN(
        \i_tv80_core/i_mcode/n249 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U369  ( .A1(\i_tv80_core/i_mcode/n201 ), .A2(
        \i_tv80_core/i_mcode/n669 ), .ZN(\i_tv80_core/i_mcode/n521 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U368  ( .A1(\i_tv80_core/i_mcode/n223 ), .A2(
        \i_tv80_core/i_mcode/n528 ), .ZN(\i_tv80_core/i_mcode/n669 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U367  ( .B1(\i_tv80_core/i_mcode/n297 ), .B2(
        \i_tv80_core/i_mcode/n578 ), .A(\i_tv80_core/i_mcode/n657 ), .ZN(
        \i_tv80_core/i_mcode/n206 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U366  ( .A1(\i_tv80_core/i_mcode/n201 ), .A2(
        \i_tv80_core/i_mcode/n834 ), .ZN(\i_tv80_core/i_mcode/n578 ) );
  INV_X1 \i_tv80_core/i_mcode/U365  ( .A(\i_tv80_core/i_mcode/n656 ), .ZN(
        \i_tv80_core/i_mcode/n834 ) );
  INV_X1 \i_tv80_core/i_mcode/U364  ( .A(\i_tv80_core/i_mcode/n374 ), .ZN(
        \i_tv80_core/i_mcode/n297 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U363  ( .A1(\i_tv80_core/i_mcode/n880 ), .A2(
        \i_tv80_core/i_mcode/n350 ), .ZN(\i_tv80_core/i_mcode/n374 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U362  ( .A1(\i_tv80_core/i_mcode/n569 ), .A2(
        \i_tv80_core/i_mcode/n733 ), .ZN(\i_tv80_core/i_mcode/n350 ) );
  INV_X1 \i_tv80_core/i_mcode/U361  ( .A(\i_tv80_core/i_mcode/n226 ), .ZN(
        \i_tv80_core/i_mcode/n569 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U360  ( .A1(\i_tv80_core/i_mcode/n58 ), .A2(
        \i_tv80_core/i_mcode/n139 ), .ZN(\i_tv80_core/i_mcode/n226 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U359  ( .A1(\i_tv80_core/i_mcode/n734 ), .A2(
        \i_tv80_core/i_mcode/n813 ), .ZN(\i_tv80_core/i_mcode/n880 ) );
  INV_X1 \i_tv80_core/i_mcode/U358  ( .A(\i_tv80_core/i_mcode/n57 ), .ZN(
        \i_tv80_core/i_mcode/n813 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U357  ( .A1(\i_tv80_core/i_mcode/n85 ), .A2(
        \i_tv80_core/i_mcode/n153 ), .ZN(\i_tv80_core/i_mcode/n242 ) );
  INV_X1 \i_tv80_core/i_mcode/U356  ( .A(\i_tv80_core/i_mcode/n868 ), .ZN(
        \i_tv80_core/i_mcode/n734 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U355  ( .A1(\i_tv80_core/i_mcode/n703 ), .A2(
        \i_tv80_core/i_mcode/n732 ), .A3(\i_tv80_core/i_mcode/n66 ), .A4(
        \i_tv80_core/i_mcode/n48 ), .ZN(\i_tv80_core/i_mcode/n868 ) );
  OAI221_X1 \i_tv80_core/i_mcode/U354  ( .B1(\i_tv80_core/i_mcode/n200 ), .B2(
        \i_tv80_core/i_mcode/n706 ), .C1(\i_tv80_core/i_mcode/n83 ), .C2(
        \i_tv80_core/i_mcode/n522 ), .A(\i_tv80_core/i_mcode/n199 ), .ZN(
        \i_tv80_core/i_mcode/n207 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U353  ( .B1(\i_tv80_core/i_mcode/n148 ), .B2(
        \i_tv80_core/i_mcode/n295 ), .A(\i_tv80_core/i_mcode/n162 ), .ZN(
        \i_tv80_core/i_mcode/n199 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U352  ( .A1(\i_tv80_core/i_mcode/n822 ), .A2(
        \i_tv80_core/i_mcode/n821 ), .ZN(\i_tv80_core/i_mcode/n295 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U351  ( .A1(\i_tv80_core/i_mcode/n733 ), .A2(
        \i_tv80_core/i_mcode/n783 ), .ZN(\i_tv80_core/i_mcode/n822 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U350  ( .A1(\i_tv80_core/i_mcode/n684 ), .A2(
        \i_tv80_core/i_mcode/n3 ), .ZN(\i_tv80_core/i_mcode/n783 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U349  ( .A1(\i_tv80_core/i_mcode/n58 ), .A2(
        \i_tv80_core/i_mcode/n172 ), .A3(\i_tv80_core/i_mcode/n250 ), .ZN(
        \i_tv80_core/i_mcode/n240 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U348  ( .A1(\i_tv80_core/i_mcode/n153 ), .A2(
        \i_tv80_core/i_mcode/n250 ), .ZN(\i_tv80_core/i_mcode/n684 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U347  ( .A1(\i_tv80_core/i_mcode/n66 ), .A2(
        \i_tv80_core/i_mcode/n48 ), .ZN(\i_tv80_core/i_mcode/n309 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U346  ( .A1(\i_tv80_core/i_mcode/n368 ), .A2(
        \i_tv80_core/i_mcode/n198 ), .ZN(\i_tv80_core/i_mcode/n527 ) );
  INV_X1 \i_tv80_core/i_mcode/U345  ( .A(\i_tv80_core/IntCycle ), .ZN(
        \i_tv80_core/i_mcode/n198 ) );
  INV_X1 \i_tv80_core/i_mcode/U344  ( .A(\i_tv80_core/NMICycle ), .ZN(
        \i_tv80_core/i_mcode/n368 ) );
  INV_X1 \i_tv80_core/i_mcode/U343  ( .A(\i_tv80_core/i_mcode/n528 ), .ZN(
        \i_tv80_core/i_mcode/n697 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U342  ( .A1(\i_tv80_core/i_mcode/n201 ), .A2(
        \i_tv80_core/i_mcode/n49 ), .ZN(\i_tv80_core/i_mcode/n522 ) );
  INV_X1 \i_tv80_core/i_mcode/U341  ( .A(\i_tv80_core/i_mcode/n470 ), .ZN(
        \i_tv80_core/i_mcode/n201 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U340  ( .A1(\i_tv80_core/i_mcode/n143 ), .A2(
        \i_tv80_core/i_mcode/n155 ), .ZN(\i_tv80_core/i_mcode/n470 ) );
  NOR4_X1 \i_tv80_core/i_mcode/U339  ( .A1(\i_tv80_core/i_mcode/n524 ), .A2(
        \i_tv80_core/i_mcode/n197 ), .A3(\i_tv80_core/i_mcode/n581 ), .A4(
        \i_tv80_core/i_mcode/n850 ), .ZN(\i_tv80_core/i_mcode/n200 ) );
  INV_X1 \i_tv80_core/i_mcode/U338  ( .A(\i_tv80_core/i_mcode/n404 ), .ZN(
        \i_tv80_core/i_mcode/n850 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U337  ( .B1(\i_tv80_core/i_mcode/n685 ), .B2(
        \i_tv80_core/i_mcode/n196 ), .A(\i_tv80_core/i_mcode/n49 ), .ZN(
        \i_tv80_core/i_mcode/n404 ) );
  INV_X1 \i_tv80_core/i_mcode/U336  ( .A(\i_tv80_core/i_mcode/n202 ), .ZN(
        \i_tv80_core/i_mcode/n196 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U335  ( .A1(\i_tv80_core/i_mcode/n52 ), .A2(
        \i_tv80_core/i_mcode/n139 ), .ZN(\i_tv80_core/i_mcode/n202 ) );
  INV_X1 \i_tv80_core/i_mcode/U334  ( .A(\i_tv80_core/i_mcode/n104 ), .ZN(
        \i_tv80_core/i_mcode/n685 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U333  ( .A1(\i_tv80_core/i_mcode/n558 ), .A2(
        \i_tv80_core/i_mcode/n78 ), .ZN(\i_tv80_core/i_mcode/n565 ) );
  INV_X1 \i_tv80_core/i_mcode/U332  ( .A(\i_tv80_core/i_mcode/n879 ), .ZN(
        \i_tv80_core/i_mcode/n581 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U331  ( .A1(\i_tv80_core/i_mcode/n812 ), .A2(
        \i_tv80_core/i_mcode/n195 ), .ZN(\i_tv80_core/i_mcode/n879 ) );
  INV_X1 \i_tv80_core/i_mcode/U330  ( .A(\i_tv80_core/i_mcode/n699 ), .ZN(
        \i_tv80_core/i_mcode/n195 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U329  ( .A1(\i_tv80_core/i_mcode/n140 ), .A2(
        \i_tv80_core/i_mcode/n250 ), .ZN(\i_tv80_core/i_mcode/n699 ) );
  INV_X1 \i_tv80_core/i_mcode/U328  ( .A(\i_tv80_core/i_mcode/n265 ), .ZN(
        \i_tv80_core/i_mcode/n812 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U327  ( .A1(\i_tv80_core/i_mcode/n168 ), .A2(
        \i_tv80_core/i_mcode/n703 ), .A3(\i_tv80_core/i_mcode/n236 ), .ZN(
        \i_tv80_core/i_mcode/n265 ) );
  INV_X1 \i_tv80_core/i_mcode/U326  ( .A(\i_tv80_core/i_mcode/n520 ), .ZN(
        \i_tv80_core/i_mcode/n197 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U325  ( .A1(\i_tv80_core/i_mcode/n673 ), .A2(
        \i_tv80_core/i_mcode/n68 ), .ZN(\i_tv80_core/i_mcode/n520 ) );
  INV_X1 \i_tv80_core/i_mcode/U324  ( .A(\i_tv80_core/i_mcode/n278 ), .ZN(
        \i_tv80_core/i_mcode/n673 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U323  ( .A1(\i_tv80_core/i_mcode/n236 ), .A2(
        \i_tv80_core/i_mcode/n732 ), .A3(\i_tv80_core/i_mcode/n175 ), .ZN(
        \i_tv80_core/i_mcode/n278 ) );
  INV_X1 \i_tv80_core/i_mcode/U322  ( .A(\i_tv80_core/i_mcode/n751 ), .ZN(
        \i_tv80_core/i_mcode/n236 ) );
  INV_X1 \i_tv80_core/i_mcode/U321  ( .A(\i_tv80_core/i_mcode/n357 ), .ZN(
        \i_tv80_core/i_mcode/n524 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U320  ( .A1(\i_tv80_core/i_mcode/n218 ), .A2(
        \i_tv80_core/i_mcode/n49 ), .ZN(\i_tv80_core/i_mcode/n357 ) );
  INV_X1 \i_tv80_core/i_mcode/U319  ( .A(\i_tv80_core/i_mcode/n219 ), .ZN(
        \i_tv80_core/i_mcode/n218 ) );
  OAI33_X1 \i_tv80_core/i_mcode/U318  ( .A1(\i_tv80_core/i_mcode/n426 ), .A2(
        \i_tv80_core/i_mcode/n706 ), .A3(\i_tv80_core/i_mcode/n854 ), .B1(
        \i_tv80_core/i_mcode/n657 ), .B2(\i_tv80_core/i_mcode/n185 ), .B3(
        \i_tv80_core/i_mcode/n547 ), .ZN(\i_tv80_core/i_mcode/n211 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U317  ( .A1(\i_tv80_core/i_mcode/n68 ), .A2(
        \i_tv80_core/i_mcode/n639 ), .ZN(\i_tv80_core/i_mcode/n547 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U316  ( .A1(\i_tv80_core/i_mcode/n109 ), .A2(
        \i_tv80_core/i_mcode/n168 ), .A3(\i_tv80_core/i_mcode/n175 ), .ZN(
        \i_tv80_core/i_mcode/n742 ) );
  INV_X1 \i_tv80_core/i_mcode/U315  ( .A(\i_tv80_core/i_mcode/n246 ), .ZN(
        \i_tv80_core/i_mcode/n194 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U314  ( .A1(\i_tv80_core/i_mcode/n744 ), .A2(
        \i_tv80_core/i_mcode/n743 ), .ZN(\i_tv80_core/i_mcode/n246 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U313  ( .A1(\i_tv80_core/i_mcode/n175 ), .A2(
        \i_tv80_core/i_mcode/n732 ), .A3(\i_tv80_core/i_mcode/n108 ), .ZN(
        \i_tv80_core/i_mcode/n743 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U312  ( .A1(\i_tv80_core/i_mcode/n109 ), .A2(
        \i_tv80_core/i_mcode/n703 ), .ZN(\i_tv80_core/i_mcode/n744 ) );
  INV_X1 \i_tv80_core/i_mcode/U311  ( .A(\i_tv80_core/i_mcode/n640 ), .ZN(
        \i_tv80_core/i_mcode/n657 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U310  ( .A1(\i_tv80_core/i_mcode/n606 ), .A2(
        \i_tv80_core/i_mcode/n50 ), .ZN(\i_tv80_core/i_mcode/n640 ) );
  INV_X1 \i_tv80_core/i_mcode/U309  ( .A(\i_tv80_core/n2180 ), .ZN(
        \i_tv80_core/i_mcode/n294 ) );
  INV_X1 \i_tv80_core/i_mcode/U308  ( .A(\i_tv80_core/n2179 ), .ZN(
        \i_tv80_core/i_mcode/n333 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U307  ( .A1(\i_tv80_core/ISet [0]), .A2(
        \i_tv80_core/i_mcode/n54 ), .ZN(\i_tv80_core/i_mcode/n854 ) );
  INV_X1 \i_tv80_core/i_mcode/U306  ( .A(\i_tv80_core/i_mcode/n873 ), .ZN(
        \i_tv80_core/i_mcode/n426 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U305  ( .A1(\i_tv80_core/i_mcode/n482 ), .A2(
        \i_tv80_core/i_mcode/n476 ), .ZN(\i_tv80_core/i_mcode/n873 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U304  ( .A1(\i_tv80_core/i_mcode/n484 ), .A2(
        \i_tv80_core/i_mcode/n409 ), .ZN(\i_tv80_core/i_mcode/n476 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U303  ( .A1(\i_tv80_core/i_mcode/n136 ), .A2(
        \i_tv80_core/i_mcode/n33 ), .ZN(\i_tv80_core/i_mcode/n484 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U302  ( .A1(\i_tv80_core/i_mcode/n168 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .A3(\i_tv80_core/i_mcode/n61 ), .ZN(
        \i_tv80_core/i_mcode/n307 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U301  ( .A1(\i_tv80_core/i_mcode/n175 ), .A2(
        \i_tv80_core/i_mcode/n732 ), .A3(\i_tv80_core/i_mcode/n141 ), .ZN(
        \i_tv80_core/i_mcode/n223 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U300  ( .A1(\i_tv80_core/i_mcode/n168 ), .A2(
        \i_tv80_core/i_mcode/n703 ), .A3(\i_tv80_core/i_mcode/n141 ), .ZN(
        \i_tv80_core/i_mcode/n656 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U299  ( .A1(\i_tv80_core/i_mcode/n703 ), .A2(
        \i_tv80_core/i_mcode/n732 ), .A3(\i_tv80_core/i_mcode/n141 ), .ZN(
        \i_tv80_core/i_mcode/n528 ) );
  INV_X1 \i_tv80_core/i_mcode/U298  ( .A(\i_tv80_core/IR [7]), .ZN(
        \i_tv80_core/i_mcode/n193 ) );
  INV_X1 \i_tv80_core/i_mcode/U297  ( .A(\i_tv80_core/i_mcode/n191 ), .ZN(
        \i_tv80_core/i_mcode/n482 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U296  ( .B1(\i_tv80_core/i_mcode/n310 ), .B2(
        \i_tv80_core/i_mcode/n309 ), .A(\i_tv80_core/i_mcode/n300 ), .ZN(
        \i_tv80_core/i_mcode/n191 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U295  ( .A1(\i_tv80_core/i_mcode/n321 ), .A2(
        \i_tv80_core/i_mcode/n409 ), .ZN(\i_tv80_core/i_mcode/n300 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U294  ( .A1(\i_tv80_core/i_mcode/n224 ), .A2(
        \i_tv80_core/i_mcode/n724 ), .A3(\i_tv80_core/i_mcode/n227 ), .ZN(
        \i_tv80_core/i_mcode/n321 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U293  ( .A1(\i_tv80_core/i_mcode/n154 ), .A2(
        \i_tv80_core/i_mcode/n171 ), .ZN(\i_tv80_core/i_mcode/n227 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U292  ( .A1(\i_tv80_core/i_mcode/n154 ), .A2(
        \i_tv80_core/i_mcode/n190 ), .ZN(\i_tv80_core/i_mcode/n224 ) );
  INV_X1 \i_tv80_core/i_mcode/U291  ( .A(\i_tv80_core/i_mcode/n84 ), .ZN(
        \i_tv80_core/i_mcode/n190 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U290  ( .A1(\i_tv80_core/i_mcode/n178 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .ZN(\i_tv80_core/i_mcode/n515 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U289  ( .A1(\i_tv80_core/IR [7]), .A2(
        \i_tv80_core/IR [6]), .ZN(\i_tv80_core/i_mcode/n751 ) );
  INV_X1 \i_tv80_core/i_mcode/U288  ( .A(\i_tv80_core/i_mcode/n409 ), .ZN(
        \i_tv80_core/i_mcode/n310 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U287  ( .A1(\i_tv80_core/i_mcode/n52 ), .A2(
        \i_tv80_core/i_mcode/n155 ), .ZN(\i_tv80_core/i_mcode/n219 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U286  ( .A1(\i_tv80_core/i_mcode/n58 ), .A2(
        \i_tv80_core/i_mcode/n102 ), .ZN(\i_tv80_core/i_mcode/n189 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U285  ( .A1(\i_tv80_core/i_mcode/n362 ), .A2(
        \i_tv80_core/i_mcode/n816 ), .ZN(\i_tv80_core/i_mcode/n587 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U284  ( .A1(\i_tv80_core/i_mcode/n768 ), .A2(
        \i_tv80_core/i_mcode/n312 ), .ZN(\i_tv80_core/i_mcode/n816 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U283  ( .A1(\i_tv80_core/i_mcode/n100 ), .A2(
        \i_tv80_core/i_mcode/n237 ), .ZN(\i_tv80_core/i_mcode/n312 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U282  ( .A1(\i_tv80_core/i_mcode/n140 ), .A2(
        \i_tv80_core/i_mcode/n250 ), .ZN(\i_tv80_core/i_mcode/n237 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U281  ( .A1(\i_tv80_core/i_mcode/n138 ), .A2(
        \i_tv80_core/i_mcode/n250 ), .ZN(\i_tv80_core/i_mcode/n700 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U280  ( .A1(\i_tv80_core/IR [1]), .A2(
        \i_tv80_core/IR [0]), .ZN(\i_tv80_core/i_mcode/n188 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U279  ( .A1(\i_tv80_core/i_mcode/n768 ), .A2(
        \i_tv80_core/i_mcode/n311 ), .ZN(\i_tv80_core/i_mcode/n362 ) );
  INV_X1 \i_tv80_core/i_mcode/U278  ( .A(\i_tv80_core/i_mcode/n767 ), .ZN(
        \i_tv80_core/i_mcode/n311 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U277  ( .A1(\i_tv80_core/i_mcode/n155 ), .A2(
        \i_tv80_core/i_mcode/n101 ), .ZN(\i_tv80_core/i_mcode/n767 ) );
  INV_X1 \i_tv80_core/i_mcode/U276  ( .A(\i_tv80_core/i_mcode/n766 ), .ZN(
        \i_tv80_core/i_mcode/n239 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U275  ( .A1(\i_tv80_core/ISet [1]), .A2(
        \i_tv80_core/i_mcode/n173 ), .ZN(\i_tv80_core/i_mcode/n766 ) );
  INV_X1 \i_tv80_core/i_mcode/U274  ( .A(\i_tv80_core/i_mcode/n722 ), .ZN(
        \i_tv80_core/i_mcode/n187 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U273  ( .A1(\i_tv80_core/i_mcode/n774 ), .A2(
        \i_tv80_core/i_mcode/n768 ), .ZN(\i_tv80_core/i_mcode/n722 ) );
  INV_X1 \i_tv80_core/i_mcode/U272  ( .A(\i_tv80_core/i_mcode/n724 ), .ZN(
        \i_tv80_core/i_mcode/n768 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U271  ( .A1(\i_tv80_core/i_mcode/n154 ), .A2(
        \i_tv80_core/i_mcode/n168 ), .ZN(\i_tv80_core/i_mcode/n724 ) );
  INV_X1 \i_tv80_core/i_mcode/U270  ( .A(\i_tv80_core/IR [6]), .ZN(
        \i_tv80_core/i_mcode/n192 ) );
  INV_X1 \i_tv80_core/i_mcode/U269  ( .A(\i_tv80_core/i_mcode/n835 ), .ZN(
        \i_tv80_core/i_mcode/n774 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U268  ( .A1(\i_tv80_core/i_mcode/n139 ), .A2(
        \i_tv80_core/i_mcode/n735 ), .ZN(\i_tv80_core/i_mcode/n835 ) );
  INV_X1 \i_tv80_core/i_mcode/U267  ( .A(\i_tv80_core/IR [2]), .ZN(
        \i_tv80_core/i_mcode/n735 ) );
  INV_X1 \i_tv80_core/i_mcode/U266  ( .A(\i_tv80_core/i_mcode/n55 ), .ZN(
        \i_tv80_core/i_mcode/n632 ) );
  INV_X1 \i_tv80_core/i_mcode/U265  ( .A(\i_tv80_core/IR [1]), .ZN(
        \i_tv80_core/i_mcode/n558 ) );
  INV_X2 \i_tv80_core/i_mcode/U264  ( .A(\i_tv80_core/i_mcode/n751 ), .ZN(
        \i_tv80_core/i_mcode/n733 ) );
  OAI221_X4 \i_tv80_core/i_mcode/U263  ( .B1(\i_tv80_core/i_mcode/n91 ), .B2(
        \i_tv80_core/i_mcode/n181 ), .C1(\i_tv80_core/i_mcode/n761 ), .C2(
        \i_tv80_core/i_mcode/n181 ), .A(\i_tv80_core/i_mcode/n760 ), .ZN(
        \i_tv80_core/IncDec_16 [2]) );
  INV_X1 \i_tv80_core/i_mcode/U262  ( .A(\i_tv80_core/i_mcode/n183 ), .ZN(
        \i_tv80_core/i_mcode/n182 ) );
  XNOR2_X1 \i_tv80_core/i_mcode/U261  ( .A(\i_tv80_core/i_mcode/n98 ), .B(
        \i_tv80_core/n114 ), .ZN(\i_tv80_core/i_mcode/n269 ) );
  XNOR2_X1 \i_tv80_core/i_mcode/U260  ( .A(\i_tv80_core/i_mcode/n566 ), .B(
        \i_tv80_core/F [2]), .ZN(\i_tv80_core/i_mcode/n267 ) );
  XNOR2_X1 \i_tv80_core/i_mcode/U259  ( .A(\i_tv80_core/IR [3]), .B(
        \i_tv80_core/F [6]), .ZN(\i_tv80_core/i_mcode/n266 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U258  ( .A1(\i_tv80_core/i_mcode/n506 ), .A2(
        \i_tv80_core/i_mcode/n59 ), .ZN(\i_tv80_core/i_mcode/n507 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U257  ( .B1(\i_tv80_core/i_mcode/n74 ), .B2(
        \i_tv80_core/i_mcode/n695 ), .A(\i_tv80_core/i_mcode/n694 ), .ZN(
        \i_tv80_core/i_mcode/n698 ) );
  AND2_X1 \i_tv80_core/i_mcode/U256  ( .A1(\i_tv80_core/i_mcode/n104 ), .A2(
        \i_tv80_core/i_mcode/n57 ), .ZN(\i_tv80_core/i_mcode/n179 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U255  ( .B1(\i_tv80_core/i_mcode/n511 ), .B2(
        \i_tv80_core/i_mcode/n510 ), .A(\i_tv80_core/i_mcode/n161 ), .ZN(
        \i_tv80_core/i_mcode/n536 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U254  ( .A1(\i_tv80_core/i_mcode/n177 ), .A2(
        \i_tv80_core/i_mcode/n111 ), .A3(\i_tv80_core/i_mcode/n692 ), .A4(
        \i_tv80_core/i_mcode/n877 ), .ZN(\i_tv80_core/i_mcode/n693 ) );
  BUF_X2 \i_tv80_core/i_mcode/U253  ( .A(\i_tv80_core/IR [4]), .Z(
        \i_tv80_core/i_mcode/n176 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U252  ( .A(\i_tv80_core/IR [4]), .Z(
        \i_tv80_core/i_mcode/n174 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U251  ( .A1(\i_tv80_core/i_mcode/n579 ), .A2(
        \i_tv80_core/i_mcode/n78 ), .ZN(\i_tv80_core/i_mcode/n531 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U250  ( .A1(\i_tv80_core/i_mcode/n78 ), .A2(
        \i_tv80_core/i_mcode/n586 ), .ZN(\i_tv80_core/i_mcode/n539 ) );
  INV_X1 \i_tv80_core/i_mcode/U249  ( .A(\i_tv80_core/IR [3]), .ZN(
        \i_tv80_core/i_mcode/n566 ) );
  INV_X1 \i_tv80_core/i_mcode/U248  ( .A(\i_tv80_core/IR [3]), .ZN(
        \i_tv80_core/i_mcode/n172 ) );
  AND2_X1 \i_tv80_core/i_mcode/U247  ( .A1(\i_tv80_core/i_mcode/n703 ), .A2(
        \i_tv80_core/i_mcode/n732 ), .ZN(\i_tv80_core/i_mcode/n171 ) );
  INV_X1 \i_tv80_core/i_mcode/U246  ( .A(\i_tv80_core/i_mcode/n174 ), .ZN(
        \i_tv80_core/i_mcode/n703 ) );
  INV_X1 \i_tv80_core/i_mcode/U245  ( .A(\i_tv80_core/i_mcode/n175 ), .ZN(
        \i_tv80_core/i_mcode/n169 ) );
  AND2_X1 \i_tv80_core/i_mcode/U244  ( .A1(\i_tv80_core/i_mcode/n713 ), .A2(
        \i_tv80_core/i_mcode/n159 ), .ZN(\i_tv80_core/i_mcode/n166 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U243  ( .A1(\i_tv80_core/i_mcode/n266 ), .A2(
        \i_tv80_core/i_mcode/n732 ), .ZN(\i_tv80_core/i_mcode/n165 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U242  ( .A1(\i_tv80_core/i_mcode/n173 ), .A2(
        \i_tv80_core/i_mcode/n800 ), .ZN(\i_tv80_core/i_mcode/n694 ) );
  INV_X1 \i_tv80_core/i_mcode/U241  ( .A(\i_tv80_core/i_mcode/n804 ), .ZN(
        \i_tv80_core/i_mcode/n162 ) );
  BUF_X2 \i_tv80_core/i_mcode/U240  ( .A(\i_tv80_core/i_mcode/n160 ), .Z(
        \i_tv80_core/i_mcode/n161 ) );
  BUF_X2 \i_tv80_core/i_mcode/U239  ( .A(\i_tv80_core/ISet [1]), .Z(
        \i_tv80_core/i_mcode/n160 ) );
  INV_X1 \i_tv80_core/i_mcode/U238  ( .A(\i_tv80_core/i_mcode/n183 ), .ZN(
        \i_tv80_core/i_mcode/n180 ) );
  CLKBUF_X3 \i_tv80_core/i_mcode/U237  ( .A(\i_tv80_core/i_mcode/n180 ), .Z(
        \i_tv80_core/i_mcode/n159 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U236  ( .A(\i_tv80_core/i_mcode/n37 ), .Z(
        \i_tv80_core/i_mcode/n157 ) );
  AND2_X1 \i_tv80_core/i_mcode/U235  ( .A1(\i_tv80_core/i_mcode/n99 ), .A2(
        \i_tv80_core/i_mcode/n79 ), .ZN(\i_tv80_core/i_mcode/n156 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U234  ( .A1(\i_tv80_core/i_mcode/n529 ), .A2(
        \i_tv80_core/i_mcode/n571 ), .ZN(\i_tv80_core/i_mcode/n530 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U233  ( .C1(\i_tv80_core/i_mcode/n666 ), .C2(
        \i_tv80_core/i_mcode/n574 ), .A(\i_tv80_core/i_mcode/n531 ), .B(
        \i_tv80_core/i_mcode/n530 ), .ZN(\i_tv80_core/i_mcode/n532 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U232  ( .B1(\i_tv80_core/i_mcode/n541 ), .B2(
        \i_tv80_core/i_mcode/n532 ), .A(\i_tv80_core/i_mcode/n163 ), .ZN(
        \i_tv80_core/i_mcode/n533 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U231  ( .A1(\i_tv80_core/i_mcode/n538 ), .A2(
        \i_tv80_core/i_mcode/n537 ), .ZN(\i_tv80_core/i_mcode/n540 ) );
  AND2_X1 \i_tv80_core/i_mcode/U230  ( .A1(\i_tv80_core/IR [3]), .A2(
        \i_tv80_core/IR [2]), .ZN(\i_tv80_core/i_mcode/n153 ) );
  AND2_X1 \i_tv80_core/i_mcode/U229  ( .A1(\i_tv80_core/n2180 ), .A2(
        \i_tv80_core/i_mcode/n333 ), .ZN(\i_tv80_core/i_mcode/n152 ) );
  OR2_X1 \i_tv80_core/i_mcode/U228  ( .A1(\i_tv80_core/i_mcode/n267 ), .A2(
        \i_tv80_core/i_mcode/n516 ), .ZN(\i_tv80_core/i_mcode/n177 ) );
  AND3_X1 \i_tv80_core/i_mcode/U227  ( .A1(\i_tv80_core/i_mcode/n339 ), .A2(
        \i_tv80_core/i_mcode/n854 ), .A3(\i_tv80_core/i_mcode/n234 ), .ZN(
        \i_tv80_core/i_mcode/n151 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U226  ( .A1(\i_tv80_core/i_mcode/n503 ), .A2(
        \i_tv80_core/i_mcode/n547 ), .ZN(\i_tv80_core/i_mcode/n511 ) );
  INV_X1 \i_tv80_core/i_mcode/U225  ( .A(\i_tv80_core/i_mcode/n595 ), .ZN(
        \i_tv80_core/i_mcode/n506 ) );
  AOI22_X1 \i_tv80_core/i_mcode/U224  ( .A1(\i_tv80_core/i_mcode/n655 ), .A2(
        \i_tv80_core/i_mcode/n53 ), .B1(\i_tv80_core/i_mcode/n836 ), .B2(
        \i_tv80_core/i_mcode/n546 ), .ZN(\i_tv80_core/i_mcode/n509 ) );
  OAI211_X1 \i_tv80_core/i_mcode/U223  ( .C1(\i_tv80_core/i_mcode/n509 ), .C2(
        \i_tv80_core/i_mcode/n630 ), .A(\i_tv80_core/i_mcode/n508 ), .B(
        \i_tv80_core/i_mcode/n507 ), .ZN(\i_tv80_core/i_mcode/n510 ) );
  AND2_X1 \i_tv80_core/i_mcode/U222  ( .A1(\i_tv80_core/i_mcode/n153 ), .A2(
        \i_tv80_core/i_mcode/n139 ), .ZN(\i_tv80_core/i_mcode/n150 ) );
  AND2_X1 \i_tv80_core/i_mcode/U221  ( .A1(\i_tv80_core/i_mcode/n104 ), .A2(
        \i_tv80_core/i_mcode/n3 ), .ZN(\i_tv80_core/i_mcode/n149 ) );
  AND2_X1 \i_tv80_core/i_mcode/U220  ( .A1(\i_tv80_core/i_mcode/n2 ), .A2(
        \i_tv80_core/i_mcode/n527 ), .ZN(\i_tv80_core/i_mcode/n148 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U219  ( .B1(\i_tv80_core/i_mcode/n14 ), .B2(
        \i_tv80_core/i_mcode/n519 ), .A(\i_tv80_core/i_mcode/n670 ), .ZN(
        \i_tv80_core/i_mcode/n534 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U218  ( .B1(\i_tv80_core/i_mcode/n513 ), .B2(
        \i_tv80_core/i_mcode/n512 ), .A(\i_tv80_core/i_mcode/n40 ), .ZN(
        \i_tv80_core/i_mcode/n535 ) );
  NAND4_X1 \i_tv80_core/i_mcode/U217  ( .A1(\i_tv80_core/i_mcode/n536 ), .A2(
        \i_tv80_core/i_mcode/n535 ), .A3(\i_tv80_core/i_mcode/n534 ), .A4(
        \i_tv80_core/i_mcode/n533 ), .ZN(\i_tv80_core/i_mcode/n537 ) );
  INV_X1 \i_tv80_core/i_mcode/U216  ( .A(\i_tv80_core/i_mcode/n173 ), .ZN(
        \i_tv80_core/i_mcode/n706 ) );
  AND2_X1 \i_tv80_core/i_mcode/U215  ( .A1(\i_tv80_core/i_mcode/n794 ), .A2(
        \i_tv80_core/i_mcode/n324 ), .ZN(\i_tv80_core/i_mcode/n146 ) );
  OR2_X1 \i_tv80_core/i_mcode/U214  ( .A1(\i_tv80_core/i_mcode/n289 ), .A2(
        \i_tv80_core/i_mcode/n854 ), .ZN(\i_tv80_core/i_mcode/n145 ) );
  MUX2_X1 \i_tv80_core/i_mcode/U213  ( .A(\i_tv80_core/i_mcode/n145 ), .B(
        \i_tv80_core/i_mcode/n146 ), .S(\i_tv80_core/i_mcode/n824 ), .Z(
        \i_tv80_core/i_mcode/n144 ) );
  INV_X1 \i_tv80_core/i_mcode/U212  ( .A(\i_tv80_core/i_mcode/n177 ), .ZN(
        \i_tv80_core/i_mcode/n690 ) );
  AND2_X1 \i_tv80_core/i_mcode/U211  ( .A1(\i_tv80_core/i_mcode/n186 ), .A2(
        \i_tv80_core/i_mcode/n251 ), .ZN(\i_tv80_core/i_mcode/n142 ) );
  OR2_X1 \i_tv80_core/i_mcode/U210  ( .A1(\i_tv80_core/i_mcode/n804 ), .A2(
        \i_tv80_core/i_mcode/n54 ), .ZN(\i_tv80_core/i_mcode/n765 ) );
  AND2_X1 \i_tv80_core/i_mcode/U209  ( .A1(\i_tv80_core/i_mcode/n102 ), .A2(
        \i_tv80_core/i_mcode/n735 ), .ZN(\i_tv80_core/i_mcode/n140 ) );
  AND2_X1 \i_tv80_core/i_mcode/U208  ( .A1(\i_tv80_core/IR [3]), .A2(
        \i_tv80_core/i_mcode/n735 ), .ZN(\i_tv80_core/i_mcode/n138 ) );
  OR2_X1 \i_tv80_core/i_mcode/U207  ( .A1(\i_tv80_core/i_mcode/n178 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .ZN(\i_tv80_core/i_mcode/n516 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U206  ( .A1(\i_tv80_core/i_mcode/n666 ), .A2(
        \i_tv80_core/i_mcode/n616 ), .ZN(\i_tv80_core/i_mcode/n513 ) );
  AND2_X1 \i_tv80_core/i_mcode/U205  ( .A1(\i_tv80_core/i_mcode/n452 ), .A2(
        \i_tv80_core/i_mcode/n451 ), .ZN(\i_tv80_core/i_mcode/n137 ) );
  INV_X1 \i_tv80_core/i_mcode/U204  ( .A(\i_tv80_core/i_mcode/n38 ), .ZN(
        \i_tv80_core/i_mcode/n845 ) );
  INV_X1 \i_tv80_core/i_mcode/U203  ( .A(\i_tv80_core/i_mcode/n171 ), .ZN(
        \i_tv80_core/i_mcode/n514 ) );
  AND3_X1 \i_tv80_core/i_mcode/U202  ( .A1(\i_tv80_core/i_mcode/n528 ), .A2(
        \i_tv80_core/i_mcode/n656 ), .A3(\i_tv80_core/i_mcode/n5 ), .ZN(
        \i_tv80_core/i_mcode/n136 ) );
  AND3_X1 \i_tv80_core/i_mcode/U201  ( .A1(\i_tv80_core/i_mcode/n338 ), .A2(
        \i_tv80_core/i_mcode/n337 ), .A3(\i_tv80_core/i_mcode/n618 ), .ZN(
        \i_tv80_core/i_mcode/n135 ) );
  AND3_X1 \i_tv80_core/i_mcode/U200  ( .A1(\i_tv80_core/i_mcode/n443 ), .A2(
        \i_tv80_core/i_mcode/n411 ), .A3(\i_tv80_core/i_mcode/n464 ), .ZN(
        \i_tv80_core/i_mcode/n134 ) );
  AND2_X1 \i_tv80_core/i_mcode/U199  ( .A1(\i_tv80_core/i_mcode/n100 ), .A2(
        \i_tv80_core/i_mcode/n242 ), .ZN(\i_tv80_core/i_mcode/n133 ) );
  BUF_X1 \i_tv80_core/i_mcode/U198  ( .A(\i_tv80_core/i_mcode/n142 ), .Z(
        \i_tv80_core/i_mcode/n184 ) );
  BUF_X1 \i_tv80_core/i_mcode/U197  ( .A(\i_tv80_core/i_mcode/n142 ), .Z(
        \i_tv80_core/i_mcode/n183 ) );
  AND2_X1 \i_tv80_core/i_mcode/U196  ( .A1(\i_tv80_core/i_mcode/n239 ), .A2(
        \i_tv80_core/i_mcode/n587 ), .ZN(\i_tv80_core/I_BTR ) );
  AND2_X1 \i_tv80_core/i_mcode/U195  ( .A1(\i_tv80_core/i_mcode/n187 ), .A2(
        \i_tv80_core/i_mcode/n239 ), .ZN(\i_tv80_core/I_BT ) );
  NAND2_X1 \i_tv80_core/i_mcode/U194  ( .A1(\i_tv80_core/i_mcode/n879 ), .A2(
        \i_tv80_core/i_mcode/n542 ), .ZN(\i_tv80_core/i_mcode/n519 ) );
  AND2_X1 \i_tv80_core/i_mcode/U193  ( .A1(\i_tv80_core/i_mcode/n256 ), .A2(
        \i_tv80_core/i_mcode/n161 ), .ZN(\i_tv80_core/Special_LD [2]) );
  AND2_X1 \i_tv80_core/i_mcode/U192  ( .A1(\i_tv80_core/i_mcode/n323 ), .A2(
        \i_tv80_core/i_mcode/n312 ), .ZN(\i_tv80_core/i_mcode/n129 ) );
  AND2_X1 \i_tv80_core/i_mcode/U191  ( .A1(\i_tv80_core/i_mcode/n432 ), .A2(
        \i_tv80_core/i_mcode/n614 ), .ZN(\i_tv80_core/i_mcode/n128 ) );
  AND2_X1 \i_tv80_core/i_mcode/U190  ( .A1(\i_tv80_core/i_mcode/n258 ), .A2(
        \i_tv80_core/i_mcode/n323 ), .ZN(\i_tv80_core/LDSPHL ) );
  AND2_X1 \i_tv80_core/i_mcode/U189  ( .A1(\i_tv80_core/i_mcode/n409 ), .A2(
        \i_tv80_core/i_mcode/n639 ), .ZN(\i_tv80_core/i_mcode/n126 ) );
  AND2_X1 \i_tv80_core/i_mcode/U188  ( .A1(\i_tv80_core/i_mcode/n323 ), .A2(
        \i_tv80_core/i_mcode/n157 ), .ZN(\i_tv80_core/i_mcode/n125 ) );
  AND2_X1 \i_tv80_core/i_mcode/U187  ( .A1(\i_tv80_core/i_mcode/n814 ), .A2(
        \i_tv80_core/i_mcode/n324 ), .ZN(\i_tv80_core/i_mcode/n124 ) );
  INV_X1 \i_tv80_core/i_mcode/U186  ( .A(\i_tv80_core/i_mcode/n183 ), .ZN(
        \i_tv80_core/i_mcode/n181 ) );
  AND2_X1 \i_tv80_core/i_mcode/U185  ( .A1(\i_tv80_core/i_mcode/n386 ), .A2(
        \i_tv80_core/i_mcode/n161 ), .ZN(\i_tv80_core/i_mcode/n120 ) );
  AND4_X1 \i_tv80_core/i_mcode/U184  ( .A1(\i_tv80_core/i_mcode/n554 ), .A2(
        \i_tv80_core/i_mcode/n553 ), .A3(\i_tv80_core/i_mcode/n116 ), .A4(
        \i_tv80_core/i_mcode/n793 ), .ZN(\i_tv80_core/i_mcode/n119 ) );
  AND2_X1 \i_tv80_core/i_mcode/U183  ( .A1(\i_tv80_core/i_mcode/n857 ), .A2(
        \i_tv80_core/i_mcode/n160 ), .ZN(\i_tv80_core/i_mcode/n118 ) );
  AND3_X1 \i_tv80_core/i_mcode/U182  ( .A1(\i_tv80_core/i_mcode/n848 ), .A2(
        \i_tv80_core/i_mcode/n436 ), .A3(\i_tv80_core/i_mcode/n435 ), .ZN(
        \i_tv80_core/i_mcode/n117 ) );
  AND2_X1 \i_tv80_core/i_mcode/U181  ( .A1(\i_tv80_core/i_mcode/n723 ), .A2(
        \i_tv80_core/i_mcode/n722 ), .ZN(\i_tv80_core/i_mcode/n116 ) );
  AND4_X1 \i_tv80_core/i_mcode/U180  ( .A1(\i_tv80_core/i_mcode/n297 ), .A2(
        \i_tv80_core/i_mcode/n367 ), .A3(\i_tv80_core/i_mcode/n1 ), .A4(
        \i_tv80_core/i_mcode/n296 ), .ZN(\i_tv80_core/i_mcode/n115 ) );
  AND2_X1 \i_tv80_core/i_mcode/U179  ( .A1(\i_tv80_core/i_mcode/n282 ), .A2(
        \i_tv80_core/i_mcode/n281 ), .ZN(\i_tv80_core/i_mcode/n114 ) );
  INV_X1 \i_tv80_core/i_mcode/U178  ( .A(\i_tv80_core/i_mcode/n158 ), .ZN(
        \i_tv80_core/i_mcode/n113 ) );
  BUF_X2 \i_tv80_core/i_mcode/U177  ( .A(\i_tv80_core/i_mcode/n184 ), .Z(
        \i_tv80_core/i_mcode/n163 ) );
  NOR4_X2 \i_tv80_core/i_mcode/U176  ( .A1(\i_tv80_core/i_mcode/n265 ), .A2(
        \i_tv80_core/i_mcode/n252 ), .A3(\i_tv80_core/i_mcode/n161 ), .A4(
        \i_tv80_core/i_mcode/n172 ), .ZN(\i_tv80_core/ExchangeDH ) );
  INV_X1 \i_tv80_core/i_mcode/U175  ( .A(\i_tv80_core/n2179 ), .ZN(
        \i_tv80_core/i_mcode/n110 ) );
  AND2_X1 \i_tv80_core/i_mcode/U174  ( .A1(\i_tv80_core/i_mcode/n48 ), .A2(
        \i_tv80_core/i_mcode/n193 ), .ZN(\i_tv80_core/i_mcode/n108 ) );
  INV_X2 \i_tv80_core/i_mcode/U173  ( .A(\i_tv80_core/n2178 ), .ZN(
        \i_tv80_core/i_mcode/n564 ) );
  AND3_X1 \i_tv80_core/i_mcode/U172  ( .A1(\i_tv80_core/i_mcode/n714 ), .A2(
        \i_tv80_core/i_mcode/n718 ), .A3(\i_tv80_core/i_mcode/n654 ), .ZN(
        \i_tv80_core/i_mcode/n107 ) );
  INV_X1 \i_tv80_core/i_mcode/U171  ( .A(\i_tv80_core/i_mcode/n60 ), .ZN(
        \i_tv80_core/i_mcode/n702 ) );
  INV_X1 \i_tv80_core/i_mcode/U170  ( .A(\i_tv80_core/IR [5]), .ZN(
        \i_tv80_core/i_mcode/n178 ) );
  INV_X1 \i_tv80_core/i_mcode/U169  ( .A(\i_tv80_core/i_mcode/n877 ), .ZN(
        \i_tv80_core/i_mcode/n800 ) );
  BUF_X1 \i_tv80_core/i_mcode/U168  ( .A(\i_tv80_core/i_mcode/n294 ), .Z(
        \i_tv80_core/i_mcode/n105 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U167  ( .A(\i_tv80_core/i_mcode/n186 ), .Z(
        \i_tv80_core/i_mcode/n185 ) );
  AND2_X1 \i_tv80_core/i_mcode/U166  ( .A1(\i_tv80_core/i_mcode/n91 ), .A2(
        \i_tv80_core/i_mcode/n761 ), .ZN(\i_tv80_core/i_mcode/n103 ) );
  INV_X1 \i_tv80_core/i_mcode/U165  ( .A(\i_tv80_core/IR [3]), .ZN(
        \i_tv80_core/i_mcode/n102 ) );
  INV_X1 \i_tv80_core/i_mcode/U164  ( .A(\i_tv80_core/IR [2]), .ZN(
        \i_tv80_core/i_mcode/n101 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U163  ( .A1(\i_tv80_core/i_mcode/n138 ), .A2(
        \i_tv80_core/i_mcode/n250 ), .ZN(\i_tv80_core/i_mcode/n100 ) );
  INV_X1 \i_tv80_core/i_mcode/U162  ( .A(\i_tv80_core/IR [3]), .ZN(
        \i_tv80_core/i_mcode/n98 ) );
  OR2_X1 \i_tv80_core/i_mcode/U161  ( .A1(\i_tv80_core/i_mcode/n269 ), .A2(
        \i_tv80_core/i_mcode/n515 ), .ZN(\i_tv80_core/i_mcode/n111 ) );
  INV_X1 \i_tv80_core/i_mcode/U160  ( .A(\i_tv80_core/i_mcode/n93 ), .ZN(
        \i_tv80_core/i_mcode/n691 ) );
  XNOR2_X1 \i_tv80_core/i_mcode/U159  ( .A(\i_tv80_core/n2179 ), .B(
        \i_tv80_core/n2180 ), .ZN(\i_tv80_core/i_mcode/n97 ) );
  NOR2_X2 \i_tv80_core/i_mcode/U158  ( .A1(\i_tv80_core/i_mcode/n97 ), .A2(
        \i_tv80_core/i_mcode/n99 ), .ZN(\i_tv80_core/i_mcode/n96 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U157  ( .A(\i_tv80_core/IR [1]), .Z(
        \i_tv80_core/i_mcode/n95 ) );
  OR2_X1 \i_tv80_core/i_mcode/U156  ( .A1(\i_tv80_core/i_mcode/n165 ), .A2(
        \i_tv80_core/i_mcode/n19 ), .ZN(\i_tv80_core/i_mcode/n94 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U155  ( .A(\i_tv80_core/i_mcode/n111 ), .Z(
        \i_tv80_core/i_mcode/n93 ) );
  INV_X1 \i_tv80_core/i_mcode/U154  ( .A(\i_tv80_core/i_mcode/n21 ), .ZN(
        \i_tv80_core/i_mcode/n92 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U153  ( .B1(\i_tv80_core/i_mcode/n698 ), .B2(
        \i_tv80_core/i_mcode/n884 ), .A(\i_tv80_core/i_mcode/n167 ), .ZN(
        \i_tv80_core/i_mcode/n762 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U152  ( .B1(\i_tv80_core/i_mcode/n87 ), .B2(
        \i_tv80_core/i_mcode/n884 ), .A(\i_tv80_core/i_mcode/n167 ), .ZN(
        \i_tv80_core/i_mcode/n91 ) );
  NOR3_X1 \i_tv80_core/i_mcode/U151  ( .A1(\i_tv80_core/i_mcode/n782 ), .A2(
        \i_tv80_core/i_mcode/n90 ), .A3(\i_tv80_core/i_mcode/n89 ), .ZN(
        \i_tv80_core/i_mcode/n786 ) );
  AND2_X1 \i_tv80_core/i_mcode/U150  ( .A1(\i_tv80_core/i_mcode/n784 ), .A2(
        \i_tv80_core/i_mcode/n783 ), .ZN(\i_tv80_core/i_mcode/n90 ) );
  AND2_X1 \i_tv80_core/i_mcode/U149  ( .A1(\i_tv80_core/i_mcode/n785 ), .A2(
        \i_tv80_core/i_mcode/n8 ), .ZN(\i_tv80_core/i_mcode/n89 ) );
  OR2_X1 \i_tv80_core/i_mcode/U148  ( .A1(\i_tv80_core/i_mcode/n163 ), .A2(
        \i_tv80_core/i_mcode/n789 ), .ZN(\i_tv80_core/i_mcode/n88 ) );
  AOI21_X1 \i_tv80_core/i_mcode/U147  ( .B1(\i_tv80_core/i_mcode/n20 ), .B2(
        \i_tv80_core/i_mcode/n695 ), .A(\i_tv80_core/i_mcode/n694 ), .ZN(
        \i_tv80_core/i_mcode/n87 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U146  ( .A1(\i_tv80_core/i_mcode/n86 ), .A2(
        \i_tv80_core/i_mcode/n567 ), .ZN(\i_tv80_core/i_mcode/n777 ) );
  OR2_X1 \i_tv80_core/i_mcode/U145  ( .A1(\i_tv80_core/i_mcode/n173 ), .A2(
        \i_tv80_core/i_mcode/n568 ), .ZN(\i_tv80_core/i_mcode/n86 ) );
  INV_X1 \i_tv80_core/i_mcode/U144  ( .A(\i_tv80_core/i_mcode/n565 ), .ZN(
        \i_tv80_core/i_mcode/n85 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U143  ( .A1(\i_tv80_core/i_mcode/n62 ), .A2(
        \i_tv80_core/i_mcode/n812 ), .A3(\i_tv80_core/i_mcode/n25 ), .ZN(
        \i_tv80_core/i_mcode/n687 ) );
  AOI221_X4 \i_tv80_core/i_mcode/U142  ( .B1(\i_tv80_core/i_mcode/n481 ), .B2(
        \i_tv80_core/i_mcode/n480 ), .C1(\i_tv80_core/i_mcode/n479 ), .C2(
        \i_tv80_core/i_mcode/n81 ), .A(\i_tv80_core/i_mcode/n478 ), .ZN(
        \i_tv80_core/i_mcode/n483 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U141  ( .A1(\i_tv80_core/i_mcode/n178 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .ZN(\i_tv80_core/i_mcode/n84 ) );
  AND3_X1 \i_tv80_core/i_mcode/U140  ( .A1(\i_tv80_core/i_mcode/n221 ), .A2(
        \i_tv80_core/i_mcode/n240 ), .A3(\i_tv80_core/i_mcode/n684 ), .ZN(
        \i_tv80_core/i_mcode/n688 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U139  ( .A1(\i_tv80_core/i_mcode/n294 ), .A2(
        \i_tv80_core/i_mcode/n333 ), .A3(\i_tv80_core/i_mcode/n99 ), .ZN(
        \i_tv80_core/i_mcode/n877 ) );
  INV_X1 \i_tv80_core/i_mcode/U138  ( .A(\i_tv80_core/i_mcode/n106 ), .ZN(
        \i_tv80_core/i_mcode/n83 ) );
  BUF_X2 \i_tv80_core/i_mcode/U137  ( .A(\i_tv80_core/i_mcode/n184 ), .Z(
        \i_tv80_core/i_mcode/n164 ) );
  INV_X1 \i_tv80_core/i_mcode/U136  ( .A(\i_tv80_core/i_mcode/n26 ), .ZN(
        \i_tv80_core/i_mcode/n80 ) );
  INV_X1 \i_tv80_core/i_mcode/U135  ( .A(\i_tv80_core/i_mcode/n333 ), .ZN(
        \i_tv80_core/i_mcode/n79 ) );
  NOR2_X2 \i_tv80_core/i_mcode/U134  ( .A1(\i_tv80_core/IR [1]), .A2(
        \i_tv80_core/IR [0]), .ZN(\i_tv80_core/i_mcode/n139 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U133  ( .A1(\i_tv80_core/i_mcode/n685 ), .A2(
        \i_tv80_core/i_mcode/n733 ), .ZN(\i_tv80_core/i_mcode/n821 ) );
  INV_X2 \i_tv80_core/i_mcode/U132  ( .A(\i_tv80_core/i_mcode/n877 ), .ZN(
        \i_tv80_core/i_mcode/n106 ) );
  INV_X1 \i_tv80_core/i_mcode/U131  ( .A(\i_tv80_core/i_mcode/n76 ), .ZN(
        \i_tv80_core/i_mcode/n77 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U130  ( .A(\i_tv80_core/i_mcode/n734 ), .Z(
        \i_tv80_core/i_mcode/n76 ) );
  OR2_X1 \i_tv80_core/i_mcode/U129  ( .A1(\i_tv80_core/i_mcode/n840 ), .A2(
        \i_tv80_core/i_mcode/n669 ), .ZN(\i_tv80_core/i_mcode/n711 ) );
  AND2_X1 \i_tv80_core/i_mcode/U128  ( .A1(\i_tv80_core/i_mcode/n733 ), .A2(
        \i_tv80_core/i_mcode/n139 ), .ZN(\i_tv80_core/i_mcode/n75 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U127  ( .A1(\i_tv80_core/i_mcode/n693 ), .A2(
        \i_tv80_core/i_mcode/n24 ), .ZN(\i_tv80_core/i_mcode/n74 ) );
  AND3_X2 \i_tv80_core/i_mcode/U126  ( .A1(\i_tv80_core/n2180 ), .A2(
        \i_tv80_core/i_mcode/n564 ), .A3(\i_tv80_core/n2179 ), .ZN(
        \i_tv80_core/i_mcode/n173 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U125  ( .A(\i_tv80_core/IR [3]), .Z(
        \i_tv80_core/i_mcode/n73 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U124  ( .A1(\i_tv80_core/i_mcode/n71 ), .A2(
        \i_tv80_core/i_mcode/n72 ), .A3(\i_tv80_core/i_mcode/n730 ), .ZN(
        \i_tv80_core/IncDec_16 [1]) );
  OR2_X1 \i_tv80_core/i_mcode/U123  ( .A1(\i_tv80_core/i_mcode/n166 ), .A2(
        \i_tv80_core/i_mcode/n731 ), .ZN(\i_tv80_core/i_mcode/n72 ) );
  OR2_X1 \i_tv80_core/i_mcode/U122  ( .A1(\i_tv80_core/i_mcode/n732 ), .A2(
        \i_tv80_core/i_mcode/n827 ), .ZN(\i_tv80_core/i_mcode/n71 ) );
  OAI21_X1 \i_tv80_core/i_mcode/U121  ( .B1(\i_tv80_core/i_mcode/n32 ), .B2(
        \i_tv80_core/i_mcode/n773 ), .A(\i_tv80_core/i_mcode/n772 ), .ZN(
        \i_tv80_core/i_mcode/n787 ) );
  AND2_X1 \i_tv80_core/i_mcode/U120  ( .A1(\i_tv80_core/i_mcode/n788 ), .A2(
        \i_tv80_core/i_mcode/n787 ), .ZN(\i_tv80_core/i_mcode/n70 ) );
  INV_X2 \i_tv80_core/i_mcode/U119  ( .A(\i_tv80_core/i_mcode/n188 ), .ZN(
        \i_tv80_core/i_mcode/n250 ) );
  BUF_X1 \i_tv80_core/i_mcode/U118  ( .A(\i_tv80_core/i_mcode/n780 ), .Z(
        \i_tv80_core/i_mcode/n69 ) );
  AND2_X1 \i_tv80_core/i_mcode/U117  ( .A1(\i_tv80_core/i_mcode/n140 ), .A2(
        \i_tv80_core/i_mcode/n250 ), .ZN(\i_tv80_core/i_mcode/n68 ) );
  BUF_X1 \i_tv80_core/i_mcode/U116  ( .A(\i_tv80_core/i_mcode/n102 ), .Z(
        \i_tv80_core/i_mcode/n67 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U115  ( .A(\i_tv80_core/IR [7]), .Z(
        \i_tv80_core/i_mcode/n66 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U114  ( .A1(\i_tv80_core/IR [6]), .A2(
        \i_tv80_core/IR [7]), .ZN(\i_tv80_core/i_mcode/n141 ) );
  OR2_X2 \i_tv80_core/i_mcode/U113  ( .A1(\i_tv80_core/i_mcode/n739 ), .A2(
        \i_tv80_core/i_mcode/n309 ), .ZN(\i_tv80_core/i_mcode/n654 ) );
  INV_X1 \i_tv80_core/i_mcode/U112  ( .A(\i_tv80_core/i_mcode/n175 ), .ZN(
        \i_tv80_core/i_mcode/n65 ) );
  AND2_X1 \i_tv80_core/i_mcode/U111  ( .A1(\i_tv80_core/i_mcode/n732 ), .A2(
        \i_tv80_core/i_mcode/n65 ), .ZN(\i_tv80_core/i_mcode/n64 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U110  ( .A1(\i_tv80_core/i_mcode/n266 ), .A2(
        \i_tv80_core/i_mcode/n64 ), .ZN(\i_tv80_core/i_mcode/n692 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U109  ( .A1(\i_tv80_core/i_mcode/n847 ), .A2(
        \i_tv80_core/i_mcode/n28 ), .ZN(\i_tv80_core/i_mcode/n397 ) );
  INV_X1 \i_tv80_core/i_mcode/U108  ( .A(\i_tv80_core/i_mcode/n265 ), .ZN(
        \i_tv80_core/i_mcode/n63 ) );
  INV_X2 \i_tv80_core/i_mcode/U107  ( .A(\i_tv80_core/IR [5]), .ZN(
        \i_tv80_core/i_mcode/n732 ) );
  AND2_X2 \i_tv80_core/i_mcode/U106  ( .A1(\i_tv80_core/i_mcode/n152 ), .A2(
        \i_tv80_core/i_mcode/n99 ), .ZN(\i_tv80_core/i_mcode/n62 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U105  ( .A1(\i_tv80_core/i_mcode/n865 ), .A2(
        \i_tv80_core/i_mcode/n29 ), .ZN(\i_tv80_core/i_mcode/n788 ) );
  AND3_X1 \i_tv80_core/i_mcode/U104  ( .A1(\i_tv80_core/i_mcode/n96 ), .A2(
        \i_tv80_core/i_mcode/n697 ), .A3(\i_tv80_core/i_mcode/n39 ), .ZN(
        \i_tv80_core/i_mcode/n167 ) );
  INV_X1 \i_tv80_core/i_mcode/U103  ( .A(\i_tv80_core/i_mcode/n26 ), .ZN(
        \i_tv80_core/i_mcode/n81 ) );
  AND3_X1 \i_tv80_core/i_mcode/U102  ( .A1(\i_tv80_core/i_mcode/n714 ), .A2(
        \i_tv80_core/i_mcode/n718 ), .A3(\i_tv80_core/i_mcode/n654 ), .ZN(
        \i_tv80_core/i_mcode/n60 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U101  ( .A1(\i_tv80_core/i_mcode/n85 ), .A2(
        \i_tv80_core/i_mcode/n153 ), .ZN(\i_tv80_core/i_mcode/n57 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U100  ( .A1(\i_tv80_core/i_mcode/n101 ), .A2(
        \i_tv80_core/i_mcode/n172 ), .A3(\i_tv80_core/i_mcode/n82 ), .ZN(
        \i_tv80_core/i_mcode/n56 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U99  ( .A(\i_tv80_core/IR [0]), .Z(
        \i_tv80_core/i_mcode/n55 ) );
  INV_X1 \i_tv80_core/i_mcode/U98  ( .A(\i_tv80_core/ISet [1]), .ZN(
        \i_tv80_core/i_mcode/n186 ) );
  INV_X1 \i_tv80_core/i_mcode/U97  ( .A(\i_tv80_core/ISet [1]), .ZN(
        \i_tv80_core/i_mcode/n54 ) );
  BUF_X1 \i_tv80_core/i_mcode/U96  ( .A(\i_tv80_core/i_mcode/n37 ), .Z(
        \i_tv80_core/i_mcode/n158 ) );
  BUF_X2 \i_tv80_core/i_mcode/U95  ( .A(\i_tv80_core/IR [5]), .Z(
        \i_tv80_core/i_mcode/n168 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U94  ( .A1(\i_tv80_core/i_mcode/n741 ), .A2(
        \i_tv80_core/i_mcode/n774 ), .A3(\i_tv80_core/i_mcode/n27 ), .ZN(
        \i_tv80_core/i_mcode/n748 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U93  ( .A(\i_tv80_core/i_mcode/n173 ), .Z(
        \i_tv80_core/i_mcode/n53 ) );
  AND2_X1 \i_tv80_core/i_mcode/U92  ( .A1(\i_tv80_core/i_mcode/n58 ), .A2(
        \i_tv80_core/i_mcode/n102 ), .ZN(\i_tv80_core/i_mcode/n52 ) );
  INV_X1 \i_tv80_core/i_mcode/U91  ( .A(\i_tv80_core/i_mcode/n299 ), .ZN(
        \i_tv80_core/i_mcode/n51 ) );
  INV_X1 \i_tv80_core/i_mcode/U90  ( .A(\i_tv80_core/i_mcode/n800 ), .ZN(
        \i_tv80_core/i_mcode/n50 ) );
  AND3_X1 \i_tv80_core/i_mcode/U89  ( .A1(\i_tv80_core/i_mcode/n168 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .A3(\i_tv80_core/i_mcode/n61 ), .ZN(
        \i_tv80_core/i_mcode/n49 ) );
  OR4_X2 \i_tv80_core/i_mcode/U88  ( .A1(\i_tv80_core/i_mcode/n268 ), .A2(
        \i_tv80_core/i_mcode/n178 ), .A3(\i_tv80_core/i_mcode/n172 ), .A4(
        \i_tv80_core/i_mcode/n65 ), .ZN(\i_tv80_core/i_mcode/n695 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U87  ( .A1(\i_tv80_core/n2179 ), .A2(
        \i_tv80_core/i_mcode/n564 ), .ZN(\i_tv80_core/i_mcode/n804 ) );
  INV_X2 \i_tv80_core/i_mcode/U86  ( .A(\i_tv80_core/i_mcode/n804 ), .ZN(
        \i_tv80_core/i_mcode/n802 ) );
  INV_X1 \i_tv80_core/i_mcode/U85  ( .A(\i_tv80_core/i_mcode/n802 ), .ZN(
        \i_tv80_core/i_mcode/n47 ) );
  INV_X2 \i_tv80_core/i_mcode/U84  ( .A(\i_tv80_core/i_mcode/n46 ), .ZN(
        \i_tv80_core/i_mcode/n805 ) );
  AND3_X1 \i_tv80_core/i_mcode/U83  ( .A1(\i_tv80_core/i_mcode/n564 ), .A2(
        \i_tv80_core/i_mcode/n294 ), .A3(\i_tv80_core/n2179 ), .ZN(
        \i_tv80_core/i_mcode/n46 ) );
  INV_X1 \i_tv80_core/i_mcode/U82  ( .A(\i_tv80_core/i_mcode/n778 ), .ZN(
        \i_tv80_core/i_mcode/n45 ) );
  BUF_X1 \i_tv80_core/i_mcode/U81  ( .A(\i_tv80_core/i_mcode/n558 ), .Z(
        \i_tv80_core/i_mcode/n44 ) );
  NAND2_X2 \i_tv80_core/i_mcode/U80  ( .A1(\i_tv80_core/i_mcode/n155 ), .A2(
        \i_tv80_core/i_mcode/n153 ), .ZN(\i_tv80_core/i_mcode/n619 ) );
  AND2_X2 \i_tv80_core/i_mcode/U79  ( .A1(\i_tv80_core/i_mcode/n95 ), .A2(
        \i_tv80_core/i_mcode/n632 ), .ZN(\i_tv80_core/i_mcode/n155 ) );
  AND4_X1 \i_tv80_core/i_mcode/U78  ( .A1(\i_tv80_core/i_mcode/n231 ), .A2(
        \i_tv80_core/i_mcode/n309 ), .A3(\i_tv80_core/i_mcode/n232 ), .A4(
        \i_tv80_core/i_mcode/n233 ), .ZN(\i_tv80_core/i_mcode/n43 ) );
  NAND2_X2 \i_tv80_core/i_mcode/U77  ( .A1(\i_tv80_core/i_mcode/n194 ), .A2(
        \i_tv80_core/i_mcode/n742 ), .ZN(\i_tv80_core/i_mcode/n639 ) );
  AND2_X2 \i_tv80_core/i_mcode/U76  ( .A1(\i_tv80_core/i_mcode/n179 ), .A2(
        \i_tv80_core/i_mcode/n226 ), .ZN(\i_tv80_core/i_mcode/n147 ) );
  OR4_X2 \i_tv80_core/i_mcode/U75  ( .A1(\i_tv80_core/i_mcode/n455 ), .A2(
        \i_tv80_core/i_mcode/n808 ), .A3(\i_tv80_core/i_mcode/n857 ), .A4(
        \i_tv80_core/i_mcode/n422 ), .ZN(\i_tv80_core/i_mcode/n42 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U74  ( .A1(\i_tv80_core/i_mcode/n42 ), .A2(
        \i_tv80_core/i_mcode/n456 ), .ZN(\i_tv80_core/i_mcode/n122 ) );
  AND2_X2 \i_tv80_core/i_mcode/U73  ( .A1(\i_tv80_core/i_mcode/n428 ), .A2(
        \i_tv80_core/i_mcode/n465 ), .ZN(\i_tv80_core/i_mcode/n121 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U72  ( .A(\i_tv80_core/i_mcode/n405 ), .Z(
        \i_tv80_core/i_mcode/n41 ) );
  AND2_X2 \i_tv80_core/i_mcode/U71  ( .A1(\i_tv80_core/IR [6]), .A2(
        \i_tv80_core/i_mcode/n193 ), .ZN(\i_tv80_core/i_mcode/n109 ) );
  AOI211_X1 \i_tv80_core/i_mcode/U70  ( .C1(\i_tv80_core/i_mcode/n654 ), .C2(
        \i_tv80_core/i_mcode/n614 ), .A(\i_tv80_core/i_mcode/n885 ), .B(
        \i_tv80_core/i_mcode/n666 ), .ZN(\i_tv80_core/i_mcode/n612 ) );
  AND2_X1 \i_tv80_core/i_mcode/U69  ( .A1(\i_tv80_core/i_mcode/n164 ), .A2(
        \i_tv80_core/i_mcode/n173 ), .ZN(\i_tv80_core/i_mcode/n40 ) );
  AND3_X1 \i_tv80_core/i_mcode/U68  ( .A1(\i_tv80_core/i_mcode/n101 ), .A2(
        \i_tv80_core/i_mcode/n102 ), .A3(\i_tv80_core/i_mcode/n139 ), .ZN(
        \i_tv80_core/i_mcode/n170 ) );
  BUF_X1 \i_tv80_core/i_mcode/U67  ( .A(\i_tv80_core/i_mcode/n170 ), .Z(
        \i_tv80_core/i_mcode/n38 ) );
  AND2_X1 \i_tv80_core/i_mcode/U66  ( .A1(\i_tv80_core/i_mcode/n78 ), .A2(
        \i_tv80_core/i_mcode/n558 ), .ZN(\i_tv80_core/i_mcode/n82 ) );
  AND3_X1 \i_tv80_core/i_mcode/U65  ( .A1(\i_tv80_core/i_mcode/n82 ), .A2(
        \i_tv80_core/i_mcode/n101 ), .A3(\i_tv80_core/i_mcode/n73 ), .ZN(
        \i_tv80_core/i_mcode/n37 ) );
  AND2_X1 \i_tv80_core/i_mcode/U64  ( .A1(\i_tv80_core/i_mcode/n218 ), .A2(
        \i_tv80_core/i_mcode/n249 ), .ZN(\i_tv80_core/i_mcode/n36 ) );
  AND2_X1 \i_tv80_core/i_mcode/U63  ( .A1(\i_tv80_core/i_mcode/n138 ), .A2(
        \i_tv80_core/i_mcode/n155 ), .ZN(\i_tv80_core/i_mcode/n35 ) );
  AND3_X1 \i_tv80_core/i_mcode/U62  ( .A1(\i_tv80_core/i_mcode/n443 ), .A2(
        \i_tv80_core/i_mcode/n411 ), .A3(\i_tv80_core/i_mcode/n464 ), .ZN(
        \i_tv80_core/i_mcode/n34 ) );
  BUF_X2 \i_tv80_core/i_mcode/U61  ( .A(\i_tv80_core/i_mcode/n307 ), .Z(
        \i_tv80_core/i_mcode/n33 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U60  ( .A(\i_tv80_core/i_mcode/n774 ), .Z(
        \i_tv80_core/i_mcode/n32 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U59  ( .B1(\i_tv80_core/i_mcode/n670 ), .B2(
        \i_tv80_core/i_mcode/n634 ), .C1(\i_tv80_core/i_mcode/n59 ), .C2(
        \i_tv80_core/i_mcode/n653 ), .A(\i_tv80_core/i_mcode/n633 ), .ZN(
        \i_tv80_core/i_mcode/n635 ) );
  AND2_X1 \i_tv80_core/i_mcode/U58  ( .A1(\i_tv80_core/i_mcode/n629 ), .A2(
        \i_tv80_core/i_mcode/n628 ), .ZN(\i_tv80_core/i_mcode/n31 ) );
  AND2_X1 \i_tv80_core/i_mcode/U57  ( .A1(\i_tv80_core/i_mcode/n684 ), .A2(
        \i_tv80_core/i_mcode/n240 ), .ZN(\i_tv80_core/i_mcode/n30 ) );
  AND2_X1 \i_tv80_core/i_mcode/U56  ( .A1(\i_tv80_core/i_mcode/n884 ), .A2(
        \i_tv80_core/i_mcode/n173 ), .ZN(\i_tv80_core/i_mcode/n29 ) );
  OR3_X1 \i_tv80_core/i_mcode/U55  ( .A1(\i_tv80_core/i_mcode/n392 ), .A2(
        \i_tv80_core/i_mcode/n391 ), .A3(\i_tv80_core/i_mcode/n160 ), .ZN(
        \i_tv80_core/i_mcode/n28 ) );
  AND2_X1 \i_tv80_core/i_mcode/U54  ( .A1(\i_tv80_core/i_mcode/n154 ), .A2(
        \i_tv80_core/i_mcode/n168 ), .ZN(\i_tv80_core/i_mcode/n27 ) );
  AND3_X1 \i_tv80_core/i_mcode/U53  ( .A1(\i_tv80_core/i_mcode/n564 ), .A2(
        \i_tv80_core/i_mcode/n110 ), .A3(\i_tv80_core/n2180 ), .ZN(
        \i_tv80_core/i_mcode/n26 ) );
  AND2_X1 \i_tv80_core/i_mcode/U52  ( .A1(\i_tv80_core/i_mcode/n143 ), .A2(
        \i_tv80_core/i_mcode/n250 ), .ZN(\i_tv80_core/i_mcode/n25 ) );
  AND4_X1 \i_tv80_core/i_mcode/U51  ( .A1(\i_tv80_core/i_mcode/n102 ), .A2(
        \i_tv80_core/i_mcode/n268 ), .A3(\i_tv80_core/i_mcode/n168 ), .A4(
        \i_tv80_core/i_mcode/n176 ), .ZN(\i_tv80_core/i_mcode/n24 ) );
  OAI222_X1 \i_tv80_core/i_mcode/U50  ( .A1(\i_tv80_core/i_mcode/n121 ), .A2(
        \i_tv80_core/i_mcode/n81 ), .B1(\i_tv80_core/i_mcode/n483 ), .B2(
        \i_tv80_core/i_mcode/n169 ), .C1(\i_tv80_core/i_mcode/n482 ), .C2(
        \i_tv80_core/i_mcode/n805 ), .ZN(\i_tv80_core/i_mcode/n488 ) );
  INV_X1 \i_tv80_core/i_mcode/U49  ( .A(\i_tv80_core/i_mcode/n35 ), .ZN(
        \i_tv80_core/i_mcode/n676 ) );
  BUF_X1 \i_tv80_core/i_mcode/U48  ( .A(\i_tv80_core/IR [0]), .Z(
        \i_tv80_core/i_mcode/n78 ) );
  BUF_X1 \i_tv80_core/i_mcode/U47  ( .A(\i_tv80_core/n2178 ), .Z(
        \i_tv80_core/i_mcode/n99 ) );
  INV_X1 \i_tv80_core/i_mcode/U46  ( .A(\i_tv80_core/i_mcode/n96 ), .ZN(
        \i_tv80_core/i_mcode/n552 ) );
  INV_X1 \i_tv80_core/i_mcode/U45  ( .A(\i_tv80_core/i_mcode/n62 ), .ZN(
        \i_tv80_core/i_mcode/n606 ) );
  INV_X1 \i_tv80_core/i_mcode/U44  ( .A(\i_tv80_core/i_mcode/n39 ), .ZN(
        \i_tv80_core/i_mcode/n696 ) );
  AND2_X1 \i_tv80_core/i_mcode/U43  ( .A1(\i_tv80_core/i_mcode/n192 ), .A2(
        \i_tv80_core/i_mcode/n66 ), .ZN(\i_tv80_core/i_mcode/n154 ) );
  INV_X1 \i_tv80_core/i_mcode/U42  ( .A(\i_tv80_core/i_mcode/n61 ), .ZN(
        \i_tv80_core/i_mcode/n755 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U41  ( .A1(\i_tv80_core/i_mcode/n219 ), .A2(
        \i_tv80_core/i_mcode/n619 ), .ZN(\i_tv80_core/i_mcode/n409 ) );
  AND2_X1 \i_tv80_core/i_mcode/U40  ( .A1(\i_tv80_core/i_mcode/n192 ), .A2(
        \i_tv80_core/i_mcode/n193 ), .ZN(\i_tv80_core/i_mcode/n61 ) );
  AND2_X1 \i_tv80_core/i_mcode/U39  ( .A1(\i_tv80_core/i_mcode/n170 ), .A2(
        \i_tv80_core/i_mcode/n527 ), .ZN(\i_tv80_core/i_mcode/n39 ) );
  AND2_X1 \i_tv80_core/i_mcode/U38  ( .A1(\i_tv80_core/i_mcode/n700 ), .A2(
        \i_tv80_core/i_mcode/n699 ), .ZN(\i_tv80_core/i_mcode/n23 ) );
  OR2_X1 \i_tv80_core/i_mcode/U37  ( .A1(\i_tv80_core/i_mcode/n178 ), .A2(
        \i_tv80_core/i_mcode/n176 ), .ZN(\i_tv80_core/i_mcode/n22 ) );
  AND3_X1 \i_tv80_core/i_mcode/U36  ( .A1(\i_tv80_core/i_mcode/n62 ), .A2(
        \i_tv80_core/i_mcode/n812 ), .A3(\i_tv80_core/i_mcode/n25 ), .ZN(
        \i_tv80_core/i_mcode/n21 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U35  ( .A1(\i_tv80_core/i_mcode/n693 ), .A2(
        \i_tv80_core/i_mcode/n24 ), .ZN(\i_tv80_core/i_mcode/n20 ) );
  OR2_X1 \i_tv80_core/i_mcode/U34  ( .A1(\i_tv80_core/i_mcode/n189 ), .A2(
        \i_tv80_core/i_mcode/n565 ), .ZN(\i_tv80_core/i_mcode/n221 ) );
  BUF_X1 \i_tv80_core/i_mcode/U33  ( .A(\i_tv80_core/i_mcode/n221 ), .Z(
        \i_tv80_core/i_mcode/n104 ) );
  CLKBUF_X3 \i_tv80_core/i_mcode/U32  ( .A(\i_tv80_core/IR [2]), .Z(
        \i_tv80_core/i_mcode/n58 ) );
  NOR2_X1 \i_tv80_core/i_mcode/U31  ( .A1(\i_tv80_core/i_mcode/n73 ), .A2(
        \i_tv80_core/i_mcode/n58 ), .ZN(\i_tv80_core/i_mcode/n143 ) );
  BUF_X2 \i_tv80_core/i_mcode/U30  ( .A(\i_tv80_core/IR [4]), .Z(
        \i_tv80_core/i_mcode/n175 ) );
  CLKBUF_X1 \i_tv80_core/i_mcode/U29  ( .A(\i_tv80_core/i_mcode/n175 ), .Z(
        \i_tv80_core/i_mcode/n19 ) );
  BUF_X1 \i_tv80_core/i_mcode/U28  ( .A(\i_tv80_core/i_mcode/n73 ), .Z(
        \i_tv80_core/i_mcode/n59 ) );
  AOI221_X1 \i_tv80_core/i_mcode/U27  ( .B1(\i_tv80_core/i_mcode/n475 ), .B2(
        \i_tv80_core/i_mcode/n18 ), .C1(\i_tv80_core/i_mcode/n19 ), .C2(
        \i_tv80_core/i_mcode/n474 ), .A(\i_tv80_core/i_mcode/n473 ), .ZN(
        \i_tv80_core/i_mcode/n491 ) );
  BUF_X1 \i_tv80_core/i_mcode/U26  ( .A(\i_tv80_core/i_mcode/n639 ), .Z(
        \i_tv80_core/i_mcode/n18 ) );
  AND2_X1 \i_tv80_core/i_mcode/U25  ( .A1(\i_tv80_core/i_mcode/n16 ), .A2(
        \i_tv80_core/i_mcode/n121 ), .ZN(\i_tv80_core/i_mcode/n17 ) );
  AND2_X1 \i_tv80_core/i_mcode/U24  ( .A1(\i_tv80_core/i_mcode/n405 ), .A2(
        \i_tv80_core/i_mcode/n462 ), .ZN(\i_tv80_core/i_mcode/n16 ) );
  BUF_X1 \i_tv80_core/i_mcode/U23  ( .A(\i_tv80_core/i_mcode/n465 ), .Z(
        \i_tv80_core/i_mcode/n15 ) );
  BUF_X1 \i_tv80_core/i_mcode/U22  ( .A(\i_tv80_core/i_mcode/n598 ), .Z(
        \i_tv80_core/i_mcode/n14 ) );
  AND2_X1 \i_tv80_core/i_mcode/U21  ( .A1(\i_tv80_core/i_mcode/n70 ), .A2(
        \i_tv80_core/i_mcode/n790 ), .ZN(\i_tv80_core/i_mcode/n13 ) );
  INV_X1 \i_tv80_core/i_mcode/U20  ( .A(\i_tv80_core/i_mcode/n790 ), .ZN(
        \i_tv80_core/i_mcode/n12 ) );
  OR2_X1 \i_tv80_core/i_mcode/U19  ( .A1(\i_tv80_core/i_mcode/n12 ), .A2(
        \i_tv80_core/i_mcode/n88 ), .ZN(\i_tv80_core/i_mcode/n11 ) );
  AND2_X1 \i_tv80_core/i_mcode/U18  ( .A1(\i_tv80_core/i_mcode/n10 ), .A2(
        \i_tv80_core/i_mcode/n11 ), .ZN(\i_tv80_core/IncDec_16 [3]) );
  NAND2_X1 \i_tv80_core/i_mcode/U17  ( .A1(\i_tv80_core/i_mcode/n13 ), .A2(
        \i_tv80_core/i_mcode/n786 ), .ZN(\i_tv80_core/i_mcode/n10 ) );
  AND2_X1 \i_tv80_core/i_mcode/U16  ( .A1(\i_tv80_core/i_mcode/n314 ), .A2(
        \i_tv80_core/i_mcode/n320 ), .ZN(\i_tv80_core/i_mcode/n9 ) );
  AND2_X2 \i_tv80_core/i_mcode/U15  ( .A1(\i_tv80_core/i_mcode/n40 ), .A2(
        \i_tv80_core/i_mcode/n212 ), .ZN(\i_tv80_core/JumpE ) );
  BUF_X1 \i_tv80_core/i_mcode/U14  ( .A(\i_tv80_core/i_mcode/n141 ), .Z(
        \i_tv80_core/i_mcode/n8 ) );
  AND2_X2 \i_tv80_core/i_mcode/U13  ( .A1(\i_tv80_core/i_mcode/n293 ), .A2(
        \i_tv80_core/i_mcode/n292 ), .ZN(\i_tv80_core/i_mcode/n123 ) );
  AND2_X1 \i_tv80_core/i_mcode/U12  ( .A1(\i_tv80_core/i_mcode/n833 ), .A2(
        \i_tv80_core/i_mcode/n170 ), .ZN(\i_tv80_core/i_mcode/n7 ) );
  INV_X1 \i_tv80_core/i_mcode/U11  ( .A(\i_tv80_core/i_mcode/n5 ), .ZN(
        \i_tv80_core/i_mcode/n6 ) );
  BUF_X1 \i_tv80_core/i_mcode/U10  ( .A(\i_tv80_core/i_mcode/n223 ), .Z(
        \i_tv80_core/i_mcode/n5 ) );
  NAND2_X1 \i_tv80_core/i_mcode/U9  ( .A1(\i_tv80_core/i_mcode/n684 ), .A2(
        \i_tv80_core/i_mcode/n3 ), .ZN(\i_tv80_core/i_mcode/n4 ) );
  NAND3_X1 \i_tv80_core/i_mcode/U8  ( .A1(\i_tv80_core/i_mcode/n58 ), .A2(
        \i_tv80_core/i_mcode/n172 ), .A3(\i_tv80_core/i_mcode/n250 ), .ZN(
        \i_tv80_core/i_mcode/n3 ) );
  INV_X4 \i_tv80_core/i_mcode/U7  ( .A(\i_tv80_core/i_mcode/n2 ), .ZN(
        \i_tv80_core/i_mcode/n369 ) );
  AND2_X2 \i_tv80_core/i_mcode/U6  ( .A1(\i_tv80_core/i_mcode/n38 ), .A2(
        \i_tv80_core/i_mcode/n697 ), .ZN(\i_tv80_core/i_mcode/n2 ) );
  BUF_X1 \i_tv80_core/i_mcode/U5  ( .A(\i_tv80_core/IR [6]), .Z(
        \i_tv80_core/i_mcode/n48 ) );
  BUF_X1 \i_tv80_core/i_mcode/U4  ( .A(\i_tv80_core/i_mcode/n714 ), .Z(
        \i_tv80_core/i_mcode/n112 ) );
  AND2_X1 \i_tv80_core/i_mcode/U3  ( .A1(\i_tv80_core/i_mcode/n112 ), .A2(
        \i_tv80_core/i_mcode/n346 ), .ZN(\i_tv80_core/i_mcode/n1 ) );
  OAI211_X1 \i_tv80_core/i_alu/U487  ( .C1(\i_tv80_core/i_alu/n469 ), .C2(
        \i_tv80_core/i_alu/n468 ), .A(\i_tv80_core/i_alu/n467 ), .B(
        \i_tv80_core/i_alu/n466 ), .ZN(\i_tv80_core/ALU_Q [7]) );
  NOR2_X1 \i_tv80_core/i_alu/U486  ( .A1(\i_tv80_core/i_alu/n460 ), .A2(
        \i_tv80_core/i_alu/n459 ), .ZN(\i_tv80_core/i_alu/n463 ) );
  NAND3_X1 \i_tv80_core/i_alu/U485  ( .A1(\i_tv80_core/BusB [6]), .A2(
        \i_tv80_core/i_alu/n435 ), .A3(\i_tv80_core/i_alu/n449 ), .ZN(
        \i_tv80_core/i_alu/n457 ) );
  OAI221_X1 \i_tv80_core/i_alu/U484  ( .B1(\i_tv80_core/i_alu/n444 ), .B2(
        \i_tv80_core/i_alu/n442 ), .C1(\i_tv80_core/ALU_Op_r [3]), .C2(
        \i_tv80_core/i_alu/n441 ), .A(\i_tv80_core/i_alu/n440 ), .ZN(
        \i_tv80_core/ALU_Q [5]) );
  NOR3_X1 \i_tv80_core/i_alu/U483  ( .A1(\i_tv80_core/i_alu/n439 ), .A2(
        \i_tv80_core/i_alu/n47 ), .A3(\i_tv80_core/i_alu/n44 ), .ZN(
        \i_tv80_core/i_alu/n440 ) );
  OAI211_X1 \i_tv80_core/i_alu/U482  ( .C1(\i_tv80_core/i_alu/n446 ), .C2(
        \i_tv80_core/i_alu/n438 ), .A(\i_tv80_core/i_alu/n437 ), .B(
        \i_tv80_core/i_alu/n436 ), .ZN(\i_tv80_core/i_alu/n439 ) );
  NAND3_X1 \i_tv80_core/i_alu/U481  ( .A1(\i_tv80_core/BusB [5]), .A2(
        \i_tv80_core/i_alu/n435 ), .A3(\i_tv80_core/i_alu/n438 ), .ZN(
        \i_tv80_core/i_alu/n437 ) );
  OAI211_X1 \i_tv80_core/i_alu/U480  ( .C1(\i_tv80_core/i_alu/n450 ), .C2(
        \i_tv80_core/i_alu/n434 ), .A(\i_tv80_core/i_alu/n433 ), .B(
        \i_tv80_core/i_alu/n432 ), .ZN(\i_tv80_core/ALU_Q [4]) );
  AOI221_X1 \i_tv80_core/i_alu/U479  ( .B1(\i_tv80_core/i_alu/n431 ), .B2(
        \i_tv80_core/i_alu/n430 ), .C1(\i_tv80_core/i_alu/n429 ), .C2(
        \i_tv80_core/i_alu/n465 ), .A(\i_tv80_core/i_alu/n428 ), .ZN(
        \i_tv80_core/i_alu/n432 ) );
  OAI22_X1 \i_tv80_core/i_alu/U478  ( .A1(\i_tv80_core/ALU_Op_r [3]), .A2(
        \i_tv80_core/i_alu/n427 ), .B1(\i_tv80_core/i_alu/n444 ), .B2(
        \i_tv80_core/i_alu/n426 ), .ZN(\i_tv80_core/i_alu/n428 ) );
  NOR2_X1 \i_tv80_core/i_alu/U477  ( .A1(\i_tv80_core/i_alu/n459 ), .A2(
        \i_tv80_core/i_alu/n425 ), .ZN(\i_tv80_core/i_alu/n431 ) );
  AOI22_X1 \i_tv80_core/i_alu/U476  ( .A1(\i_tv80_core/i_alu/n452 ), .A2(
        \i_tv80_core/i_alu/n424 ), .B1(\i_tv80_core/i_alu/n453 ), .B2(
        \i_tv80_core/i_alu/n423 ), .ZN(\i_tv80_core/i_alu/n433 ) );
  OAI221_X1 \i_tv80_core/i_alu/U475  ( .B1(\i_tv80_core/i_alu/n444 ), .B2(
        \i_tv80_core/i_alu/n422 ), .C1(\i_tv80_core/ALU_Op_r [3]), .C2(
        \i_tv80_core/i_alu/n421 ), .A(\i_tv80_core/i_alu/n420 ), .ZN(
        \i_tv80_core/ALU_Q [3]) );
  AOI221_X1 \i_tv80_core/i_alu/U474  ( .B1(\i_tv80_core/i_alu/n419 ), .B2(
        \i_tv80_core/i_alu/n465 ), .C1(\i_tv80_core/i_alu/n418 ), .C2(
        \i_tv80_core/i_alu/n417 ), .A(\i_tv80_core/i_alu/n416 ), .ZN(
        \i_tv80_core/i_alu/n420 ) );
  NOR2_X1 \i_tv80_core/i_alu/U473  ( .A1(\i_tv80_core/i_alu/n459 ), .A2(
        \i_tv80_core/i_alu/n415 ), .ZN(\i_tv80_core/i_alu/n418 ) );
  INV_X1 \i_tv80_core/i_alu/U472  ( .A(\i_tv80_core/i_alu/n414 ), .ZN(
        \i_tv80_core/i_alu/n421 ) );
  OAI211_X1 \i_tv80_core/i_alu/U471  ( .C1(\i_tv80_core/i_alu/n413 ), .C2(
        \i_tv80_core/i_alu/n412 ), .A(\i_tv80_core/i_alu/n411 ), .B(
        \i_tv80_core/i_alu/n410 ), .ZN(\i_tv80_core/ALU_Q [2]) );
  AOI221_X1 \i_tv80_core/i_alu/U470  ( .B1(\i_tv80_core/i_alu/n409 ), .B2(
        \i_tv80_core/i_alu/n408 ), .C1(\i_tv80_core/i_alu/n407 ), .C2(
        \i_tv80_core/i_alu/n465 ), .A(\i_tv80_core/i_alu/n406 ), .ZN(
        \i_tv80_core/i_alu/n410 ) );
  OAI22_X1 \i_tv80_core/i_alu/U469  ( .A1(\i_tv80_core/i_alu/n405 ), .A2(
        \i_tv80_core/ALU_Op_r [3]), .B1(\i_tv80_core/i_alu/n444 ), .B2(
        \i_tv80_core/i_alu/n404 ), .ZN(\i_tv80_core/i_alu/n406 ) );
  INV_X1 \i_tv80_core/i_alu/U468  ( .A(\i_tv80_core/i_alu/n403 ), .ZN(
        \i_tv80_core/i_alu/n405 ) );
  NOR2_X1 \i_tv80_core/i_alu/U467  ( .A1(\i_tv80_core/i_alu/n459 ), .A2(
        \i_tv80_core/i_alu/n402 ), .ZN(\i_tv80_core/i_alu/n409 ) );
  AOI22_X1 \i_tv80_core/i_alu/U466  ( .A1(\i_tv80_core/i_alu/n452 ), .A2(
        \i_tv80_core/i_alu/n401 ), .B1(\i_tv80_core/i_alu/n400 ), .B2(
        \i_tv80_core/i_alu/n399 ), .ZN(\i_tv80_core/i_alu/n411 ) );
  OAI211_X1 \i_tv80_core/i_alu/U465  ( .C1(\i_tv80_core/i_alu/n398 ), .C2(
        \i_tv80_core/i_alu/n412 ), .A(\i_tv80_core/i_alu/n397 ), .B(
        \i_tv80_core/i_alu/n396 ), .ZN(\i_tv80_core/ALU_Q [1]) );
  AOI221_X1 \i_tv80_core/i_alu/U464  ( .B1(\i_tv80_core/i_alu/n395 ), .B2(
        \i_tv80_core/i_alu/n394 ), .C1(\i_tv80_core/i_alu/n393 ), .C2(
        \i_tv80_core/i_alu/n465 ), .A(\i_tv80_core/i_alu/n392 ), .ZN(
        \i_tv80_core/i_alu/n396 ) );
  OAI22_X1 \i_tv80_core/i_alu/U463  ( .A1(\i_tv80_core/ALU_Op_r [3]), .A2(
        \i_tv80_core/i_alu/n391 ), .B1(\i_tv80_core/i_alu/n444 ), .B2(
        \i_tv80_core/i_alu/n390 ), .ZN(\i_tv80_core/i_alu/n392 ) );
  INV_X1 \i_tv80_core/i_alu/U462  ( .A(\i_tv80_core/i_alu/n389 ), .ZN(
        \i_tv80_core/i_alu/n391 ) );
  NOR2_X1 \i_tv80_core/i_alu/U461  ( .A1(\i_tv80_core/i_alu/n459 ), .A2(
        \i_tv80_core/i_alu/n388 ), .ZN(\i_tv80_core/i_alu/n395 ) );
  AOI22_X1 \i_tv80_core/i_alu/U460  ( .A1(\i_tv80_core/i_alu/n452 ), .A2(
        \i_tv80_core/i_alu/n387 ), .B1(\i_tv80_core/i_alu/n400 ), .B2(
        \i_tv80_core/i_alu/n386 ), .ZN(\i_tv80_core/i_alu/n397 ) );
  OAI211_X1 \i_tv80_core/i_alu/U459  ( .C1(\i_tv80_core/i_alu/n412 ), .C2(
        \i_tv80_core/i_alu/n385 ), .A(\i_tv80_core/i_alu/n384 ), .B(
        \i_tv80_core/i_alu/n383 ), .ZN(\i_tv80_core/ALU_Q [0]) );
  AOI221_X1 \i_tv80_core/i_alu/U458  ( .B1(\i_tv80_core/i_alu/n382 ), .B2(
        \i_tv80_core/i_alu/n381 ), .C1(\i_tv80_core/i_alu/n380 ), .C2(
        \i_tv80_core/i_alu/n465 ), .A(\i_tv80_core/i_alu/n379 ), .ZN(
        \i_tv80_core/i_alu/n383 ) );
  OAI22_X1 \i_tv80_core/i_alu/U457  ( .A1(\i_tv80_core/ALU_Op_r [3]), .A2(
        \i_tv80_core/i_alu/n378 ), .B1(\i_tv80_core/i_alu/n444 ), .B2(
        \i_tv80_core/i_alu/n377 ), .ZN(\i_tv80_core/i_alu/n379 ) );
  INV_X1 \i_tv80_core/i_alu/U456  ( .A(\i_tv80_core/i_alu/n446 ), .ZN(
        \i_tv80_core/i_alu/n465 ) );
  NAND2_X1 \i_tv80_core/i_alu/U455  ( .A1(\i_tv80_core/i_alu/n435 ), .A2(
        \i_tv80_core/i_alu/n10 ), .ZN(\i_tv80_core/i_alu/n446 ) );
  INV_X1 \i_tv80_core/i_alu/U454  ( .A(\i_tv80_core/i_alu/n459 ), .ZN(
        \i_tv80_core/i_alu/n435 ) );
  NOR2_X1 \i_tv80_core/i_alu/U453  ( .A1(\i_tv80_core/i_alu/n459 ), .A2(
        \i_tv80_core/i_alu/n376 ), .ZN(\i_tv80_core/i_alu/n382 ) );
  AOI22_X1 \i_tv80_core/i_alu/U452  ( .A1(\i_tv80_core/i_alu/n452 ), .A2(
        \i_tv80_core/i_alu/n375 ), .B1(\i_tv80_core/i_alu/n400 ), .B2(
        \i_tv80_core/i_alu/n374 ), .ZN(\i_tv80_core/i_alu/n384 ) );
  OAI211_X1 \i_tv80_core/i_alu/U451  ( .C1(\i_tv80_core/Arith16_r ), .C2(
        \i_tv80_core/i_alu/n467 ), .A(\i_tv80_core/i_alu/n373 ), .B(
        \i_tv80_core/i_alu/n372 ), .ZN(\i_tv80_core/F_Out [7]) );
  AOI22_X1 \i_tv80_core/i_alu/U450  ( .A1(\i_tv80_core/F [7]), .A2(
        \i_tv80_core/i_alu/n371 ), .B1(\i_tv80_core/i_alu/n370 ), .B2(
        \i_tv80_core/i_alu/n369 ), .ZN(\i_tv80_core/i_alu/n372 ) );
  INV_X1 \i_tv80_core/i_alu/U449  ( .A(\i_tv80_core/i_alu/n461 ), .ZN(
        \i_tv80_core/i_alu/n373 ) );
  NAND2_X1 \i_tv80_core/i_alu/U448  ( .A1(\i_tv80_core/i_alu/n368 ), .A2(
        \i_tv80_core/i_alu/n367 ), .ZN(\i_tv80_core/i_alu/n461 ) );
  NAND3_X1 \i_tv80_core/i_alu/U447  ( .A1(\i_tv80_core/i_alu/n453 ), .A2(
        \i_tv80_core/i_alu/n366 ), .A3(\i_tv80_core/i_alu/n365 ), .ZN(
        \i_tv80_core/i_alu/n367 ) );
  AOI221_X1 \i_tv80_core/i_alu/U446  ( .B1(\i_tv80_core/BusA [7]), .B2(
        \i_tv80_core/i_alu/n400 ), .C1(\i_tv80_core/i_alu/n364 ), .C2(
        \i_tv80_core/i_alu/n52 ), .A(\i_tv80_core/i_alu/n363 ), .ZN(
        \i_tv80_core/i_alu/n368 ) );
  NOR3_X1 \i_tv80_core/i_alu/U445  ( .A1(\i_tv80_core/i_alu/n43 ), .A2(
        \i_tv80_core/i_alu/n412 ), .A3(\i_tv80_core/i_alu/n366 ), .ZN(
        \i_tv80_core/i_alu/n363 ) );
  NAND2_X1 \i_tv80_core/i_alu/U444  ( .A1(\i_tv80_core/i_alu/n362 ), .A2(
        \i_tv80_core/i_alu/n361 ), .ZN(\i_tv80_core/i_alu/n467 ) );
  NAND2_X1 \i_tv80_core/i_alu/U443  ( .A1(\i_tv80_core/i_alu/n360 ), .A2(
        \i_tv80_core/i_alu/n359 ), .ZN(\i_tv80_core/F_Out [6]) );
  AOI221_X1 \i_tv80_core/i_alu/U442  ( .B1(\i_tv80_core/i_alu/n358 ), .B2(
        \i_tv80_core/i_alu/n357 ), .C1(\i_tv80_core/F [6]), .C2(
        \i_tv80_core/i_alu/n371 ), .A(\i_tv80_core/i_alu/n49 ), .ZN(
        \i_tv80_core/i_alu/n359 ) );
  NOR4_X1 \i_tv80_core/i_alu/U441  ( .A1(\i_tv80_core/i_alu/n356 ), .A2(
        \i_tv80_core/i_alu/n355 ), .A3(\i_tv80_core/i_alu/n389 ), .A4(
        \i_tv80_core/i_alu/n403 ), .ZN(\i_tv80_core/i_alu/n357 ) );
  NAND2_X1 \i_tv80_core/i_alu/U440  ( .A1(\i_tv80_core/i_alu/n354 ), .A2(
        \i_tv80_core/i_alu/n361 ), .ZN(\i_tv80_core/i_alu/n356 ) );
  OAI21_X1 \i_tv80_core/i_alu/U439  ( .B1(\i_tv80_core/Z16_r ), .B2(
        \i_tv80_core/Arith16_r ), .A(\i_tv80_core/i_alu/n353 ), .ZN(
        \i_tv80_core/i_alu/n354 ) );
  INV_X1 \i_tv80_core/i_alu/U438  ( .A(\i_tv80_core/F [6]), .ZN(
        \i_tv80_core/i_alu/n353 ) );
  NOR3_X1 \i_tv80_core/i_alu/U437  ( .A1(\i_tv80_core/i_alu/n352 ), .A2(
        \i_tv80_core/i_alu/n351 ), .A3(\i_tv80_core/i_alu/n414 ), .ZN(
        \i_tv80_core/i_alu/n358 ) );
  NAND3_X1 \i_tv80_core/i_alu/U436  ( .A1(\i_tv80_core/i_alu/n9 ), .A2(
        \i_tv80_core/i_alu/n445 ), .A3(\i_tv80_core/i_alu/n441 ), .ZN(
        \i_tv80_core/i_alu/n352 ) );
  AOI221_X1 \i_tv80_core/i_alu/U435  ( .B1(\i_tv80_core/i_alu/n350 ), .B2(
        \i_tv80_core/i_alu/n349 ), .C1(\i_tv80_core/i_alu/n348 ), .C2(
        \i_tv80_core/i_alu/n347 ), .A(\i_tv80_core/i_alu/n346 ), .ZN(
        \i_tv80_core/i_alu/n360 ) );
  NOR4_X1 \i_tv80_core/i_alu/U434  ( .A1(\i_tv80_core/i_alu/n345 ), .A2(
        \i_tv80_core/i_alu/n344 ), .A3(\i_tv80_core/i_alu/n401 ), .A4(
        \i_tv80_core/i_alu/n387 ), .ZN(\i_tv80_core/i_alu/n346 ) );
  NAND3_X1 \i_tv80_core/i_alu/U433  ( .A1(\i_tv80_core/i_alu/n469 ), .A2(
        \i_tv80_core/i_alu/n343 ), .A3(\i_tv80_core/i_alu/n370 ), .ZN(
        \i_tv80_core/i_alu/n344 ) );
  INV_X1 \i_tv80_core/i_alu/U432  ( .A(\i_tv80_core/i_alu/n375 ), .ZN(
        \i_tv80_core/i_alu/n343 ) );
  INV_X1 \i_tv80_core/i_alu/U431  ( .A(\i_tv80_core/i_alu/n369 ), .ZN(
        \i_tv80_core/i_alu/n469 ) );
  NAND4_X1 \i_tv80_core/i_alu/U430  ( .A1(\i_tv80_core/i_alu/n342 ), .A2(
        \i_tv80_core/i_alu/n341 ), .A3(\i_tv80_core/i_alu/n340 ), .A4(
        \i_tv80_core/i_alu/n339 ), .ZN(\i_tv80_core/i_alu/n345 ) );
  NOR4_X1 \i_tv80_core/i_alu/U429  ( .A1(\i_tv80_core/i_alu/n338 ), .A2(
        \i_tv80_core/i_alu/n337 ), .A3(\i_tv80_core/BusA [0]), .A4(
        \i_tv80_core/i_alu/n423 ), .ZN(\i_tv80_core/i_alu/n347 ) );
  NOR3_X1 \i_tv80_core/i_alu/U428  ( .A1(\i_tv80_core/i_alu/n336 ), .A2(
        \i_tv80_core/i_alu/n454 ), .A3(\i_tv80_core/i_alu/n335 ), .ZN(
        \i_tv80_core/i_alu/n348 ) );
  INV_X1 \i_tv80_core/i_alu/U427  ( .A(\i_tv80_core/i_alu/n334 ), .ZN(
        \i_tv80_core/i_alu/n454 ) );
  NAND3_X1 \i_tv80_core/i_alu/U426  ( .A1(\i_tv80_core/i_alu/n398 ), .A2(
        \i_tv80_core/i_alu/n453 ), .A3(\i_tv80_core/i_alu/n333 ), .ZN(
        \i_tv80_core/i_alu/n336 ) );
  NOR4_X1 \i_tv80_core/i_alu/U425  ( .A1(\i_tv80_core/i_alu/n332 ), .A2(
        \i_tv80_core/i_alu/n399 ), .A3(\i_tv80_core/i_alu/n386 ), .A4(
        \i_tv80_core/i_alu/n374 ), .ZN(\i_tv80_core/i_alu/n349 ) );
  INV_X1 \i_tv80_core/i_alu/U424  ( .A(\i_tv80_core/i_alu/n331 ), .ZN(
        \i_tv80_core/i_alu/n374 ) );
  INV_X1 \i_tv80_core/i_alu/U423  ( .A(\i_tv80_core/i_alu/n330 ), .ZN(
        \i_tv80_core/i_alu/n386 ) );
  NOR4_X1 \i_tv80_core/i_alu/U422  ( .A1(\i_tv80_core/BusA [7]), .A2(
        \i_tv80_core/BusA [4]), .A3(\i_tv80_core/i_alu/n450 ), .A4(
        \i_tv80_core/i_alu/n329 ), .ZN(\i_tv80_core/i_alu/n350 ) );
  OAI211_X1 \i_tv80_core/i_alu/U421  ( .C1(\i_tv80_core/i_alu/n328 ), .C2(
        \i_tv80_core/i_alu/n327 ), .A(\i_tv80_core/i_alu/n326 ), .B(
        \i_tv80_core/i_alu/n325 ), .ZN(\i_tv80_core/F_Out [5]) );
  AOI22_X1 \i_tv80_core/i_alu/U420  ( .A1(\i_tv80_core/i_alu/n50 ), .A2(
        \i_tv80_core/i_alu/n324 ), .B1(\i_tv80_core/F [5]), .B2(
        \i_tv80_core/i_alu/n323 ), .ZN(\i_tv80_core/i_alu/n325 ) );
  NOR3_X1 \i_tv80_core/i_alu/U419  ( .A1(\i_tv80_core/i_alu/n322 ), .A2(
        \i_tv80_core/i_alu/n47 ), .A3(\i_tv80_core/i_alu/n44 ), .ZN(
        \i_tv80_core/i_alu/n326 ) );
  INV_X1 \i_tv80_core/i_alu/U418  ( .A(\i_tv80_core/i_alu/n340 ), .ZN(
        \i_tv80_core/i_alu/n321 ) );
  INV_X1 \i_tv80_core/i_alu/U417  ( .A(\i_tv80_core/i_alu/n436 ), .ZN(
        \i_tv80_core/i_alu/n322 ) );
  NAND2_X1 \i_tv80_core/i_alu/U416  ( .A1(\i_tv80_core/BusA [5]), .A2(
        \i_tv80_core/i_alu/n400 ), .ZN(\i_tv80_core/i_alu/n436 ) );
  OAI211_X1 \i_tv80_core/i_alu/U415  ( .C1(\i_tv80_core/i_alu/n320 ), .C2(
        \i_tv80_core/i_alu/n412 ), .A(\i_tv80_core/i_alu/n444 ), .B(
        \i_tv80_core/i_alu/n319 ), .ZN(\i_tv80_core/F_Out [4]) );
  AOI22_X1 \i_tv80_core/i_alu/U414  ( .A1(\i_tv80_core/i_alu/n318 ), .A2(
        \i_tv80_core/i_alu/n361 ), .B1(\i_tv80_core/F [4]), .B2(
        \i_tv80_core/i_alu/n323 ), .ZN(\i_tv80_core/i_alu/n319 ) );
  NAND2_X1 \i_tv80_core/i_alu/U413  ( .A1(\i_tv80_core/i_alu/n317 ), .A2(
        \i_tv80_core/i_alu/n316 ), .ZN(\i_tv80_core/i_alu/n318 ) );
  MUX2_X1 \i_tv80_core/i_alu/U412  ( .A(\i_tv80_core/i_alu/n312 ), .B(
        \i_tv80_core/i_alu/n311 ), .S(\i_tv80_core/F [1]), .Z(
        \i_tv80_core/i_alu/n320 ) );
  OAI211_X1 \i_tv80_core/i_alu/U411  ( .C1(\i_tv80_core/i_alu/n310 ), .C2(
        \i_tv80_core/i_alu/n309 ), .A(\i_tv80_core/F [4]), .B(
        \i_tv80_core/i_alu/n308 ), .ZN(\i_tv80_core/i_alu/n311 ) );
  OAI211_X1 \i_tv80_core/i_alu/U410  ( .C1(\i_tv80_core/i_alu/n328 ), .C2(
        \i_tv80_core/i_alu/n415 ), .A(\i_tv80_core/i_alu/n307 ), .B(
        \i_tv80_core/i_alu/n306 ), .ZN(\i_tv80_core/F_Out [3]) );
  AOI22_X1 \i_tv80_core/i_alu/U409  ( .A1(\i_tv80_core/i_alu/n50 ), .A2(
        \i_tv80_core/i_alu/n414 ), .B1(\i_tv80_core/F [3]), .B2(
        \i_tv80_core/i_alu/n323 ), .ZN(\i_tv80_core/i_alu/n306 ) );
  INV_X1 \i_tv80_core/i_alu/U408  ( .A(\i_tv80_core/i_alu/n416 ), .ZN(
        \i_tv80_core/i_alu/n307 ) );
  OAI222_X1 \i_tv80_core/i_alu/U407  ( .A1(\i_tv80_core/i_alu/n304 ), .A2(
        \i_tv80_core/i_alu/n450 ), .B1(\i_tv80_core/i_alu/n342 ), .B2(
        \i_tv80_core/i_alu/n468 ), .C1(\i_tv80_core/i_alu/n412 ), .C2(
        \i_tv80_core/i_alu/n303 ), .ZN(\i_tv80_core/i_alu/n416 ) );
  INV_X1 \i_tv80_core/i_alu/U406  ( .A(\i_tv80_core/i_alu/n302 ), .ZN(
        \i_tv80_core/i_alu/n328 ) );
  OAI21_X1 \i_tv80_core/i_alu/U405  ( .B1(\i_tv80_core/ALU_Op_r [3]), .B2(
        \i_tv80_core/i_alu/n305 ), .A(\i_tv80_core/i_alu/n301 ), .ZN(
        \i_tv80_core/i_alu/n302 ) );
  OAI21_X1 \i_tv80_core/i_alu/U404  ( .B1(\i_tv80_core/n162 ), .B2(
        \i_tv80_core/i_alu/n300 ), .A(\i_tv80_core/i_alu/n364 ), .ZN(
        \i_tv80_core/i_alu/n301 ) );
  INV_X1 \i_tv80_core/i_alu/U403  ( .A(\i_tv80_core/i_alu/n444 ), .ZN(
        \i_tv80_core/i_alu/n364 ) );
  NAND2_X1 \i_tv80_core/i_alu/U402  ( .A1(\i_tv80_core/n576 ), .A2(
        \i_tv80_core/n166 ), .ZN(\i_tv80_core/i_alu/n300 ) );
  INV_X1 \i_tv80_core/i_alu/U401  ( .A(\i_tv80_core/i_alu/n339 ), .ZN(
        \i_tv80_core/i_alu/n451 ) );
  MUX2_X1 \i_tv80_core/i_alu/U400  ( .A(\i_tv80_core/i_alu/n292 ), .B(
        \i_tv80_core/i_alu/n291 ), .S(\i_tv80_core/n570 ), .Z(
        \i_tv80_core/i_alu/n339 ) );
  MUX2_X1 \i_tv80_core/i_alu/U399  ( .A(\i_tv80_core/i_alu/n434 ), .B(
        \i_tv80_core/i_alu/n290 ), .S(\i_tv80_core/n570 ), .Z(
        \i_tv80_core/i_alu/n340 ) );
  MUX2_X1 \i_tv80_core/i_alu/U398  ( .A(\i_tv80_core/i_alu/n310 ), .B(
        \i_tv80_core/i_alu/n434 ), .S(\i_tv80_core/n570 ), .Z(
        \i_tv80_core/i_alu/n342 ) );
  INV_X1 \i_tv80_core/i_alu/U397  ( .A(\i_tv80_core/i_alu/n341 ), .ZN(
        \i_tv80_core/i_alu/n424 ) );
  MUX2_X1 \i_tv80_core/i_alu/U396  ( .A(\i_tv80_core/i_alu/n308 ), .B(
        \i_tv80_core/i_alu/n292 ), .S(\i_tv80_core/n570 ), .Z(
        \i_tv80_core/i_alu/n341 ) );
  OAI211_X1 \i_tv80_core/i_alu/U395  ( .C1(\i_tv80_core/i_alu/n291 ), .C2(
        \i_tv80_core/i_alu/n381 ), .A(\i_tv80_core/i_alu/n449 ), .B(
        \i_tv80_core/i_alu/n287 ), .ZN(\i_tv80_core/i_alu/n375 ) );
  MUX2_X1 \i_tv80_core/i_alu/U394  ( .A(\i_tv80_core/i_alu/n286 ), .B(
        \i_tv80_core/i_alu/n309 ), .S(\i_tv80_core/n570 ), .Z(
        \i_tv80_core/i_alu/n287 ) );
  NAND2_X1 \i_tv80_core/i_alu/U393  ( .A1(\i_tv80_core/F [0]), .A2(
        \i_tv80_core/n185 ), .ZN(\i_tv80_core/i_alu/n286 ) );
  OAI221_X1 \i_tv80_core/i_alu/U392  ( .B1(\i_tv80_core/i_alu/n291 ), .B2(
        \i_tv80_core/i_alu/n438 ), .C1(\i_tv80_core/i_alu/n285 ), .C2(
        \i_tv80_core/i_alu/n417 ), .A(\i_tv80_core/i_alu/n284 ), .ZN(
        \i_tv80_core/i_alu/n369 ) );
  AOI22_X1 \i_tv80_core/i_alu/U391  ( .A1(\i_tv80_core/i_alu/n393 ), .A2(
        \i_tv80_core/BusA [0]), .B1(\i_tv80_core/BusA [6]), .B2(
        \i_tv80_core/i_alu/n283 ), .ZN(\i_tv80_core/i_alu/n284 ) );
  INV_X1 \i_tv80_core/i_alu/U390  ( .A(\i_tv80_core/i_alu/n282 ), .ZN(
        \i_tv80_core/i_alu/n387 ) );
  MUX2_X1 \i_tv80_core/i_alu/U389  ( .A(\i_tv80_core/i_alu/n385 ), .B(
        \i_tv80_core/i_alu/n310 ), .S(\i_tv80_core/n570 ), .Z(
        \i_tv80_core/i_alu/n282 ) );
  INV_X1 \i_tv80_core/i_alu/U388  ( .A(\i_tv80_core/i_alu/n281 ), .ZN(
        \i_tv80_core/i_alu/n401 ) );
  MUX2_X1 \i_tv80_core/i_alu/U387  ( .A(\i_tv80_core/i_alu/n309 ), .B(
        \i_tv80_core/i_alu/n308 ), .S(\i_tv80_core/n570 ), .Z(
        \i_tv80_core/i_alu/n281 ) );
  INV_X1 \i_tv80_core/i_alu/U386  ( .A(\i_tv80_core/i_alu/n280 ), .ZN(
        \i_tv80_core/i_alu/n370 ) );
  OAI21_X1 \i_tv80_core/i_alu/U385  ( .B1(\i_tv80_core/i_alu/n55 ), .B2(
        \i_tv80_core/ISet [0]), .A(\i_tv80_core/i_alu/n452 ), .ZN(
        \i_tv80_core/i_alu/n280 ) );
  MUX2_X1 \i_tv80_core/i_alu/U384  ( .A(\i_tv80_core/i_alu/n376 ), .B(
        \i_tv80_core/i_alu/n425 ), .S(\i_tv80_core/i_alu/n15 ), .Z(
        \i_tv80_core/i_alu/n331 ) );
  INV_X1 \i_tv80_core/i_alu/U383  ( .A(\i_tv80_core/BusB [4]), .ZN(
        \i_tv80_core/i_alu/n425 ) );
  MUX2_X1 \i_tv80_core/i_alu/U382  ( .A(\i_tv80_core/i_alu/n388 ), .B(
        \i_tv80_core/i_alu/n327 ), .S(\i_tv80_core/i_alu/n14 ), .Z(
        \i_tv80_core/i_alu/n330 ) );
  INV_X1 \i_tv80_core/i_alu/U381  ( .A(\i_tv80_core/i_alu/n275 ), .ZN(
        \i_tv80_core/i_alu/n399 ) );
  MUX2_X1 \i_tv80_core/i_alu/U380  ( .A(\i_tv80_core/i_alu/n402 ), .B(
        \i_tv80_core/i_alu/n274 ), .S(\i_tv80_core/i_alu/n15 ), .Z(
        \i_tv80_core/i_alu/n275 ) );
  INV_X1 \i_tv80_core/i_alu/U379  ( .A(\i_tv80_core/BusB [6]), .ZN(
        \i_tv80_core/i_alu/n274 ) );
  INV_X1 \i_tv80_core/i_alu/U378  ( .A(\i_tv80_core/i_alu/n304 ), .ZN(
        \i_tv80_core/i_alu/n332 ) );
  MUX2_X1 \i_tv80_core/i_alu/U377  ( .A(\i_tv80_core/i_alu/n415 ), .B(
        \i_tv80_core/i_alu/n460 ), .S(\i_tv80_core/i_alu/n14 ), .Z(
        \i_tv80_core/i_alu/n304 ) );
  INV_X1 \i_tv80_core/i_alu/U376  ( .A(\i_tv80_core/BusB [7]), .ZN(
        \i_tv80_core/i_alu/n460 ) );
  INV_X1 \i_tv80_core/i_alu/U375  ( .A(\i_tv80_core/i_alu/n450 ), .ZN(
        \i_tv80_core/i_alu/n400 ) );
  NOR4_X1 \i_tv80_core/i_alu/U374  ( .A1(\i_tv80_core/i_alu/n267 ), .A2(
        \i_tv80_core/i_alu/n266 ), .A3(\i_tv80_core/i_alu/n265 ), .A4(
        \i_tv80_core/i_alu/n264 ), .ZN(\i_tv80_core/i_alu/n268 ) );
  INV_X1 \i_tv80_core/i_alu/U373  ( .A(\i_tv80_core/i_alu/n404 ), .ZN(
        \i_tv80_core/i_alu/n264 ) );
  NAND2_X1 \i_tv80_core/i_alu/U372  ( .A1(\i_tv80_core/i_alu/n407 ), .A2(
        \i_tv80_core/BusB [2]), .ZN(\i_tv80_core/i_alu/n404 ) );
  INV_X1 \i_tv80_core/i_alu/U371  ( .A(\i_tv80_core/i_alu/n408 ), .ZN(
        \i_tv80_core/i_alu/n407 ) );
  NAND3_X1 \i_tv80_core/i_alu/U370  ( .A1(\i_tv80_core/n185 ), .A2(
        \i_tv80_core/i_alu/n263 ), .A3(\i_tv80_core/i_alu/n283 ), .ZN(
        \i_tv80_core/i_alu/n408 ) );
  INV_X1 \i_tv80_core/i_alu/U369  ( .A(\i_tv80_core/i_alu/n422 ), .ZN(
        \i_tv80_core/i_alu/n265 ) );
  NAND2_X1 \i_tv80_core/i_alu/U368  ( .A1(\i_tv80_core/BusB [3]), .A2(
        \i_tv80_core/i_alu/n419 ), .ZN(\i_tv80_core/i_alu/n422 ) );
  INV_X1 \i_tv80_core/i_alu/U367  ( .A(\i_tv80_core/i_alu/n417 ), .ZN(
        \i_tv80_core/i_alu/n419 ) );
  NAND3_X1 \i_tv80_core/i_alu/U366  ( .A1(\i_tv80_core/n570 ), .A2(
        \i_tv80_core/n185 ), .A3(\i_tv80_core/i_alu/n263 ), .ZN(
        \i_tv80_core/i_alu/n417 ) );
  INV_X1 \i_tv80_core/i_alu/U365  ( .A(\i_tv80_core/i_alu/n377 ), .ZN(
        \i_tv80_core/i_alu/n266 ) );
  NAND2_X1 \i_tv80_core/i_alu/U364  ( .A1(\i_tv80_core/i_alu/n380 ), .A2(
        \i_tv80_core/BusB [0]), .ZN(\i_tv80_core/i_alu/n377 ) );
  INV_X1 \i_tv80_core/i_alu/U363  ( .A(\i_tv80_core/i_alu/n381 ), .ZN(
        \i_tv80_core/i_alu/n380 ) );
  NAND3_X1 \i_tv80_core/i_alu/U362  ( .A1(\i_tv80_core/i_alu/n263 ), .A2(
        \i_tv80_core/i_alu/n262 ), .A3(\i_tv80_core/i_alu/n283 ), .ZN(
        \i_tv80_core/i_alu/n381 ) );
  INV_X1 \i_tv80_core/i_alu/U361  ( .A(\i_tv80_core/i_alu/n390 ), .ZN(
        \i_tv80_core/i_alu/n267 ) );
  NAND2_X1 \i_tv80_core/i_alu/U360  ( .A1(\i_tv80_core/BusB [1]), .A2(
        \i_tv80_core/i_alu/n393 ), .ZN(\i_tv80_core/i_alu/n390 ) );
  INV_X1 \i_tv80_core/i_alu/U359  ( .A(\i_tv80_core/i_alu/n394 ), .ZN(
        \i_tv80_core/i_alu/n393 ) );
  NAND3_X1 \i_tv80_core/i_alu/U358  ( .A1(\i_tv80_core/n570 ), .A2(
        \i_tv80_core/i_alu/n262 ), .A3(\i_tv80_core/i_alu/n263 ), .ZN(
        \i_tv80_core/i_alu/n394 ) );
  INV_X1 \i_tv80_core/i_alu/U357  ( .A(\i_tv80_core/n110 ), .ZN(
        \i_tv80_core/i_alu/n263 ) );
  NOR3_X1 \i_tv80_core/i_alu/U356  ( .A1(\i_tv80_core/i_alu/n261 ), .A2(
        \i_tv80_core/i_alu/n52 ), .A3(\i_tv80_core/i_alu/n444 ), .ZN(
        \i_tv80_core/i_alu/n269 ) );
  INV_X1 \i_tv80_core/i_alu/U355  ( .A(\i_tv80_core/i_alu/n462 ), .ZN(
        \i_tv80_core/i_alu/n464 ) );
  NAND2_X1 \i_tv80_core/i_alu/U354  ( .A1(\i_tv80_core/n570 ), .A2(
        \i_tv80_core/i_alu/n53 ), .ZN(\i_tv80_core/i_alu/n462 ) );
  INV_X1 \i_tv80_core/i_alu/U353  ( .A(\i_tv80_core/i_alu/n443 ), .ZN(
        \i_tv80_core/i_alu/n261 ) );
  NAND2_X1 \i_tv80_core/i_alu/U352  ( .A1(\i_tv80_core/i_alu/n260 ), .A2(
        \i_tv80_core/BusB [6]), .ZN(\i_tv80_core/i_alu/n443 ) );
  INV_X1 \i_tv80_core/i_alu/U351  ( .A(\i_tv80_core/i_alu/n449 ), .ZN(
        \i_tv80_core/i_alu/n260 ) );
  NAND2_X1 \i_tv80_core/i_alu/U350  ( .A1(\i_tv80_core/i_alu/n53 ), .A2(
        \i_tv80_core/i_alu/n283 ), .ZN(\i_tv80_core/i_alu/n449 ) );
  NAND2_X1 \i_tv80_core/i_alu/U349  ( .A1(\i_tv80_core/BusB [5]), .A2(
        \i_tv80_core/i_alu/n259 ), .ZN(\i_tv80_core/i_alu/n442 ) );
  INV_X1 \i_tv80_core/i_alu/U348  ( .A(\i_tv80_core/i_alu/n438 ), .ZN(
        \i_tv80_core/i_alu/n259 ) );
  NAND3_X1 \i_tv80_core/i_alu/U347  ( .A1(\i_tv80_core/n570 ), .A2(
        \i_tv80_core/n110 ), .A3(\i_tv80_core/i_alu/n262 ), .ZN(
        \i_tv80_core/i_alu/n438 ) );
  NAND2_X1 \i_tv80_core/i_alu/U346  ( .A1(\i_tv80_core/i_alu/n429 ), .A2(
        \i_tv80_core/BusB [4]), .ZN(\i_tv80_core/i_alu/n426 ) );
  INV_X1 \i_tv80_core/i_alu/U345  ( .A(\i_tv80_core/i_alu/n430 ), .ZN(
        \i_tv80_core/i_alu/n429 ) );
  NAND3_X1 \i_tv80_core/i_alu/U344  ( .A1(\i_tv80_core/n110 ), .A2(
        \i_tv80_core/i_alu/n262 ), .A3(\i_tv80_core/i_alu/n283 ), .ZN(
        \i_tv80_core/i_alu/n430 ) );
  INV_X1 \i_tv80_core/i_alu/U343  ( .A(\i_tv80_core/n570 ), .ZN(
        \i_tv80_core/i_alu/n283 ) );
  INV_X1 \i_tv80_core/i_alu/U342  ( .A(\i_tv80_core/n185 ), .ZN(
        \i_tv80_core/i_alu/n262 ) );
  OAI211_X1 \i_tv80_core/i_alu/U341  ( .C1(\i_tv80_core/ALU_Op_r [3]), .C2(
        \i_tv80_core/i_alu/n270 ), .A(\i_tv80_core/i_alu/n258 ), .B(
        \i_tv80_core/i_alu/n257 ), .ZN(\i_tv80_core/i_alu/n371 ) );
  NAND3_X1 \i_tv80_core/i_alu/U340  ( .A1(\i_tv80_core/i_alu/n452 ), .A2(
        \i_tv80_core/i_alu/n256 ), .A3(\i_tv80_core/i_alu/n56 ), .ZN(
        \i_tv80_core/i_alu/n257 ) );
  INV_X1 \i_tv80_core/i_alu/U339  ( .A(\i_tv80_core/ISet [0]), .ZN(
        \i_tv80_core/i_alu/n256 ) );
  INV_X1 \i_tv80_core/i_alu/U338  ( .A(\i_tv80_core/i_alu/n468 ), .ZN(
        \i_tv80_core/i_alu/n452 ) );
  INV_X1 \i_tv80_core/i_alu/U337  ( .A(\i_tv80_core/Arith16_r ), .ZN(
        \i_tv80_core/i_alu/n270 ) );
  NAND3_X1 \i_tv80_core/i_alu/U336  ( .A1(\i_tv80_core/i_alu/n253 ), .A2(
        \i_tv80_core/i_alu/n252 ), .A3(\i_tv80_core/i_alu/n361 ), .ZN(
        \i_tv80_core/i_alu/n254 ) );
  NAND3_X1 \i_tv80_core/i_alu/U335  ( .A1(\i_tv80_core/i_alu/n251 ), .A2(
        \i_tv80_core/i_alu/n250 ), .A3(\i_tv80_core/i_alu/n249 ), .ZN(
        \i_tv80_core/i_alu/n252 ) );
  NAND3_X1 \i_tv80_core/i_alu/U334  ( .A1(\i_tv80_core/i_alu/n247 ), .A2(
        \i_tv80_core/i_alu/n246 ), .A3(\i_tv80_core/i_alu/n250 ), .ZN(
        \i_tv80_core/i_alu/n253 ) );
  NAND4_X1 \i_tv80_core/i_alu/U333  ( .A1(\i_tv80_core/i_alu/n241 ), .A2(
        \i_tv80_core/i_alu/n243 ), .A3(\i_tv80_core/i_alu/n242 ), .A4(
        \i_tv80_core/i_alu/n244 ), .ZN(\i_tv80_core/i_alu/n362 ) );
  OAI21_X1 \i_tv80_core/i_alu/U332  ( .B1(\i_tv80_core/BusA [7]), .B2(
        \i_tv80_core/i_alu/n235 ), .A(\i_tv80_core/i_alu/n234 ), .ZN(
        \i_tv80_core/i_alu/n239 ) );
  NOR3_X1 \i_tv80_core/i_alu/U331  ( .A1(\i_tv80_core/i_alu/n237 ), .A2(
        \i_tv80_core/BusA [7]), .A3(\i_tv80_core/i_alu/n233 ), .ZN(
        \i_tv80_core/i_alu/n240 ) );
  NAND4_X1 \i_tv80_core/i_alu/U330  ( .A1(\i_tv80_core/i_alu/n232 ), .A2(
        \i_tv80_core/i_alu/n231 ), .A3(\i_tv80_core/BusA [7]), .A4(
        \i_tv80_core/i_alu/n236 ), .ZN(\i_tv80_core/i_alu/n242 ) );
  NAND4_X1 \i_tv80_core/i_alu/U329  ( .A1(\i_tv80_core/i_alu/n33 ), .A2(
        \i_tv80_core/i_alu/n232 ), .A3(\i_tv80_core/BusA [7]), .A4(
        \i_tv80_core/i_alu/n233 ), .ZN(\i_tv80_core/i_alu/n243 ) );
  OAI21_X1 \i_tv80_core/i_alu/U328  ( .B1(\i_tv80_core/i_alu/n230 ), .B2(
        \i_tv80_core/i_alu/n229 ), .A(\i_tv80_core/BusA [7]), .ZN(
        \i_tv80_core/i_alu/n244 ) );
  MUX2_X1 \i_tv80_core/i_alu/U327  ( .A(\i_tv80_core/i_alu/n228 ), .B(
        \i_tv80_core/i_alu/n227 ), .S(\i_tv80_core/BusB [7]), .Z(
        \i_tv80_core/i_alu/n229 ) );
  INV_X1 \i_tv80_core/i_alu/U326  ( .A(\i_tv80_core/i_alu/n355 ), .ZN(
        \i_tv80_core/i_alu/n378 ) );
  OAI21_X1 \i_tv80_core/i_alu/U325  ( .B1(\i_tv80_core/i_alu/n234 ), .B2(
        \i_tv80_core/i_alu/n376 ), .A(\i_tv80_core/i_alu/n226 ), .ZN(
        \i_tv80_core/i_alu/n355 ) );
  MUX2_X1 \i_tv80_core/i_alu/U324  ( .A(\i_tv80_core/i_alu/n225 ), .B(
        \i_tv80_core/i_alu/n224 ), .S(\i_tv80_core/BusA [0]), .Z(
        \i_tv80_core/i_alu/n226 ) );
  AOI211_X1 \i_tv80_core/i_alu/U323  ( .C1(\i_tv80_core/i_alu/n223 ), .C2(
        \i_tv80_core/i_alu/n232 ), .A(\i_tv80_core/i_alu/n222 ), .B(
        \i_tv80_core/i_alu/n230 ), .ZN(\i_tv80_core/i_alu/n224 ) );
  MUX2_X1 \i_tv80_core/i_alu/U322  ( .A(\i_tv80_core/i_alu/n228 ), .B(
        \i_tv80_core/i_alu/n227 ), .S(\i_tv80_core/BusB [0]), .Z(
        \i_tv80_core/i_alu/n222 ) );
  INV_X1 \i_tv80_core/i_alu/U321  ( .A(\i_tv80_core/i_alu/n221 ), .ZN(
        \i_tv80_core/i_alu/n223 ) );
  AOI22_X1 \i_tv80_core/i_alu/U320  ( .A1(\i_tv80_core/i_alu/n221 ), .A2(
        \i_tv80_core/i_alu/n232 ), .B1(\i_tv80_core/BusB [0]), .B2(
        \i_tv80_core/i_alu/n228 ), .ZN(\i_tv80_core/i_alu/n225 ) );
  XOR2_X1 \i_tv80_core/i_alu/U319  ( .A(\i_tv80_core/i_alu/n220 ), .B(
        \i_tv80_core/i_alu/n51 ), .Z(\i_tv80_core/i_alu/n221 ) );
  INV_X1 \i_tv80_core/i_alu/U318  ( .A(\i_tv80_core/BusB [0]), .ZN(
        \i_tv80_core/i_alu/n376 ) );
  OAI21_X1 \i_tv80_core/i_alu/U317  ( .B1(\i_tv80_core/i_alu/n234 ), .B2(
        \i_tv80_core/i_alu/n388 ), .A(\i_tv80_core/i_alu/n219 ), .ZN(
        \i_tv80_core/i_alu/n389 ) );
  MUX2_X1 \i_tv80_core/i_alu/U316  ( .A(\i_tv80_core/i_alu/n218 ), .B(
        \i_tv80_core/i_alu/n217 ), .S(\i_tv80_core/BusA [1]), .Z(
        \i_tv80_core/i_alu/n219 ) );
  AOI211_X1 \i_tv80_core/i_alu/U315  ( .C1(\i_tv80_core/i_alu/n216 ), .C2(
        \i_tv80_core/i_alu/n232 ), .A(\i_tv80_core/i_alu/n215 ), .B(
        \i_tv80_core/i_alu/n230 ), .ZN(\i_tv80_core/i_alu/n217 ) );
  MUX2_X1 \i_tv80_core/i_alu/U314  ( .A(\i_tv80_core/i_alu/n228 ), .B(
        \i_tv80_core/i_alu/n227 ), .S(\i_tv80_core/BusB [1]), .Z(
        \i_tv80_core/i_alu/n215 ) );
  INV_X1 \i_tv80_core/i_alu/U313  ( .A(\i_tv80_core/i_alu/n214 ), .ZN(
        \i_tv80_core/i_alu/n216 ) );
  AOI22_X1 \i_tv80_core/i_alu/U312  ( .A1(\i_tv80_core/i_alu/n214 ), .A2(
        \i_tv80_core/i_alu/n232 ), .B1(\i_tv80_core/BusB [1]), .B2(
        \i_tv80_core/i_alu/n228 ), .ZN(\i_tv80_core/i_alu/n218 ) );
  XOR2_X1 \i_tv80_core/i_alu/U311  ( .A(\i_tv80_core/i_alu/n213 ), .B(
        \i_tv80_core/i_alu/n212 ), .Z(\i_tv80_core/i_alu/n214 ) );
  INV_X1 \i_tv80_core/i_alu/U310  ( .A(\i_tv80_core/BusB [1]), .ZN(
        \i_tv80_core/i_alu/n388 ) );
  OAI21_X1 \i_tv80_core/i_alu/U309  ( .B1(\i_tv80_core/i_alu/n234 ), .B2(
        \i_tv80_core/i_alu/n402 ), .A(\i_tv80_core/i_alu/n211 ), .ZN(
        \i_tv80_core/i_alu/n403 ) );
  MUX2_X1 \i_tv80_core/i_alu/U308  ( .A(\i_tv80_core/i_alu/n210 ), .B(
        \i_tv80_core/i_alu/n209 ), .S(\i_tv80_core/BusA [2]), .Z(
        \i_tv80_core/i_alu/n211 ) );
  AOI211_X1 \i_tv80_core/i_alu/U307  ( .C1(\i_tv80_core/i_alu/n208 ), .C2(
        \i_tv80_core/i_alu/n232 ), .A(\i_tv80_core/i_alu/n207 ), .B(
        \i_tv80_core/i_alu/n230 ), .ZN(\i_tv80_core/i_alu/n209 ) );
  MUX2_X1 \i_tv80_core/i_alu/U306  ( .A(\i_tv80_core/i_alu/n228 ), .B(
        \i_tv80_core/i_alu/n227 ), .S(\i_tv80_core/BusB [2]), .Z(
        \i_tv80_core/i_alu/n207 ) );
  INV_X1 \i_tv80_core/i_alu/U305  ( .A(\i_tv80_core/i_alu/n206 ), .ZN(
        \i_tv80_core/i_alu/n208 ) );
  AOI22_X1 \i_tv80_core/i_alu/U304  ( .A1(\i_tv80_core/i_alu/n206 ), .A2(
        \i_tv80_core/i_alu/n232 ), .B1(\i_tv80_core/BusB [2]), .B2(
        \i_tv80_core/i_alu/n228 ), .ZN(\i_tv80_core/i_alu/n210 ) );
  XOR2_X1 \i_tv80_core/i_alu/U303  ( .A(\i_tv80_core/i_alu/n205 ), .B(
        \i_tv80_core/i_alu/n204 ), .Z(\i_tv80_core/i_alu/n206 ) );
  OAI21_X1 \i_tv80_core/i_alu/U302  ( .B1(\i_tv80_core/i_alu/n11 ), .B2(
        \i_tv80_core/i_alu/n203 ), .A(\i_tv80_core/i_alu/n202 ), .ZN(
        \i_tv80_core/i_alu/n205 ) );
  INV_X1 \i_tv80_core/i_alu/U301  ( .A(\i_tv80_core/i_alu/n199 ), .ZN(
        \i_tv80_core/i_alu/n203 ) );
  INV_X1 \i_tv80_core/i_alu/U300  ( .A(\i_tv80_core/BusB [2]), .ZN(
        \i_tv80_core/i_alu/n402 ) );
  XOR2_X1 \i_tv80_core/i_alu/U299  ( .A(\i_tv80_core/i_alu/n445 ), .B(
        \i_tv80_core/i_alu/n441 ), .Z(\i_tv80_core/i_alu/n198 ) );
  INV_X1 \i_tv80_core/i_alu/U298  ( .A(\i_tv80_core/i_alu/n324 ), .ZN(
        \i_tv80_core/i_alu/n441 ) );
  OAI221_X1 \i_tv80_core/i_alu/U297  ( .B1(\i_tv80_core/i_alu/n197 ), .B2(
        \i_tv80_core/i_alu/n327 ), .C1(\i_tv80_core/i_alu/n237 ), .C2(
        \i_tv80_core/i_alu/n196 ), .A(\i_tv80_core/i_alu/n195 ), .ZN(
        \i_tv80_core/i_alu/n324 ) );
  OAI21_X1 \i_tv80_core/i_alu/U296  ( .B1(\i_tv80_core/i_alu/n230 ), .B2(
        \i_tv80_core/i_alu/n194 ), .A(\i_tv80_core/BusA [5]), .ZN(
        \i_tv80_core/i_alu/n195 ) );
  MUX2_X1 \i_tv80_core/i_alu/U295  ( .A(\i_tv80_core/i_alu/n228 ), .B(
        \i_tv80_core/i_alu/n227 ), .S(\i_tv80_core/BusB [5]), .Z(
        \i_tv80_core/i_alu/n194 ) );
  XOR2_X1 \i_tv80_core/i_alu/U294  ( .A(\i_tv80_core/i_alu/n13 ), .B(
        \i_tv80_core/i_alu/n193 ), .Z(\i_tv80_core/i_alu/n196 ) );
  INV_X1 \i_tv80_core/i_alu/U293  ( .A(\i_tv80_core/BusB [5]), .ZN(
        \i_tv80_core/i_alu/n327 ) );
  AOI21_X1 \i_tv80_core/i_alu/U292  ( .B1(\i_tv80_core/i_alu/n228 ), .B2(
        \i_tv80_core/i_alu/n292 ), .A(\i_tv80_core/i_alu/n230 ), .ZN(
        \i_tv80_core/i_alu/n197 ) );
  MUX2_X1 \i_tv80_core/i_alu/U291  ( .A(\i_tv80_core/i_alu/n235 ), .B(
        \i_tv80_core/i_alu/n316 ), .S(\i_tv80_core/BusB [6]), .Z(
        \i_tv80_core/i_alu/n184 ) );
  INV_X1 \i_tv80_core/i_alu/U290  ( .A(\i_tv80_core/i_alu/n427 ), .ZN(
        \i_tv80_core/i_alu/n351 ) );
  NAND2_X1 \i_tv80_core/i_alu/U289  ( .A1(\i_tv80_core/i_alu/n183 ), .A2(
        \i_tv80_core/i_alu/n182 ), .ZN(\i_tv80_core/i_alu/n427 ) );
  OAI21_X1 \i_tv80_core/i_alu/U288  ( .B1(\i_tv80_core/i_alu/n237 ), .B2(
        \i_tv80_core/i_alu/n181 ), .A(\i_tv80_core/i_alu/n180 ), .ZN(
        \i_tv80_core/i_alu/n182 ) );
  NOR3_X1 \i_tv80_core/i_alu/U287  ( .A1(\i_tv80_core/i_alu/n179 ), .A2(
        \i_tv80_core/i_alu/n230 ), .A3(\i_tv80_core/i_alu/n434 ), .ZN(
        \i_tv80_core/i_alu/n180 ) );
  MUX2_X1 \i_tv80_core/i_alu/U286  ( .A(\i_tv80_core/i_alu/n228 ), .B(
        \i_tv80_core/i_alu/n227 ), .S(\i_tv80_core/BusB [4]), .Z(
        \i_tv80_core/i_alu/n179 ) );
  OAI211_X1 \i_tv80_core/i_alu/U285  ( .C1(\i_tv80_core/i_alu/n237 ), .C2(
        \i_tv80_core/i_alu/n178 ), .A(\i_tv80_core/i_alu/n177 ), .B(
        \i_tv80_core/i_alu/n434 ), .ZN(\i_tv80_core/i_alu/n183 ) );
  OAI21_X1 \i_tv80_core/i_alu/U284  ( .B1(\i_tv80_core/i_alu/n230 ), .B2(
        \i_tv80_core/i_alu/n228 ), .A(\i_tv80_core/BusB [4]), .ZN(
        \i_tv80_core/i_alu/n177 ) );
  INV_X1 \i_tv80_core/i_alu/U283  ( .A(\i_tv80_core/i_alu/n181 ), .ZN(
        \i_tv80_core/i_alu/n178 ) );
  OAI211_X1 \i_tv80_core/i_alu/U282  ( .C1(\i_tv80_core/i_alu/n175 ), .C2(
        \i_tv80_core/i_alu/n174 ), .A(\i_tv80_core/i_alu/n173 ), .B(
        \i_tv80_core/i_alu/n172 ), .ZN(\i_tv80_core/i_alu/n313 ) );
  AOI21_X1 \i_tv80_core/i_alu/U281  ( .B1(\i_tv80_core/i_alu/n171 ), .B2(
        \i_tv80_core/i_alu/n170 ), .A(\i_tv80_core/i_alu/n169 ), .ZN(
        \i_tv80_core/i_alu/n172 ) );
  INV_X1 \i_tv80_core/i_alu/U280  ( .A(\i_tv80_core/i_alu/n168 ), .ZN(
        \i_tv80_core/i_alu/n169 ) );
  INV_X1 \i_tv80_core/i_alu/U279  ( .A(\i_tv80_core/i_alu/n167 ), .ZN(
        \i_tv80_core/i_alu/n171 ) );
  NAND3_X1 \i_tv80_core/i_alu/U278  ( .A1(\i_tv80_core/i_alu/n170 ), .A2(
        \i_tv80_core/i_alu/n166 ), .A3(\i_tv80_core/i_alu/n165 ), .ZN(
        \i_tv80_core/i_alu/n173 ) );
  INV_X1 \i_tv80_core/i_alu/U277  ( .A(\i_tv80_core/i_alu/n164 ), .ZN(
        \i_tv80_core/i_alu/n165 ) );
  INV_X1 \i_tv80_core/i_alu/U276  ( .A(\i_tv80_core/i_alu/n170 ), .ZN(
        \i_tv80_core/i_alu/n175 ) );
  INV_X1 \i_tv80_core/i_alu/U275  ( .A(\i_tv80_core/i_alu/n232 ), .ZN(
        \i_tv80_core/i_alu/n237 ) );
  OAI21_X1 \i_tv80_core/i_alu/U274  ( .B1(\i_tv80_core/i_alu/n415 ), .B2(
        \i_tv80_core/i_alu/n234 ), .A(\i_tv80_core/i_alu/n163 ), .ZN(
        \i_tv80_core/i_alu/n414 ) );
  MUX2_X1 \i_tv80_core/i_alu/U273  ( .A(\i_tv80_core/i_alu/n162 ), .B(
        \i_tv80_core/i_alu/n161 ), .S(\i_tv80_core/i_alu/n2 ), .Z(
        \i_tv80_core/i_alu/n163 ) );
  AOI211_X1 \i_tv80_core/i_alu/U272  ( .C1(\i_tv80_core/i_alu/n160 ), .C2(
        \i_tv80_core/i_alu/n232 ), .A(\i_tv80_core/i_alu/n159 ), .B(
        \i_tv80_core/i_alu/n230 ), .ZN(\i_tv80_core/i_alu/n161 ) );
  MUX2_X1 \i_tv80_core/i_alu/U271  ( .A(\i_tv80_core/i_alu/n228 ), .B(
        \i_tv80_core/i_alu/n227 ), .S(\i_tv80_core/BusB [3]), .Z(
        \i_tv80_core/i_alu/n159 ) );
  INV_X1 \i_tv80_core/i_alu/U270  ( .A(\i_tv80_core/i_alu/n158 ), .ZN(
        \i_tv80_core/i_alu/n160 ) );
  AOI22_X1 \i_tv80_core/i_alu/U269  ( .A1(\i_tv80_core/i_alu/n158 ), .A2(
        \i_tv80_core/i_alu/n232 ), .B1(\i_tv80_core/BusB [3]), .B2(
        \i_tv80_core/i_alu/n228 ), .ZN(\i_tv80_core/i_alu/n162 ) );
  INV_X1 \i_tv80_core/i_alu/U268  ( .A(\i_tv80_core/BusB [3]), .ZN(
        \i_tv80_core/i_alu/n415 ) );
  NAND2_X1 \i_tv80_core/i_alu/U267  ( .A1(\i_tv80_core/ALU_Op_r [2]), .A2(
        \i_tv80_core/i_alu/n155 ), .ZN(\i_tv80_core/i_alu/n248 ) );
  INV_X1 \i_tv80_core/i_alu/U266  ( .A(\i_tv80_core/i_alu/n149 ), .ZN(
        \i_tv80_core/i_alu/n423 ) );
  MUX2_X1 \i_tv80_core/i_alu/U265  ( .A(\i_tv80_core/i_alu/n148 ), .B(
        \i_tv80_core/i_alu/n147 ), .S(\i_tv80_core/BusA [4]), .Z(
        \i_tv80_core/i_alu/n149 ) );
  OAI21_X1 \i_tv80_core/i_alu/U264  ( .B1(\i_tv80_core/i_alu/n2 ), .B2(
        \i_tv80_core/i_alu/n146 ), .A(\i_tv80_core/i_alu/n145 ), .ZN(
        \i_tv80_core/i_alu/n147 ) );
  NAND2_X1 \i_tv80_core/i_alu/U263  ( .A1(\i_tv80_core/i_alu/n144 ), .A2(
        \i_tv80_core/i_alu/n143 ), .ZN(\i_tv80_core/i_alu/n148 ) );
  MUX2_X1 \i_tv80_core/i_alu/U262  ( .A(\i_tv80_core/i_alu/n142 ), .B(
        \i_tv80_core/i_alu/n308 ), .S(\i_tv80_core/F [1]), .Z(
        \i_tv80_core/i_alu/n143 ) );
  INV_X1 \i_tv80_core/i_alu/U261  ( .A(\i_tv80_core/i_alu/n141 ), .ZN(
        \i_tv80_core/i_alu/n144 ) );
  INV_X1 \i_tv80_core/i_alu/U260  ( .A(\i_tv80_core/i_alu/n140 ), .ZN(
        \i_tv80_core/i_alu/n398 ) );
  OAI21_X1 \i_tv80_core/i_alu/U259  ( .B1(\i_tv80_core/i_alu/n309 ), .B2(
        \i_tv80_core/i_alu/n6 ), .A(\i_tv80_core/i_alu/n138 ), .ZN(
        \i_tv80_core/i_alu/n140 ) );
  INV_X1 \i_tv80_core/i_alu/U258  ( .A(\i_tv80_core/i_alu/n303 ), .ZN(
        \i_tv80_core/i_alu/n338 ) );
  NAND2_X1 \i_tv80_core/i_alu/U257  ( .A1(\i_tv80_core/i_alu/n137 ), .A2(
        \i_tv80_core/i_alu/n145 ), .ZN(\i_tv80_core/i_alu/n303 ) );
  NAND2_X1 \i_tv80_core/i_alu/U256  ( .A1(\i_tv80_core/i_alu/n142 ), .A2(
        \i_tv80_core/i_alu/n366 ), .ZN(\i_tv80_core/i_alu/n145 ) );
  MUX2_X1 \i_tv80_core/i_alu/U255  ( .A(\i_tv80_core/i_alu/n136 ), .B(
        \i_tv80_core/i_alu/n146 ), .S(\i_tv80_core/i_alu/n2 ), .Z(
        \i_tv80_core/i_alu/n137 ) );
  NAND2_X1 \i_tv80_core/i_alu/U254  ( .A1(\i_tv80_core/F [1]), .A2(
        \i_tv80_core/i_alu/n23 ), .ZN(\i_tv80_core/i_alu/n146 ) );
  AOI21_X1 \i_tv80_core/i_alu/U253  ( .B1(\i_tv80_core/i_alu/n134 ), .B2(
        \i_tv80_core/i_alu/n366 ), .A(\i_tv80_core/i_alu/n141 ), .ZN(
        \i_tv80_core/i_alu/n136 ) );
  OAI21_X1 \i_tv80_core/i_alu/U252  ( .B1(\i_tv80_core/i_alu/n366 ), .B2(
        \i_tv80_core/i_alu/n135 ), .A(\i_tv80_core/i_alu/n6 ), .ZN(
        \i_tv80_core/i_alu/n141 ) );
  INV_X1 \i_tv80_core/i_alu/U251  ( .A(\i_tv80_core/i_alu/n133 ), .ZN(
        \i_tv80_core/i_alu/n134 ) );
  MUX2_X1 \i_tv80_core/i_alu/U250  ( .A(\i_tv80_core/i_alu/n130 ), .B(
        \i_tv80_core/i_alu/n129 ), .S(\i_tv80_core/F [1]), .Z(
        \i_tv80_core/i_alu/n335 ) );
  OAI21_X1 \i_tv80_core/i_alu/U249  ( .B1(\i_tv80_core/i_alu/n20 ), .B2(
        \i_tv80_core/i_alu/n127 ), .A(\i_tv80_core/i_alu/n126 ), .ZN(
        \i_tv80_core/i_alu/n129 ) );
  XOR2_X1 \i_tv80_core/i_alu/U248  ( .A(\i_tv80_core/i_alu/n125 ), .B(
        \i_tv80_core/i_alu/n124 ), .Z(\i_tv80_core/i_alu/n130 ) );
  MUX2_X1 \i_tv80_core/i_alu/U247  ( .A(\i_tv80_core/i_alu/n123 ), .B(
        \i_tv80_core/i_alu/n122 ), .S(\i_tv80_core/F [1]), .Z(
        \i_tv80_core/i_alu/n334 ) );
  XOR2_X1 \i_tv80_core/i_alu/U246  ( .A(\i_tv80_core/i_alu/n121 ), .B(
        \i_tv80_core/i_alu/n120 ), .Z(\i_tv80_core/i_alu/n122 ) );
  NOR2_X1 \i_tv80_core/i_alu/U245  ( .A1(\i_tv80_core/i_alu/n119 ), .A2(
        \i_tv80_core/i_alu/n118 ), .ZN(\i_tv80_core/i_alu/n120 ) );
  INV_X1 \i_tv80_core/i_alu/U244  ( .A(\i_tv80_core/i_alu/n126 ), .ZN(
        \i_tv80_core/i_alu/n118 ) );
  INV_X1 \i_tv80_core/i_alu/U243  ( .A(\i_tv80_core/i_alu/n117 ), .ZN(
        \i_tv80_core/i_alu/n121 ) );
  XOR2_X1 \i_tv80_core/i_alu/U242  ( .A(\i_tv80_core/i_alu/n116 ), .B(
        \i_tv80_core/i_alu/n115 ), .Z(\i_tv80_core/i_alu/n123 ) );
  INV_X1 \i_tv80_core/i_alu/U241  ( .A(\i_tv80_core/i_alu/n114 ), .ZN(
        \i_tv80_core/i_alu/n115 ) );
  XOR2_X1 \i_tv80_core/i_alu/U240  ( .A(\i_tv80_core/i_alu/n113 ), .B(
        \i_tv80_core/i_alu/n112 ), .Z(\i_tv80_core/i_alu/n116 ) );
  INV_X1 \i_tv80_core/i_alu/U239  ( .A(\i_tv80_core/i_alu/n111 ), .ZN(
        \i_tv80_core/i_alu/n112 ) );
  MUX2_X1 \i_tv80_core/i_alu/U238  ( .A(\i_tv80_core/i_alu/n109 ), .B(
        \i_tv80_core/i_alu/n43 ), .S(\i_tv80_core/F [1]), .Z(
        \i_tv80_core/i_alu/n333 ) );
  INV_X1 \i_tv80_core/i_alu/U237  ( .A(\i_tv80_core/i_alu/n365 ), .ZN(
        \i_tv80_core/i_alu/n109 ) );
  XOR2_X1 \i_tv80_core/i_alu/U236  ( .A(\i_tv80_core/i_alu/n107 ), .B(
        \i_tv80_core/i_alu/n17 ), .Z(\i_tv80_core/i_alu/n365 ) );
  INV_X1 \i_tv80_core/i_alu/U235  ( .A(\i_tv80_core/i_alu/n413 ), .ZN(
        \i_tv80_core/i_alu/n337 ) );
  NAND2_X1 \i_tv80_core/i_alu/U234  ( .A1(\i_tv80_core/F [1]), .A2(
        \i_tv80_core/i_alu/n6 ), .ZN(\i_tv80_core/i_alu/n106 ) );
  OAI22_X1 \i_tv80_core/i_alu/U233  ( .A1(\i_tv80_core/i_alu/n48 ), .A2(
        \i_tv80_core/i_alu/n366 ), .B1(\i_tv80_core/ALU_Op_r [3]), .B2(
        \i_tv80_core/i_alu/n314 ), .ZN(\i_tv80_core/F_Out [1]) );
  OAI221_X1 \i_tv80_core/i_alu/U232  ( .B1(\i_tv80_core/ALU_Op_r [3]), .B2(
        \i_tv80_core/i_alu/n105 ), .C1(\i_tv80_core/i_alu/n104 ), .C2(
        \i_tv80_core/i_alu/n468 ), .A(\i_tv80_core/i_alu/n103 ), .ZN(
        \i_tv80_core/F_Out [0]) );
  AOI22_X1 \i_tv80_core/i_alu/U231  ( .A1(\i_tv80_core/F [0]), .A2(
        \i_tv80_core/i_alu/n102 ), .B1(\i_tv80_core/i_alu/n453 ), .B2(
        \i_tv80_core/i_alu/n101 ), .ZN(\i_tv80_core/i_alu/n103 ) );
  INV_X1 \i_tv80_core/i_alu/U230  ( .A(\i_tv80_core/i_alu/n150 ), .ZN(
        \i_tv80_core/i_alu/n101 ) );
  OAI211_X1 \i_tv80_core/i_alu/U229  ( .C1(\i_tv80_core/i_alu/n29 ), .C2(
        \i_tv80_core/i_alu/n100 ), .A(\i_tv80_core/i_alu/n127 ), .B(
        \i_tv80_core/i_alu/n99 ), .ZN(\i_tv80_core/i_alu/n150 ) );
  OAI211_X1 \i_tv80_core/i_alu/U228  ( .C1(\i_tv80_core/i_alu/n98 ), .C2(
        \i_tv80_core/i_alu/n97 ), .A(\i_tv80_core/i_alu/n96 ), .B(
        \i_tv80_core/i_alu/n366 ), .ZN(\i_tv80_core/i_alu/n99 ) );
  INV_X1 \i_tv80_core/i_alu/U227  ( .A(\i_tv80_core/F [1]), .ZN(
        \i_tv80_core/i_alu/n366 ) );
  INV_X1 \i_tv80_core/i_alu/U226  ( .A(\i_tv80_core/i_alu/n107 ), .ZN(
        \i_tv80_core/i_alu/n98 ) );
  OAI21_X1 \i_tv80_core/i_alu/U225  ( .B1(\i_tv80_core/i_alu/n113 ), .B2(
        \i_tv80_core/i_alu/n111 ), .A(\i_tv80_core/i_alu/n114 ), .ZN(
        \i_tv80_core/i_alu/n107 ) );
  NAND2_X1 \i_tv80_core/i_alu/U224  ( .A1(\i_tv80_core/i_alu/n125 ), .A2(
        \i_tv80_core/i_alu/n124 ), .ZN(\i_tv80_core/i_alu/n114 ) );
  INV_X1 \i_tv80_core/i_alu/U223  ( .A(\i_tv80_core/i_alu/n113 ), .ZN(
        \i_tv80_core/i_alu/n124 ) );
  INV_X1 \i_tv80_core/i_alu/U222  ( .A(\i_tv80_core/i_alu/n95 ), .ZN(
        \i_tv80_core/i_alu/n125 ) );
  OAI21_X1 \i_tv80_core/i_alu/U221  ( .B1(\i_tv80_core/i_alu/n18 ), .B2(
        \i_tv80_core/i_alu/n94 ), .A(\i_tv80_core/i_alu/n93 ), .ZN(
        \i_tv80_core/i_alu/n113 ) );
  NAND3_X1 \i_tv80_core/i_alu/U220  ( .A1(\i_tv80_core/i_alu/n92 ), .A2(
        \i_tv80_core/i_alu/n95 ), .A3(\i_tv80_core/i_alu/n111 ), .ZN(
        \i_tv80_core/i_alu/n93 ) );
  XOR2_X1 \i_tv80_core/i_alu/U219  ( .A(\i_tv80_core/i_alu/n91 ), .B(
        \i_tv80_core/BusA [6]), .Z(\i_tv80_core/i_alu/n111 ) );
  XOR2_X1 \i_tv80_core/i_alu/U218  ( .A(\i_tv80_core/i_alu/n90 ), .B(
        \i_tv80_core/BusA [5]), .Z(\i_tv80_core/i_alu/n95 ) );
  INV_X1 \i_tv80_core/i_alu/U217  ( .A(\i_tv80_core/i_alu/n94 ), .ZN(
        \i_tv80_core/i_alu/n92 ) );
  NAND2_X1 \i_tv80_core/i_alu/U216  ( .A1(\i_tv80_core/i_alu/n96 ), .A2(
        \i_tv80_core/i_alu/n285 ), .ZN(\i_tv80_core/i_alu/n94 ) );
  NAND2_X1 \i_tv80_core/i_alu/U215  ( .A1(\i_tv80_core/BusA [6]), .A2(
        \i_tv80_core/BusA [7]), .ZN(\i_tv80_core/i_alu/n96 ) );
  INV_X1 \i_tv80_core/i_alu/U214  ( .A(\i_tv80_core/i_alu/n91 ), .ZN(
        \i_tv80_core/i_alu/n89 ) );
  NAND3_X1 \i_tv80_core/i_alu/U213  ( .A1(\i_tv80_core/BusA [5]), .A2(
        \i_tv80_core/BusA [4]), .A3(\i_tv80_core/i_alu/n142 ), .ZN(
        \i_tv80_core/i_alu/n91 ) );
  INV_X1 \i_tv80_core/i_alu/U212  ( .A(\i_tv80_core/i_alu/n108 ), .ZN(
        \i_tv80_core/i_alu/n100 ) );
  XOR2_X1 \i_tv80_core/i_alu/U211  ( .A(\i_tv80_core/i_alu/n88 ), .B(
        \i_tv80_core/BusA [7]), .Z(\i_tv80_core/i_alu/n108 ) );
  OAI21_X1 \i_tv80_core/i_alu/U210  ( .B1(\i_tv80_core/i_alu/n119 ), .B2(
        \i_tv80_core/i_alu/n117 ), .A(\i_tv80_core/i_alu/n126 ), .ZN(
        \i_tv80_core/i_alu/n87 ) );
  NAND2_X1 \i_tv80_core/i_alu/U209  ( .A1(\i_tv80_core/i_alu/n128 ), .A2(
        \i_tv80_core/i_alu/n127 ), .ZN(\i_tv80_core/i_alu/n126 ) );
  NAND2_X1 \i_tv80_core/i_alu/U208  ( .A1(\i_tv80_core/i_alu/n88 ), .A2(
        \i_tv80_core/i_alu/n86 ), .ZN(\i_tv80_core/i_alu/n117 ) );
  OAI21_X1 \i_tv80_core/i_alu/U207  ( .B1(\i_tv80_core/BusA [5]), .B2(
        \i_tv80_core/i_alu/n85 ), .A(\i_tv80_core/BusA [6]), .ZN(
        \i_tv80_core/i_alu/n86 ) );
  NAND3_X1 \i_tv80_core/i_alu/U206  ( .A1(\i_tv80_core/i_alu/n23 ), .A2(
        \i_tv80_core/i_alu/n308 ), .A3(\i_tv80_core/i_alu/n434 ), .ZN(
        \i_tv80_core/i_alu/n85 ) );
  OAI21_X1 \i_tv80_core/i_alu/U205  ( .B1(\i_tv80_core/BusA [2]), .B2(
        \i_tv80_core/i_alu/n84 ), .A(\i_tv80_core/i_alu/n138 ), .ZN(
        \i_tv80_core/i_alu/n135 ) );
  NAND2_X1 \i_tv80_core/i_alu/U204  ( .A1(\i_tv80_core/i_alu/n139 ), .A2(
        \i_tv80_core/i_alu/n309 ), .ZN(\i_tv80_core/i_alu/n138 ) );
  INV_X1 \i_tv80_core/i_alu/U203  ( .A(\i_tv80_core/i_alu/n139 ), .ZN(
        \i_tv80_core/i_alu/n84 ) );
  INV_X1 \i_tv80_core/i_alu/U202  ( .A(\i_tv80_core/F [4]), .ZN(
        \i_tv80_core/i_alu/n83 ) );
  INV_X1 \i_tv80_core/i_alu/U201  ( .A(\i_tv80_core/i_alu/n127 ), .ZN(
        \i_tv80_core/i_alu/n119 ) );
  NAND2_X1 \i_tv80_core/i_alu/U200  ( .A1(\i_tv80_core/i_alu/n82 ), .A2(
        \i_tv80_core/i_alu/n285 ), .ZN(\i_tv80_core/i_alu/n127 ) );
  OAI21_X1 \i_tv80_core/i_alu/U199  ( .B1(\i_tv80_core/i_alu/n81 ), .B2(
        \i_tv80_core/i_alu/n329 ), .A(\i_tv80_core/BusA [7]), .ZN(
        \i_tv80_core/i_alu/n82 ) );
  NAND2_X1 \i_tv80_core/i_alu/U198  ( .A1(\i_tv80_core/i_alu/n292 ), .A2(
        \i_tv80_core/i_alu/n290 ), .ZN(\i_tv80_core/i_alu/n329 ) );
  INV_X1 \i_tv80_core/i_alu/U197  ( .A(\i_tv80_core/BusA [6]), .ZN(
        \i_tv80_core/i_alu/n290 ) );
  INV_X1 \i_tv80_core/i_alu/U196  ( .A(\i_tv80_core/i_alu/n90 ), .ZN(
        \i_tv80_core/i_alu/n81 ) );
  NAND2_X1 \i_tv80_core/i_alu/U195  ( .A1(\i_tv80_core/BusA [4]), .A2(
        \i_tv80_core/i_alu/n142 ), .ZN(\i_tv80_core/i_alu/n90 ) );
  INV_X1 \i_tv80_core/i_alu/U194  ( .A(\i_tv80_core/i_alu/n312 ), .ZN(
        \i_tv80_core/i_alu/n142 ) );
  NAND2_X1 \i_tv80_core/i_alu/U193  ( .A1(\i_tv80_core/i_alu/n2 ), .A2(
        \i_tv80_core/i_alu/n133 ), .ZN(\i_tv80_core/i_alu/n312 ) );
  NAND2_X1 \i_tv80_core/i_alu/U192  ( .A1(\i_tv80_core/i_alu/n310 ), .A2(
        \i_tv80_core/i_alu/n309 ), .ZN(\i_tv80_core/i_alu/n133 ) );
  INV_X1 \i_tv80_core/i_alu/U191  ( .A(\i_tv80_core/i_alu/n412 ), .ZN(
        \i_tv80_core/i_alu/n453 ) );
  NAND3_X1 \i_tv80_core/i_alu/U190  ( .A1(\i_tv80_core/i_alu/n48 ), .A2(
        \i_tv80_core/i_alu/n444 ), .A3(\i_tv80_core/i_alu/n450 ), .ZN(
        \i_tv80_core/i_alu/n102 ) );
  OAI21_X1 \i_tv80_core/i_alu/U189  ( .B1(\i_tv80_core/i_alu/n230 ), .B2(
        \i_tv80_core/i_alu/n228 ), .A(\i_tv80_core/ALU_Op_r [3]), .ZN(
        \i_tv80_core/i_alu/n450 ) );
  NAND3_X1 \i_tv80_core/i_alu/U188  ( .A1(\i_tv80_core/i_alu/n14 ), .A2(
        \i_tv80_core/ALU_Op_r [2]), .A3(\i_tv80_core/i_alu/n4 ), .ZN(
        \i_tv80_core/i_alu/n235 ) );
  INV_X1 \i_tv80_core/i_alu/U187  ( .A(\i_tv80_core/i_alu/n234 ), .ZN(
        \i_tv80_core/i_alu/n230 ) );
  NAND2_X1 \i_tv80_core/i_alu/U186  ( .A1(\i_tv80_core/i_alu/n16 ), .A2(
        \i_tv80_core/i_alu/n79 ), .ZN(\i_tv80_core/i_alu/n234 ) );
  NAND3_X1 \i_tv80_core/i_alu/U185  ( .A1(\i_tv80_core/ALU_Op_r [3]), .A2(
        \i_tv80_core/i_alu/n15 ), .A3(\i_tv80_core/i_alu/n78 ), .ZN(
        \i_tv80_core/i_alu/n444 ) );
  NAND2_X1 \i_tv80_core/i_alu/U184  ( .A1(\i_tv80_core/i_alu/n227 ), .A2(
        \i_tv80_core/ALU_Op_r [3]), .ZN(\i_tv80_core/i_alu/n412 ) );
  INV_X1 \i_tv80_core/i_alu/U183  ( .A(\i_tv80_core/i_alu/n316 ), .ZN(
        \i_tv80_core/i_alu/n227 ) );
  NAND2_X1 \i_tv80_core/i_alu/U182  ( .A1(\i_tv80_core/i_alu/n79 ), .A2(
        \i_tv80_core/i_alu/n4 ), .ZN(\i_tv80_core/i_alu/n316 ) );
  INV_X1 \i_tv80_core/i_alu/U181  ( .A(\i_tv80_core/i_alu/n77 ), .ZN(
        \i_tv80_core/i_alu/n79 ) );
  INV_X1 \i_tv80_core/i_alu/U180  ( .A(\i_tv80_core/i_alu/n323 ), .ZN(
        \i_tv80_core/i_alu/n258 ) );
  OAI21_X1 \i_tv80_core/i_alu/U179  ( .B1(\i_tv80_core/i_alu/n361 ), .B2(
        \i_tv80_core/i_alu/n305 ), .A(\i_tv80_core/i_alu/n459 ), .ZN(
        \i_tv80_core/i_alu/n323 ) );
  NAND3_X1 \i_tv80_core/i_alu/U178  ( .A1(\i_tv80_core/ALU_Op_r [3]), .A2(
        \i_tv80_core/i_alu/n16 ), .A3(\i_tv80_core/i_alu/n76 ), .ZN(
        \i_tv80_core/i_alu/n459 ) );
  NAND2_X1 \i_tv80_core/i_alu/U177  ( .A1(\i_tv80_core/i_alu/n75 ), .A2(
        \i_tv80_core/ALU_Op_r [2]), .ZN(\i_tv80_core/i_alu/n305 ) );
  INV_X1 \i_tv80_core/i_alu/U176  ( .A(\i_tv80_core/i_alu/n155 ), .ZN(
        \i_tv80_core/i_alu/n75 ) );
  NAND2_X1 \i_tv80_core/i_alu/U175  ( .A1(\i_tv80_core/i_alu/n14 ), .A2(
        \i_tv80_core/i_alu/n16 ), .ZN(\i_tv80_core/i_alu/n155 ) );
  INV_X1 \i_tv80_core/i_alu/U174  ( .A(\i_tv80_core/ALU_Op_r [3]), .ZN(
        \i_tv80_core/i_alu/n361 ) );
  NAND3_X1 \i_tv80_core/i_alu/U173  ( .A1(\i_tv80_core/i_alu/n78 ), .A2(
        \i_tv80_core/ALU_Op_r [3]), .A3(\i_tv80_core/i_alu/n10 ), .ZN(
        \i_tv80_core/i_alu/n468 ) );
  INV_X1 \i_tv80_core/i_alu/U172  ( .A(\i_tv80_core/i_alu/n315 ), .ZN(
        \i_tv80_core/i_alu/n78 ) );
  MUX2_X1 \i_tv80_core/i_alu/U171  ( .A(\i_tv80_core/i_alu/n291 ), .B(
        \i_tv80_core/i_alu/n385 ), .S(\i_tv80_core/n570 ), .Z(
        \i_tv80_core/i_alu/n104 ) );
  INV_X1 \i_tv80_core/i_alu/U170  ( .A(\i_tv80_core/BusA [0]), .ZN(
        \i_tv80_core/i_alu/n385 ) );
  INV_X1 \i_tv80_core/i_alu/U169  ( .A(\i_tv80_core/BusA [7]), .ZN(
        \i_tv80_core/i_alu/n291 ) );
  MUX2_X1 \i_tv80_core/i_alu/U168  ( .A(\i_tv80_core/i_alu/n315 ), .B(
        \i_tv80_core/i_alu/n314 ), .S(\i_tv80_core/i_alu/n154 ), .Z(
        \i_tv80_core/i_alu/n105 ) );
  INV_X1 \i_tv80_core/i_alu/U167  ( .A(\i_tv80_core/i_alu/n74 ), .ZN(
        \i_tv80_core/i_alu/n154 ) );
  OAI21_X1 \i_tv80_core/i_alu/U166  ( .B1(\i_tv80_core/i_alu/n236 ), .B2(
        \i_tv80_core/i_alu/n231 ), .A(\i_tv80_core/i_alu/n73 ), .ZN(
        \i_tv80_core/i_alu/n74 ) );
  OAI21_X1 \i_tv80_core/i_alu/U165  ( .B1(\i_tv80_core/i_alu/n33 ), .B2(
        \i_tv80_core/i_alu/n233 ), .A(\i_tv80_core/BusA [7]), .ZN(
        \i_tv80_core/i_alu/n73 ) );
  INV_X1 \i_tv80_core/i_alu/U164  ( .A(\i_tv80_core/i_alu/n236 ), .ZN(
        \i_tv80_core/i_alu/n233 ) );
  XOR2_X1 \i_tv80_core/i_alu/U163  ( .A(\i_tv80_core/i_alu/n4 ), .B(
        \i_tv80_core/BusB [6]), .Z(\i_tv80_core/i_alu/n185 ) );
  NAND2_X1 \i_tv80_core/i_alu/U162  ( .A1(\i_tv80_core/i_alu/n68 ), .A2(
        \i_tv80_core/i_alu/n67 ), .ZN(\i_tv80_core/i_alu/n186 ) );
  OAI21_X1 \i_tv80_core/i_alu/U161  ( .B1(\i_tv80_core/i_alu/n12 ), .B2(
        \i_tv80_core/i_alu/n292 ), .A(\i_tv80_core/i_alu/n192 ), .ZN(
        \i_tv80_core/i_alu/n67 ) );
  XOR2_X1 \i_tv80_core/i_alu/U160  ( .A(\i_tv80_core/i_alu/n3 ), .B(
        \i_tv80_core/BusB [5]), .Z(\i_tv80_core/i_alu/n192 ) );
  NAND2_X1 \i_tv80_core/i_alu/U159  ( .A1(\i_tv80_core/i_alu/n12 ), .A2(
        \i_tv80_core/i_alu/n292 ), .ZN(\i_tv80_core/i_alu/n68 ) );
  INV_X1 \i_tv80_core/i_alu/U158  ( .A(\i_tv80_core/BusA [5]), .ZN(
        \i_tv80_core/i_alu/n292 ) );
  NAND3_X1 \i_tv80_core/i_alu/U157  ( .A1(\i_tv80_core/i_alu/n156 ), .A2(
        \i_tv80_core/i_alu/n64 ), .A3(\i_tv80_core/i_alu/n170 ), .ZN(
        \i_tv80_core/i_alu/n65 ) );
  OAI211_X1 \i_tv80_core/i_alu/U156  ( .C1(\i_tv80_core/i_alu/n8 ), .C2(
        \i_tv80_core/i_alu/n164 ), .A(\i_tv80_core/i_alu/n174 ), .B(
        \i_tv80_core/i_alu/n167 ), .ZN(\i_tv80_core/i_alu/n156 ) );
  NAND2_X1 \i_tv80_core/i_alu/U155  ( .A1(\i_tv80_core/BusA [2]), .A2(
        \i_tv80_core/i_alu/n204 ), .ZN(\i_tv80_core/i_alu/n167 ) );
  INV_X1 \i_tv80_core/i_alu/U154  ( .A(\i_tv80_core/i_alu/n63 ), .ZN(
        \i_tv80_core/i_alu/n204 ) );
  NAND3_X1 \i_tv80_core/i_alu/U153  ( .A1(\i_tv80_core/i_alu/n62 ), .A2(
        \i_tv80_core/i_alu/n61 ), .A3(\i_tv80_core/i_alu/n199 ), .ZN(
        \i_tv80_core/i_alu/n174 ) );
  INV_X1 \i_tv80_core/i_alu/U152  ( .A(\i_tv80_core/i_alu/n200 ), .ZN(
        \i_tv80_core/i_alu/n62 ) );
  NAND2_X1 \i_tv80_core/i_alu/U151  ( .A1(\i_tv80_core/BusA [0]), .A2(
        \i_tv80_core/i_alu/n51 ), .ZN(\i_tv80_core/i_alu/n200 ) );
  NAND2_X1 \i_tv80_core/i_alu/U150  ( .A1(\i_tv80_core/i_alu/n61 ), .A2(
        \i_tv80_core/i_alu/n199 ), .ZN(\i_tv80_core/i_alu/n164 ) );
  NAND2_X1 \i_tv80_core/i_alu/U149  ( .A1(\i_tv80_core/i_alu/n60 ), .A2(
        \i_tv80_core/i_alu/n309 ), .ZN(\i_tv80_core/i_alu/n199 ) );
  NAND2_X1 \i_tv80_core/i_alu/U148  ( .A1(\i_tv80_core/i_alu/n63 ), .A2(
        \i_tv80_core/i_alu/n310 ), .ZN(\i_tv80_core/i_alu/n61 ) );
  INV_X1 \i_tv80_core/i_alu/U147  ( .A(\i_tv80_core/BusA [2]), .ZN(
        \i_tv80_core/i_alu/n310 ) );
  XOR2_X1 \i_tv80_core/i_alu/U146  ( .A(\i_tv80_core/i_alu/n4 ), .B(
        \i_tv80_core/BusB [2]), .Z(\i_tv80_core/i_alu/n63 ) );
  NAND2_X1 \i_tv80_core/i_alu/U145  ( .A1(\i_tv80_core/i_alu/n202 ), .A2(
        \i_tv80_core/i_alu/n201 ), .ZN(\i_tv80_core/i_alu/n166 ) );
  OAI21_X1 \i_tv80_core/i_alu/U144  ( .B1(\i_tv80_core/BusA [0]), .B2(
        \i_tv80_core/i_alu/n51 ), .A(\i_tv80_core/i_alu/n220 ), .ZN(
        \i_tv80_core/i_alu/n201 ) );
  OAI21_X1 \i_tv80_core/i_alu/U143  ( .B1(\i_tv80_core/i_alu/n59 ), .B2(
        \i_tv80_core/i_alu/n3 ), .A(\i_tv80_core/i_alu/n58 ), .ZN(
        \i_tv80_core/i_alu/n220 ) );
  NAND3_X1 \i_tv80_core/i_alu/U142  ( .A1(\i_tv80_core/i_alu/n15 ), .A2(
        \i_tv80_core/i_alu/n80 ), .A3(\i_tv80_core/F [0]), .ZN(
        \i_tv80_core/i_alu/n58 ) );
  NOR3_X1 \i_tv80_core/i_alu/U141  ( .A1(\i_tv80_core/ALU_Op_r [2]), .A2(
        \i_tv80_core/i_alu/n10 ), .A3(\i_tv80_core/i_alu/n285 ), .ZN(
        \i_tv80_core/i_alu/n59 ) );
  INV_X1 \i_tv80_core/i_alu/U140  ( .A(\i_tv80_core/F [0]), .ZN(
        \i_tv80_core/i_alu/n285 ) );
  NAND2_X1 \i_tv80_core/i_alu/U139  ( .A1(\i_tv80_core/BusA [1]), .A2(
        \i_tv80_core/i_alu/n212 ), .ZN(\i_tv80_core/i_alu/n202 ) );
  INV_X1 \i_tv80_core/i_alu/U138  ( .A(\i_tv80_core/i_alu/n60 ), .ZN(
        \i_tv80_core/i_alu/n212 ) );
  NAND2_X1 \i_tv80_core/i_alu/U137  ( .A1(\i_tv80_core/i_alu/n157 ), .A2(
        \i_tv80_core/i_alu/n308 ), .ZN(\i_tv80_core/i_alu/n170 ) );
  INV_X1 \i_tv80_core/i_alu/U136  ( .A(\i_tv80_core/BusA [3]), .ZN(
        \i_tv80_core/i_alu/n308 ) );
  NAND2_X1 \i_tv80_core/i_alu/U135  ( .A1(\i_tv80_core/i_alu/n2 ), .A2(
        \i_tv80_core/i_alu/n57 ), .ZN(\i_tv80_core/i_alu/n168 ) );
  INV_X1 \i_tv80_core/i_alu/U134  ( .A(\i_tv80_core/i_alu/n157 ), .ZN(
        \i_tv80_core/i_alu/n57 ) );
  XOR2_X1 \i_tv80_core/i_alu/U133  ( .A(\i_tv80_core/i_alu/n3 ), .B(
        \i_tv80_core/BusB [3]), .Z(\i_tv80_core/i_alu/n157 ) );
  INV_X1 \i_tv80_core/i_alu/U132  ( .A(\i_tv80_core/i_alu/n64 ), .ZN(
        \i_tv80_core/i_alu/n66 ) );
  NAND2_X1 \i_tv80_core/i_alu/U131  ( .A1(\i_tv80_core/i_alu/n176 ), .A2(
        \i_tv80_core/i_alu/n434 ), .ZN(\i_tv80_core/i_alu/n64 ) );
  INV_X1 \i_tv80_core/i_alu/U130  ( .A(\i_tv80_core/BusA [4]), .ZN(
        \i_tv80_core/i_alu/n434 ) );
  XOR2_X1 \i_tv80_core/i_alu/U129  ( .A(\i_tv80_core/i_alu/n3 ), .B(
        \i_tv80_core/BusB [4]), .Z(\i_tv80_core/i_alu/n176 ) );
  XOR2_X1 \i_tv80_core/i_alu/U128  ( .A(\i_tv80_core/i_alu/n3 ), .B(
        \i_tv80_core/BusB [7]), .Z(\i_tv80_core/i_alu/n236 ) );
  NAND2_X1 \i_tv80_core/i_alu/U127  ( .A1(\i_tv80_core/i_alu/n16 ), .A2(
        \i_tv80_core/i_alu/n77 ), .ZN(\i_tv80_core/i_alu/n314 ) );
  NAND2_X1 \i_tv80_core/i_alu/U126  ( .A1(\i_tv80_core/ALU_Op_r [2]), .A2(
        \i_tv80_core/i_alu/n10 ), .ZN(\i_tv80_core/i_alu/n77 ) );
  NAND2_X1 \i_tv80_core/i_alu/U125  ( .A1(\i_tv80_core/i_alu/n76 ), .A2(
        \i_tv80_core/i_alu/n4 ), .ZN(\i_tv80_core/i_alu/n315 ) );
  INV_X1 \i_tv80_core/i_alu/U124  ( .A(\i_tv80_core/ALU_Op_r [2]), .ZN(
        \i_tv80_core/i_alu/n76 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U123  ( .A(\i_tv80_core/BusA [5]), .B(
        \i_tv80_core/BusA [4]), .ZN(\i_tv80_core/i_alu/n272 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U122  ( .A(\i_tv80_core/BusA [7]), .B(
        \i_tv80_core/BusA [6]), .ZN(\i_tv80_core/i_alu/n273 ) );
  MUX2_X1 \i_tv80_core/i_alu/U121  ( .A(\i_tv80_core/i_alu/n314 ), .B(
        \i_tv80_core/i_alu/n315 ), .S(\i_tv80_core/i_alu/n313 ), .Z(
        \i_tv80_core/i_alu/n317 ) );
  INV_X1 \i_tv80_core/i_alu/U120  ( .A(\i_tv80_core/i_alu/n56 ), .ZN(
        \i_tv80_core/i_alu/n55 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U119  ( .A(\i_tv80_core/BusA [2]), .B(
        \i_tv80_core/i_alu/n7 ), .ZN(\i_tv80_core/i_alu/n54 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U118  ( .A(\i_tv80_core/i_alu/n106 ), .B(
        \i_tv80_core/i_alu/n54 ), .ZN(\i_tv80_core/i_alu/n413 ) );
  AND2_X1 \i_tv80_core/i_alu/U117  ( .A1(\i_tv80_core/n185 ), .A2(
        \i_tv80_core/n110 ), .ZN(\i_tv80_core/i_alu/n53 ) );
  AND2_X1 \i_tv80_core/i_alu/U116  ( .A1(\i_tv80_core/BusB [7]), .A2(
        \i_tv80_core/i_alu/n464 ), .ZN(\i_tv80_core/i_alu/n52 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U115  ( .A(\i_tv80_core/BusA [5]), .B(
        \i_tv80_core/i_alu/n192 ), .ZN(\i_tv80_core/i_alu/n193 ) );
  NAND2_X1 \i_tv80_core/i_alu/U114  ( .A1(\i_tv80_core/BusA [6]), .A2(
        \i_tv80_core/i_alu/n400 ), .ZN(\i_tv80_core/i_alu/n456 ) );
  OAI21_X1 \i_tv80_core/i_alu/U113  ( .B1(\i_tv80_core/BusA [6]), .B2(
        \i_tv80_core/i_alu/n235 ), .A(\i_tv80_core/i_alu/n234 ), .ZN(
        \i_tv80_core/i_alu/n187 ) );
  NAND2_X1 \i_tv80_core/i_alu/U112  ( .A1(\i_tv80_core/BusB [6]), .A2(
        \i_tv80_core/i_alu/n187 ), .ZN(\i_tv80_core/i_alu/n188 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U111  ( .A(\i_tv80_core/BusA [0]), .B(
        \i_tv80_core/i_alu/n337 ), .ZN(\i_tv80_core/i_alu/n110 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U110  ( .A(\i_tv80_core/i_alu/n110 ), .B(
        \i_tv80_core/i_alu/n333 ), .ZN(\i_tv80_core/i_alu/n132 ) );
  NOR2_X1 \i_tv80_core/i_alu/U109  ( .A1(\i_tv80_core/i_alu/n255 ), .A2(
        \i_tv80_core/i_alu/n254 ), .ZN(\i_tv80_core/i_alu/n271 ) );
  AOI211_X1 \i_tv80_core/i_alu/U108  ( .C1(\i_tv80_core/i_alu/n271 ), .C2(
        \i_tv80_core/i_alu/n270 ), .A(\i_tv80_core/i_alu/n42 ), .B(
        \i_tv80_core/i_alu/n49 ), .ZN(\i_tv80_core/i_alu/n298 ) );
  OAI211_X1 \i_tv80_core/i_alu/U107  ( .C1(\i_tv80_core/i_alu/n299 ), .C2(
        \i_tv80_core/i_alu/n412 ), .A(\i_tv80_core/i_alu/n298 ), .B(
        \i_tv80_core/i_alu/n297 ), .ZN(\i_tv80_core/F_Out [2]) );
  OAI22_X1 \i_tv80_core/i_alu/U106  ( .A1(\i_tv80_core/ALU_Op_r [3]), .A2(
        \i_tv80_core/i_alu/n445 ), .B1(\i_tv80_core/i_alu/n444 ), .B2(
        \i_tv80_core/i_alu/n443 ), .ZN(\i_tv80_core/i_alu/n448 ) );
  NOR2_X1 \i_tv80_core/i_alu/U105  ( .A1(\i_tv80_core/i_alu/n446 ), .A2(
        \i_tv80_core/i_alu/n449 ), .ZN(\i_tv80_core/i_alu/n447 ) );
  NOR2_X1 \i_tv80_core/i_alu/U104  ( .A1(\i_tv80_core/i_alu/n448 ), .A2(
        \i_tv80_core/i_alu/n447 ), .ZN(\i_tv80_core/i_alu/n458 ) );
  OAI21_X1 \i_tv80_core/i_alu/U103  ( .B1(\i_tv80_core/i_alu/n237 ), .B2(
        \i_tv80_core/i_alu/n189 ), .A(\i_tv80_core/i_alu/n188 ), .ZN(
        \i_tv80_core/i_alu/n190 ) );
  AOI21_X1 \i_tv80_core/i_alu/U102  ( .B1(\i_tv80_core/i_alu/n184 ), .B2(
        \i_tv80_core/i_alu/n234 ), .A(\i_tv80_core/i_alu/n290 ), .ZN(
        \i_tv80_core/i_alu/n191 ) );
  NOR2_X1 \i_tv80_core/i_alu/U101  ( .A1(\i_tv80_core/i_alu/n191 ), .A2(
        \i_tv80_core/i_alu/n190 ), .ZN(\i_tv80_core/i_alu/n445 ) );
  NAND4_X1 \i_tv80_core/i_alu/U100  ( .A1(\i_tv80_core/i_alu/n458 ), .A2(
        \i_tv80_core/i_alu/n457 ), .A3(\i_tv80_core/i_alu/n456 ), .A4(
        \i_tv80_core/i_alu/n455 ), .ZN(\i_tv80_core/ALU_Q [6]) );
  NAND2_X1 \i_tv80_core/i_alu/U99  ( .A1(\i_tv80_core/i_alu/n68 ), .A2(
        \i_tv80_core/BusA [6]), .ZN(\i_tv80_core/i_alu/n69 ) );
  NAND2_X1 \i_tv80_core/i_alu/U98  ( .A1(\i_tv80_core/i_alu/n186 ), .A2(
        \i_tv80_core/i_alu/n290 ), .ZN(\i_tv80_core/i_alu/n72 ) );
  OAI21_X1 \i_tv80_core/i_alu/U97  ( .B1(\i_tv80_core/i_alu/n70 ), .B2(
        \i_tv80_core/i_alu/n69 ), .A(\i_tv80_core/i_alu/n185 ), .ZN(
        \i_tv80_core/i_alu/n71 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U96  ( .A(\i_tv80_core/i_alu/n80 ), .B(
        \i_tv80_core/BusB [0]), .ZN(\i_tv80_core/i_alu/n51 ) );
  INV_X1 \i_tv80_core/i_alu/U95  ( .A(\i_tv80_core/i_alu/n248 ), .ZN(
        \i_tv80_core/i_alu/n250 ) );
  AND2_X1 \i_tv80_core/i_alu/U94  ( .A1(\i_tv80_core/i_alu/n305 ), .A2(
        \i_tv80_core/i_alu/n361 ), .ZN(\i_tv80_core/i_alu/n50 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U93  ( .A(\i_tv80_core/i_alu/n332 ), .B(
        \i_tv80_core/i_alu/n399 ), .ZN(\i_tv80_core/i_alu/n277 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U92  ( .A(\i_tv80_core/i_alu/n330 ), .B(
        \i_tv80_core/i_alu/n331 ), .ZN(\i_tv80_core/i_alu/n276 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U91  ( .A(\i_tv80_core/i_alu/n277 ), .B(
        \i_tv80_core/i_alu/n276 ), .ZN(\i_tv80_core/i_alu/n278 ) );
  AND4_X1 \i_tv80_core/i_alu/U90  ( .A1(\i_tv80_core/i_alu/n426 ), .A2(
        \i_tv80_core/i_alu/n442 ), .A3(\i_tv80_core/i_alu/n269 ), .A4(
        \i_tv80_core/i_alu/n268 ), .ZN(\i_tv80_core/i_alu/n49 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U89  ( .A(\i_tv80_core/i_alu/n369 ), .B(
        \i_tv80_core/i_alu/n375 ), .ZN(\i_tv80_core/i_alu/n288 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U88  ( .A(\i_tv80_core/i_alu/n401 ), .B(
        \i_tv80_core/i_alu/n387 ), .ZN(\i_tv80_core/i_alu/n289 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U87  ( .A(\i_tv80_core/i_alu/n289 ), .B(
        \i_tv80_core/i_alu/n288 ), .ZN(\i_tv80_core/i_alu/n294 ) );
  AND2_X1 \i_tv80_core/i_alu/U86  ( .A1(\i_tv80_core/i_alu/n258 ), .A2(
        \i_tv80_core/i_alu/n412 ), .ZN(\i_tv80_core/i_alu/n48 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U85  ( .A(\i_tv80_core/i_alu/n273 ), .B(
        \i_tv80_core/i_alu/n272 ), .ZN(\i_tv80_core/i_alu/n279 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U84  ( .A(\i_tv80_core/i_alu/n294 ), .B(
        \i_tv80_core/i_alu/n293 ), .ZN(\i_tv80_core/i_alu/n295 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U83  ( .A(\i_tv80_core/i_alu/n279 ), .B(
        \i_tv80_core/i_alu/n278 ), .ZN(\i_tv80_core/i_alu/n296 ) );
  AOI22_X1 \i_tv80_core/i_alu/U82  ( .A1(\i_tv80_core/i_alu/n400 ), .A2(
        \i_tv80_core/i_alu/n296 ), .B1(\i_tv80_core/i_alu/n370 ), .B2(
        \i_tv80_core/i_alu/n295 ), .ZN(\i_tv80_core/i_alu/n297 ) );
  INV_X1 \i_tv80_core/i_alu/U81  ( .A(\i_tv80_core/n1950 ), .ZN(
        \i_tv80_core/i_alu/n56 ) );
  AND2_X1 \i_tv80_core/i_alu/U80  ( .A1(\i_tv80_core/i_alu/n452 ), .A2(
        \i_tv80_core/i_alu/n321 ), .ZN(\i_tv80_core/i_alu/n47 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U79  ( .A(\i_tv80_core/i_alu/n334 ), .B(
        \i_tv80_core/i_alu/n335 ), .ZN(\i_tv80_core/i_alu/n131 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U78  ( .A(\i_tv80_core/i_alu/n150 ), .B(
        \i_tv80_core/i_alu/n423 ), .ZN(\i_tv80_core/i_alu/n151 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U77  ( .A(\i_tv80_core/i_alu/n132 ), .B(
        \i_tv80_core/i_alu/n131 ), .ZN(\i_tv80_core/i_alu/n153 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U76  ( .A(\i_tv80_core/i_alu/n153 ), .B(
        \i_tv80_core/i_alu/n152 ), .ZN(\i_tv80_core/i_alu/n299 ) );
  NAND2_X1 \i_tv80_core/i_alu/U75  ( .A1(\i_tv80_core/i_alu/n314 ), .A2(
        \i_tv80_core/i_alu/n315 ), .ZN(\i_tv80_core/i_alu/n232 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U74  ( .A(\i_tv80_core/i_alu/n313 ), .B(
        \i_tv80_core/i_alu/n176 ), .ZN(\i_tv80_core/i_alu/n181 ) );
  XOR2_X1 \i_tv80_core/i_alu/U73  ( .A(\i_tv80_core/i_alu/n33 ), .B(
        \i_tv80_core/i_alu/n154 ), .Z(\i_tv80_core/i_alu/n46 ) );
  AND2_X1 \i_tv80_core/i_alu/U72  ( .A1(\i_tv80_core/i_alu/n46 ), .A2(
        \i_tv80_core/i_alu/n248 ), .ZN(\i_tv80_core/i_alu/n255 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U71  ( .A(\i_tv80_core/i_alu/n157 ), .B(
        \i_tv80_core/i_alu/n36 ), .ZN(\i_tv80_core/i_alu/n158 ) );
  INV_X1 \i_tv80_core/i_alu/U70  ( .A(\i_tv80_core/i_alu/n235 ), .ZN(
        \i_tv80_core/i_alu/n228 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U69  ( .A(\i_tv80_core/i_alu/n414 ), .B(
        \i_tv80_core/i_alu/n351 ), .ZN(\i_tv80_core/i_alu/n45 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U68  ( .A(\i_tv80_core/i_alu/n45 ), .B(
        \i_tv80_core/i_alu/n198 ), .ZN(\i_tv80_core/i_alu/n251 ) );
  AND2_X1 \i_tv80_core/i_alu/U67  ( .A1(\i_tv80_core/i_alu/n453 ), .A2(
        \i_tv80_core/i_alu/n335 ), .ZN(\i_tv80_core/i_alu/n44 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U66  ( .A(\i_tv80_core/i_alu/n245 ), .B(
        \i_tv80_core/i_alu/n9 ), .ZN(\i_tv80_core/i_alu/n249 ) );
  INV_X1 \i_tv80_core/i_alu/U65  ( .A(\i_tv80_core/i_alu/n251 ), .ZN(
        \i_tv80_core/i_alu/n247 ) );
  AOI22_X1 \i_tv80_core/i_alu/U64  ( .A1(\i_tv80_core/i_alu/n454 ), .A2(
        \i_tv80_core/i_alu/n453 ), .B1(\i_tv80_core/i_alu/n452 ), .B2(
        \i_tv80_core/i_alu/n451 ), .ZN(\i_tv80_core/i_alu/n455 ) );
  INV_X1 \i_tv80_core/i_alu/U63  ( .A(\i_tv80_core/i_alu/n249 ), .ZN(
        \i_tv80_core/i_alu/n246 ) );
  OR2_X1 \i_tv80_core/i_alu/U62  ( .A1(\i_tv80_core/i_alu/n85 ), .A2(
        \i_tv80_core/i_alu/n329 ), .ZN(\i_tv80_core/i_alu/n88 ) );
  INV_X1 \i_tv80_core/i_alu/U61  ( .A(\i_tv80_core/i_alu/n35 ), .ZN(
        \i_tv80_core/i_alu/n70 ) );
  AND2_X1 \i_tv80_core/i_alu/U60  ( .A1(\i_tv80_core/F [2]), .A2(
        \i_tv80_core/i_alu/n371 ), .ZN(\i_tv80_core/i_alu/n42 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U59  ( .A(\i_tv80_core/i_alu/n185 ), .B(
        \i_tv80_core/BusA [6]), .ZN(\i_tv80_core/i_alu/n41 ) );
  XOR2_X1 \i_tv80_core/i_alu/U58  ( .A(\i_tv80_core/i_alu/n41 ), .B(
        \i_tv80_core/i_alu/n186 ), .Z(\i_tv80_core/i_alu/n189 ) );
  XOR2_X1 \i_tv80_core/i_alu/U57  ( .A(\i_tv80_core/i_alu/n340 ), .B(
        \i_tv80_core/i_alu/n451 ), .Z(\i_tv80_core/i_alu/n40 ) );
  XOR2_X1 \i_tv80_core/i_alu/U56  ( .A(\i_tv80_core/i_alu/n424 ), .B(
        \i_tv80_core/i_alu/n342 ), .Z(\i_tv80_core/i_alu/n39 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U55  ( .A(\i_tv80_core/i_alu/n39 ), .B(
        \i_tv80_core/i_alu/n40 ), .ZN(\i_tv80_core/i_alu/n293 ) );
  XOR2_X1 \i_tv80_core/i_alu/U54  ( .A(\i_tv80_core/i_alu/n338 ), .B(
        \i_tv80_core/i_alu/n398 ), .Z(\i_tv80_core/i_alu/n38 ) );
  XOR2_X1 \i_tv80_core/i_alu/U53  ( .A(\i_tv80_core/i_alu/n38 ), .B(
        \i_tv80_core/i_alu/n151 ), .Z(\i_tv80_core/i_alu/n152 ) );
  XOR2_X1 \i_tv80_core/i_alu/U52  ( .A(\i_tv80_core/i_alu/n403 ), .B(
        \i_tv80_core/i_alu/n389 ), .Z(\i_tv80_core/i_alu/n37 ) );
  XOR2_X1 \i_tv80_core/i_alu/U51  ( .A(\i_tv80_core/i_alu/n37 ), .B(
        \i_tv80_core/i_alu/n378 ), .Z(\i_tv80_core/i_alu/n245 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U50  ( .A(\i_tv80_core/i_alu/n16 ), .B(
        \i_tv80_core/BusB [1]), .ZN(\i_tv80_core/i_alu/n60 ) );
  OAI211_X1 \i_tv80_core/i_alu/U49  ( .C1(\i_tv80_core/i_alu/n8 ), .C2(
        \i_tv80_core/i_alu/n164 ), .A(\i_tv80_core/i_alu/n174 ), .B(
        \i_tv80_core/i_alu/n167 ), .ZN(\i_tv80_core/i_alu/n36 ) );
  OAI21_X1 \i_tv80_core/i_alu/U48  ( .B1(\i_tv80_core/i_alu/n13 ), .B2(
        \i_tv80_core/i_alu/n292 ), .A(\i_tv80_core/i_alu/n192 ), .ZN(
        \i_tv80_core/i_alu/n35 ) );
  AND3_X1 \i_tv80_core/i_alu/U47  ( .A1(\i_tv80_core/i_alu/n434 ), .A2(
        \i_tv80_core/i_alu/n308 ), .A3(\i_tv80_core/i_alu/n135 ), .ZN(
        \i_tv80_core/i_alu/n34 ) );
  XNOR2_X1 \i_tv80_core/i_alu/U46  ( .A(\i_tv80_core/i_alu/n34 ), .B(
        \i_tv80_core/BusA [5]), .ZN(\i_tv80_core/i_alu/n128 ) );
  AND2_X2 \i_tv80_core/i_alu/U45  ( .A1(\i_tv80_core/i_alu/n72 ), .A2(
        \i_tv80_core/i_alu/n71 ), .ZN(\i_tv80_core/i_alu/n33 ) );
  OAI21_X1 \i_tv80_core/i_alu/U44  ( .B1(\i_tv80_core/i_alu/n119 ), .B2(
        \i_tv80_core/i_alu/n117 ), .A(\i_tv80_core/i_alu/n126 ), .ZN(
        \i_tv80_core/i_alu/n32 ) );
  INV_X1 \i_tv80_core/i_alu/U43  ( .A(\i_tv80_core/i_alu/n87 ), .ZN(
        \i_tv80_core/i_alu/n29 ) );
  INV_X1 \i_tv80_core/i_alu/U42  ( .A(\i_tv80_core/i_alu/n108 ), .ZN(
        \i_tv80_core/i_alu/n28 ) );
  NAND2_X1 \i_tv80_core/i_alu/U41  ( .A1(\i_tv80_core/i_alu/n30 ), .A2(
        \i_tv80_core/i_alu/n31 ), .ZN(\i_tv80_core/i_alu/n43 ) );
  NAND2_X1 \i_tv80_core/i_alu/U40  ( .A1(\i_tv80_core/i_alu/n28 ), .A2(
        \i_tv80_core/i_alu/n32 ), .ZN(\i_tv80_core/i_alu/n31 ) );
  NAND2_X1 \i_tv80_core/i_alu/U39  ( .A1(\i_tv80_core/i_alu/n108 ), .A2(
        \i_tv80_core/i_alu/n29 ), .ZN(\i_tv80_core/i_alu/n30 ) );
  NOR2_X1 \i_tv80_core/i_alu/U38  ( .A1(\i_tv80_core/i_alu/n33 ), .A2(
        \i_tv80_core/i_alu/n5 ), .ZN(\i_tv80_core/i_alu/n238 ) );
  NOR3_X1 \i_tv80_core/i_alu/U37  ( .A1(\i_tv80_core/i_alu/n26 ), .A2(
        \i_tv80_core/i_alu/n27 ), .A3(\i_tv80_core/i_alu/n238 ), .ZN(
        \i_tv80_core/i_alu/n241 ) );
  AND2_X1 \i_tv80_core/i_alu/U36  ( .A1(\i_tv80_core/BusB [7]), .A2(
        \i_tv80_core/i_alu/n239 ), .ZN(\i_tv80_core/i_alu/n27 ) );
  AND2_X1 \i_tv80_core/i_alu/U35  ( .A1(\i_tv80_core/i_alu/n33 ), .A2(
        \i_tv80_core/i_alu/n240 ), .ZN(\i_tv80_core/i_alu/n26 ) );
  OR2_X1 \i_tv80_core/i_alu/U34  ( .A1(\i_tv80_core/i_alu/n66 ), .A2(
        \i_tv80_core/i_alu/n168 ), .ZN(\i_tv80_core/i_alu/n25 ) );
  OR2_X1 \i_tv80_core/i_alu/U33  ( .A1(\i_tv80_core/i_alu/n176 ), .A2(
        \i_tv80_core/i_alu/n434 ), .ZN(\i_tv80_core/i_alu/n24 ) );
  OAI21_X1 \i_tv80_core/i_alu/U32  ( .B1(\i_tv80_core/BusA [2]), .B2(
        \i_tv80_core/i_alu/n84 ), .A(\i_tv80_core/i_alu/n138 ), .ZN(
        \i_tv80_core/i_alu/n23 ) );
  NOR3_X1 \i_tv80_core/i_alu/U31  ( .A1(\i_tv80_core/i_alu/n461 ), .A2(
        \i_tv80_core/i_alu/n22 ), .A3(\i_tv80_core/i_alu/n21 ), .ZN(
        \i_tv80_core/i_alu/n466 ) );
  AND2_X1 \i_tv80_core/i_alu/U30  ( .A1(\i_tv80_core/i_alu/n463 ), .A2(
        \i_tv80_core/i_alu/n462 ), .ZN(\i_tv80_core/i_alu/n22 ) );
  AND2_X1 \i_tv80_core/i_alu/U29  ( .A1(\i_tv80_core/i_alu/n465 ), .A2(
        \i_tv80_core/i_alu/n464 ), .ZN(\i_tv80_core/i_alu/n21 ) );
  CLKBUF_X1 \i_tv80_core/i_alu/U28  ( .A(\i_tv80_core/i_alu/n128 ), .Z(
        \i_tv80_core/i_alu/n20 ) );
  AND2_X1 \i_tv80_core/i_alu/U27  ( .A1(\i_tv80_core/i_alu/n89 ), .A2(
        \i_tv80_core/BusA [6]), .ZN(\i_tv80_core/i_alu/n19 ) );
  XOR2_X1 \i_tv80_core/i_alu/U26  ( .A(\i_tv80_core/i_alu/n19 ), .B(
        \i_tv80_core/BusA [7]), .Z(\i_tv80_core/i_alu/n18 ) );
  BUF_X1 \i_tv80_core/i_alu/U25  ( .A(\i_tv80_core/i_alu/n18 ), .Z(
        \i_tv80_core/i_alu/n17 ) );
  BUF_X2 \i_tv80_core/i_alu/U24  ( .A(\i_tv80_core/ALU_Op_r [1]), .Z(
        \i_tv80_core/i_alu/n16 ) );
  BUF_X1 \i_tv80_core/i_alu/U23  ( .A(\i_tv80_core/ALU_Op_r [0]), .Z(
        \i_tv80_core/i_alu/n15 ) );
  CLKBUF_X1 \i_tv80_core/i_alu/U22  ( .A(\i_tv80_core/ALU_Op_r [0]), .Z(
        \i_tv80_core/i_alu/n14 ) );
  AND3_X1 \i_tv80_core/i_alu/U21  ( .A1(\i_tv80_core/i_alu/n24 ), .A2(
        \i_tv80_core/i_alu/n25 ), .A3(\i_tv80_core/i_alu/n65 ), .ZN(
        \i_tv80_core/i_alu/n13 ) );
  INV_X1 \i_tv80_core/i_alu/U20  ( .A(\i_tv80_core/i_alu/n33 ), .ZN(
        \i_tv80_core/i_alu/n231 ) );
  AND2_X1 \i_tv80_core/i_alu/U19  ( .A1(\i_tv80_core/i_alu/n201 ), .A2(
        \i_tv80_core/i_alu/n200 ), .ZN(\i_tv80_core/i_alu/n11 ) );
  INV_X1 \i_tv80_core/i_alu/U18  ( .A(\i_tv80_core/ALU_Op_r [0]), .ZN(
        \i_tv80_core/i_alu/n10 ) );
  AND3_X1 \i_tv80_core/i_alu/U17  ( .A1(\i_tv80_core/i_alu/n24 ), .A2(
        \i_tv80_core/i_alu/n25 ), .A3(\i_tv80_core/i_alu/n65 ), .ZN(
        \i_tv80_core/i_alu/n12 ) );
  INV_X1 \i_tv80_core/i_alu/U16  ( .A(\i_tv80_core/i_alu/n362 ), .ZN(
        \i_tv80_core/i_alu/n9 ) );
  AND2_X1 \i_tv80_core/i_alu/U15  ( .A1(\i_tv80_core/i_alu/n202 ), .A2(
        \i_tv80_core/i_alu/n201 ), .ZN(\i_tv80_core/i_alu/n8 ) );
  INV_X2 \i_tv80_core/i_alu/U14  ( .A(\i_tv80_core/BusA [1]), .ZN(
        \i_tv80_core/i_alu/n309 ) );
  AND2_X1 \i_tv80_core/i_alu/U13  ( .A1(\i_tv80_core/i_alu/n6 ), .A2(
        \i_tv80_core/i_alu/n309 ), .ZN(\i_tv80_core/i_alu/n7 ) );
  INV_X1 \i_tv80_core/i_alu/U12  ( .A(\i_tv80_core/i_alu/n11 ), .ZN(
        \i_tv80_core/i_alu/n213 ) );
  OAI221_X1 \i_tv80_core/i_alu/U11  ( .B1(\i_tv80_core/i_alu/n308 ), .B2(
        \i_tv80_core/i_alu/n310 ), .C1(\i_tv80_core/i_alu/n308 ), .C2(
        \i_tv80_core/i_alu/n309 ), .A(\i_tv80_core/i_alu/n83 ), .ZN(
        \i_tv80_core/i_alu/n139 ) );
  BUF_X1 \i_tv80_core/i_alu/U10  ( .A(\i_tv80_core/i_alu/n139 ), .Z(
        \i_tv80_core/i_alu/n6 ) );
  OR3_X1 \i_tv80_core/i_alu/U9  ( .A1(\i_tv80_core/i_alu/n237 ), .A2(
        \i_tv80_core/i_alu/n236 ), .A3(\i_tv80_core/BusA [7]), .ZN(
        \i_tv80_core/i_alu/n5 ) );
  INV_X1 \i_tv80_core/i_alu/U8  ( .A(\i_tv80_core/i_alu/n17 ), .ZN(
        \i_tv80_core/i_alu/n97 ) );
  INV_X1 \i_tv80_core/i_alu/U7  ( .A(\i_tv80_core/ALU_Op_r [1]), .ZN(
        \i_tv80_core/i_alu/n80 ) );
  INV_X1 \i_tv80_core/i_alu/U6  ( .A(\i_tv80_core/ALU_Op_r [1]), .ZN(
        \i_tv80_core/i_alu/n4 ) );
  INV_X1 \i_tv80_core/i_alu/U5  ( .A(\i_tv80_core/ALU_Op_r [1]), .ZN(
        \i_tv80_core/i_alu/n3 ) );
  INV_X1 \i_tv80_core/i_alu/U4  ( .A(\i_tv80_core/i_alu/n1 ), .ZN(
        \i_tv80_core/i_alu/n2 ) );
  INV_X1 \i_tv80_core/i_alu/U3  ( .A(\i_tv80_core/BusA [3]), .ZN(
        \i_tv80_core/i_alu/n1 ) );
  MUX2_X1 \i_tv80_core/i_reg/U541  ( .A(\i_tv80_core/i_reg/RegsL[0][0] ), .B(
        \i_tv80_core/RegDIL [0]), .S(\i_tv80_core/i_reg/n78 ), .Z(
        \i_tv80_core/i_reg/n294 ) );
  MUX2_X1 \i_tv80_core/i_reg/U540  ( .A(\i_tv80_core/i_reg/RegsL[0][1] ), .B(
        \i_tv80_core/RegDIL [1]), .S(\i_tv80_core/i_reg/n78 ), .Z(
        \i_tv80_core/i_reg/n295 ) );
  MUX2_X1 \i_tv80_core/i_reg/U539  ( .A(\i_tv80_core/i_reg/RegsL[0][2] ), .B(
        \i_tv80_core/RegDIL [2]), .S(\i_tv80_core/i_reg/n78 ), .Z(
        \i_tv80_core/i_reg/n296 ) );
  MUX2_X1 \i_tv80_core/i_reg/U538  ( .A(\i_tv80_core/i_reg/RegsL[0][3] ), .B(
        \i_tv80_core/RegDIL [3]), .S(\i_tv80_core/i_reg/n78 ), .Z(
        \i_tv80_core/i_reg/n297 ) );
  MUX2_X1 \i_tv80_core/i_reg/U537  ( .A(\i_tv80_core/i_reg/RegsL[0][4] ), .B(
        \i_tv80_core/RegDIL [4]), .S(\i_tv80_core/i_reg/n78 ), .Z(
        \i_tv80_core/i_reg/n298 ) );
  MUX2_X1 \i_tv80_core/i_reg/U536  ( .A(\i_tv80_core/i_reg/RegsL[0][5] ), .B(
        \i_tv80_core/n2166 ), .S(\i_tv80_core/i_reg/n78 ), .Z(
        \i_tv80_core/i_reg/n299 ) );
  MUX2_X1 \i_tv80_core/i_reg/U535  ( .A(\i_tv80_core/i_reg/RegsL[0][6] ), .B(
        \i_tv80_core/n2163 ), .S(\i_tv80_core/i_reg/n78 ), .Z(
        \i_tv80_core/i_reg/n300 ) );
  MUX2_X1 \i_tv80_core/i_reg/U534  ( .A(\i_tv80_core/i_reg/RegsL[0][7] ), .B(
        \i_tv80_core/RegDIL [7]), .S(\i_tv80_core/i_reg/n78 ), .Z(
        \i_tv80_core/i_reg/n301 ) );
  MUX2_X1 \i_tv80_core/i_reg/U533  ( .A(\i_tv80_core/i_reg/RegsH[0][0] ), .B(
        \i_tv80_core/RegDIH [0]), .S(\i_tv80_core/i_reg/n65 ), .Z(
        \i_tv80_core/i_reg/n230 ) );
  MUX2_X1 \i_tv80_core/i_reg/U532  ( .A(\i_tv80_core/i_reg/RegsH[0][1] ), .B(
        \i_tv80_core/RegDIH [1]), .S(\i_tv80_core/i_reg/n65 ), .Z(
        \i_tv80_core/i_reg/n231 ) );
  MUX2_X1 \i_tv80_core/i_reg/U531  ( .A(\i_tv80_core/i_reg/RegsH[0][2] ), .B(
        \i_tv80_core/n2164 ), .S(\i_tv80_core/i_reg/n65 ), .Z(
        \i_tv80_core/i_reg/n232 ) );
  MUX2_X1 \i_tv80_core/i_reg/U530  ( .A(\i_tv80_core/i_reg/RegsH[0][3] ), .B(
        \i_tv80_core/n2165 ), .S(\i_tv80_core/i_reg/n65 ), .Z(
        \i_tv80_core/i_reg/n233 ) );
  MUX2_X1 \i_tv80_core/i_reg/U529  ( .A(\i_tv80_core/i_reg/RegsH[0][4] ), .B(
        \i_tv80_core/RegDIH [4]), .S(\i_tv80_core/i_reg/n65 ), .Z(
        \i_tv80_core/i_reg/n234 ) );
  MUX2_X1 \i_tv80_core/i_reg/U528  ( .A(\i_tv80_core/i_reg/RegsH[0][5] ), .B(
        \i_tv80_core/n2167 ), .S(\i_tv80_core/i_reg/n65 ), .Z(
        \i_tv80_core/i_reg/n235 ) );
  MUX2_X1 \i_tv80_core/i_reg/U527  ( .A(\i_tv80_core/i_reg/RegsH[0][6] ), .B(
        \i_tv80_core/RegDIH [6]), .S(\i_tv80_core/i_reg/n65 ), .Z(
        \i_tv80_core/i_reg/n236 ) );
  MUX2_X1 \i_tv80_core/i_reg/U526  ( .A(\i_tv80_core/i_reg/RegsH[0][7] ), .B(
        \i_tv80_core/RegDIH [7]), .S(\i_tv80_core/i_reg/n65 ), .Z(
        \i_tv80_core/i_reg/n237 ) );
  MUX2_X1 \i_tv80_core/i_reg/U525  ( .A(\i_tv80_core/i_reg/RegsL[1][0] ), .B(
        \i_tv80_core/RegDIL [0]), .S(\i_tv80_core/i_reg/n73 ), .Z(
        \i_tv80_core/i_reg/n286 ) );
  MUX2_X1 \i_tv80_core/i_reg/U524  ( .A(\i_tv80_core/i_reg/RegsL[1][1] ), .B(
        \i_tv80_core/RegDIL [1]), .S(\i_tv80_core/i_reg/n73 ), .Z(
        \i_tv80_core/i_reg/n287 ) );
  MUX2_X1 \i_tv80_core/i_reg/U523  ( .A(\i_tv80_core/i_reg/RegsL[1][2] ), .B(
        \i_tv80_core/RegDIL [2]), .S(\i_tv80_core/i_reg/n73 ), .Z(
        \i_tv80_core/i_reg/n288 ) );
  MUX2_X1 \i_tv80_core/i_reg/U522  ( .A(\i_tv80_core/i_reg/RegsL[1][3] ), .B(
        \i_tv80_core/RegDIL [3]), .S(\i_tv80_core/i_reg/n73 ), .Z(
        \i_tv80_core/i_reg/n289 ) );
  MUX2_X1 \i_tv80_core/i_reg/U521  ( .A(\i_tv80_core/i_reg/RegsL[1][4] ), .B(
        \i_tv80_core/RegDIL [4]), .S(\i_tv80_core/i_reg/n73 ), .Z(
        \i_tv80_core/i_reg/n290 ) );
  MUX2_X1 \i_tv80_core/i_reg/U520  ( .A(\i_tv80_core/i_reg/RegsL[1][5] ), .B(
        \i_tv80_core/n2166 ), .S(\i_tv80_core/i_reg/n73 ), .Z(
        \i_tv80_core/i_reg/n291 ) );
  MUX2_X1 \i_tv80_core/i_reg/U519  ( .A(\i_tv80_core/i_reg/RegsL[1][6] ), .B(
        \i_tv80_core/n2163 ), .S(\i_tv80_core/i_reg/n73 ), .Z(
        \i_tv80_core/i_reg/n292 ) );
  MUX2_X1 \i_tv80_core/i_reg/U518  ( .A(\i_tv80_core/i_reg/RegsL[1][7] ), .B(
        \i_tv80_core/RegDIL [7]), .S(\i_tv80_core/i_reg/n73 ), .Z(
        \i_tv80_core/i_reg/n293 ) );
  MUX2_X1 \i_tv80_core/i_reg/U517  ( .A(\i_tv80_core/i_reg/RegsH[1][0] ), .B(
        \i_tv80_core/RegDIH [0]), .S(\i_tv80_core/i_reg/n61 ), .Z(
        \i_tv80_core/i_reg/n222 ) );
  MUX2_X1 \i_tv80_core/i_reg/U516  ( .A(\i_tv80_core/i_reg/RegsH[1][1] ), .B(
        \i_tv80_core/RegDIH [1]), .S(\i_tv80_core/i_reg/n61 ), .Z(
        \i_tv80_core/i_reg/n223 ) );
  MUX2_X1 \i_tv80_core/i_reg/U515  ( .A(\i_tv80_core/i_reg/RegsH[1][2] ), .B(
        \i_tv80_core/n2164 ), .S(\i_tv80_core/i_reg/n61 ), .Z(
        \i_tv80_core/i_reg/n224 ) );
  MUX2_X1 \i_tv80_core/i_reg/U514  ( .A(\i_tv80_core/i_reg/RegsH[1][3] ), .B(
        \i_tv80_core/n2165 ), .S(\i_tv80_core/i_reg/n61 ), .Z(
        \i_tv80_core/i_reg/n225 ) );
  MUX2_X1 \i_tv80_core/i_reg/U513  ( .A(\i_tv80_core/i_reg/RegsH[1][4] ), .B(
        \i_tv80_core/RegDIH [4]), .S(\i_tv80_core/i_reg/n61 ), .Z(
        \i_tv80_core/i_reg/n226 ) );
  MUX2_X1 \i_tv80_core/i_reg/U512  ( .A(\i_tv80_core/i_reg/RegsH[1][5] ), .B(
        \i_tv80_core/n2167 ), .S(\i_tv80_core/i_reg/n61 ), .Z(
        \i_tv80_core/i_reg/n227 ) );
  MUX2_X1 \i_tv80_core/i_reg/U511  ( .A(\i_tv80_core/i_reg/RegsH[1][6] ), .B(
        \i_tv80_core/RegDIH [6]), .S(\i_tv80_core/i_reg/n61 ), .Z(
        \i_tv80_core/i_reg/n228 ) );
  MUX2_X1 \i_tv80_core/i_reg/U510  ( .A(\i_tv80_core/i_reg/RegsH[1][7] ), .B(
        \i_tv80_core/RegDIH [7]), .S(\i_tv80_core/i_reg/n61 ), .Z(
        \i_tv80_core/i_reg/n229 ) );
  MUX2_X1 \i_tv80_core/i_reg/U509  ( .A(\i_tv80_core/i_reg/RegsL[2][0] ), .B(
        \i_tv80_core/RegDIL [0]), .S(\i_tv80_core/i_reg/n77 ), .Z(
        \i_tv80_core/i_reg/n278 ) );
  MUX2_X1 \i_tv80_core/i_reg/U508  ( .A(\i_tv80_core/i_reg/RegsL[2][1] ), .B(
        \i_tv80_core/RegDIL [1]), .S(\i_tv80_core/i_reg/n77 ), .Z(
        \i_tv80_core/i_reg/n279 ) );
  MUX2_X1 \i_tv80_core/i_reg/U507  ( .A(\i_tv80_core/i_reg/RegsL[2][2] ), .B(
        \i_tv80_core/RegDIL [2]), .S(\i_tv80_core/i_reg/n77 ), .Z(
        \i_tv80_core/i_reg/n280 ) );
  MUX2_X1 \i_tv80_core/i_reg/U506  ( .A(\i_tv80_core/i_reg/RegsL[2][3] ), .B(
        \i_tv80_core/RegDIL [3]), .S(\i_tv80_core/i_reg/n77 ), .Z(
        \i_tv80_core/i_reg/n281 ) );
  MUX2_X1 \i_tv80_core/i_reg/U505  ( .A(\i_tv80_core/i_reg/RegsL[2][4] ), .B(
        \i_tv80_core/RegDIL [4]), .S(\i_tv80_core/i_reg/n77 ), .Z(
        \i_tv80_core/i_reg/n282 ) );
  MUX2_X1 \i_tv80_core/i_reg/U504  ( .A(\i_tv80_core/i_reg/RegsL[2][5] ), .B(
        \i_tv80_core/n2166 ), .S(\i_tv80_core/i_reg/n77 ), .Z(
        \i_tv80_core/i_reg/n283 ) );
  MUX2_X1 \i_tv80_core/i_reg/U503  ( .A(\i_tv80_core/i_reg/RegsL[2][6] ), .B(
        \i_tv80_core/n2163 ), .S(\i_tv80_core/i_reg/n77 ), .Z(
        \i_tv80_core/i_reg/n284 ) );
  MUX2_X1 \i_tv80_core/i_reg/U502  ( .A(\i_tv80_core/i_reg/RegsL[2][7] ), .B(
        \i_tv80_core/RegDIL [7]), .S(\i_tv80_core/i_reg/n77 ), .Z(
        \i_tv80_core/i_reg/n285 ) );
  MUX2_X1 \i_tv80_core/i_reg/U501  ( .A(\i_tv80_core/i_reg/RegsH[2][0] ), .B(
        \i_tv80_core/RegDIH [0]), .S(\i_tv80_core/i_reg/n62 ), .Z(
        \i_tv80_core/i_reg/n214 ) );
  MUX2_X1 \i_tv80_core/i_reg/U500  ( .A(\i_tv80_core/i_reg/RegsH[2][1] ), .B(
        \i_tv80_core/RegDIH [1]), .S(\i_tv80_core/i_reg/n62 ), .Z(
        \i_tv80_core/i_reg/n215 ) );
  MUX2_X1 \i_tv80_core/i_reg/U499  ( .A(\i_tv80_core/i_reg/RegsH[2][2] ), .B(
        \i_tv80_core/n2164 ), .S(\i_tv80_core/i_reg/n62 ), .Z(
        \i_tv80_core/i_reg/n216 ) );
  MUX2_X1 \i_tv80_core/i_reg/U498  ( .A(\i_tv80_core/i_reg/RegsH[2][3] ), .B(
        \i_tv80_core/n2165 ), .S(\i_tv80_core/i_reg/n62 ), .Z(
        \i_tv80_core/i_reg/n217 ) );
  MUX2_X1 \i_tv80_core/i_reg/U497  ( .A(\i_tv80_core/i_reg/RegsH[2][4] ), .B(
        \i_tv80_core/RegDIH [4]), .S(\i_tv80_core/i_reg/n62 ), .Z(
        \i_tv80_core/i_reg/n218 ) );
  MUX2_X1 \i_tv80_core/i_reg/U496  ( .A(\i_tv80_core/i_reg/RegsH[2][6] ), .B(
        \i_tv80_core/RegDIH [6]), .S(\i_tv80_core/i_reg/n62 ), .Z(
        \i_tv80_core/i_reg/n220 ) );
  MUX2_X1 \i_tv80_core/i_reg/U495  ( .A(\i_tv80_core/i_reg/RegsL[3][0] ), .B(
        \i_tv80_core/RegDIL [0]), .S(\i_tv80_core/i_reg/n72 ), .Z(
        \i_tv80_core/i_reg/n270 ) );
  MUX2_X1 \i_tv80_core/i_reg/U494  ( .A(\i_tv80_core/i_reg/RegsL[3][1] ), .B(
        \i_tv80_core/RegDIL [1]), .S(\i_tv80_core/i_reg/n72 ), .Z(
        \i_tv80_core/i_reg/n271 ) );
  MUX2_X1 \i_tv80_core/i_reg/U493  ( .A(\i_tv80_core/i_reg/RegsL[3][2] ), .B(
        \i_tv80_core/RegDIL [2]), .S(\i_tv80_core/i_reg/n72 ), .Z(
        \i_tv80_core/i_reg/n272 ) );
  MUX2_X1 \i_tv80_core/i_reg/U492  ( .A(\i_tv80_core/i_reg/RegsL[3][3] ), .B(
        \i_tv80_core/RegDIL [3]), .S(\i_tv80_core/i_reg/n72 ), .Z(
        \i_tv80_core/i_reg/n273 ) );
  MUX2_X1 \i_tv80_core/i_reg/U491  ( .A(\i_tv80_core/i_reg/RegsL[3][4] ), .B(
        \i_tv80_core/RegDIL [4]), .S(\i_tv80_core/i_reg/n72 ), .Z(
        \i_tv80_core/i_reg/n274 ) );
  MUX2_X1 \i_tv80_core/i_reg/U490  ( .A(\i_tv80_core/i_reg/RegsL[3][5] ), .B(
        \i_tv80_core/n2166 ), .S(\i_tv80_core/i_reg/n72 ), .Z(
        \i_tv80_core/i_reg/n275 ) );
  MUX2_X1 \i_tv80_core/i_reg/U489  ( .A(\i_tv80_core/i_reg/RegsL[3][6] ), .B(
        \i_tv80_core/n2163 ), .S(\i_tv80_core/i_reg/n72 ), .Z(
        \i_tv80_core/i_reg/n276 ) );
  MUX2_X1 \i_tv80_core/i_reg/U488  ( .A(\i_tv80_core/i_reg/RegsL[3][7] ), .B(
        \i_tv80_core/RegDIL [7]), .S(\i_tv80_core/i_reg/n72 ), .Z(
        \i_tv80_core/i_reg/n277 ) );
  MUX2_X1 \i_tv80_core/i_reg/U487  ( .A(\i_tv80_core/i_reg/RegsH[3][0] ), .B(
        \i_tv80_core/RegDIH [0]), .S(\i_tv80_core/i_reg/n58 ), .Z(
        \i_tv80_core/i_reg/n206 ) );
  MUX2_X1 \i_tv80_core/i_reg/U486  ( .A(\i_tv80_core/i_reg/RegsH[3][1] ), .B(
        \i_tv80_core/RegDIH [1]), .S(\i_tv80_core/i_reg/n58 ), .Z(
        \i_tv80_core/i_reg/n207 ) );
  MUX2_X1 \i_tv80_core/i_reg/U485  ( .A(\i_tv80_core/i_reg/RegsH[3][2] ), .B(
        \i_tv80_core/n2164 ), .S(\i_tv80_core/i_reg/n58 ), .Z(
        \i_tv80_core/i_reg/n208 ) );
  MUX2_X1 \i_tv80_core/i_reg/U484  ( .A(\i_tv80_core/i_reg/RegsH[3][3] ), .B(
        \i_tv80_core/n2165 ), .S(\i_tv80_core/i_reg/n58 ), .Z(
        \i_tv80_core/i_reg/n209 ) );
  MUX2_X1 \i_tv80_core/i_reg/U483  ( .A(\i_tv80_core/i_reg/RegsH[3][4] ), .B(
        \i_tv80_core/RegDIH [4]), .S(\i_tv80_core/i_reg/n58 ), .Z(
        \i_tv80_core/i_reg/n210 ) );
  MUX2_X1 \i_tv80_core/i_reg/U482  ( .A(\i_tv80_core/i_reg/RegsH[3][5] ), .B(
        \i_tv80_core/n2167 ), .S(\i_tv80_core/i_reg/n58 ), .Z(
        \i_tv80_core/i_reg/n211 ) );
  MUX2_X1 \i_tv80_core/i_reg/U481  ( .A(\i_tv80_core/i_reg/RegsH[3][6] ), .B(
        \i_tv80_core/RegDIH [6]), .S(\i_tv80_core/i_reg/n58 ), .Z(
        \i_tv80_core/i_reg/n212 ) );
  MUX2_X1 \i_tv80_core/i_reg/U480  ( .A(\i_tv80_core/i_reg/RegsH[3][7] ), .B(
        \i_tv80_core/RegDIH [7]), .S(\i_tv80_core/i_reg/n58 ), .Z(
        \i_tv80_core/i_reg/n213 ) );
  MUX2_X1 \i_tv80_core/i_reg/U479  ( .A(\i_tv80_core/i_reg/RegsL[4][0] ), .B(
        \i_tv80_core/RegDIL [0]), .S(\i_tv80_core/i_reg/n76 ), .Z(
        \i_tv80_core/i_reg/n262 ) );
  MUX2_X1 \i_tv80_core/i_reg/U478  ( .A(\i_tv80_core/i_reg/RegsL[4][1] ), .B(
        \i_tv80_core/RegDIL [1]), .S(\i_tv80_core/i_reg/n76 ), .Z(
        \i_tv80_core/i_reg/n263 ) );
  MUX2_X1 \i_tv80_core/i_reg/U477  ( .A(\i_tv80_core/i_reg/RegsL[4][2] ), .B(
        \i_tv80_core/RegDIL [2]), .S(\i_tv80_core/i_reg/n76 ), .Z(
        \i_tv80_core/i_reg/n264 ) );
  MUX2_X1 \i_tv80_core/i_reg/U476  ( .A(\i_tv80_core/i_reg/RegsL[4][3] ), .B(
        \i_tv80_core/RegDIL [3]), .S(\i_tv80_core/i_reg/n76 ), .Z(
        \i_tv80_core/i_reg/n265 ) );
  MUX2_X1 \i_tv80_core/i_reg/U475  ( .A(\i_tv80_core/i_reg/RegsL[4][4] ), .B(
        \i_tv80_core/RegDIL [4]), .S(\i_tv80_core/i_reg/n76 ), .Z(
        \i_tv80_core/i_reg/n266 ) );
  MUX2_X1 \i_tv80_core/i_reg/U474  ( .A(\i_tv80_core/i_reg/RegsL[4][5] ), .B(
        \i_tv80_core/n2166 ), .S(\i_tv80_core/i_reg/n76 ), .Z(
        \i_tv80_core/i_reg/n267 ) );
  MUX2_X1 \i_tv80_core/i_reg/U473  ( .A(\i_tv80_core/i_reg/RegsL[4][6] ), .B(
        \i_tv80_core/n2163 ), .S(\i_tv80_core/i_reg/n76 ), .Z(
        \i_tv80_core/i_reg/n268 ) );
  MUX2_X1 \i_tv80_core/i_reg/U472  ( .A(\i_tv80_core/i_reg/RegsL[4][7] ), .B(
        \i_tv80_core/RegDIL [7]), .S(\i_tv80_core/i_reg/n76 ), .Z(
        \i_tv80_core/i_reg/n269 ) );
  MUX2_X1 \i_tv80_core/i_reg/U471  ( .A(\i_tv80_core/i_reg/RegsH[4][0] ), .B(
        \i_tv80_core/RegDIH [0]), .S(\i_tv80_core/i_reg/n63 ), .Z(
        \i_tv80_core/i_reg/n198 ) );
  MUX2_X1 \i_tv80_core/i_reg/U470  ( .A(\i_tv80_core/i_reg/RegsH[4][1] ), .B(
        \i_tv80_core/RegDIH [1]), .S(\i_tv80_core/i_reg/n63 ), .Z(
        \i_tv80_core/i_reg/n199 ) );
  MUX2_X1 \i_tv80_core/i_reg/U469  ( .A(\i_tv80_core/i_reg/RegsH[4][2] ), .B(
        \i_tv80_core/n2164 ), .S(\i_tv80_core/i_reg/n63 ), .Z(
        \i_tv80_core/i_reg/n200 ) );
  MUX2_X1 \i_tv80_core/i_reg/U468  ( .A(\i_tv80_core/i_reg/RegsH[4][3] ), .B(
        \i_tv80_core/n2165 ), .S(\i_tv80_core/i_reg/n63 ), .Z(
        \i_tv80_core/i_reg/n201 ) );
  MUX2_X1 \i_tv80_core/i_reg/U467  ( .A(\i_tv80_core/i_reg/RegsH[4][4] ), .B(
        \i_tv80_core/RegDIH [4]), .S(\i_tv80_core/i_reg/n63 ), .Z(
        \i_tv80_core/i_reg/n202 ) );
  MUX2_X1 \i_tv80_core/i_reg/U466  ( .A(\i_tv80_core/i_reg/RegsH[4][5] ), .B(
        \i_tv80_core/n2167 ), .S(\i_tv80_core/i_reg/n63 ), .Z(
        \i_tv80_core/i_reg/n203 ) );
  MUX2_X1 \i_tv80_core/i_reg/U465  ( .A(\i_tv80_core/i_reg/RegsH[4][6] ), .B(
        \i_tv80_core/RegDIH [6]), .S(\i_tv80_core/i_reg/n63 ), .Z(
        \i_tv80_core/i_reg/n204 ) );
  MUX2_X1 \i_tv80_core/i_reg/U464  ( .A(\i_tv80_core/i_reg/RegsH[4][7] ), .B(
        \i_tv80_core/RegDIH [7]), .S(\i_tv80_core/i_reg/n63 ), .Z(
        \i_tv80_core/i_reg/n205 ) );
  MUX2_X1 \i_tv80_core/i_reg/U463  ( .A(\i_tv80_core/i_reg/RegsL[5][0] ), .B(
        \i_tv80_core/RegDIL [0]), .S(\i_tv80_core/i_reg/n71 ), .Z(
        \i_tv80_core/i_reg/n254 ) );
  MUX2_X1 \i_tv80_core/i_reg/U462  ( .A(\i_tv80_core/i_reg/RegsL[5][1] ), .B(
        \i_tv80_core/RegDIL [1]), .S(\i_tv80_core/i_reg/n71 ), .Z(
        \i_tv80_core/i_reg/n255 ) );
  MUX2_X1 \i_tv80_core/i_reg/U461  ( .A(\i_tv80_core/i_reg/RegsL[5][2] ), .B(
        \i_tv80_core/RegDIL [2]), .S(\i_tv80_core/i_reg/n71 ), .Z(
        \i_tv80_core/i_reg/n256 ) );
  MUX2_X1 \i_tv80_core/i_reg/U460  ( .A(\i_tv80_core/i_reg/RegsL[5][3] ), .B(
        \i_tv80_core/RegDIL [3]), .S(\i_tv80_core/i_reg/n71 ), .Z(
        \i_tv80_core/i_reg/n257 ) );
  MUX2_X1 \i_tv80_core/i_reg/U459  ( .A(\i_tv80_core/i_reg/RegsL[5][4] ), .B(
        \i_tv80_core/RegDIL [4]), .S(\i_tv80_core/i_reg/n71 ), .Z(
        \i_tv80_core/i_reg/n258 ) );
  MUX2_X1 \i_tv80_core/i_reg/U458  ( .A(\i_tv80_core/i_reg/RegsL[5][5] ), .B(
        \i_tv80_core/n2166 ), .S(\i_tv80_core/i_reg/n71 ), .Z(
        \i_tv80_core/i_reg/n259 ) );
  MUX2_X1 \i_tv80_core/i_reg/U457  ( .A(\i_tv80_core/i_reg/RegsL[5][6] ), .B(
        \i_tv80_core/n2163 ), .S(\i_tv80_core/i_reg/n71 ), .Z(
        \i_tv80_core/i_reg/n260 ) );
  MUX2_X1 \i_tv80_core/i_reg/U456  ( .A(\i_tv80_core/i_reg/RegsL[5][7] ), .B(
        \i_tv80_core/RegDIL [7]), .S(\i_tv80_core/i_reg/n71 ), .Z(
        \i_tv80_core/i_reg/n261 ) );
  MUX2_X1 \i_tv80_core/i_reg/U455  ( .A(\i_tv80_core/i_reg/RegsH[5][0] ), .B(
        \i_tv80_core/RegDIH [0]), .S(\i_tv80_core/i_reg/n59 ), .Z(
        \i_tv80_core/i_reg/n190 ) );
  MUX2_X1 \i_tv80_core/i_reg/U454  ( .A(\i_tv80_core/i_reg/RegsH[5][1] ), .B(
        \i_tv80_core/RegDIH [1]), .S(\i_tv80_core/i_reg/n59 ), .Z(
        \i_tv80_core/i_reg/n191 ) );
  MUX2_X1 \i_tv80_core/i_reg/U453  ( .A(\i_tv80_core/i_reg/RegsH[5][2] ), .B(
        \i_tv80_core/n2164 ), .S(\i_tv80_core/i_reg/n59 ), .Z(
        \i_tv80_core/i_reg/n192 ) );
  MUX2_X1 \i_tv80_core/i_reg/U452  ( .A(\i_tv80_core/i_reg/RegsH[5][3] ), .B(
        \i_tv80_core/n2165 ), .S(\i_tv80_core/i_reg/n59 ), .Z(
        \i_tv80_core/i_reg/n193 ) );
  MUX2_X1 \i_tv80_core/i_reg/U451  ( .A(\i_tv80_core/i_reg/RegsH[5][4] ), .B(
        \i_tv80_core/RegDIH [4]), .S(\i_tv80_core/i_reg/n59 ), .Z(
        \i_tv80_core/i_reg/n194 ) );
  MUX2_X1 \i_tv80_core/i_reg/U450  ( .A(\i_tv80_core/i_reg/RegsH[5][5] ), .B(
        \i_tv80_core/n2167 ), .S(\i_tv80_core/i_reg/n59 ), .Z(
        \i_tv80_core/i_reg/n195 ) );
  MUX2_X1 \i_tv80_core/i_reg/U449  ( .A(\i_tv80_core/i_reg/RegsH[5][6] ), .B(
        \i_tv80_core/RegDIH [6]), .S(\i_tv80_core/i_reg/n59 ), .Z(
        \i_tv80_core/i_reg/n196 ) );
  MUX2_X1 \i_tv80_core/i_reg/U448  ( .A(\i_tv80_core/i_reg/RegsH[5][7] ), .B(
        \i_tv80_core/RegDIH [7]), .S(\i_tv80_core/i_reg/n59 ), .Z(
        \i_tv80_core/i_reg/n197 ) );
  MUX2_X1 \i_tv80_core/i_reg/U447  ( .A(\i_tv80_core/i_reg/RegsL[6][0] ), .B(
        \i_tv80_core/RegDIL [0]), .S(\i_tv80_core/i_reg/n75 ), .Z(
        \i_tv80_core/i_reg/n246 ) );
  MUX2_X1 \i_tv80_core/i_reg/U446  ( .A(\i_tv80_core/i_reg/RegsL[6][1] ), .B(
        \i_tv80_core/RegDIL [1]), .S(\i_tv80_core/i_reg/n75 ), .Z(
        \i_tv80_core/i_reg/n247 ) );
  MUX2_X1 \i_tv80_core/i_reg/U445  ( .A(\i_tv80_core/i_reg/RegsL[6][2] ), .B(
        \i_tv80_core/RegDIL [2]), .S(\i_tv80_core/i_reg/n75 ), .Z(
        \i_tv80_core/i_reg/n248 ) );
  MUX2_X1 \i_tv80_core/i_reg/U444  ( .A(\i_tv80_core/i_reg/RegsL[6][3] ), .B(
        \i_tv80_core/RegDIL [3]), .S(\i_tv80_core/i_reg/n75 ), .Z(
        \i_tv80_core/i_reg/n249 ) );
  MUX2_X1 \i_tv80_core/i_reg/U443  ( .A(\i_tv80_core/i_reg/RegsL[6][4] ), .B(
        \i_tv80_core/RegDIL [4]), .S(\i_tv80_core/i_reg/n75 ), .Z(
        \i_tv80_core/i_reg/n250 ) );
  MUX2_X1 \i_tv80_core/i_reg/U442  ( .A(\i_tv80_core/i_reg/RegsL[6][5] ), .B(
        \i_tv80_core/n2166 ), .S(\i_tv80_core/i_reg/n75 ), .Z(
        \i_tv80_core/i_reg/n251 ) );
  MUX2_X1 \i_tv80_core/i_reg/U441  ( .A(\i_tv80_core/i_reg/RegsL[6][6] ), .B(
        \i_tv80_core/n2163 ), .S(\i_tv80_core/i_reg/n75 ), .Z(
        \i_tv80_core/i_reg/n252 ) );
  MUX2_X1 \i_tv80_core/i_reg/U440  ( .A(\i_tv80_core/i_reg/RegsL[6][7] ), .B(
        \i_tv80_core/RegDIL [7]), .S(\i_tv80_core/i_reg/n75 ), .Z(
        \i_tv80_core/i_reg/n253 ) );
  MUX2_X1 \i_tv80_core/i_reg/U439  ( .A(\i_tv80_core/i_reg/RegsH[6][0] ), .B(
        \i_tv80_core/RegDIH [0]), .S(\i_tv80_core/i_reg/n64 ), .Z(
        \i_tv80_core/i_reg/n182 ) );
  MUX2_X1 \i_tv80_core/i_reg/U438  ( .A(\i_tv80_core/i_reg/RegsH[6][1] ), .B(
        \i_tv80_core/RegDIH [1]), .S(\i_tv80_core/i_reg/n64 ), .Z(
        \i_tv80_core/i_reg/n183 ) );
  MUX2_X1 \i_tv80_core/i_reg/U437  ( .A(\i_tv80_core/i_reg/RegsH[6][2] ), .B(
        \i_tv80_core/n2164 ), .S(\i_tv80_core/i_reg/n64 ), .Z(
        \i_tv80_core/i_reg/n184 ) );
  MUX2_X1 \i_tv80_core/i_reg/U436  ( .A(\i_tv80_core/i_reg/RegsH[6][3] ), .B(
        \i_tv80_core/n2165 ), .S(\i_tv80_core/i_reg/n64 ), .Z(
        \i_tv80_core/i_reg/n185 ) );
  MUX2_X1 \i_tv80_core/i_reg/U435  ( .A(\i_tv80_core/i_reg/RegsH[6][4] ), .B(
        \i_tv80_core/RegDIH [4]), .S(\i_tv80_core/i_reg/n64 ), .Z(
        \i_tv80_core/i_reg/n186 ) );
  MUX2_X1 \i_tv80_core/i_reg/U434  ( .A(\i_tv80_core/i_reg/RegsH[6][5] ), .B(
        \i_tv80_core/n2167 ), .S(\i_tv80_core/i_reg/n64 ), .Z(
        \i_tv80_core/i_reg/n187 ) );
  MUX2_X1 \i_tv80_core/i_reg/U433  ( .A(\i_tv80_core/i_reg/RegsH[6][6] ), .B(
        \i_tv80_core/RegDIH [6]), .S(\i_tv80_core/i_reg/n64 ), .Z(
        \i_tv80_core/i_reg/n188 ) );
  MUX2_X1 \i_tv80_core/i_reg/U432  ( .A(\i_tv80_core/i_reg/RegsH[6][7] ), .B(
        \i_tv80_core/RegDIH [7]), .S(\i_tv80_core/i_reg/n64 ), .Z(
        \i_tv80_core/i_reg/n189 ) );
  MUX2_X1 \i_tv80_core/i_reg/U431  ( .A(\i_tv80_core/i_reg/RegsL[7][0] ), .B(
        \i_tv80_core/RegDIL [0]), .S(\i_tv80_core/i_reg/n495 ), .Z(
        \i_tv80_core/i_reg/n238 ) );
  MUX2_X1 \i_tv80_core/i_reg/U430  ( .A(\i_tv80_core/i_reg/RegsL[7][2] ), .B(
        \i_tv80_core/RegDIL [2]), .S(\i_tv80_core/i_reg/n495 ), .Z(
        \i_tv80_core/i_reg/n240 ) );
  MUX2_X1 \i_tv80_core/i_reg/U429  ( .A(\i_tv80_core/i_reg/RegsL[7][3] ), .B(
        \i_tv80_core/RegDIL [3]), .S(\i_tv80_core/i_reg/n495 ), .Z(
        \i_tv80_core/i_reg/n241 ) );
  MUX2_X1 \i_tv80_core/i_reg/U428  ( .A(\i_tv80_core/i_reg/RegsL[7][4] ), .B(
        \i_tv80_core/RegDIL [4]), .S(\i_tv80_core/i_reg/n495 ), .Z(
        \i_tv80_core/i_reg/n242 ) );
  MUX2_X1 \i_tv80_core/i_reg/U427  ( .A(\i_tv80_core/i_reg/RegsL[7][5] ), .B(
        \i_tv80_core/n2166 ), .S(\i_tv80_core/i_reg/n495 ), .Z(
        \i_tv80_core/i_reg/n243 ) );
  NAND2_X1 \i_tv80_core/i_reg/U426  ( .A1(\i_tv80_core/i_reg/n81 ), .A2(
        \i_tv80_core/i_reg/n89 ), .ZN(\i_tv80_core/i_reg/n494 ) );
  MUX2_X1 \i_tv80_core/i_reg/U425  ( .A(\i_tv80_core/i_reg/RegsH[7][0] ), .B(
        \i_tv80_core/RegDIH [0]), .S(\i_tv80_core/i_reg/n60 ), .Z(
        \i_tv80_core/i_reg/n174 ) );
  MUX2_X1 \i_tv80_core/i_reg/U424  ( .A(\i_tv80_core/i_reg/RegsH[7][1] ), .B(
        \i_tv80_core/RegDIH [1]), .S(\i_tv80_core/i_reg/n60 ), .Z(
        \i_tv80_core/i_reg/n175 ) );
  MUX2_X1 \i_tv80_core/i_reg/U423  ( .A(\i_tv80_core/i_reg/RegsH[7][2] ), .B(
        \i_tv80_core/n2164 ), .S(\i_tv80_core/i_reg/n60 ), .Z(
        \i_tv80_core/i_reg/n176 ) );
  MUX2_X1 \i_tv80_core/i_reg/U422  ( .A(\i_tv80_core/i_reg/RegsH[7][3] ), .B(
        \i_tv80_core/n2165 ), .S(\i_tv80_core/i_reg/n60 ), .Z(
        \i_tv80_core/i_reg/n177 ) );
  MUX2_X1 \i_tv80_core/i_reg/U421  ( .A(\i_tv80_core/i_reg/RegsH[7][4] ), .B(
        \i_tv80_core/RegDIH [4]), .S(\i_tv80_core/i_reg/n60 ), .Z(
        \i_tv80_core/i_reg/n178 ) );
  MUX2_X1 \i_tv80_core/i_reg/U420  ( .A(\i_tv80_core/i_reg/RegsH[7][5] ), .B(
        \i_tv80_core/n2167 ), .S(\i_tv80_core/i_reg/n60 ), .Z(
        \i_tv80_core/i_reg/n179 ) );
  MUX2_X1 \i_tv80_core/i_reg/U419  ( .A(\i_tv80_core/i_reg/RegsH[7][6] ), .B(
        \i_tv80_core/RegDIH [6]), .S(\i_tv80_core/i_reg/n60 ), .Z(
        \i_tv80_core/i_reg/n180 ) );
  MUX2_X1 \i_tv80_core/i_reg/U418  ( .A(\i_tv80_core/i_reg/RegsH[7][7] ), .B(
        \i_tv80_core/RegDIH [7]), .S(\i_tv80_core/i_reg/n60 ), .Z(
        \i_tv80_core/i_reg/n181 ) );
  INV_X1 \i_tv80_core/i_reg/U417  ( .A(\i_tv80_core/i_reg/n42 ), .ZN(
        \i_tv80_core/i_reg/n493 ) );
  BUF_X2 \i_tv80_core/i_reg/U416  ( .A(\i_tv80_core/i_reg/n496 ), .Z(
        \i_tv80_core/RegBusA [11]) );
  MUX2_X1 \i_tv80_core/i_reg/U415  ( .A(\i_tv80_core/n2163 ), .B(
        \i_tv80_core/i_reg/RegsL[7][6] ), .S(\i_tv80_core/i_reg/n494 ), .Z(
        \i_tv80_core/i_reg/n244 ) );
  INV_X1 \i_tv80_core/i_reg/U414  ( .A(\i_tv80_core/i_reg/n336 ), .ZN(
        \i_tv80_core/i_reg/n492 ) );
  INV_X1 \i_tv80_core/i_reg/U413  ( .A(\i_tv80_core/RegAddrC [2]), .ZN(
        \i_tv80_core/i_reg/n489 ) );
  INV_X1 \i_tv80_core/i_reg/U412  ( .A(\i_tv80_core/RegAddrC [0]), .ZN(
        \i_tv80_core/i_reg/n490 ) );
  INV_X1 \i_tv80_core/i_reg/U411  ( .A(\i_tv80_core/RegAddrC [1]), .ZN(
        \i_tv80_core/i_reg/n488 ) );
  AOI22_X1 \i_tv80_core/i_reg/U410  ( .A1(\i_tv80_core/i_reg/RegsH[2][7] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsH[0][7] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n484 ) );
  AOI22_X1 \i_tv80_core/i_reg/U409  ( .A1(\i_tv80_core/i_reg/RegsH[6][7] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsH[4][7] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n485 ) );
  AOI22_X1 \i_tv80_core/i_reg/U408  ( .A1(\i_tv80_core/i_reg/RegsH[3][7] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsH[1][7] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n486 ) );
  AOI22_X1 \i_tv80_core/i_reg/U407  ( .A1(\i_tv80_core/i_reg/RegsH[7][7] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsH[5][7] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n487 ) );
  NAND4_X1 \i_tv80_core/i_reg/U406  ( .A1(\i_tv80_core/i_reg/n484 ), .A2(
        \i_tv80_core/i_reg/n485 ), .A3(\i_tv80_core/i_reg/n486 ), .A4(
        \i_tv80_core/i_reg/n487 ), .ZN(\i_tv80_core/RegBusC [15]) );
  AOI22_X1 \i_tv80_core/i_reg/U405  ( .A1(\i_tv80_core/i_reg/RegsH[2][6] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsH[0][6] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n480 ) );
  AOI22_X1 \i_tv80_core/i_reg/U404  ( .A1(\i_tv80_core/i_reg/RegsH[6][6] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsH[4][6] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n481 ) );
  AOI22_X1 \i_tv80_core/i_reg/U403  ( .A1(\i_tv80_core/i_reg/RegsH[3][6] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsH[1][6] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n482 ) );
  AOI22_X1 \i_tv80_core/i_reg/U402  ( .A1(\i_tv80_core/i_reg/RegsH[7][6] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsH[5][6] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n483 ) );
  NAND4_X1 \i_tv80_core/i_reg/U401  ( .A1(\i_tv80_core/i_reg/n480 ), .A2(
        \i_tv80_core/i_reg/n481 ), .A3(\i_tv80_core/i_reg/n482 ), .A4(
        \i_tv80_core/i_reg/n483 ), .ZN(\i_tv80_core/RegBusC [14]) );
  AOI22_X1 \i_tv80_core/i_reg/U400  ( .A1(\i_tv80_core/i_reg/RegsH[2][5] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsH[0][5] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n476 ) );
  AOI22_X1 \i_tv80_core/i_reg/U399  ( .A1(\i_tv80_core/i_reg/RegsH[6][5] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsH[4][5] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n477 ) );
  AOI22_X1 \i_tv80_core/i_reg/U398  ( .A1(\i_tv80_core/i_reg/RegsH[3][5] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsH[1][5] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n478 ) );
  AOI22_X1 \i_tv80_core/i_reg/U397  ( .A1(\i_tv80_core/i_reg/RegsH[7][5] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsH[5][5] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n479 ) );
  NAND4_X1 \i_tv80_core/i_reg/U396  ( .A1(\i_tv80_core/i_reg/n476 ), .A2(
        \i_tv80_core/i_reg/n477 ), .A3(\i_tv80_core/i_reg/n478 ), .A4(
        \i_tv80_core/i_reg/n479 ), .ZN(\i_tv80_core/RegBusC [13]) );
  AOI22_X1 \i_tv80_core/i_reg/U395  ( .A1(\i_tv80_core/i_reg/RegsH[2][4] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsH[0][4] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n472 ) );
  AOI22_X1 \i_tv80_core/i_reg/U394  ( .A1(\i_tv80_core/i_reg/RegsH[6][4] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsH[4][4] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n473 ) );
  AOI22_X1 \i_tv80_core/i_reg/U393  ( .A1(\i_tv80_core/i_reg/RegsH[3][4] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsH[1][4] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n474 ) );
  AOI22_X1 \i_tv80_core/i_reg/U392  ( .A1(\i_tv80_core/i_reg/RegsH[7][4] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsH[5][4] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n475 ) );
  NAND4_X1 \i_tv80_core/i_reg/U391  ( .A1(\i_tv80_core/i_reg/n472 ), .A2(
        \i_tv80_core/i_reg/n473 ), .A3(\i_tv80_core/i_reg/n474 ), .A4(
        \i_tv80_core/i_reg/n475 ), .ZN(\i_tv80_core/RegBusC [12]) );
  AOI22_X1 \i_tv80_core/i_reg/U390  ( .A1(\i_tv80_core/i_reg/RegsH[2][3] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsH[0][3] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n468 ) );
  AOI22_X1 \i_tv80_core/i_reg/U389  ( .A1(\i_tv80_core/i_reg/RegsH[6][3] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsH[4][3] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n469 ) );
  AOI22_X1 \i_tv80_core/i_reg/U388  ( .A1(\i_tv80_core/i_reg/RegsH[3][3] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsH[1][3] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n470 ) );
  AOI22_X1 \i_tv80_core/i_reg/U387  ( .A1(\i_tv80_core/i_reg/RegsH[7][3] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsH[5][3] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n471 ) );
  NAND4_X1 \i_tv80_core/i_reg/U386  ( .A1(\i_tv80_core/i_reg/n468 ), .A2(
        \i_tv80_core/i_reg/n469 ), .A3(\i_tv80_core/i_reg/n470 ), .A4(
        \i_tv80_core/i_reg/n471 ), .ZN(\i_tv80_core/RegBusC [11]) );
  AOI22_X1 \i_tv80_core/i_reg/U385  ( .A1(\i_tv80_core/i_reg/RegsH[2][2] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsH[0][2] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n464 ) );
  AOI22_X1 \i_tv80_core/i_reg/U384  ( .A1(\i_tv80_core/i_reg/RegsH[6][2] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsH[4][2] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n465 ) );
  AOI22_X1 \i_tv80_core/i_reg/U383  ( .A1(\i_tv80_core/i_reg/RegsH[3][2] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsH[1][2] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n466 ) );
  AOI22_X1 \i_tv80_core/i_reg/U382  ( .A1(\i_tv80_core/i_reg/RegsH[7][2] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsH[5][2] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n467 ) );
  NAND4_X1 \i_tv80_core/i_reg/U381  ( .A1(\i_tv80_core/i_reg/n464 ), .A2(
        \i_tv80_core/i_reg/n465 ), .A3(\i_tv80_core/i_reg/n466 ), .A4(
        \i_tv80_core/i_reg/n467 ), .ZN(\i_tv80_core/RegBusC [10]) );
  AOI22_X1 \i_tv80_core/i_reg/U380  ( .A1(\i_tv80_core/i_reg/RegsH[2][1] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsH[0][1] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n460 ) );
  AOI22_X1 \i_tv80_core/i_reg/U379  ( .A1(\i_tv80_core/i_reg/RegsH[6][1] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsH[4][1] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n461 ) );
  AOI22_X1 \i_tv80_core/i_reg/U378  ( .A1(\i_tv80_core/i_reg/RegsH[3][1] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsH[1][1] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n462 ) );
  AOI22_X1 \i_tv80_core/i_reg/U377  ( .A1(\i_tv80_core/i_reg/RegsH[7][1] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsH[5][1] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n463 ) );
  NAND4_X1 \i_tv80_core/i_reg/U376  ( .A1(\i_tv80_core/i_reg/n460 ), .A2(
        \i_tv80_core/i_reg/n461 ), .A3(\i_tv80_core/i_reg/n462 ), .A4(
        \i_tv80_core/i_reg/n463 ), .ZN(\i_tv80_core/RegBusC [9]) );
  AOI22_X1 \i_tv80_core/i_reg/U375  ( .A1(\i_tv80_core/i_reg/RegsH[2][0] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsH[0][0] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n456 ) );
  AOI22_X1 \i_tv80_core/i_reg/U374  ( .A1(\i_tv80_core/i_reg/RegsH[6][0] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsH[4][0] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n457 ) );
  AOI22_X1 \i_tv80_core/i_reg/U373  ( .A1(\i_tv80_core/i_reg/RegsH[3][0] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsH[1][0] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n458 ) );
  AOI22_X1 \i_tv80_core/i_reg/U372  ( .A1(\i_tv80_core/i_reg/RegsH[7][0] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsH[5][0] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n459 ) );
  NAND4_X1 \i_tv80_core/i_reg/U371  ( .A1(\i_tv80_core/i_reg/n456 ), .A2(
        \i_tv80_core/i_reg/n457 ), .A3(\i_tv80_core/i_reg/n458 ), .A4(
        \i_tv80_core/i_reg/n459 ), .ZN(\i_tv80_core/RegBusC [8]) );
  AOI22_X1 \i_tv80_core/i_reg/U370  ( .A1(\i_tv80_core/i_reg/RegsL[2][7] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsL[0][7] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n452 ) );
  AOI22_X1 \i_tv80_core/i_reg/U369  ( .A1(\i_tv80_core/i_reg/RegsL[6][7] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsL[4][7] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n453 ) );
  AOI22_X1 \i_tv80_core/i_reg/U368  ( .A1(\i_tv80_core/i_reg/RegsL[3][7] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsL[1][7] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n454 ) );
  AOI22_X1 \i_tv80_core/i_reg/U367  ( .A1(\i_tv80_core/i_reg/RegsL[7][7] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsL[5][7] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n455 ) );
  NAND4_X1 \i_tv80_core/i_reg/U366  ( .A1(\i_tv80_core/i_reg/n452 ), .A2(
        \i_tv80_core/i_reg/n453 ), .A3(\i_tv80_core/i_reg/n454 ), .A4(
        \i_tv80_core/i_reg/n455 ), .ZN(\i_tv80_core/RegBusC [7]) );
  AOI22_X1 \i_tv80_core/i_reg/U365  ( .A1(\i_tv80_core/i_reg/RegsL[2][6] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsL[0][6] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n448 ) );
  AOI22_X1 \i_tv80_core/i_reg/U364  ( .A1(\i_tv80_core/i_reg/RegsL[6][6] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsL[4][6] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n449 ) );
  AOI22_X1 \i_tv80_core/i_reg/U363  ( .A1(\i_tv80_core/i_reg/RegsL[3][6] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsL[1][6] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n450 ) );
  AOI22_X1 \i_tv80_core/i_reg/U362  ( .A1(\i_tv80_core/i_reg/RegsL[7][6] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsL[5][6] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n451 ) );
  NAND4_X1 \i_tv80_core/i_reg/U361  ( .A1(\i_tv80_core/i_reg/n448 ), .A2(
        \i_tv80_core/i_reg/n449 ), .A3(\i_tv80_core/i_reg/n450 ), .A4(
        \i_tv80_core/i_reg/n451 ), .ZN(\i_tv80_core/RegBusC [6]) );
  AOI22_X1 \i_tv80_core/i_reg/U360  ( .A1(\i_tv80_core/i_reg/RegsL[2][5] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsL[0][5] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n444 ) );
  AOI22_X1 \i_tv80_core/i_reg/U359  ( .A1(\i_tv80_core/i_reg/RegsL[6][5] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsL[4][5] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n445 ) );
  AOI22_X1 \i_tv80_core/i_reg/U358  ( .A1(\i_tv80_core/i_reg/RegsL[3][5] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsL[1][5] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n446 ) );
  AOI22_X1 \i_tv80_core/i_reg/U357  ( .A1(\i_tv80_core/i_reg/RegsL[7][5] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsL[5][5] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n447 ) );
  NAND4_X1 \i_tv80_core/i_reg/U356  ( .A1(\i_tv80_core/i_reg/n444 ), .A2(
        \i_tv80_core/i_reg/n445 ), .A3(\i_tv80_core/i_reg/n446 ), .A4(
        \i_tv80_core/i_reg/n447 ), .ZN(\i_tv80_core/RegBusC [5]) );
  AOI22_X1 \i_tv80_core/i_reg/U355  ( .A1(\i_tv80_core/i_reg/RegsL[2][4] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsL[0][4] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n440 ) );
  AOI22_X1 \i_tv80_core/i_reg/U354  ( .A1(\i_tv80_core/i_reg/RegsL[6][4] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsL[4][4] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n441 ) );
  AOI22_X1 \i_tv80_core/i_reg/U353  ( .A1(\i_tv80_core/i_reg/RegsL[3][4] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsL[1][4] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n442 ) );
  AOI22_X1 \i_tv80_core/i_reg/U352  ( .A1(\i_tv80_core/i_reg/RegsL[7][4] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsL[5][4] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n443 ) );
  NAND4_X1 \i_tv80_core/i_reg/U351  ( .A1(\i_tv80_core/i_reg/n440 ), .A2(
        \i_tv80_core/i_reg/n441 ), .A3(\i_tv80_core/i_reg/n442 ), .A4(
        \i_tv80_core/i_reg/n443 ), .ZN(\i_tv80_core/RegBusC [4]) );
  AOI22_X1 \i_tv80_core/i_reg/U350  ( .A1(\i_tv80_core/i_reg/RegsL[2][3] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsL[0][3] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n436 ) );
  AOI22_X1 \i_tv80_core/i_reg/U349  ( .A1(\i_tv80_core/i_reg/RegsL[6][3] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsL[4][3] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n437 ) );
  AOI22_X1 \i_tv80_core/i_reg/U348  ( .A1(\i_tv80_core/i_reg/RegsL[3][3] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsL[1][3] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n438 ) );
  AOI22_X1 \i_tv80_core/i_reg/U347  ( .A1(\i_tv80_core/i_reg/RegsL[7][3] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsL[5][3] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n439 ) );
  NAND4_X1 \i_tv80_core/i_reg/U346  ( .A1(\i_tv80_core/i_reg/n436 ), .A2(
        \i_tv80_core/i_reg/n437 ), .A3(\i_tv80_core/i_reg/n438 ), .A4(
        \i_tv80_core/i_reg/n439 ), .ZN(\i_tv80_core/RegBusC [3]) );
  AOI22_X1 \i_tv80_core/i_reg/U345  ( .A1(\i_tv80_core/i_reg/RegsL[2][2] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsL[0][2] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n432 ) );
  AOI22_X1 \i_tv80_core/i_reg/U344  ( .A1(\i_tv80_core/i_reg/RegsL[6][2] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsL[4][2] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n433 ) );
  AOI22_X1 \i_tv80_core/i_reg/U343  ( .A1(\i_tv80_core/i_reg/RegsL[3][2] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsL[1][2] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n434 ) );
  AOI22_X1 \i_tv80_core/i_reg/U342  ( .A1(\i_tv80_core/i_reg/RegsL[7][2] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsL[5][2] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n435 ) );
  NAND4_X1 \i_tv80_core/i_reg/U341  ( .A1(\i_tv80_core/i_reg/n432 ), .A2(
        \i_tv80_core/i_reg/n433 ), .A3(\i_tv80_core/i_reg/n434 ), .A4(
        \i_tv80_core/i_reg/n435 ), .ZN(\i_tv80_core/RegBusC [2]) );
  AOI22_X1 \i_tv80_core/i_reg/U340  ( .A1(\i_tv80_core/i_reg/RegsL[2][1] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsL[0][1] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n428 ) );
  AOI22_X1 \i_tv80_core/i_reg/U339  ( .A1(\i_tv80_core/i_reg/RegsL[6][1] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsL[4][1] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n429 ) );
  AOI22_X1 \i_tv80_core/i_reg/U338  ( .A1(\i_tv80_core/i_reg/RegsL[3][1] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsL[1][1] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n430 ) );
  AOI22_X1 \i_tv80_core/i_reg/U337  ( .A1(\i_tv80_core/i_reg/RegsL[7][1] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsL[5][1] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n431 ) );
  NAND4_X1 \i_tv80_core/i_reg/U336  ( .A1(\i_tv80_core/i_reg/n428 ), .A2(
        \i_tv80_core/i_reg/n429 ), .A3(\i_tv80_core/i_reg/n430 ), .A4(
        \i_tv80_core/i_reg/n431 ), .ZN(\i_tv80_core/RegBusC [1]) );
  AOI22_X1 \i_tv80_core/i_reg/U335  ( .A1(\i_tv80_core/i_reg/RegsL[2][0] ), 
        .A2(\i_tv80_core/i_reg/n96 ), .B1(\i_tv80_core/i_reg/RegsL[0][0] ), 
        .B2(\i_tv80_core/i_reg/n91 ), .ZN(\i_tv80_core/i_reg/n424 ) );
  AOI22_X1 \i_tv80_core/i_reg/U334  ( .A1(\i_tv80_core/i_reg/RegsL[6][0] ), 
        .A2(\i_tv80_core/i_reg/n99 ), .B1(\i_tv80_core/i_reg/RegsL[4][0] ), 
        .B2(\i_tv80_core/i_reg/n95 ), .ZN(\i_tv80_core/i_reg/n425 ) );
  AOI22_X1 \i_tv80_core/i_reg/U333  ( .A1(\i_tv80_core/i_reg/RegsL[3][0] ), 
        .A2(\i_tv80_core/i_reg/n92 ), .B1(\i_tv80_core/i_reg/RegsL[1][0] ), 
        .B2(\i_tv80_core/i_reg/n93 ), .ZN(\i_tv80_core/i_reg/n426 ) );
  AOI22_X1 \i_tv80_core/i_reg/U332  ( .A1(\i_tv80_core/i_reg/RegsL[7][0] ), 
        .A2(\i_tv80_core/i_reg/n98 ), .B1(\i_tv80_core/i_reg/RegsL[5][0] ), 
        .B2(\i_tv80_core/i_reg/n94 ), .ZN(\i_tv80_core/i_reg/n427 ) );
  NAND4_X1 \i_tv80_core/i_reg/U331  ( .A1(\i_tv80_core/i_reg/n424 ), .A2(
        \i_tv80_core/i_reg/n425 ), .A3(\i_tv80_core/i_reg/n426 ), .A4(
        \i_tv80_core/i_reg/n427 ), .ZN(\i_tv80_core/RegBusC [0]) );
  INV_X1 \i_tv80_core/i_reg/U330  ( .A(\i_tv80_core/n1091 ), .ZN(
        \i_tv80_core/i_reg/n422 ) );
  INV_X1 \i_tv80_core/i_reg/U329  ( .A(\i_tv80_core/RegAddrB [0]), .ZN(
        \i_tv80_core/i_reg/n423 ) );
  INV_X1 \i_tv80_core/i_reg/U328  ( .A(\i_tv80_core/RegAddrB [1]), .ZN(
        \i_tv80_core/i_reg/n421 ) );
  AOI22_X1 \i_tv80_core/i_reg/U327  ( .A1(\i_tv80_core/i_reg/RegsH[2][7] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsH[0][7] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n417 ) );
  AOI22_X1 \i_tv80_core/i_reg/U326  ( .A1(\i_tv80_core/i_reg/RegsH[6][7] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsH[4][7] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n418 ) );
  AOI22_X1 \i_tv80_core/i_reg/U325  ( .A1(\i_tv80_core/i_reg/RegsH[3][7] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsH[1][7] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n419 ) );
  AOI22_X1 \i_tv80_core/i_reg/U324  ( .A1(\i_tv80_core/i_reg/RegsH[7][7] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsH[5][7] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n420 ) );
  NAND4_X1 \i_tv80_core/i_reg/U323  ( .A1(\i_tv80_core/i_reg/n417 ), .A2(
        \i_tv80_core/i_reg/n418 ), .A3(\i_tv80_core/i_reg/n419 ), .A4(
        \i_tv80_core/i_reg/n420 ), .ZN(\i_tv80_core/RegBusB [15]) );
  AOI22_X1 \i_tv80_core/i_reg/U322  ( .A1(\i_tv80_core/i_reg/RegsH[2][6] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsH[0][6] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n413 ) );
  AOI22_X1 \i_tv80_core/i_reg/U321  ( .A1(\i_tv80_core/i_reg/RegsH[6][6] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsH[4][6] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n414 ) );
  AOI22_X1 \i_tv80_core/i_reg/U320  ( .A1(\i_tv80_core/i_reg/RegsH[3][6] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsH[1][6] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n415 ) );
  AOI22_X1 \i_tv80_core/i_reg/U319  ( .A1(\i_tv80_core/i_reg/RegsH[7][6] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsH[5][6] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n416 ) );
  NAND4_X1 \i_tv80_core/i_reg/U318  ( .A1(\i_tv80_core/i_reg/n413 ), .A2(
        \i_tv80_core/i_reg/n414 ), .A3(\i_tv80_core/i_reg/n415 ), .A4(
        \i_tv80_core/i_reg/n416 ), .ZN(\i_tv80_core/RegBusB [14]) );
  AOI22_X1 \i_tv80_core/i_reg/U317  ( .A1(\i_tv80_core/i_reg/RegsH[2][4] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsH[0][4] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n405 ) );
  AOI22_X1 \i_tv80_core/i_reg/U316  ( .A1(\i_tv80_core/i_reg/RegsH[6][4] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsH[4][4] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n406 ) );
  AOI22_X1 \i_tv80_core/i_reg/U315  ( .A1(\i_tv80_core/i_reg/RegsH[3][4] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsH[1][4] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n407 ) );
  AOI22_X1 \i_tv80_core/i_reg/U314  ( .A1(\i_tv80_core/i_reg/RegsH[7][4] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsH[5][4] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n408 ) );
  NAND4_X1 \i_tv80_core/i_reg/U313  ( .A1(\i_tv80_core/i_reg/n405 ), .A2(
        \i_tv80_core/i_reg/n406 ), .A3(\i_tv80_core/i_reg/n407 ), .A4(
        \i_tv80_core/i_reg/n408 ), .ZN(\i_tv80_core/RegBusB [12]) );
  AOI22_X1 \i_tv80_core/i_reg/U312  ( .A1(\i_tv80_core/i_reg/RegsH[2][3] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsH[0][3] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n401 ) );
  AOI22_X1 \i_tv80_core/i_reg/U311  ( .A1(\i_tv80_core/i_reg/RegsH[6][3] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsH[4][3] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n402 ) );
  AOI22_X1 \i_tv80_core/i_reg/U310  ( .A1(\i_tv80_core/i_reg/RegsH[3][3] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsH[1][3] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n403 ) );
  AOI22_X1 \i_tv80_core/i_reg/U309  ( .A1(\i_tv80_core/i_reg/RegsH[7][3] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsH[5][3] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n404 ) );
  NAND4_X1 \i_tv80_core/i_reg/U308  ( .A1(\i_tv80_core/i_reg/n401 ), .A2(
        \i_tv80_core/i_reg/n402 ), .A3(\i_tv80_core/i_reg/n403 ), .A4(
        \i_tv80_core/i_reg/n404 ), .ZN(\i_tv80_core/RegBusB [11]) );
  AOI22_X1 \i_tv80_core/i_reg/U307  ( .A1(\i_tv80_core/i_reg/RegsH[2][2] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsH[0][2] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n397 ) );
  AOI22_X1 \i_tv80_core/i_reg/U306  ( .A1(\i_tv80_core/i_reg/RegsH[6][2] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsH[4][2] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n398 ) );
  AOI22_X1 \i_tv80_core/i_reg/U305  ( .A1(\i_tv80_core/i_reg/RegsH[3][2] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsH[1][2] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n399 ) );
  AOI22_X1 \i_tv80_core/i_reg/U304  ( .A1(\i_tv80_core/i_reg/RegsH[7][2] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsH[5][2] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n400 ) );
  NAND4_X1 \i_tv80_core/i_reg/U303  ( .A1(\i_tv80_core/i_reg/n397 ), .A2(
        \i_tv80_core/i_reg/n398 ), .A3(\i_tv80_core/i_reg/n399 ), .A4(
        \i_tv80_core/i_reg/n400 ), .ZN(\i_tv80_core/RegBusB [10]) );
  AOI22_X1 \i_tv80_core/i_reg/U302  ( .A1(\i_tv80_core/i_reg/RegsH[2][1] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsH[0][1] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n393 ) );
  AOI22_X1 \i_tv80_core/i_reg/U301  ( .A1(\i_tv80_core/i_reg/RegsH[6][1] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsH[4][1] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n394 ) );
  AOI22_X1 \i_tv80_core/i_reg/U300  ( .A1(\i_tv80_core/i_reg/RegsH[3][1] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsH[1][1] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n395 ) );
  AOI22_X1 \i_tv80_core/i_reg/U299  ( .A1(\i_tv80_core/i_reg/RegsH[7][1] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsH[5][1] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n396 ) );
  NAND4_X1 \i_tv80_core/i_reg/U298  ( .A1(\i_tv80_core/i_reg/n393 ), .A2(
        \i_tv80_core/i_reg/n394 ), .A3(\i_tv80_core/i_reg/n395 ), .A4(
        \i_tv80_core/i_reg/n396 ), .ZN(\i_tv80_core/RegBusB [9]) );
  AOI22_X1 \i_tv80_core/i_reg/U297  ( .A1(\i_tv80_core/i_reg/RegsH[2][0] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsH[0][0] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n389 ) );
  AOI22_X1 \i_tv80_core/i_reg/U296  ( .A1(\i_tv80_core/i_reg/RegsH[6][0] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsH[4][0] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n390 ) );
  AOI22_X1 \i_tv80_core/i_reg/U295  ( .A1(\i_tv80_core/i_reg/RegsH[3][0] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsH[1][0] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n391 ) );
  AOI22_X1 \i_tv80_core/i_reg/U294  ( .A1(\i_tv80_core/i_reg/RegsH[7][0] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsH[5][0] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n392 ) );
  NAND4_X1 \i_tv80_core/i_reg/U293  ( .A1(\i_tv80_core/i_reg/n389 ), .A2(
        \i_tv80_core/i_reg/n390 ), .A3(\i_tv80_core/i_reg/n391 ), .A4(
        \i_tv80_core/i_reg/n392 ), .ZN(\i_tv80_core/RegBusB [8]) );
  AOI22_X1 \i_tv80_core/i_reg/U292  ( .A1(\i_tv80_core/i_reg/RegsL[2][7] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsL[0][7] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n385 ) );
  AOI22_X1 \i_tv80_core/i_reg/U291  ( .A1(\i_tv80_core/i_reg/RegsL[6][7] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsL[4][7] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n386 ) );
  AOI22_X1 \i_tv80_core/i_reg/U290  ( .A1(\i_tv80_core/i_reg/RegsL[3][7] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsL[1][7] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n387 ) );
  AOI22_X1 \i_tv80_core/i_reg/U289  ( .A1(\i_tv80_core/i_reg/RegsL[7][7] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsL[5][7] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n388 ) );
  NAND4_X1 \i_tv80_core/i_reg/U288  ( .A1(\i_tv80_core/i_reg/n385 ), .A2(
        \i_tv80_core/i_reg/n386 ), .A3(\i_tv80_core/i_reg/n387 ), .A4(
        \i_tv80_core/i_reg/n388 ), .ZN(\i_tv80_core/RegBusB [7]) );
  AOI22_X1 \i_tv80_core/i_reg/U287  ( .A1(\i_tv80_core/i_reg/RegsL[2][6] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsL[0][6] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n381 ) );
  AOI22_X1 \i_tv80_core/i_reg/U286  ( .A1(\i_tv80_core/i_reg/RegsL[6][6] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsL[4][6] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n382 ) );
  AOI22_X1 \i_tv80_core/i_reg/U285  ( .A1(\i_tv80_core/i_reg/RegsL[3][6] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsL[1][6] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n383 ) );
  AOI22_X1 \i_tv80_core/i_reg/U284  ( .A1(\i_tv80_core/i_reg/RegsL[7][6] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsL[5][6] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n384 ) );
  NAND4_X1 \i_tv80_core/i_reg/U283  ( .A1(\i_tv80_core/i_reg/n381 ), .A2(
        \i_tv80_core/i_reg/n382 ), .A3(\i_tv80_core/i_reg/n383 ), .A4(
        \i_tv80_core/i_reg/n384 ), .ZN(\i_tv80_core/RegBusB [6]) );
  AOI22_X1 \i_tv80_core/i_reg/U282  ( .A1(\i_tv80_core/i_reg/RegsL[2][4] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsL[0][4] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n373 ) );
  AOI22_X1 \i_tv80_core/i_reg/U281  ( .A1(\i_tv80_core/i_reg/RegsL[6][4] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsL[4][4] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n374 ) );
  AOI22_X1 \i_tv80_core/i_reg/U280  ( .A1(\i_tv80_core/i_reg/RegsL[3][4] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsL[1][4] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n375 ) );
  AOI22_X1 \i_tv80_core/i_reg/U279  ( .A1(\i_tv80_core/i_reg/RegsL[7][4] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsL[5][4] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n376 ) );
  NAND4_X1 \i_tv80_core/i_reg/U278  ( .A1(\i_tv80_core/i_reg/n373 ), .A2(
        \i_tv80_core/i_reg/n374 ), .A3(\i_tv80_core/i_reg/n375 ), .A4(
        \i_tv80_core/i_reg/n376 ), .ZN(\i_tv80_core/RegBusB [4]) );
  AOI22_X1 \i_tv80_core/i_reg/U277  ( .A1(\i_tv80_core/i_reg/RegsL[2][3] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsL[0][3] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n369 ) );
  AOI22_X1 \i_tv80_core/i_reg/U276  ( .A1(\i_tv80_core/i_reg/RegsL[6][3] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsL[4][3] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n370 ) );
  AOI22_X1 \i_tv80_core/i_reg/U275  ( .A1(\i_tv80_core/i_reg/RegsL[3][3] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsL[1][3] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n371 ) );
  AOI22_X1 \i_tv80_core/i_reg/U274  ( .A1(\i_tv80_core/i_reg/RegsL[7][3] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsL[5][3] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n372 ) );
  NAND4_X1 \i_tv80_core/i_reg/U273  ( .A1(\i_tv80_core/i_reg/n369 ), .A2(
        \i_tv80_core/i_reg/n370 ), .A3(\i_tv80_core/i_reg/n371 ), .A4(
        \i_tv80_core/i_reg/n372 ), .ZN(\i_tv80_core/RegBusB [3]) );
  AOI22_X1 \i_tv80_core/i_reg/U272  ( .A1(\i_tv80_core/i_reg/RegsL[2][2] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsL[0][2] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n365 ) );
  AOI22_X1 \i_tv80_core/i_reg/U271  ( .A1(\i_tv80_core/i_reg/RegsL[6][2] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsL[4][2] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n366 ) );
  AOI22_X1 \i_tv80_core/i_reg/U270  ( .A1(\i_tv80_core/i_reg/RegsL[3][2] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsL[1][2] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n367 ) );
  AOI22_X1 \i_tv80_core/i_reg/U269  ( .A1(\i_tv80_core/i_reg/RegsL[7][2] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsL[5][2] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n368 ) );
  NAND4_X1 \i_tv80_core/i_reg/U268  ( .A1(\i_tv80_core/i_reg/n365 ), .A2(
        \i_tv80_core/i_reg/n366 ), .A3(\i_tv80_core/i_reg/n367 ), .A4(
        \i_tv80_core/i_reg/n368 ), .ZN(\i_tv80_core/RegBusB [2]) );
  AOI22_X1 \i_tv80_core/i_reg/U267  ( .A1(\i_tv80_core/i_reg/RegsL[2][1] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsL[0][1] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n361 ) );
  AOI22_X1 \i_tv80_core/i_reg/U266  ( .A1(\i_tv80_core/i_reg/RegsL[6][1] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsL[4][1] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n362 ) );
  AOI22_X1 \i_tv80_core/i_reg/U265  ( .A1(\i_tv80_core/i_reg/RegsL[3][1] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsL[1][1] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n363 ) );
  AOI22_X1 \i_tv80_core/i_reg/U264  ( .A1(\i_tv80_core/i_reg/RegsL[7][1] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsL[5][1] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n364 ) );
  NAND4_X1 \i_tv80_core/i_reg/U263  ( .A1(\i_tv80_core/i_reg/n361 ), .A2(
        \i_tv80_core/i_reg/n362 ), .A3(\i_tv80_core/i_reg/n363 ), .A4(
        \i_tv80_core/i_reg/n364 ), .ZN(\i_tv80_core/RegBusB [1]) );
  AOI22_X1 \i_tv80_core/i_reg/U262  ( .A1(\i_tv80_core/i_reg/RegsL[2][0] ), 
        .A2(\i_tv80_core/i_reg/n82 ), .B1(\i_tv80_core/i_reg/RegsL[0][0] ), 
        .B2(\i_tv80_core/i_reg/n68 ), .ZN(\i_tv80_core/i_reg/n357 ) );
  AOI22_X1 \i_tv80_core/i_reg/U261  ( .A1(\i_tv80_core/i_reg/RegsL[6][0] ), 
        .A2(\i_tv80_core/i_reg/n86 ), .B1(\i_tv80_core/i_reg/RegsL[4][0] ), 
        .B2(\i_tv80_core/i_reg/n88 ), .ZN(\i_tv80_core/i_reg/n358 ) );
  AOI22_X1 \i_tv80_core/i_reg/U260  ( .A1(\i_tv80_core/i_reg/RegsL[3][0] ), 
        .A2(\i_tv80_core/i_reg/n67 ), .B1(\i_tv80_core/i_reg/RegsL[1][0] ), 
        .B2(\i_tv80_core/i_reg/n83 ), .ZN(\i_tv80_core/i_reg/n359 ) );
  AOI22_X1 \i_tv80_core/i_reg/U259  ( .A1(\i_tv80_core/i_reg/RegsL[7][0] ), 
        .A2(\i_tv80_core/i_reg/n84 ), .B1(\i_tv80_core/i_reg/RegsL[5][0] ), 
        .B2(\i_tv80_core/i_reg/n87 ), .ZN(\i_tv80_core/i_reg/n360 ) );
  NAND4_X1 \i_tv80_core/i_reg/U258  ( .A1(\i_tv80_core/i_reg/n357 ), .A2(
        \i_tv80_core/i_reg/n358 ), .A3(\i_tv80_core/i_reg/n359 ), .A4(
        \i_tv80_core/i_reg/n360 ), .ZN(\i_tv80_core/RegBusB [0]) );
  NOR2_X1 \i_tv80_core/i_reg/U257  ( .A1(\i_tv80_core/i_reg/n112 ), .A2(
        \i_tv80_core/i_reg/n113 ), .ZN(\i_tv80_core/RegBusA [3]) );
  BUF_X1 \i_tv80_core/i_reg/U256  ( .A(\i_tv80_core/i_reg/n323 ), .Z(
        \i_tv80_core/i_reg/n324 ) );
  INV_X1 \i_tv80_core/i_reg/U255  ( .A(\i_tv80_core/RegAddrA [1]), .ZN(
        \i_tv80_core/i_reg/n351 ) );
  INV_X1 \i_tv80_core/i_reg/U254  ( .A(\i_tv80_core/RegAddrA [2]), .ZN(
        \i_tv80_core/i_reg/n323 ) );
  INV_X1 \i_tv80_core/i_reg/U253  ( .A(\i_tv80_core/i_reg/n331 ), .ZN(
        \i_tv80_core/i_reg/n332 ) );
  INV_X1 \i_tv80_core/i_reg/U252  ( .A(\i_tv80_core/i_reg/n350 ), .ZN(
        \i_tv80_core/i_reg/n349 ) );
  INV_X1 \i_tv80_core/i_reg/U251  ( .A(\i_tv80_core/i_reg/n331 ), .ZN(
        \i_tv80_core/i_reg/n335 ) );
  INV_X1 \i_tv80_core/i_reg/U250  ( .A(\i_tv80_core/i_reg/n33 ), .ZN(
        \i_tv80_core/i_reg/n339 ) );
  INV_X1 \i_tv80_core/i_reg/U249  ( .A(\i_tv80_core/i_reg/n337 ), .ZN(
        \i_tv80_core/i_reg/n347 ) );
  AND2_X1 \i_tv80_core/i_reg/U248  ( .A1(\i_tv80_core/i_reg/RegsL[5][5] ), 
        .A2(\i_tv80_core/i_reg/n35 ), .ZN(\i_tv80_core/i_reg/n346 ) );
  AND2_X1 \i_tv80_core/i_reg/U247  ( .A1(\i_tv80_core/i_reg/RegsL[7][5] ), 
        .A2(\i_tv80_core/i_reg/n16 ), .ZN(\i_tv80_core/i_reg/n345 ) );
  NOR3_X1 \i_tv80_core/i_reg/U246  ( .A1(\i_tv80_core/i_reg/n346 ), .A2(
        \i_tv80_core/i_reg/n345 ), .A3(\i_tv80_core/i_reg/n354 ), .ZN(
        \i_tv80_core/i_reg/n127 ) );
  INV_X1 \i_tv80_core/i_reg/U245  ( .A(\i_tv80_core/i_reg/n337 ), .ZN(
        \i_tv80_core/i_reg/n344 ) );
  AND2_X1 \i_tv80_core/i_reg/U244  ( .A1(\i_tv80_core/i_reg/RegsL[5][1] ), 
        .A2(\i_tv80_core/i_reg/n35 ), .ZN(\i_tv80_core/i_reg/n343 ) );
  AND2_X1 \i_tv80_core/i_reg/U243  ( .A1(\i_tv80_core/i_reg/RegsL[7][1] ), 
        .A2(\i_tv80_core/i_reg/n333 ), .ZN(\i_tv80_core/i_reg/n342 ) );
  NOR3_X1 \i_tv80_core/i_reg/U242  ( .A1(\i_tv80_core/i_reg/n343 ), .A2(
        \i_tv80_core/i_reg/n342 ), .A3(\i_tv80_core/i_reg/n356 ), .ZN(
        \i_tv80_core/i_reg/n107 ) );
  INV_X1 \i_tv80_core/i_reg/U241  ( .A(\i_tv80_core/RegAddrA [0]), .ZN(
        \i_tv80_core/i_reg/n336 ) );
  INV_X1 \i_tv80_core/i_reg/U240  ( .A(\i_tv80_core/RegAddrA [1]), .ZN(
        \i_tv80_core/i_reg/n328 ) );
  INV_X1 \i_tv80_core/i_reg/U239  ( .A(\i_tv80_core/i_reg/n33 ), .ZN(
        \i_tv80_core/i_reg/n340 ) );
  NAND3_X1 \i_tv80_core/i_reg/U238  ( .A1(\i_tv80_core/i_reg/RegsH[1][7] ), 
        .A2(\i_tv80_core/i_reg/n353 ), .A3(\i_tv80_core/i_reg/n55 ), .ZN(
        \i_tv80_core/i_reg/n319 ) );
  NAND3_X1 \i_tv80_core/i_reg/U237  ( .A1(\i_tv80_core/i_reg/RegsH[3][7] ), 
        .A2(\i_tv80_core/i_reg/n9 ), .A3(\i_tv80_core/i_reg/n53 ), .ZN(
        \i_tv80_core/i_reg/n320 ) );
  NAND3_X1 \i_tv80_core/i_reg/U236  ( .A1(\i_tv80_core/i_reg/RegsH[5][7] ), 
        .A2(\i_tv80_core/i_reg/n3 ), .A3(\i_tv80_core/i_reg/n55 ), .ZN(
        \i_tv80_core/i_reg/n321 ) );
  NAND3_X1 \i_tv80_core/i_reg/U235  ( .A1(\i_tv80_core/i_reg/RegsH[7][7] ), 
        .A2(\i_tv80_core/i_reg/n2 ), .A3(\i_tv80_core/i_reg/n53 ), .ZN(
        \i_tv80_core/i_reg/n322 ) );
  NAND4_X1 \i_tv80_core/i_reg/U234  ( .A1(\i_tv80_core/i_reg/n319 ), .A2(
        \i_tv80_core/i_reg/n320 ), .A3(\i_tv80_core/i_reg/n321 ), .A4(
        \i_tv80_core/i_reg/n322 ), .ZN(\i_tv80_core/i_reg/n313 ) );
  NAND3_X1 \i_tv80_core/i_reg/U233  ( .A1(\i_tv80_core/i_reg/RegsH[0][7] ), 
        .A2(\i_tv80_core/i_reg/n353 ), .A3(\i_tv80_core/i_reg/n54 ), .ZN(
        \i_tv80_core/i_reg/n315 ) );
  NAND3_X1 \i_tv80_core/i_reg/U232  ( .A1(\i_tv80_core/i_reg/RegsH[2][7] ), 
        .A2(\i_tv80_core/i_reg/n9 ), .A3(\i_tv80_core/i_reg/n52 ), .ZN(
        \i_tv80_core/i_reg/n316 ) );
  NAND3_X1 \i_tv80_core/i_reg/U231  ( .A1(\i_tv80_core/i_reg/RegsH[6][7] ), 
        .A2(\i_tv80_core/i_reg/n3 ), .A3(\i_tv80_core/i_reg/n57 ), .ZN(
        \i_tv80_core/i_reg/n318 ) );
  NAND4_X1 \i_tv80_core/i_reg/U230  ( .A1(\i_tv80_core/i_reg/n315 ), .A2(
        \i_tv80_core/i_reg/n316 ), .A3(\i_tv80_core/i_reg/n317 ), .A4(
        \i_tv80_core/i_reg/n318 ), .ZN(\i_tv80_core/i_reg/n314 ) );
  NAND3_X1 \i_tv80_core/i_reg/U229  ( .A1(\i_tv80_core/i_reg/RegsH[1][6] ), 
        .A2(\i_tv80_core/i_reg/n353 ), .A3(\i_tv80_core/i_reg/n55 ), .ZN(
        \i_tv80_core/i_reg/n309 ) );
  NAND3_X1 \i_tv80_core/i_reg/U228  ( .A1(\i_tv80_core/i_reg/RegsH[3][6] ), 
        .A2(\i_tv80_core/i_reg/n9 ), .A3(\i_tv80_core/i_reg/n53 ), .ZN(
        \i_tv80_core/i_reg/n310 ) );
  NAND3_X1 \i_tv80_core/i_reg/U227  ( .A1(\i_tv80_core/i_reg/RegsH[5][6] ), 
        .A2(\i_tv80_core/i_reg/n3 ), .A3(\i_tv80_core/i_reg/n55 ), .ZN(
        \i_tv80_core/i_reg/n311 ) );
  NAND3_X1 \i_tv80_core/i_reg/U226  ( .A1(\i_tv80_core/i_reg/RegsH[7][6] ), 
        .A2(\i_tv80_core/i_reg/n2 ), .A3(\i_tv80_core/i_reg/n53 ), .ZN(
        \i_tv80_core/i_reg/n312 ) );
  NAND4_X1 \i_tv80_core/i_reg/U225  ( .A1(\i_tv80_core/i_reg/n309 ), .A2(
        \i_tv80_core/i_reg/n310 ), .A3(\i_tv80_core/i_reg/n311 ), .A4(
        \i_tv80_core/i_reg/n312 ), .ZN(\i_tv80_core/i_reg/n303 ) );
  NAND3_X1 \i_tv80_core/i_reg/U224  ( .A1(\i_tv80_core/i_reg/RegsH[0][6] ), 
        .A2(\i_tv80_core/i_reg/n353 ), .A3(\i_tv80_core/i_reg/n54 ), .ZN(
        \i_tv80_core/i_reg/n305 ) );
  NAND3_X1 \i_tv80_core/i_reg/U223  ( .A1(\i_tv80_core/i_reg/RegsH[2][6] ), 
        .A2(\i_tv80_core/i_reg/n9 ), .A3(\i_tv80_core/i_reg/n52 ), .ZN(
        \i_tv80_core/i_reg/n306 ) );
  NAND3_X1 \i_tv80_core/i_reg/U222  ( .A1(\i_tv80_core/i_reg/RegsH[4][6] ), 
        .A2(\i_tv80_core/i_reg/n2 ), .A3(\i_tv80_core/i_reg/n56 ), .ZN(
        \i_tv80_core/i_reg/n307 ) );
  NAND3_X1 \i_tv80_core/i_reg/U221  ( .A1(\i_tv80_core/i_reg/RegsH[6][6] ), 
        .A2(\i_tv80_core/i_reg/n3 ), .A3(\i_tv80_core/i_reg/n57 ), .ZN(
        \i_tv80_core/i_reg/n308 ) );
  NAND4_X1 \i_tv80_core/i_reg/U220  ( .A1(\i_tv80_core/i_reg/n305 ), .A2(
        \i_tv80_core/i_reg/n306 ), .A3(\i_tv80_core/i_reg/n307 ), .A4(
        \i_tv80_core/i_reg/n308 ), .ZN(\i_tv80_core/i_reg/n304 ) );
  OR2_X1 \i_tv80_core/i_reg/U219  ( .A1(\i_tv80_core/i_reg/n303 ), .A2(
        \i_tv80_core/i_reg/n304 ), .ZN(\i_tv80_core/RegBusA [14]) );
  AOI221_X1 \i_tv80_core/i_reg/U218  ( .B1(\i_tv80_core/i_reg/n8 ), .B2(
        \i_tv80_core/i_reg/RegsH[6][5] ), .C1(\i_tv80_core/i_reg/RegsH[7][5] ), 
        .C2(\i_tv80_core/i_reg/n27 ), .A(\i_tv80_core/i_reg/n34 ), .ZN(
        \i_tv80_core/i_reg/n171 ) );
  AOI221_X1 \i_tv80_core/i_reg/U217  ( .B1(\i_tv80_core/i_reg/RegsH[4][5] ), 
        .B2(\i_tv80_core/i_reg/n21 ), .C1(\i_tv80_core/i_reg/RegsH[5][5] ), 
        .C2(\i_tv80_core/i_reg/n344 ), .A(\i_tv80_core/i_reg/n335 ), .ZN(
        \i_tv80_core/i_reg/n172 ) );
  AOI221_X1 \i_tv80_core/i_reg/U216  ( .B1(\i_tv80_core/i_reg/RegsH[0][5] ), 
        .B2(\i_tv80_core/i_reg/n45 ), .C1(\i_tv80_core/i_reg/RegsH[1][5] ), 
        .C2(\i_tv80_core/i_reg/n344 ), .A(\i_tv80_core/i_reg/n332 ), .ZN(
        \i_tv80_core/i_reg/n173 ) );
  AOI221_X1 \i_tv80_core/i_reg/U215  ( .B1(\i_tv80_core/i_reg/RegsH[2][5] ), 
        .B2(\i_tv80_core/i_reg/n356 ), .C1(\i_tv80_core/i_reg/RegsH[3][5] ), 
        .C2(\i_tv80_core/i_reg/n28 ), .A(\i_tv80_core/i_reg/n329 ), .ZN(
        \i_tv80_core/i_reg/n302 ) );
  OAI33_X1 \i_tv80_core/i_reg/U214  ( .A1(\i_tv80_core/i_reg/n171 ), .A2(
        \i_tv80_core/i_reg/n172 ), .A3(\i_tv80_core/i_reg/n353 ), .B1(
        \i_tv80_core/i_reg/n173 ), .B2(\i_tv80_core/i_reg/n302 ), .B3(
        \i_tv80_core/i_reg/n327 ), .ZN(\i_tv80_core/RegBusA [13]) );
  OAI21_X1 \i_tv80_core/i_reg/U213  ( .B1(\i_tv80_core/i_reg/RegsH[5][4] ), 
        .B2(\i_tv80_core/i_reg/n15 ), .A(\i_tv80_core/i_reg/n327 ), .ZN(
        \i_tv80_core/i_reg/n167 ) );
  OAI21_X1 \i_tv80_core/i_reg/U212  ( .B1(\i_tv80_core/i_reg/RegsH[7][4] ), 
        .B2(\i_tv80_core/i_reg/n23 ), .A(\i_tv80_core/i_reg/n28 ), .ZN(
        \i_tv80_core/i_reg/n168 ) );
  OAI21_X1 \i_tv80_core/i_reg/U211  ( .B1(\i_tv80_core/i_reg/RegsH[3][4] ), 
        .B2(\i_tv80_core/i_reg/n35 ), .A(\i_tv80_core/i_reg/n339 ), .ZN(
        \i_tv80_core/i_reg/n169 ) );
  OAI21_X1 \i_tv80_core/i_reg/U210  ( .B1(\i_tv80_core/i_reg/RegsH[1][4] ), 
        .B2(\i_tv80_core/i_reg/n16 ), .A(\i_tv80_core/i_reg/n352 ), .ZN(
        \i_tv80_core/i_reg/n170 ) );
  OAI22_X1 \i_tv80_core/i_reg/U209  ( .A1(\i_tv80_core/i_reg/n167 ), .A2(
        \i_tv80_core/i_reg/n168 ), .B1(\i_tv80_core/i_reg/n170 ), .B2(
        \i_tv80_core/i_reg/n169 ), .ZN(\i_tv80_core/i_reg/n163 ) );
  OAI22_X1 \i_tv80_core/i_reg/U208  ( .A1(\i_tv80_core/i_reg/RegsH[4][4] ), 
        .A2(\i_tv80_core/i_reg/n334 ), .B1(\i_tv80_core/i_reg/RegsH[6][4] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .ZN(\i_tv80_core/i_reg/n165 ) );
  OAI22_X1 \i_tv80_core/i_reg/U207  ( .A1(\i_tv80_core/i_reg/RegsH[0][4] ), 
        .A2(\i_tv80_core/i_reg/n334 ), .B1(\i_tv80_core/i_reg/RegsH[2][4] ), 
        .B2(\i_tv80_core/i_reg/n35 ), .ZN(\i_tv80_core/i_reg/n166 ) );
  OAI33_X1 \i_tv80_core/i_reg/U206  ( .A1(\i_tv80_core/i_reg/n165 ), .A2(
        \i_tv80_core/i_reg/n32 ), .A3(\i_tv80_core/i_reg/n9 ), .B1(
        \i_tv80_core/i_reg/n166 ), .B2(\i_tv80_core/i_reg/n492 ), .B3(
        \i_tv80_core/i_reg/n326 ), .ZN(\i_tv80_core/i_reg/n164 ) );
  AOI221_X1 \i_tv80_core/i_reg/U205  ( .B1(\i_tv80_core/i_reg/RegsH[6][3] ), 
        .B2(\i_tv80_core/i_reg/n21 ), .C1(\i_tv80_core/i_reg/RegsH[7][3] ), 
        .C2(\i_tv80_core/i_reg/n344 ), .A(\i_tv80_core/i_reg/n23 ), .ZN(
        \i_tv80_core/i_reg/n159 ) );
  AOI221_X1 \i_tv80_core/i_reg/U204  ( .B1(\i_tv80_core/i_reg/RegsH[4][3] ), 
        .B2(\i_tv80_core/i_reg/n354 ), .C1(\i_tv80_core/i_reg/n27 ), .C2(
        \i_tv80_core/i_reg/RegsH[5][3] ), .A(\i_tv80_core/i_reg/n332 ), .ZN(
        \i_tv80_core/i_reg/n160 ) );
  AOI221_X1 \i_tv80_core/i_reg/U203  ( .B1(\i_tv80_core/i_reg/RegsH[2][3] ), 
        .B2(\i_tv80_core/i_reg/n26 ), .C1(\i_tv80_core/i_reg/RegsH[3][3] ), 
        .C2(\i_tv80_core/i_reg/n344 ), .A(\i_tv80_core/i_reg/n34 ), .ZN(
        \i_tv80_core/i_reg/n161 ) );
  AOI221_X1 \i_tv80_core/i_reg/U202  ( .B1(\i_tv80_core/i_reg/RegsH[0][3] ), 
        .B2(\i_tv80_core/i_reg/n21 ), .C1(\i_tv80_core/i_reg/RegsH[1][3] ), 
        .C2(\i_tv80_core/i_reg/n31 ), .A(\i_tv80_core/i_reg/n334 ), .ZN(
        \i_tv80_core/i_reg/n162 ) );
  OAI33_X1 \i_tv80_core/i_reg/U201  ( .A1(\i_tv80_core/i_reg/n159 ), .A2(
        \i_tv80_core/i_reg/n160 ), .A3(\i_tv80_core/i_reg/n353 ), .B1(
        \i_tv80_core/i_reg/n161 ), .B2(\i_tv80_core/i_reg/n2 ), .B3(
        \i_tv80_core/i_reg/n162 ), .ZN(\i_tv80_core/i_reg/n496 ) );
  AOI21_X1 \i_tv80_core/i_reg/U200  ( .B1(\i_tv80_core/i_reg/RegsH[3][2] ), 
        .B2(\i_tv80_core/i_reg/n32 ), .A(\i_tv80_core/i_reg/n34 ), .ZN(
        \i_tv80_core/i_reg/n150 ) );
  AOI21_X1 \i_tv80_core/i_reg/U199  ( .B1(\i_tv80_core/i_reg/RegsH[2][2] ), 
        .B2(\i_tv80_core/i_reg/n341 ), .A(\i_tv80_core/i_reg/n327 ), .ZN(
        \i_tv80_core/i_reg/n151 ) );
  AOI21_X1 \i_tv80_core/i_reg/U198  ( .B1(\i_tv80_core/i_reg/RegsH[0][2] ), 
        .B2(\i_tv80_core/i_reg/n341 ), .A(\i_tv80_core/i_reg/n335 ), .ZN(
        \i_tv80_core/i_reg/n152 ) );
  AOI21_X1 \i_tv80_core/i_reg/U197  ( .B1(\i_tv80_core/i_reg/RegsH[1][2] ), 
        .B2(\i_tv80_core/i_reg/n344 ), .A(\i_tv80_core/i_reg/n2 ), .ZN(
        \i_tv80_core/i_reg/n153 ) );
  AOI22_X1 \i_tv80_core/i_reg/U196  ( .A1(\i_tv80_core/i_reg/RegsH[7][2] ), 
        .A2(\i_tv80_core/i_reg/n340 ), .B1(\i_tv80_core/i_reg/RegsH[6][2] ), 
        .B2(\i_tv80_core/i_reg/n21 ), .ZN(\i_tv80_core/i_reg/n158 ) );
  NAND3_X1 \i_tv80_core/i_reg/U195  ( .A1(\i_tv80_core/i_reg/n158 ), .A2(
        \i_tv80_core/i_reg/n332 ), .A3(\i_tv80_core/i_reg/n327 ), .ZN(
        \i_tv80_core/i_reg/n155 ) );
  AOI22_X1 \i_tv80_core/i_reg/U194  ( .A1(\i_tv80_core/i_reg/RegsH[4][2] ), 
        .A2(\i_tv80_core/i_reg/n45 ), .B1(\i_tv80_core/i_reg/RegsH[5][2] ), 
        .B2(\i_tv80_core/i_reg/n340 ), .ZN(\i_tv80_core/i_reg/n157 ) );
  NAND3_X1 \i_tv80_core/i_reg/U193  ( .A1(\i_tv80_core/i_reg/n157 ), .A2(
        \i_tv80_core/i_reg/n329 ), .A3(\i_tv80_core/i_reg/n3 ), .ZN(
        \i_tv80_core/i_reg/n156 ) );
  NAND2_X1 \i_tv80_core/i_reg/U192  ( .A1(\i_tv80_core/i_reg/n156 ), .A2(
        \i_tv80_core/i_reg/n155 ), .ZN(\i_tv80_core/i_reg/n154 ) );
  AOI22_X1 \i_tv80_core/i_reg/U191  ( .A1(\i_tv80_core/i_reg/RegsH[7][1] ), 
        .A2(\i_tv80_core/i_reg/n335 ), .B1(\i_tv80_core/i_reg/RegsH[5][1] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .ZN(\i_tv80_core/i_reg/n148 ) );
  AOI22_X1 \i_tv80_core/i_reg/U190  ( .A1(\i_tv80_core/i_reg/RegsH[3][1] ), 
        .A2(\i_tv80_core/i_reg/n15 ), .B1(\i_tv80_core/i_reg/RegsH[1][1] ), 
        .B2(\i_tv80_core/i_reg/n329 ), .ZN(\i_tv80_core/i_reg/n149 ) );
  OAI33_X1 \i_tv80_core/i_reg/U189  ( .A1(\i_tv80_core/i_reg/n148 ), .A2(
        \i_tv80_core/i_reg/n8 ), .A3(\i_tv80_core/i_reg/n353 ), .B1(
        \i_tv80_core/i_reg/n149 ), .B2(\i_tv80_core/i_reg/n326 ), .B3(
        \i_tv80_core/i_reg/n354 ), .ZN(\i_tv80_core/i_reg/n144 ) );
  OAI22_X1 \i_tv80_core/i_reg/U188  ( .A1(\i_tv80_core/i_reg/RegsH[6][1] ), 
        .A2(\i_tv80_core/i_reg/n34 ), .B1(\i_tv80_core/i_reg/RegsH[4][1] ), 
        .B2(\i_tv80_core/i_reg/n335 ), .ZN(\i_tv80_core/i_reg/n146 ) );
  OAI22_X1 \i_tv80_core/i_reg/U187  ( .A1(\i_tv80_core/i_reg/RegsH[2][1] ), 
        .A2(\i_tv80_core/i_reg/n329 ), .B1(\i_tv80_core/i_reg/RegsH[0][1] ), 
        .B2(\i_tv80_core/i_reg/n334 ), .ZN(\i_tv80_core/i_reg/n147 ) );
  OAI33_X1 \i_tv80_core/i_reg/U186  ( .A1(\i_tv80_core/i_reg/n146 ), .A2(
        \i_tv80_core/i_reg/n36 ), .A3(\i_tv80_core/i_reg/n353 ), .B1(
        \i_tv80_core/i_reg/n147 ), .B2(\i_tv80_core/i_reg/n36 ), .B3(
        \i_tv80_core/i_reg/n327 ), .ZN(\i_tv80_core/i_reg/n145 ) );
  AOI22_X1 \i_tv80_core/i_reg/U185  ( .A1(\i_tv80_core/i_reg/RegsH[7][0] ), 
        .A2(\i_tv80_core/i_reg/n15 ), .B1(\i_tv80_core/i_reg/RegsH[5][0] ), 
        .B2(\i_tv80_core/i_reg/n23 ), .ZN(\i_tv80_core/i_reg/n142 ) );
  AOI22_X1 \i_tv80_core/i_reg/U184  ( .A1(\i_tv80_core/i_reg/RegsH[3][0] ), 
        .A2(\i_tv80_core/i_reg/n334 ), .B1(\i_tv80_core/i_reg/RegsH[1][0] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .ZN(\i_tv80_core/i_reg/n143 ) );
  OAI33_X1 \i_tv80_core/i_reg/U183  ( .A1(\i_tv80_core/i_reg/n142 ), .A2(
        \i_tv80_core/i_reg/n8 ), .A3(\i_tv80_core/i_reg/n353 ), .B1(
        \i_tv80_core/i_reg/n143 ), .B2(\i_tv80_core/i_reg/n327 ), .B3(
        \i_tv80_core/i_reg/n8 ), .ZN(\i_tv80_core/i_reg/n138 ) );
  OAI22_X1 \i_tv80_core/i_reg/U182  ( .A1(\i_tv80_core/i_reg/RegsH[6][0] ), 
        .A2(\i_tv80_core/i_reg/n23 ), .B1(\i_tv80_core/i_reg/RegsH[4][0] ), 
        .B2(\i_tv80_core/i_reg/n16 ), .ZN(\i_tv80_core/i_reg/n140 ) );
  OAI22_X1 \i_tv80_core/i_reg/U181  ( .A1(\i_tv80_core/i_reg/RegsH[2][0] ), 
        .A2(\i_tv80_core/i_reg/n34 ), .B1(\i_tv80_core/i_reg/RegsH[0][0] ), 
        .B2(\i_tv80_core/i_reg/n335 ), .ZN(\i_tv80_core/i_reg/n141 ) );
  OAI33_X1 \i_tv80_core/i_reg/U180  ( .A1(\i_tv80_core/i_reg/n140 ), .A2(
        \i_tv80_core/i_reg/n339 ), .A3(\i_tv80_core/i_reg/n9 ), .B1(
        \i_tv80_core/i_reg/n141 ), .B2(\i_tv80_core/i_reg/n339 ), .B3(
        \i_tv80_core/i_reg/n2 ), .ZN(\i_tv80_core/i_reg/n139 ) );
  AOI221_X1 \i_tv80_core/i_reg/U179  ( .B1(\i_tv80_core/i_reg/RegsL[5][7] ), 
        .B2(\i_tv80_core/i_reg/n35 ), .C1(\i_tv80_core/i_reg/RegsL[7][7] ), 
        .C2(\i_tv80_core/i_reg/n16 ), .A(\i_tv80_core/i_reg/n21 ), .ZN(
        \i_tv80_core/i_reg/n135 ) );
  OAI33_X1 \i_tv80_core/i_reg/U178  ( .A1(\i_tv80_core/i_reg/n9 ), .A2(
        \i_tv80_core/i_reg/n134 ), .A3(\i_tv80_core/i_reg/n135 ), .B1(
        \i_tv80_core/i_reg/n136 ), .B2(\i_tv80_core/i_reg/n137 ), .B3(
        \i_tv80_core/i_reg/n2 ), .ZN(\i_tv80_core/RegBusA [7]) );
  AOI221_X1 \i_tv80_core/i_reg/U177  ( .B1(\i_tv80_core/i_reg/RegsL[4][6] ), 
        .B2(\i_tv80_core/i_reg/n23 ), .C1(\i_tv80_core/i_reg/RegsL[6][6] ), 
        .C2(\i_tv80_core/i_reg/n17 ), .A(\i_tv80_core/i_reg/n492 ), .ZN(
        \i_tv80_core/i_reg/n130 ) );
  AOI221_X1 \i_tv80_core/i_reg/U176  ( .B1(\i_tv80_core/i_reg/RegsL[5][6] ), 
        .B2(\i_tv80_core/i_reg/n23 ), .C1(\i_tv80_core/i_reg/RegsL[7][6] ), 
        .C2(\i_tv80_core/i_reg/n348 ), .A(\i_tv80_core/i_reg/n354 ), .ZN(
        \i_tv80_core/i_reg/n131 ) );
  AOI221_X1 \i_tv80_core/i_reg/U175  ( .B1(\i_tv80_core/i_reg/RegsL[0][6] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .C1(\i_tv80_core/i_reg/RegsL[2][6] ), 
        .C2(\i_tv80_core/i_reg/n348 ), .A(\i_tv80_core/i_reg/n36 ), .ZN(
        \i_tv80_core/i_reg/n132 ) );
  AOI221_X1 \i_tv80_core/i_reg/U174  ( .B1(\i_tv80_core/i_reg/RegsL[1][6] ), 
        .B2(\i_tv80_core/i_reg/n329 ), .C1(\i_tv80_core/i_reg/RegsL[3][6] ), 
        .C2(\i_tv80_core/i_reg/n333 ), .A(\i_tv80_core/i_reg/n356 ), .ZN(
        \i_tv80_core/i_reg/n133 ) );
  OAI33_X1 \i_tv80_core/i_reg/U173  ( .A1(\i_tv80_core/i_reg/n131 ), .A2(
        \i_tv80_core/i_reg/n130 ), .A3(\i_tv80_core/i_reg/n353 ), .B1(
        \i_tv80_core/i_reg/n132 ), .B2(\i_tv80_core/i_reg/n2 ), .B3(
        \i_tv80_core/i_reg/n133 ), .ZN(\i_tv80_core/RegBusA [6]) );
  AOI221_X1 \i_tv80_core/i_reg/U172  ( .B1(\i_tv80_core/i_reg/RegsL[4][5] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .C1(\i_tv80_core/i_reg/RegsL[6][5] ), 
        .C2(\i_tv80_core/i_reg/n17 ), .A(\i_tv80_core/i_reg/n339 ), .ZN(
        \i_tv80_core/i_reg/n126 ) );
  AOI221_X1 \i_tv80_core/i_reg/U171  ( .B1(\i_tv80_core/i_reg/RegsL[0][5] ), 
        .B2(\i_tv80_core/i_reg/n22 ), .C1(\i_tv80_core/i_reg/RegsL[2][5] ), 
        .C2(\i_tv80_core/i_reg/n16 ), .A(\i_tv80_core/i_reg/n347 ), .ZN(
        \i_tv80_core/i_reg/n128 ) );
  AOI221_X1 \i_tv80_core/i_reg/U170  ( .B1(\i_tv80_core/i_reg/RegsL[1][5] ), 
        .B2(\i_tv80_core/i_reg/n329 ), .C1(\i_tv80_core/i_reg/RegsL[3][5] ), 
        .C2(\i_tv80_core/i_reg/n333 ), .A(\i_tv80_core/i_reg/n21 ), .ZN(
        \i_tv80_core/i_reg/n129 ) );
  OAI33_X1 \i_tv80_core/i_reg/U169  ( .A1(\i_tv80_core/i_reg/n126 ), .A2(
        \i_tv80_core/i_reg/n127 ), .A3(\i_tv80_core/i_reg/n353 ), .B1(
        \i_tv80_core/i_reg/n128 ), .B2(\i_tv80_core/i_reg/n327 ), .B3(
        \i_tv80_core/i_reg/n129 ), .ZN(\i_tv80_core/RegBusA [5]) );
  AOI221_X1 \i_tv80_core/i_reg/U168  ( .B1(\i_tv80_core/i_reg/RegsL[4][4] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .C1(\i_tv80_core/i_reg/RegsL[6][4] ), 
        .C2(\i_tv80_core/i_reg/n348 ), .A(\i_tv80_core/i_reg/n28 ), .ZN(
        \i_tv80_core/i_reg/n122 ) );
  AOI221_X1 \i_tv80_core/i_reg/U167  ( .B1(\i_tv80_core/i_reg/RegsL[5][4] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .C1(\i_tv80_core/i_reg/RegsL[7][4] ), 
        .C2(\i_tv80_core/i_reg/n334 ), .A(\i_tv80_core/i_reg/n356 ), .ZN(
        \i_tv80_core/i_reg/n123 ) );
  AOI221_X1 \i_tv80_core/i_reg/U166  ( .B1(\i_tv80_core/i_reg/RegsL[0][4] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .C1(\i_tv80_core/i_reg/RegsL[2][4] ), 
        .C2(\i_tv80_core/i_reg/n16 ), .A(\i_tv80_core/i_reg/n347 ), .ZN(
        \i_tv80_core/i_reg/n124 ) );
  AOI221_X1 \i_tv80_core/i_reg/U165  ( .B1(\i_tv80_core/i_reg/RegsL[1][4] ), 
        .B2(\i_tv80_core/i_reg/n22 ), .C1(\i_tv80_core/i_reg/RegsL[3][4] ), 
        .C2(\i_tv80_core/i_reg/n332 ), .A(\i_tv80_core/i_reg/n356 ), .ZN(
        \i_tv80_core/i_reg/n125 ) );
  OAI33_X1 \i_tv80_core/i_reg/U164  ( .A1(\i_tv80_core/i_reg/n122 ), .A2(
        \i_tv80_core/i_reg/n9 ), .A3(\i_tv80_core/i_reg/n123 ), .B1(
        \i_tv80_core/i_reg/n125 ), .B2(\i_tv80_core/i_reg/n124 ), .B3(
        \i_tv80_core/i_reg/n2 ), .ZN(\i_tv80_core/RegBusA [4]) );
  NOR2_X1 \i_tv80_core/i_reg/U163  ( .A1(\i_tv80_core/i_reg/n334 ), .A2(
        \i_tv80_core/i_reg/n339 ), .ZN(\i_tv80_core/i_reg/n118 ) );
  NOR2_X1 \i_tv80_core/i_reg/U162  ( .A1(\i_tv80_core/i_reg/n354 ), .A2(
        \i_tv80_core/i_reg/n23 ), .ZN(\i_tv80_core/i_reg/n119 ) );
  NAND3_X1 \i_tv80_core/i_reg/U161  ( .A1(\i_tv80_core/i_reg/n21 ), .A2(
        \i_tv80_core/i_reg/n333 ), .A3(\i_tv80_core/i_reg/RegsL[6][3] ), .ZN(
        \i_tv80_core/i_reg/n120 ) );
  NAND3_X1 \i_tv80_core/i_reg/U160  ( .A1(\i_tv80_core/i_reg/RegsL[5][3] ), 
        .A2(\i_tv80_core/i_reg/n492 ), .A3(\i_tv80_core/i_reg/n35 ), .ZN(
        \i_tv80_core/i_reg/n121 ) );
  NOR2_X1 \i_tv80_core/i_reg/U159  ( .A1(\i_tv80_core/i_reg/n36 ), .A2(
        \i_tv80_core/i_reg/n348 ), .ZN(\i_tv80_core/i_reg/n114 ) );
  NAND3_X1 \i_tv80_core/i_reg/U158  ( .A1(\i_tv80_core/i_reg/n335 ), .A2(
        \i_tv80_core/i_reg/n355 ), .A3(\i_tv80_core/i_reg/RegsL[2][3] ), .ZN(
        \i_tv80_core/i_reg/n116 ) );
  NAND3_X1 \i_tv80_core/i_reg/U157  ( .A1(\i_tv80_core/i_reg/RegsL[1][3] ), 
        .A2(\i_tv80_core/i_reg/n492 ), .A3(\i_tv80_core/i_reg/n34 ), .ZN(
        \i_tv80_core/i_reg/n117 ) );
  NAND3_X1 \i_tv80_core/i_reg/U156  ( .A1(\i_tv80_core/i_reg/n116 ), .A2(
        \i_tv80_core/i_reg/n352 ), .A3(\i_tv80_core/i_reg/n117 ), .ZN(
        \i_tv80_core/i_reg/n115 ) );
  AOI221_X1 \i_tv80_core/i_reg/U155  ( .B1(\i_tv80_core/i_reg/RegsL[5][2] ), 
        .B2(\i_tv80_core/i_reg/n329 ), .C1(\i_tv80_core/i_reg/RegsL[7][2] ), 
        .C2(\i_tv80_core/i_reg/n334 ), .A(\i_tv80_core/i_reg/n355 ), .ZN(
        \i_tv80_core/i_reg/n109 ) );
  AOI221_X1 \i_tv80_core/i_reg/U154  ( .B1(\i_tv80_core/i_reg/RegsL[1][2] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .C1(\i_tv80_core/i_reg/RegsL[3][2] ), 
        .C2(\i_tv80_core/i_reg/n17 ), .A(\i_tv80_core/i_reg/n355 ), .ZN(
        \i_tv80_core/i_reg/n111 ) );
  OAI33_X1 \i_tv80_core/i_reg/U153  ( .A1(\i_tv80_core/i_reg/n109 ), .A2(
        \i_tv80_core/i_reg/n9 ), .A3(\i_tv80_core/i_reg/n108 ), .B1(
        \i_tv80_core/i_reg/n111 ), .B2(\i_tv80_core/i_reg/n110 ), .B3(
        \i_tv80_core/i_reg/n326 ), .ZN(\i_tv80_core/RegBusA [2]) );
  AOI221_X1 \i_tv80_core/i_reg/U152  ( .B1(\i_tv80_core/i_reg/RegsL[1][1] ), 
        .B2(\i_tv80_core/i_reg/n34 ), .C1(\i_tv80_core/i_reg/RegsL[3][1] ), 
        .C2(\i_tv80_core/i_reg/n17 ), .A(\i_tv80_core/i_reg/n354 ), .ZN(
        \i_tv80_core/i_reg/n104 ) );
  AOI221_X1 \i_tv80_core/i_reg/U151  ( .B1(\i_tv80_core/i_reg/RegsL[2][1] ), 
        .B2(\i_tv80_core/i_reg/n332 ), .C1(\i_tv80_core/i_reg/RegsL[0][1] ), 
        .C2(\i_tv80_core/i_reg/n35 ), .A(\i_tv80_core/i_reg/n31 ), .ZN(
        \i_tv80_core/i_reg/n105 ) );
  AOI221_X1 \i_tv80_core/i_reg/U150  ( .B1(\i_tv80_core/i_reg/RegsL[6][1] ), 
        .B2(\i_tv80_core/i_reg/n15 ), .C1(\i_tv80_core/i_reg/RegsL[4][1] ), 
        .C2(\i_tv80_core/i_reg/n329 ), .A(\i_tv80_core/i_reg/n28 ), .ZN(
        \i_tv80_core/i_reg/n106 ) );
  OAI33_X1 \i_tv80_core/i_reg/U149  ( .A1(\i_tv80_core/i_reg/n104 ), .A2(
        \i_tv80_core/i_reg/n2 ), .A3(\i_tv80_core/i_reg/n105 ), .B1(
        \i_tv80_core/i_reg/n106 ), .B2(\i_tv80_core/i_reg/n107 ), .B3(
        \i_tv80_core/i_reg/n9 ), .ZN(\i_tv80_core/RegBusA [1]) );
  AOI221_X1 \i_tv80_core/i_reg/U148  ( .B1(\i_tv80_core/i_reg/RegsL[6][0] ), 
        .B2(\i_tv80_core/i_reg/n15 ), .C1(\i_tv80_core/i_reg/RegsL[4][0] ), 
        .C2(\i_tv80_core/i_reg/n35 ), .A(\i_tv80_core/i_reg/n31 ), .ZN(
        \i_tv80_core/i_reg/n102 ) );
  AOI221_X1 \i_tv80_core/i_reg/U147  ( .B1(\i_tv80_core/i_reg/RegsL[5][0] ), 
        .B2(\i_tv80_core/i_reg/n22 ), .C1(\i_tv80_core/i_reg/RegsL[7][0] ), 
        .C2(\i_tv80_core/i_reg/n334 ), .A(\i_tv80_core/i_reg/n21 ), .ZN(
        \i_tv80_core/i_reg/n103 ) );
  OAI33_X1 \i_tv80_core/i_reg/U146  ( .A1(\i_tv80_core/i_reg/n100 ), .A2(
        \i_tv80_core/i_reg/n101 ), .A3(\i_tv80_core/i_reg/n3 ), .B1(
        \i_tv80_core/i_reg/n103 ), .B2(\i_tv80_core/i_reg/n102 ), .B3(
        \i_tv80_core/i_reg/n9 ), .ZN(\i_tv80_core/RegBusA [0]) );
  AND3_X1 \i_tv80_core/i_reg/U145  ( .A1(\i_tv80_core/RegAddrC [2]), .A2(
        \i_tv80_core/RegAddrC [1]), .A3(\i_tv80_core/i_reg/n490 ), .ZN(
        \i_tv80_core/i_reg/n99 ) );
  AND2_X1 \i_tv80_core/i_reg/U144  ( .A1(\i_tv80_core/i_reg/n97 ), .A2(
        \i_tv80_core/RegAddrC [2]), .ZN(\i_tv80_core/i_reg/n98 ) );
  AND2_X1 \i_tv80_core/i_reg/U143  ( .A1(\i_tv80_core/RegAddrC [0]), .A2(
        \i_tv80_core/RegAddrC [1]), .ZN(\i_tv80_core/i_reg/n97 ) );
  AND3_X1 \i_tv80_core/i_reg/U142  ( .A1(\i_tv80_core/RegAddrC [1]), .A2(
        \i_tv80_core/i_reg/n489 ), .A3(\i_tv80_core/i_reg/n490 ), .ZN(
        \i_tv80_core/i_reg/n96 ) );
  AND3_X1 \i_tv80_core/i_reg/U141  ( .A1(\i_tv80_core/RegAddrC [2]), .A2(
        \i_tv80_core/i_reg/n490 ), .A3(\i_tv80_core/i_reg/n488 ), .ZN(
        \i_tv80_core/i_reg/n95 ) );
  AND3_X1 \i_tv80_core/i_reg/U140  ( .A1(\i_tv80_core/RegAddrC [0]), .A2(
        \i_tv80_core/RegAddrC [2]), .A3(\i_tv80_core/i_reg/n488 ), .ZN(
        \i_tv80_core/i_reg/n94 ) );
  AND3_X1 \i_tv80_core/i_reg/U139  ( .A1(\i_tv80_core/RegAddrC [0]), .A2(
        \i_tv80_core/i_reg/n489 ), .A3(\i_tv80_core/i_reg/n488 ), .ZN(
        \i_tv80_core/i_reg/n93 ) );
  AOI22_X1 \i_tv80_core/i_reg/U138  ( .A1(\i_tv80_core/i_reg/RegsH[1][5] ), 
        .A2(\i_tv80_core/i_reg/n83 ), .B1(\i_tv80_core/i_reg/RegsH[3][5] ), 
        .B2(\i_tv80_core/i_reg/n67 ), .ZN(\i_tv80_core/i_reg/n411 ) );
  AOI22_X1 \i_tv80_core/i_reg/U137  ( .A1(\i_tv80_core/i_reg/RegsH[5][5] ), 
        .A2(\i_tv80_core/i_reg/n87 ), .B1(\i_tv80_core/i_reg/RegsH[7][5] ), 
        .B2(\i_tv80_core/i_reg/n84 ), .ZN(\i_tv80_core/i_reg/n412 ) );
  AOI22_X1 \i_tv80_core/i_reg/U136  ( .A1(\i_tv80_core/i_reg/RegsH[4][5] ), 
        .A2(\i_tv80_core/i_reg/n88 ), .B1(\i_tv80_core/i_reg/RegsH[6][5] ), 
        .B2(\i_tv80_core/i_reg/n86 ), .ZN(\i_tv80_core/i_reg/n410 ) );
  NAND4_X1 \i_tv80_core/i_reg/U135  ( .A1(\i_tv80_core/i_reg/n409 ), .A2(
        \i_tv80_core/i_reg/n410 ), .A3(\i_tv80_core/i_reg/n411 ), .A4(
        \i_tv80_core/i_reg/n412 ), .ZN(\i_tv80_core/RegBusB [13]) );
  AOI22_X1 \i_tv80_core/i_reg/U134  ( .A1(\i_tv80_core/i_reg/RegsH[0][5] ), 
        .A2(\i_tv80_core/i_reg/n68 ), .B1(\i_tv80_core/i_reg/RegsH[2][5] ), 
        .B2(\i_tv80_core/i_reg/n82 ), .ZN(\i_tv80_core/i_reg/n409 ) );
  AOI22_X1 \i_tv80_core/i_reg/U133  ( .A1(\i_tv80_core/i_reg/RegsL[1][5] ), 
        .A2(\i_tv80_core/i_reg/n83 ), .B1(\i_tv80_core/i_reg/RegsL[3][5] ), 
        .B2(\i_tv80_core/i_reg/n67 ), .ZN(\i_tv80_core/i_reg/n379 ) );
  AOI22_X1 \i_tv80_core/i_reg/U132  ( .A1(\i_tv80_core/i_reg/RegsL[5][5] ), 
        .A2(\i_tv80_core/i_reg/n87 ), .B1(\i_tv80_core/i_reg/RegsL[7][5] ), 
        .B2(\i_tv80_core/i_reg/n84 ), .ZN(\i_tv80_core/i_reg/n380 ) );
  AOI22_X1 \i_tv80_core/i_reg/U131  ( .A1(\i_tv80_core/i_reg/RegsL[4][5] ), 
        .A2(\i_tv80_core/i_reg/n88 ), .B1(\i_tv80_core/i_reg/RegsL[6][5] ), 
        .B2(\i_tv80_core/i_reg/n86 ), .ZN(\i_tv80_core/i_reg/n378 ) );
  NAND4_X1 \i_tv80_core/i_reg/U130  ( .A1(\i_tv80_core/i_reg/n377 ), .A2(
        \i_tv80_core/i_reg/n378 ), .A3(\i_tv80_core/i_reg/n379 ), .A4(
        \i_tv80_core/i_reg/n380 ), .ZN(\i_tv80_core/RegBusB [5]) );
  AOI22_X1 \i_tv80_core/i_reg/U129  ( .A1(\i_tv80_core/i_reg/RegsL[0][5] ), 
        .A2(\i_tv80_core/i_reg/n68 ), .B1(\i_tv80_core/i_reg/RegsL[2][5] ), 
        .B2(\i_tv80_core/i_reg/n82 ), .ZN(\i_tv80_core/i_reg/n377 ) );
  AND2_X1 \i_tv80_core/i_reg/U128  ( .A1(\i_tv80_core/i_reg/n97 ), .A2(
        \i_tv80_core/i_reg/n489 ), .ZN(\i_tv80_core/i_reg/n92 ) );
  AND3_X1 \i_tv80_core/i_reg/U127  ( .A1(\i_tv80_core/i_reg/n489 ), .A2(
        \i_tv80_core/i_reg/n490 ), .A3(\i_tv80_core/i_reg/n488 ), .ZN(
        \i_tv80_core/i_reg/n91 ) );
  AND3_X1 \i_tv80_core/i_reg/U126  ( .A1(\i_tv80_core/i_reg/n354 ), .A2(
        \i_tv80_core/n370 ), .A3(\i_tv80_core/RegWEL ), .ZN(
        \i_tv80_core/i_reg/n90 ) );
  AND2_X1 \i_tv80_core/i_reg/U125  ( .A1(\i_tv80_core/i_reg/n69 ), .A2(
        \i_tv80_core/RegWEL ), .ZN(\i_tv80_core/i_reg/n89 ) );
  AND3_X2 \i_tv80_core/i_reg/U124  ( .A1(\i_tv80_core/n1091 ), .A2(
        \i_tv80_core/i_reg/n423 ), .A3(\i_tv80_core/i_reg/n421 ), .ZN(
        \i_tv80_core/i_reg/n88 ) );
  AND3_X2 \i_tv80_core/i_reg/U123  ( .A1(\i_tv80_core/RegAddrB [0]), .A2(
        \i_tv80_core/n1091 ), .A3(\i_tv80_core/i_reg/n421 ), .ZN(
        \i_tv80_core/i_reg/n87 ) );
  AND3_X2 \i_tv80_core/i_reg/U122  ( .A1(\i_tv80_core/n1091 ), .A2(
        \i_tv80_core/RegAddrB [1]), .A3(\i_tv80_core/i_reg/n423 ), .ZN(
        \i_tv80_core/i_reg/n86 ) );
  AND2_X1 \i_tv80_core/i_reg/U121  ( .A1(\i_tv80_core/RegAddrB [0]), .A2(
        \i_tv80_core/RegAddrB [1]), .ZN(\i_tv80_core/i_reg/n85 ) );
  AND2_X2 \i_tv80_core/i_reg/U120  ( .A1(\i_tv80_core/i_reg/n85 ), .A2(
        \i_tv80_core/n1091 ), .ZN(\i_tv80_core/i_reg/n84 ) );
  AND3_X2 \i_tv80_core/i_reg/U119  ( .A1(\i_tv80_core/RegAddrB [0]), .A2(
        \i_tv80_core/i_reg/n422 ), .A3(\i_tv80_core/i_reg/n421 ), .ZN(
        \i_tv80_core/i_reg/n83 ) );
  AND3_X2 \i_tv80_core/i_reg/U118  ( .A1(\i_tv80_core/RegAddrB [1]), .A2(
        \i_tv80_core/i_reg/n422 ), .A3(\i_tv80_core/i_reg/n423 ), .ZN(
        \i_tv80_core/i_reg/n82 ) );
  AND2_X1 \i_tv80_core/i_reg/U117  ( .A1(\i_tv80_core/i_reg/n42 ), .A2(
        \i_tv80_core/i_reg/n334 ), .ZN(\i_tv80_core/i_reg/n81 ) );
  AND2_X1 \i_tv80_core/i_reg/U116  ( .A1(\i_tv80_core/i_reg/n42 ), .A2(
        \i_tv80_core/i_reg/n22 ), .ZN(\i_tv80_core/i_reg/n80 ) );
  AND2_X1 \i_tv80_core/i_reg/U115  ( .A1(\i_tv80_core/i_reg/n349 ), .A2(
        \i_tv80_core/i_reg/n493 ), .ZN(\i_tv80_core/i_reg/n79 ) );
  AND2_X1 \i_tv80_core/i_reg/U114  ( .A1(\i_tv80_core/i_reg/n90 ), .A2(
        \i_tv80_core/i_reg/n66 ), .ZN(\i_tv80_core/i_reg/n78 ) );
  AND2_X1 \i_tv80_core/i_reg/U113  ( .A1(\i_tv80_core/i_reg/n79 ), .A2(
        \i_tv80_core/i_reg/n90 ), .ZN(\i_tv80_core/i_reg/n77 ) );
  AND2_X1 \i_tv80_core/i_reg/U112  ( .A1(\i_tv80_core/i_reg/n80 ), .A2(
        \i_tv80_core/i_reg/n90 ), .ZN(\i_tv80_core/i_reg/n76 ) );
  AND2_X1 \i_tv80_core/i_reg/U111  ( .A1(\i_tv80_core/i_reg/n81 ), .A2(
        \i_tv80_core/i_reg/n90 ), .ZN(\i_tv80_core/i_reg/n75 ) );
  AND3_X1 \i_tv80_core/i_reg/U110  ( .A1(\i_tv80_core/i_reg/n356 ), .A2(
        \i_tv80_core/n370 ), .A3(\i_tv80_core/RegWEH ), .ZN(
        \i_tv80_core/i_reg/n74 ) );
  AND2_X1 \i_tv80_core/i_reg/U109  ( .A1(\i_tv80_core/i_reg/n89 ), .A2(
        \i_tv80_core/i_reg/n66 ), .ZN(\i_tv80_core/i_reg/n73 ) );
  AND2_X1 \i_tv80_core/i_reg/U108  ( .A1(\i_tv80_core/i_reg/n79 ), .A2(
        \i_tv80_core/i_reg/n89 ), .ZN(\i_tv80_core/i_reg/n72 ) );
  AND2_X1 \i_tv80_core/i_reg/U107  ( .A1(\i_tv80_core/i_reg/n80 ), .A2(
        \i_tv80_core/i_reg/n89 ), .ZN(\i_tv80_core/i_reg/n71 ) );
  AND2_X1 \i_tv80_core/i_reg/U106  ( .A1(\i_tv80_core/i_reg/n69 ), .A2(
        \i_tv80_core/RegWEH ), .ZN(\i_tv80_core/i_reg/n70 ) );
  AND2_X1 \i_tv80_core/i_reg/U105  ( .A1(\i_tv80_core/i_reg/n492 ), .A2(
        \i_tv80_core/n370 ), .ZN(\i_tv80_core/i_reg/n69 ) );
  AND3_X2 \i_tv80_core/i_reg/U104  ( .A1(\i_tv80_core/i_reg/n422 ), .A2(
        \i_tv80_core/i_reg/n423 ), .A3(\i_tv80_core/i_reg/n421 ), .ZN(
        \i_tv80_core/i_reg/n68 ) );
  AND2_X2 \i_tv80_core/i_reg/U103  ( .A1(\i_tv80_core/i_reg/n85 ), .A2(
        \i_tv80_core/i_reg/n422 ), .ZN(\i_tv80_core/i_reg/n67 ) );
  AND2_X1 \i_tv80_core/i_reg/U102  ( .A1(\i_tv80_core/i_reg/n493 ), .A2(
        \i_tv80_core/i_reg/n22 ), .ZN(\i_tv80_core/i_reg/n66 ) );
  AND2_X1 \i_tv80_core/i_reg/U101  ( .A1(\i_tv80_core/i_reg/n74 ), .A2(
        \i_tv80_core/i_reg/n66 ), .ZN(\i_tv80_core/i_reg/n65 ) );
  AND2_X1 \i_tv80_core/i_reg/U100  ( .A1(\i_tv80_core/i_reg/n81 ), .A2(
        \i_tv80_core/i_reg/n74 ), .ZN(\i_tv80_core/i_reg/n64 ) );
  AND2_X1 \i_tv80_core/i_reg/U99  ( .A1(\i_tv80_core/i_reg/n80 ), .A2(
        \i_tv80_core/i_reg/n74 ), .ZN(\i_tv80_core/i_reg/n63 ) );
  AND2_X1 \i_tv80_core/i_reg/U98  ( .A1(\i_tv80_core/i_reg/n70 ), .A2(
        \i_tv80_core/i_reg/n66 ), .ZN(\i_tv80_core/i_reg/n61 ) );
  AND2_X1 \i_tv80_core/i_reg/U97  ( .A1(\i_tv80_core/i_reg/n81 ), .A2(
        \i_tv80_core/i_reg/n70 ), .ZN(\i_tv80_core/i_reg/n60 ) );
  AND2_X1 \i_tv80_core/i_reg/U96  ( .A1(\i_tv80_core/i_reg/n80 ), .A2(
        \i_tv80_core/i_reg/n70 ), .ZN(\i_tv80_core/i_reg/n59 ) );
  AND2_X1 \i_tv80_core/i_reg/U95  ( .A1(\i_tv80_core/i_reg/n79 ), .A2(
        \i_tv80_core/i_reg/n70 ), .ZN(\i_tv80_core/i_reg/n58 ) );
  AND2_X1 \i_tv80_core/i_reg/U94  ( .A1(\i_tv80_core/i_reg/n16 ), .A2(
        \i_tv80_core/i_reg/n337 ), .ZN(\i_tv80_core/i_reg/n57 ) );
  AND2_X1 \i_tv80_core/i_reg/U93  ( .A1(\i_tv80_core/i_reg/n354 ), .A2(
        \i_tv80_core/i_reg/n23 ), .ZN(\i_tv80_core/i_reg/n56 ) );
  AND2_X1 \i_tv80_core/i_reg/U92  ( .A1(\i_tv80_core/i_reg/n492 ), .A2(
        \i_tv80_core/i_reg/n23 ), .ZN(\i_tv80_core/i_reg/n55 ) );
  AND2_X1 \i_tv80_core/i_reg/U91  ( .A1(\i_tv80_core/i_reg/n354 ), .A2(
        \i_tv80_core/i_reg/n23 ), .ZN(\i_tv80_core/i_reg/n54 ) );
  AND2_X1 \i_tv80_core/i_reg/U90  ( .A1(\i_tv80_core/i_reg/n492 ), .A2(
        \i_tv80_core/i_reg/n15 ), .ZN(\i_tv80_core/i_reg/n53 ) );
  AND2_X1 \i_tv80_core/i_reg/U89  ( .A1(\i_tv80_core/i_reg/n354 ), .A2(
        \i_tv80_core/i_reg/n332 ), .ZN(\i_tv80_core/i_reg/n52 ) );
  NOR3_X1 \i_tv80_core/i_reg/U88  ( .A1(\i_tv80_core/i_reg/n50 ), .A2(
        \i_tv80_core/i_reg/n115 ), .A3(\i_tv80_core/i_reg/n51 ), .ZN(
        \i_tv80_core/i_reg/n113 ) );
  AND2_X1 \i_tv80_core/i_reg/U87  ( .A1(\i_tv80_core/i_reg/n114 ), .A2(
        \i_tv80_core/i_reg/RegsL[0][3] ), .ZN(\i_tv80_core/i_reg/n50 ) );
  NOR3_X1 \i_tv80_core/i_reg/U86  ( .A1(\i_tv80_core/i_reg/n32 ), .A2(
        \i_tv80_core/i_reg/n49 ), .A3(\i_tv80_core/i_reg/n48 ), .ZN(
        \i_tv80_core/i_reg/n108 ) );
  AND2_X1 \i_tv80_core/i_reg/U85  ( .A1(\i_tv80_core/i_reg/RegsL[4][2] ), .A2(
        \i_tv80_core/i_reg/n22 ), .ZN(\i_tv80_core/i_reg/n48 ) );
  NOR3_X1 \i_tv80_core/i_reg/U84  ( .A1(\i_tv80_core/i_reg/n46 ), .A2(
        \i_tv80_core/i_reg/n36 ), .A3(\i_tv80_core/i_reg/n47 ), .ZN(
        \i_tv80_core/i_reg/n101 ) );
  AND2_X1 \i_tv80_core/i_reg/U83  ( .A1(\i_tv80_core/i_reg/RegsL[2][0] ), .A2(
        \i_tv80_core/i_reg/n334 ), .ZN(\i_tv80_core/i_reg/n46 ) );
  NOR3_X1 \i_tv80_core/i_reg/U82  ( .A1(\i_tv80_core/i_reg/n43 ), .A2(
        \i_tv80_core/i_reg/n44 ), .A3(\i_tv80_core/i_reg/n341 ), .ZN(
        \i_tv80_core/i_reg/n137 ) );
  AND2_X1 \i_tv80_core/i_reg/U81  ( .A1(\i_tv80_core/i_reg/RegsL[3][7] ), .A2(
        \i_tv80_core/i_reg/n349 ), .ZN(\i_tv80_core/i_reg/n44 ) );
  AND2_X1 \i_tv80_core/i_reg/U80  ( .A1(\i_tv80_core/i_reg/RegsL[1][7] ), .A2(
        \i_tv80_core/i_reg/n329 ), .ZN(\i_tv80_core/i_reg/n43 ) );
  NOR3_X1 \i_tv80_core/i_reg/U79  ( .A1(\i_tv80_core/i_reg/n41 ), .A2(
        \i_tv80_core/i_reg/n40 ), .A3(\i_tv80_core/i_reg/n347 ), .ZN(
        \i_tv80_core/i_reg/n110 ) );
  AND2_X1 \i_tv80_core/i_reg/U78  ( .A1(\i_tv80_core/i_reg/RegsL[2][2] ), .A2(
        \i_tv80_core/i_reg/n349 ), .ZN(\i_tv80_core/i_reg/n41 ) );
  AND2_X1 \i_tv80_core/i_reg/U77  ( .A1(\i_tv80_core/i_reg/RegsL[0][2] ), .A2(
        \i_tv80_core/i_reg/n329 ), .ZN(\i_tv80_core/i_reg/n40 ) );
  AND2_X2 \i_tv80_core/i_reg/U76  ( .A1(\i_tv80_core/i_reg/n79 ), .A2(
        \i_tv80_core/i_reg/n74 ), .ZN(\i_tv80_core/i_reg/n62 ) );
  INV_X1 \i_tv80_core/i_reg/U75  ( .A(\i_tv80_core/i_reg/n62 ), .ZN(
        \i_tv80_core/i_reg/n37 ) );
  NAND2_X1 \i_tv80_core/i_reg/U74  ( .A1(\i_tv80_core/i_reg/n38 ), .A2(
        \i_tv80_core/i_reg/n39 ), .ZN(\i_tv80_core/i_reg/n221 ) );
  NAND2_X1 \i_tv80_core/i_reg/U73  ( .A1(\i_tv80_core/RegDIH [7]), .A2(
        \i_tv80_core/i_reg/n62 ), .ZN(\i_tv80_core/i_reg/n39 ) );
  NAND2_X1 \i_tv80_core/i_reg/U72  ( .A1(\i_tv80_core/i_reg/RegsH[2][7] ), 
        .A2(\i_tv80_core/i_reg/n37 ), .ZN(\i_tv80_core/i_reg/n38 ) );
  INV_X1 \i_tv80_core/i_reg/U71  ( .A(\i_tv80_core/i_reg/n492 ), .ZN(
        \i_tv80_core/i_reg/n45 ) );
  INV_X1 \i_tv80_core/i_reg/U70  ( .A(\i_tv80_core/i_reg/n33 ), .ZN(
        \i_tv80_core/i_reg/n36 ) );
  BUF_X1 \i_tv80_core/i_reg/U69  ( .A(\i_tv80_core/i_reg/n338 ), .Z(
        \i_tv80_core/i_reg/n355 ) );
  BUF_X1 \i_tv80_core/i_reg/U68  ( .A(\i_tv80_core/i_reg/n336 ), .Z(
        \i_tv80_core/i_reg/n338 ) );
  BUF_X2 \i_tv80_core/i_reg/U67  ( .A(\i_tv80_core/i_reg/n324 ), .Z(
        \i_tv80_core/i_reg/n353 ) );
  CLKBUF_X3 \i_tv80_core/i_reg/U66  ( .A(\i_tv80_core/i_reg/n351 ), .Z(
        \i_tv80_core/i_reg/n34 ) );
  NAND2_X1 \i_tv80_core/i_reg/U65  ( .A1(\i_tv80_core/i_reg/n56 ), .A2(
        \i_tv80_core/i_reg/n1 ), .ZN(\i_tv80_core/i_reg/n317 ) );
  INV_X1 \i_tv80_core/i_reg/U64  ( .A(\i_tv80_core/i_reg/n21 ), .ZN(
        \i_tv80_core/i_reg/n32 ) );
  INV_X1 \i_tv80_core/i_reg/U63  ( .A(\i_tv80_core/i_reg/n337 ), .ZN(
        \i_tv80_core/i_reg/n31 ) );
  NOR2_X1 \i_tv80_core/i_reg/U62  ( .A1(\i_tv80_core/i_reg/n30 ), .A2(
        \i_tv80_core/i_reg/n35 ), .ZN(\i_tv80_core/i_reg/n49 ) );
  OR2_X2 \i_tv80_core/i_reg/U61  ( .A1(\i_tv80_core/i_reg/n144 ), .A2(
        \i_tv80_core/i_reg/n145 ), .ZN(\i_tv80_core/RegBusA [9]) );
  OR2_X2 \i_tv80_core/i_reg/U60  ( .A1(\i_tv80_core/i_reg/n139 ), .A2(
        \i_tv80_core/i_reg/n138 ), .ZN(\i_tv80_core/RegBusA [8]) );
  INV_X1 \i_tv80_core/i_reg/U59  ( .A(\i_tv80_core/i_reg/n325 ), .ZN(
        \i_tv80_core/i_reg/n326 ) );
  INV_X1 \i_tv80_core/i_reg/U58  ( .A(\i_tv80_core/RegAddrA [0]), .ZN(
        \i_tv80_core/i_reg/n29 ) );
  OR2_X2 \i_tv80_core/i_reg/U57  ( .A1(\i_tv80_core/i_reg/n163 ), .A2(
        \i_tv80_core/i_reg/n164 ), .ZN(\i_tv80_core/RegBusA [12]) );
  INV_X1 \i_tv80_core/i_reg/U56  ( .A(\i_tv80_core/i_reg/n337 ), .ZN(
        \i_tv80_core/i_reg/n28 ) );
  INV_X1 \i_tv80_core/i_reg/U55  ( .A(\i_tv80_core/i_reg/n21 ), .ZN(
        \i_tv80_core/i_reg/n27 ) );
  INV_X1 \i_tv80_core/i_reg/U54  ( .A(\i_tv80_core/i_reg/n350 ), .ZN(
        \i_tv80_core/i_reg/n348 ) );
  CLKBUF_X3 \i_tv80_core/i_reg/U53  ( .A(\i_tv80_core/i_reg/n351 ), .Z(
        \i_tv80_core/i_reg/n35 ) );
  NOR3_X1 \i_tv80_core/i_reg/U52  ( .A1(\i_tv80_core/i_reg/n24 ), .A2(
        \i_tv80_core/i_reg/n25 ), .A3(\i_tv80_core/i_reg/n354 ), .ZN(
        \i_tv80_core/i_reg/n100 ) );
  AND2_X1 \i_tv80_core/i_reg/U51  ( .A1(\i_tv80_core/i_reg/RegsL[3][0] ), .A2(
        \i_tv80_core/i_reg/n348 ), .ZN(\i_tv80_core/i_reg/n25 ) );
  AND2_X1 \i_tv80_core/i_reg/U50  ( .A1(\i_tv80_core/i_reg/RegsL[1][0] ), .A2(
        \i_tv80_core/i_reg/n35 ), .ZN(\i_tv80_core/i_reg/n24 ) );
  BUF_X1 \i_tv80_core/i_reg/U49  ( .A(\i_tv80_core/i_reg/n29 ), .Z(
        \i_tv80_core/i_reg/n33 ) );
  CLKBUF_X3 \i_tv80_core/i_reg/U48  ( .A(\i_tv80_core/i_reg/n29 ), .Z(
        \i_tv80_core/i_reg/n21 ) );
  INV_X1 \i_tv80_core/i_reg/U47  ( .A(\i_tv80_core/i_reg/n331 ), .ZN(
        \i_tv80_core/i_reg/n333 ) );
  BUF_X2 \i_tv80_core/i_reg/U46  ( .A(\i_tv80_core/i_reg/n338 ), .Z(
        \i_tv80_core/i_reg/n354 ) );
  NAND2_X1 \i_tv80_core/i_reg/U45  ( .A1(\i_tv80_core/i_reg/n340 ), .A2(
        \i_tv80_core/i_reg/n20 ), .ZN(\i_tv80_core/i_reg/n18 ) );
  NOR2_X1 \i_tv80_core/i_reg/U44  ( .A1(\i_tv80_core/i_reg/n23 ), .A2(
        \i_tv80_core/i_reg/n18 ), .ZN(\i_tv80_core/i_reg/n51 ) );
  INV_X1 \i_tv80_core/i_reg/U43  ( .A(\i_tv80_core/i_reg/n350 ), .ZN(
        \i_tv80_core/i_reg/n17 ) );
  INV_X1 \i_tv80_core/i_reg/U42  ( .A(\i_tv80_core/i_reg/n331 ), .ZN(
        \i_tv80_core/i_reg/n16 ) );
  INV_X1 \i_tv80_core/i_reg/U41  ( .A(\i_tv80_core/i_reg/n331 ), .ZN(
        \i_tv80_core/i_reg/n15 ) );
  NOR3_X1 \i_tv80_core/i_reg/U40  ( .A1(\i_tv80_core/i_reg/n13 ), .A2(
        \i_tv80_core/i_reg/n14 ), .A3(\i_tv80_core/i_reg/n32 ), .ZN(
        \i_tv80_core/i_reg/n134 ) );
  AND2_X1 \i_tv80_core/i_reg/U39  ( .A1(\i_tv80_core/i_reg/RegsL[6][7] ), .A2(
        \i_tv80_core/i_reg/n17 ), .ZN(\i_tv80_core/i_reg/n14 ) );
  AND2_X1 \i_tv80_core/i_reg/U38  ( .A1(\i_tv80_core/i_reg/RegsL[4][7] ), .A2(
        \i_tv80_core/i_reg/n35 ), .ZN(\i_tv80_core/i_reg/n13 ) );
  CLKBUF_X3 \i_tv80_core/i_reg/U37  ( .A(\i_tv80_core/i_reg/n351 ), .Z(
        \i_tv80_core/i_reg/n329 ) );
  BUF_X1 \i_tv80_core/i_reg/U36  ( .A(\i_tv80_core/i_reg/n324 ), .Z(
        \i_tv80_core/i_reg/n352 ) );
  BUF_X1 \i_tv80_core/i_reg/U35  ( .A(\i_tv80_core/RegAddrA [2]), .Z(
        \i_tv80_core/i_reg/n42 ) );
  INV_X1 \i_tv80_core/i_reg/U34  ( .A(\i_tv80_core/i_reg/n42 ), .ZN(
        \i_tv80_core/i_reg/n12 ) );
  INV_X1 \i_tv80_core/i_reg/U33  ( .A(\i_tv80_core/i_reg/n492 ), .ZN(
        \i_tv80_core/i_reg/n341 ) );
  AND3_X1 \i_tv80_core/i_reg/U32  ( .A1(\i_tv80_core/i_reg/n10 ), .A2(
        \i_tv80_core/i_reg/n11 ), .A3(\i_tv80_core/i_reg/n4 ), .ZN(
        \i_tv80_core/i_reg/n112 ) );
  NAND2_X1 \i_tv80_core/i_reg/U31  ( .A1(\i_tv80_core/i_reg/n119 ), .A2(
        \i_tv80_core/i_reg/RegsL[7][3] ), .ZN(\i_tv80_core/i_reg/n11 ) );
  NAND2_X1 \i_tv80_core/i_reg/U30  ( .A1(\i_tv80_core/i_reg/n118 ), .A2(
        \i_tv80_core/i_reg/RegsL[4][3] ), .ZN(\i_tv80_core/i_reg/n10 ) );
  BUF_X2 \i_tv80_core/i_reg/U29  ( .A(\i_tv80_core/i_reg/n324 ), .Z(
        \i_tv80_core/i_reg/n9 ) );
  INV_X1 \i_tv80_core/i_reg/U28  ( .A(\i_tv80_core/i_reg/n492 ), .ZN(
        \i_tv80_core/i_reg/n8 ) );
  NOR3_X1 \i_tv80_core/i_reg/U27  ( .A1(\i_tv80_core/i_reg/n6 ), .A2(
        \i_tv80_core/i_reg/n7 ), .A3(\i_tv80_core/i_reg/n27 ), .ZN(
        \i_tv80_core/i_reg/n136 ) );
  AND2_X1 \i_tv80_core/i_reg/U26  ( .A1(\i_tv80_core/i_reg/RegsL[2][7] ), .A2(
        \i_tv80_core/i_reg/n17 ), .ZN(\i_tv80_core/i_reg/n7 ) );
  AND2_X1 \i_tv80_core/i_reg/U25  ( .A1(\i_tv80_core/i_reg/RegsL[0][7] ), .A2(
        \i_tv80_core/i_reg/n329 ), .ZN(\i_tv80_core/i_reg/n6 ) );
  BUF_X2 \i_tv80_core/i_reg/U24  ( .A(\i_tv80_core/i_reg/n328 ), .Z(
        \i_tv80_core/i_reg/n330 ) );
  INV_X2 \i_tv80_core/i_reg/U23  ( .A(\i_tv80_core/i_reg/n330 ), .ZN(
        \i_tv80_core/i_reg/n334 ) );
  MUX2_X1 \i_tv80_core/i_reg/U22  ( .A(\i_tv80_core/RegDIL [7]), .B(
        \i_tv80_core/i_reg/RegsL[7][7] ), .S(\i_tv80_core/i_reg/n494 ), .Z(
        \i_tv80_core/i_reg/n245 ) );
  NOR2_X1 \i_tv80_core/i_reg/U21  ( .A1(\i_tv80_core/i_reg/n5 ), .A2(
        \i_tv80_core/i_reg/n333 ), .ZN(\i_tv80_core/i_reg/n47 ) );
  BUF_X1 \i_tv80_core/i_reg/U20  ( .A(\i_tv80_core/i_reg/n21 ), .Z(
        \i_tv80_core/i_reg/n26 ) );
  BUF_X2 \i_tv80_core/i_reg/U19  ( .A(\i_tv80_core/i_reg/n328 ), .Z(
        \i_tv80_core/i_reg/n331 ) );
  AND3_X1 \i_tv80_core/i_reg/U18  ( .A1(\i_tv80_core/i_reg/n120 ), .A2(
        \i_tv80_core/i_reg/n326 ), .A3(\i_tv80_core/i_reg/n121 ), .ZN(
        \i_tv80_core/i_reg/n4 ) );
  INV_X1 \i_tv80_core/i_reg/U17  ( .A(\i_tv80_core/i_reg/n493 ), .ZN(
        \i_tv80_core/i_reg/n3 ) );
  BUF_X2 \i_tv80_core/i_reg/U16  ( .A(\i_tv80_core/i_reg/n330 ), .Z(
        \i_tv80_core/i_reg/n22 ) );
  INV_X2 \i_tv80_core/i_reg/U15  ( .A(\i_tv80_core/i_reg/n12 ), .ZN(
        \i_tv80_core/i_reg/n2 ) );
  INV_X1 \i_tv80_core/i_reg/U14  ( .A(\i_tv80_core/i_reg/n19 ), .ZN(
        \i_tv80_core/i_reg/n20 ) );
  INV_X1 \i_tv80_core/i_reg/U13  ( .A(\i_tv80_core/i_reg/n494 ), .ZN(
        \i_tv80_core/i_reg/n495 ) );
  MUX2_X1 \i_tv80_core/i_reg/U12  ( .A(\i_tv80_core/RegDIL [1]), .B(
        \i_tv80_core/i_reg/RegsL[7][1] ), .S(\i_tv80_core/i_reg/n494 ), .Z(
        \i_tv80_core/i_reg/n239 ) );
  AND2_X1 \i_tv80_core/i_reg/U11  ( .A1(\i_tv80_core/i_reg/n2 ), .A2(
        \i_tv80_core/i_reg/RegsH[4][7] ), .ZN(\i_tv80_core/i_reg/n1 ) );
  BUF_X1 \i_tv80_core/i_reg/U10  ( .A(\i_tv80_core/i_reg/n323 ), .Z(
        \i_tv80_core/i_reg/n325 ) );
  INV_X1 \i_tv80_core/i_reg/U9  ( .A(\i_tv80_core/i_reg/n325 ), .ZN(
        \i_tv80_core/i_reg/n327 ) );
  AOI221_X4 \i_tv80_core/i_reg/U8  ( .B1(\i_tv80_core/i_reg/n150 ), .B2(
        \i_tv80_core/i_reg/n151 ), .C1(\i_tv80_core/i_reg/n152 ), .C2(
        \i_tv80_core/i_reg/n153 ), .A(\i_tv80_core/i_reg/n154 ), .ZN(
        \i_tv80_core/RegBusA [10]) );
  BUF_X2 \i_tv80_core/i_reg/U7  ( .A(\i_tv80_core/i_reg/n29 ), .Z(
        \i_tv80_core/i_reg/n337 ) );
  CLKBUF_X3 \i_tv80_core/i_reg/U6  ( .A(\i_tv80_core/i_reg/n330 ), .Z(
        \i_tv80_core/i_reg/n23 ) );
  OR2_X2 \i_tv80_core/i_reg/U5  ( .A1(\i_tv80_core/i_reg/n313 ), .A2(
        \i_tv80_core/i_reg/n314 ), .ZN(\i_tv80_core/RegBusA [15]) );
  MUX2_X1 \i_tv80_core/i_reg/U4  ( .A(\i_tv80_core/n2167 ), .B(
        \i_tv80_core/i_reg/RegsH[2][5] ), .S(\i_tv80_core/i_reg/n37 ), .Z(
        \i_tv80_core/i_reg/n219 ) );
  BUF_X2 \i_tv80_core/i_reg/U3  ( .A(\i_tv80_core/i_reg/n338 ), .Z(
        \i_tv80_core/i_reg/n356 ) );
  BUF_X1 \i_tv80_core/i_reg/U2  ( .A(\i_tv80_core/i_reg/n351 ), .Z(
        \i_tv80_core/i_reg/n350 ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[0][5]  ( .D(\i_tv80_core/i_reg/n299 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[0][5] ) );
  DFF_X2 \i_tv80_core/i_reg/RegsL_reg[7][5]  ( .D(\i_tv80_core/i_reg/n243 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[7][5] ) );
  DFF_X2 \i_tv80_core/i_reg/RegsL_reg[4][5]  ( .D(\i_tv80_core/i_reg/n267 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[4][5] ) );
  DFF_X2 \i_tv80_core/i_reg/RegsL_reg[2][5]  ( .D(\i_tv80_core/i_reg/n283 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[2][5] ) );
  DFF_X2 \i_tv80_core/i_reg/RegsL_reg[5][5]  ( .D(\i_tv80_core/i_reg/n259 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[5][5] ) );
  DFF_X2 \i_tv80_core/i_reg/RegsL_reg[6][5]  ( .D(\i_tv80_core/i_reg/n251 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[6][5] ) );
  DFF_X2 \i_tv80_core/i_reg/RegsL_reg[3][5]  ( .D(\i_tv80_core/i_reg/n275 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[3][5] ) );
  DFF_X2 \i_tv80_core/i_reg/RegsL_reg[1][5]  ( .D(\i_tv80_core/i_reg/n291 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[1][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[7][4]  ( .D(\i_tv80_core/i_reg/n178 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[7][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[4][6]  ( .D(\i_tv80_core/i_reg/n204 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[4][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[5][6]  ( .D(\i_tv80_core/i_reg/n196 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[5][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[6][6]  ( .D(\i_tv80_core/i_reg/n188 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[6][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[7][6]  ( .D(\i_tv80_core/i_reg/n180 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[7][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[0][3]  ( .D(\i_tv80_core/i_reg/n233 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[0][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[1][3]  ( .D(\i_tv80_core/i_reg/n225 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[1][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[2][3]  ( .D(\i_tv80_core/i_reg/n217 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[2][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[3][3]  ( .D(\i_tv80_core/i_reg/n209 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[3][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[4][3]  ( .D(\i_tv80_core/i_reg/n201 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[4][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[5][3]  ( .D(\i_tv80_core/i_reg/n193 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[5][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[6][3]  ( .D(\i_tv80_core/i_reg/n185 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[6][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[7][3]  ( .D(\i_tv80_core/i_reg/n177 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[7][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[0][7]  ( .D(\i_tv80_core/i_reg/n237 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[0][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[1][7]  ( .D(\i_tv80_core/i_reg/n229 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[1][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[3][7]  ( .D(\i_tv80_core/i_reg/n213 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[3][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[4][7]  ( .D(\i_tv80_core/i_reg/n205 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[4][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[5][7]  ( .D(\i_tv80_core/i_reg/n197 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[5][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[6][7]  ( .D(\i_tv80_core/i_reg/n189 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[6][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[7][7]  ( .D(\i_tv80_core/i_reg/n181 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[7][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[0][7]  ( .D(\i_tv80_core/i_reg/n301 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[0][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[1][7]  ( .D(\i_tv80_core/i_reg/n293 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[1][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[2][7]  ( .D(\i_tv80_core/i_reg/n285 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[2][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[3][7]  ( .D(\i_tv80_core/i_reg/n277 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[3][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[4][7]  ( .D(\i_tv80_core/i_reg/n269 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[4][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[5][7]  ( .D(\i_tv80_core/i_reg/n261 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[5][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[6][7]  ( .D(\i_tv80_core/i_reg/n253 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[6][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[7][7]  ( .D(\i_tv80_core/i_reg/n245 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[7][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[0][2]  ( .D(\i_tv80_core/i_reg/n232 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[0][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[1][2]  ( .D(\i_tv80_core/i_reg/n224 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[1][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[2][2]  ( .D(\i_tv80_core/i_reg/n216 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[2][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[3][2]  ( .D(\i_tv80_core/i_reg/n208 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[3][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[4][2]  ( .D(\i_tv80_core/i_reg/n200 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[4][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[5][2]  ( .D(\i_tv80_core/i_reg/n192 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[5][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[6][2]  ( .D(\i_tv80_core/i_reg/n184 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[6][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[7][2]  ( .D(\i_tv80_core/i_reg/n176 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[7][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[0][4]  ( .D(\i_tv80_core/i_reg/n234 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[0][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[1][4]  ( .D(\i_tv80_core/i_reg/n226 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[1][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[3][4]  ( .D(\i_tv80_core/i_reg/n210 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[3][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[4][4]  ( .D(\i_tv80_core/i_reg/n202 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[4][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[5][4]  ( .D(\i_tv80_core/i_reg/n194 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[5][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[6][4]  ( .D(\i_tv80_core/i_reg/n186 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[6][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[0][6]  ( .D(\i_tv80_core/i_reg/n300 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[0][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[1][6]  ( .D(\i_tv80_core/i_reg/n292 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[1][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[2][6]  ( .D(\i_tv80_core/i_reg/n284 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[2][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[3][6]  ( .D(\i_tv80_core/i_reg/n276 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[3][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[4][6]  ( .D(\i_tv80_core/i_reg/n268 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[4][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[5][6]  ( .D(\i_tv80_core/i_reg/n260 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[5][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[6][6]  ( .D(\i_tv80_core/i_reg/n252 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[6][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[2][4]  ( .D(\i_tv80_core/i_reg/n218 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[2][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[7][6]  ( .D(\i_tv80_core/i_reg/n244 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[7][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[0][1]  ( .D(\i_tv80_core/i_reg/n231 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[0][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[1][1]  ( .D(\i_tv80_core/i_reg/n223 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[1][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[2][1]  ( .D(\i_tv80_core/i_reg/n215 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[2][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[3][1]  ( .D(\i_tv80_core/i_reg/n207 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[3][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[4][1]  ( .D(\i_tv80_core/i_reg/n199 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[4][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[5][1]  ( .D(\i_tv80_core/i_reg/n191 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[5][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[6][1]  ( .D(\i_tv80_core/i_reg/n183 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[6][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[7][1]  ( .D(\i_tv80_core/i_reg/n175 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[7][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[0][0]  ( .D(\i_tv80_core/i_reg/n230 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[0][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[1][0]  ( .D(\i_tv80_core/i_reg/n222 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[1][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[2][0]  ( .D(\i_tv80_core/i_reg/n214 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[2][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[3][0]  ( .D(\i_tv80_core/i_reg/n206 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[3][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[4][0]  ( .D(\i_tv80_core/i_reg/n198 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[4][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[5][0]  ( .D(\i_tv80_core/i_reg/n190 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[5][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[6][0]  ( .D(\i_tv80_core/i_reg/n182 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[6][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[7][0]  ( .D(\i_tv80_core/i_reg/n174 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[7][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[0][4]  ( .D(\i_tv80_core/i_reg/n298 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[0][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[1][4]  ( .D(\i_tv80_core/i_reg/n290 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[1][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[2][4]  ( .D(\i_tv80_core/i_reg/n282 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[2][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[3][4]  ( .D(\i_tv80_core/i_reg/n274 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[3][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[4][4]  ( .D(\i_tv80_core/i_reg/n266 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[4][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[5][4]  ( .D(\i_tv80_core/i_reg/n258 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[5][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[6][4]  ( .D(\i_tv80_core/i_reg/n250 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[6][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[7][4]  ( .D(\i_tv80_core/i_reg/n242 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[7][4] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[0][3]  ( .D(\i_tv80_core/i_reg/n297 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[0][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[1][3]  ( .D(\i_tv80_core/i_reg/n289 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[1][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[2][3]  ( .D(\i_tv80_core/i_reg/n281 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[2][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[4][3]  ( .D(\i_tv80_core/i_reg/n265 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[4][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[5][3]  ( .D(\i_tv80_core/i_reg/n257 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[5][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[6][3]  ( .D(\i_tv80_core/i_reg/n249 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[6][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[7][3]  ( .D(\i_tv80_core/i_reg/n241 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[7][3] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[0][1]  ( .D(\i_tv80_core/i_reg/n295 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[0][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[1][1]  ( .D(\i_tv80_core/i_reg/n287 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[1][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[2][1]  ( .D(\i_tv80_core/i_reg/n279 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[2][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[3][1]  ( .D(\i_tv80_core/i_reg/n271 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[3][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[4][1]  ( .D(\i_tv80_core/i_reg/n263 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[4][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[5][1]  ( .D(\i_tv80_core/i_reg/n255 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[5][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[6][1]  ( .D(\i_tv80_core/i_reg/n247 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[6][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[7][1]  ( .D(\i_tv80_core/i_reg/n239 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[7][1] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[0][2]  ( .D(\i_tv80_core/i_reg/n296 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[0][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[1][2]  ( .D(\i_tv80_core/i_reg/n288 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[1][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[2][2]  ( .D(\i_tv80_core/i_reg/n280 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[2][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[3][2]  ( .D(\i_tv80_core/i_reg/n272 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[3][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[4][2]  ( .D(\i_tv80_core/i_reg/n264 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[4][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[5][2]  ( .D(\i_tv80_core/i_reg/n256 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[5][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[7][2]  ( .D(\i_tv80_core/i_reg/n240 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[7][2] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[1][0]  ( .D(\i_tv80_core/i_reg/n286 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[1][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[2][0]  ( .D(\i_tv80_core/i_reg/n278 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[2][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[3][0]  ( .D(\i_tv80_core/i_reg/n270 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[3][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[4][0]  ( .D(\i_tv80_core/i_reg/n262 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[4][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[5][0]  ( .D(\i_tv80_core/i_reg/n254 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[5][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[6][0]  ( .D(\i_tv80_core/i_reg/n246 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[6][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[7][0]  ( .D(\i_tv80_core/i_reg/n238 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[7][0] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[0][0]  ( .D(\i_tv80_core/i_reg/n294 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[0][0] ), .QN(
        \i_tv80_core/i_reg/n5 ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[2][5]  ( .D(\i_tv80_core/i_reg/n219 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[2][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[5][5]  ( .D(\i_tv80_core/i_reg/n195 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[5][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[6][5]  ( .D(\i_tv80_core/i_reg/n187 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[6][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[0][5]  ( .D(\i_tv80_core/i_reg/n235 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[0][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[3][5]  ( .D(\i_tv80_core/i_reg/n211 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[3][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[1][5]  ( .D(\i_tv80_core/i_reg/n227 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[1][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[4][5]  ( .D(\i_tv80_core/i_reg/n203 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[4][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[7][5]  ( .D(\i_tv80_core/i_reg/n179 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[7][5] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[2][7]  ( .D(\i_tv80_core/i_reg/n221 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[2][7] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[0][6]  ( .D(\i_tv80_core/i_reg/n236 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[0][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[1][6]  ( .D(\i_tv80_core/i_reg/n228 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[1][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[2][6]  ( .D(\i_tv80_core/i_reg/n220 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[2][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsH_reg[3][6]  ( .D(\i_tv80_core/i_reg/n212 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsH[3][6] ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[3][3]  ( .D(\i_tv80_core/i_reg/n273 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[3][3] ), .QN(
        \i_tv80_core/i_reg/n19 ) );
  DFF_X1 \i_tv80_core/i_reg/RegsL_reg[6][2]  ( .D(\i_tv80_core/i_reg/n248 ), 
        .CK(clk), .Q(\i_tv80_core/i_reg/RegsL[6][2] ), .QN(
        \i_tv80_core/i_reg/n30 ) );
  XOR2_X1 \i_tv80_core/add_776/U2  ( .A(\i_tv80_core/add_776/carry [6]), .B(
        \i_tv80_core/R [6]), .Z(\i_tv80_core/N159 ) );
  INV_X1 \i_tv80_core/add_776/U1  ( .A(\i_tv80_core/R [0]), .ZN(
        \i_tv80_core/N153 ) );
  HA_X1 \i_tv80_core/add_776/U1_1_1  ( .A(\i_tv80_core/R [1]), .B(
        \i_tv80_core/R [0]), .CO(\i_tv80_core/add_776/carry [2]), .S(
        \i_tv80_core/N154 ) );
  HA_X1 \i_tv80_core/add_776/U1_1_2  ( .A(\i_tv80_core/R [2]), .B(
        \i_tv80_core/add_776/carry [2]), .CO(\i_tv80_core/add_776/carry [3]), 
        .S(\i_tv80_core/N155 ) );
  HA_X1 \i_tv80_core/add_776/U1_1_3  ( .A(\i_tv80_core/R [3]), .B(
        \i_tv80_core/add_776/carry [3]), .CO(\i_tv80_core/add_776/carry [4]), 
        .S(\i_tv80_core/N156 ) );
  HA_X1 \i_tv80_core/add_776/U1_1_4  ( .A(\i_tv80_core/R [4]), .B(
        \i_tv80_core/add_776/carry [4]), .CO(\i_tv80_core/add_776/carry [5]), 
        .S(\i_tv80_core/N157 ) );
  HA_X1 \i_tv80_core/add_776/U1_1_5  ( .A(\i_tv80_core/R [5]), .B(
        \i_tv80_core/add_776/carry [5]), .CO(\i_tv80_core/add_776/carry [6]), 
        .S(\i_tv80_core/N158 ) );
  NAND3_X1 \i_tv80_core/add_944/U94  ( .A1(\i_tv80_core/TmpAddr [9]), .A2(
        \i_tv80_core/TmpAddr [8]), .A3(\i_tv80_core/TmpAddr [5]), .ZN(
        \i_tv80_core/add_944/n77 ) );
  NAND2_X1 \i_tv80_core/add_944/U93  ( .A1(\i_tv80_core/TmpAddr [6]), .A2(
        \i_tv80_core/TmpAddr [7]), .ZN(\i_tv80_core/add_944/n78 ) );
  NAND3_X1 \i_tv80_core/add_944/U92  ( .A1(\i_tv80_core/TmpAddr [4]), .A2(
        \i_tv80_core/TmpAddr [3]), .A3(\i_tv80_core/TmpAddr [0]), .ZN(
        \i_tv80_core/add_944/n75 ) );
  NAND2_X1 \i_tv80_core/add_944/U91  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/add_944/n76 ) );
  NAND2_X1 \i_tv80_core/add_944/U90  ( .A1(\i_tv80_core/add_944/n73 ), .A2(
        \i_tv80_core/add_944/n74 ), .ZN(\i_tv80_core/add_944/n72 ) );
  XNOR2_X1 \i_tv80_core/add_944/U89  ( .A(\i_tv80_core/add_944/n72 ), .B(
        \i_tv80_core/TmpAddr [10]), .ZN(\i_tv80_core/N257 ) );
  NAND3_X1 \i_tv80_core/add_944/U88  ( .A1(\i_tv80_core/TmpAddr [10]), .A2(
        \i_tv80_core/TmpAddr [9]), .A3(\i_tv80_core/TmpAddr [6]), .ZN(
        \i_tv80_core/add_944/n70 ) );
  NAND2_X1 \i_tv80_core/add_944/U87  ( .A1(\i_tv80_core/TmpAddr [7]), .A2(
        \i_tv80_core/TmpAddr [8]), .ZN(\i_tv80_core/add_944/n71 ) );
  NAND3_X1 \i_tv80_core/add_944/U86  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [2]), .A3(\i_tv80_core/TmpAddr [0]), .ZN(
        \i_tv80_core/add_944/n68 ) );
  NAND3_X1 \i_tv80_core/add_944/U85  ( .A1(\i_tv80_core/TmpAddr [4]), .A2(
        \i_tv80_core/TmpAddr [5]), .A3(\i_tv80_core/TmpAddr [3]), .ZN(
        \i_tv80_core/add_944/n69 ) );
  NAND2_X1 \i_tv80_core/add_944/U84  ( .A1(\i_tv80_core/add_944/n66 ), .A2(
        \i_tv80_core/add_944/n67 ), .ZN(\i_tv80_core/add_944/n65 ) );
  XNOR2_X1 \i_tv80_core/add_944/U83  ( .A(\i_tv80_core/add_944/n65 ), .B(
        \i_tv80_core/TmpAddr [11]), .ZN(\i_tv80_core/N258 ) );
  NAND3_X1 \i_tv80_core/add_944/U82  ( .A1(\i_tv80_core/TmpAddr [7]), .A2(
        \i_tv80_core/TmpAddr [8]), .A3(\i_tv80_core/TmpAddr [6]), .ZN(
        \i_tv80_core/add_944/n63 ) );
  NAND3_X1 \i_tv80_core/add_944/U81  ( .A1(\i_tv80_core/TmpAddr [10]), .A2(
        \i_tv80_core/TmpAddr [11]), .A3(\i_tv80_core/TmpAddr [9]), .ZN(
        \i_tv80_core/add_944/n64 ) );
  NAND3_X1 \i_tv80_core/add_944/U80  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [2]), .A3(\i_tv80_core/TmpAddr [0]), .ZN(
        \i_tv80_core/add_944/n61 ) );
  NAND3_X1 \i_tv80_core/add_944/U79  ( .A1(\i_tv80_core/TmpAddr [4]), .A2(
        \i_tv80_core/TmpAddr [5]), .A3(\i_tv80_core/TmpAddr [3]), .ZN(
        \i_tv80_core/add_944/n62 ) );
  NAND2_X1 \i_tv80_core/add_944/U78  ( .A1(\i_tv80_core/add_944/n59 ), .A2(
        \i_tv80_core/add_944/n60 ), .ZN(\i_tv80_core/add_944/n58 ) );
  XNOR2_X1 \i_tv80_core/add_944/U77  ( .A(\i_tv80_core/add_944/n58 ), .B(
        \i_tv80_core/TmpAddr [12]), .ZN(\i_tv80_core/N259 ) );
  NAND2_X1 \i_tv80_core/add_944/U76  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [0]), .ZN(\i_tv80_core/add_944/n56 ) );
  NAND2_X1 \i_tv80_core/add_944/U75  ( .A1(\i_tv80_core/TmpAddr [3]), .A2(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/add_944/n57 ) );
  NAND4_X1 \i_tv80_core/add_944/U74  ( .A1(\i_tv80_core/add_944/n52 ), .A2(
        \i_tv80_core/add_944/n53 ), .A3(\i_tv80_core/add_944/n54 ), .A4(
        \i_tv80_core/add_944/n55 ), .ZN(\i_tv80_core/add_944/n51 ) );
  XNOR2_X1 \i_tv80_core/add_944/U73  ( .A(\i_tv80_core/add_944/n51 ), .B(
        \i_tv80_core/TmpAddr [13]), .ZN(\i_tv80_core/N260 ) );
  NAND2_X1 \i_tv80_core/add_944/U72  ( .A1(\i_tv80_core/TmpAddr [8]), .A2(
        \i_tv80_core/TmpAddr [7]), .ZN(\i_tv80_core/add_944/n49 ) );
  NAND2_X1 \i_tv80_core/add_944/U71  ( .A1(\i_tv80_core/TmpAddr [10]), .A2(
        \i_tv80_core/TmpAddr [9]), .ZN(\i_tv80_core/add_944/n50 ) );
  NAND2_X1 \i_tv80_core/add_944/U70  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [0]), .ZN(\i_tv80_core/add_944/n47 ) );
  NAND2_X1 \i_tv80_core/add_944/U69  ( .A1(\i_tv80_core/TmpAddr [3]), .A2(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/add_944/n48 ) );
  NAND4_X1 \i_tv80_core/add_944/U68  ( .A1(\i_tv80_core/add_944/n43 ), .A2(
        \i_tv80_core/add_944/n44 ), .A3(\i_tv80_core/add_944/n45 ), .A4(
        \i_tv80_core/add_944/n46 ), .ZN(\i_tv80_core/add_944/n42 ) );
  XNOR2_X1 \i_tv80_core/add_944/U67  ( .A(\i_tv80_core/add_944/n42 ), .B(
        \i_tv80_core/TmpAddr [14]), .ZN(\i_tv80_core/N261 ) );
  NAND2_X1 \i_tv80_core/add_944/U66  ( .A1(\i_tv80_core/TmpAddr [9]), .A2(
        \i_tv80_core/TmpAddr [8]), .ZN(\i_tv80_core/add_944/n40 ) );
  NAND2_X1 \i_tv80_core/add_944/U65  ( .A1(\i_tv80_core/TmpAddr [11]), .A2(
        \i_tv80_core/TmpAddr [10]), .ZN(\i_tv80_core/add_944/n41 ) );
  NAND2_X1 \i_tv80_core/add_944/U64  ( .A1(\i_tv80_core/TmpAddr [5]), .A2(
        \i_tv80_core/TmpAddr [4]), .ZN(\i_tv80_core/add_944/n38 ) );
  NAND2_X1 \i_tv80_core/add_944/U63  ( .A1(\i_tv80_core/TmpAddr [7]), .A2(
        \i_tv80_core/TmpAddr [6]), .ZN(\i_tv80_core/add_944/n39 ) );
  NAND2_X1 \i_tv80_core/add_944/U62  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [0]), .ZN(\i_tv80_core/add_944/n36 ) );
  NAND2_X1 \i_tv80_core/add_944/U61  ( .A1(\i_tv80_core/TmpAddr [3]), .A2(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/add_944/n37 ) );
  NAND4_X1 \i_tv80_core/add_944/U60  ( .A1(\i_tv80_core/add_944/n32 ), .A2(
        \i_tv80_core/add_944/n33 ), .A3(\i_tv80_core/add_944/n34 ), .A4(
        \i_tv80_core/add_944/n35 ), .ZN(\i_tv80_core/add_944/n31 ) );
  XNOR2_X1 \i_tv80_core/add_944/U59  ( .A(\i_tv80_core/add_944/n31 ), .B(
        \i_tv80_core/TmpAddr [15]), .ZN(\i_tv80_core/N262 ) );
  NAND2_X1 \i_tv80_core/add_944/U58  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [0]), .ZN(\i_tv80_core/add_944/n30 ) );
  XNOR2_X1 \i_tv80_core/add_944/U57  ( .A(\i_tv80_core/add_944/n30 ), .B(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/N249 ) );
  NAND3_X1 \i_tv80_core/add_944/U56  ( .A1(\i_tv80_core/TmpAddr [2]), .A2(
        \i_tv80_core/TmpAddr [0]), .A3(\i_tv80_core/TmpAddr [1]), .ZN(
        \i_tv80_core/add_944/n29 ) );
  NAND4_X1 \i_tv80_core/add_944/U55  ( .A1(\i_tv80_core/TmpAddr [3]), .A2(
        \i_tv80_core/TmpAddr [2]), .A3(\i_tv80_core/TmpAddr [1]), .A4(
        \i_tv80_core/TmpAddr [0]), .ZN(\i_tv80_core/add_944/n28 ) );
  XNOR2_X1 \i_tv80_core/add_944/U54  ( .A(\i_tv80_core/add_944/n28 ), .B(
        \i_tv80_core/TmpAddr [4]), .ZN(\i_tv80_core/N251 ) );
  NAND3_X1 \i_tv80_core/add_944/U53  ( .A1(\i_tv80_core/TmpAddr [4]), .A2(
        \i_tv80_core/TmpAddr [3]), .A3(\i_tv80_core/TmpAddr [0]), .ZN(
        \i_tv80_core/add_944/n26 ) );
  NAND2_X1 \i_tv80_core/add_944/U52  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/add_944/n27 ) );
  NAND3_X1 \i_tv80_core/add_944/U51  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [2]), .A3(\i_tv80_core/TmpAddr [0]), .ZN(
        \i_tv80_core/add_944/n22 ) );
  NAND3_X1 \i_tv80_core/add_944/U50  ( .A1(\i_tv80_core/TmpAddr [4]), .A2(
        \i_tv80_core/TmpAddr [5]), .A3(\i_tv80_core/TmpAddr [3]), .ZN(
        \i_tv80_core/add_944/n23 ) );
  NAND2_X1 \i_tv80_core/add_944/U49  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [0]), .ZN(\i_tv80_core/add_944/n18 ) );
  NAND2_X1 \i_tv80_core/add_944/U48  ( .A1(\i_tv80_core/TmpAddr [3]), .A2(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/add_944/n19 ) );
  NAND2_X1 \i_tv80_core/add_944/U47  ( .A1(\i_tv80_core/add_944/n16 ), .A2(
        \i_tv80_core/add_944/n17 ), .ZN(\i_tv80_core/add_944/n15 ) );
  XNOR2_X1 \i_tv80_core/add_944/U46  ( .A(\i_tv80_core/add_944/n15 ), .B(
        \i_tv80_core/TmpAddr [7]), .ZN(\i_tv80_core/N254 ) );
  NAND2_X1 \i_tv80_core/add_944/U45  ( .A1(\i_tv80_core/TmpAddr [5]), .A2(
        \i_tv80_core/TmpAddr [4]), .ZN(\i_tv80_core/add_944/n13 ) );
  NAND2_X1 \i_tv80_core/add_944/U44  ( .A1(\i_tv80_core/TmpAddr [7]), .A2(
        \i_tv80_core/TmpAddr [6]), .ZN(\i_tv80_core/add_944/n14 ) );
  NAND2_X1 \i_tv80_core/add_944/U43  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [0]), .ZN(\i_tv80_core/add_944/n11 ) );
  NAND2_X1 \i_tv80_core/add_944/U42  ( .A1(\i_tv80_core/TmpAddr [3]), .A2(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/add_944/n12 ) );
  NAND2_X1 \i_tv80_core/add_944/U41  ( .A1(\i_tv80_core/add_944/n9 ), .A2(
        \i_tv80_core/add_944/n10 ), .ZN(\i_tv80_core/add_944/n8 ) );
  XNOR2_X1 \i_tv80_core/add_944/U40  ( .A(\i_tv80_core/add_944/n8 ), .B(
        \i_tv80_core/TmpAddr [8]), .ZN(\i_tv80_core/N255 ) );
  NAND2_X1 \i_tv80_core/add_944/U39  ( .A1(\i_tv80_core/TmpAddr [6]), .A2(
        \i_tv80_core/TmpAddr [5]), .ZN(\i_tv80_core/add_944/n6 ) );
  NAND2_X1 \i_tv80_core/add_944/U38  ( .A1(\i_tv80_core/TmpAddr [8]), .A2(
        \i_tv80_core/TmpAddr [7]), .ZN(\i_tv80_core/add_944/n7 ) );
  NAND3_X1 \i_tv80_core/add_944/U37  ( .A1(\i_tv80_core/add_944/n3 ), .A2(
        \i_tv80_core/add_944/n4 ), .A3(\i_tv80_core/add_944/n5 ), .ZN(
        \i_tv80_core/add_944/n2 ) );
  XNOR2_X1 \i_tv80_core/add_944/U36  ( .A(\i_tv80_core/add_944/n2 ), .B(
        \i_tv80_core/TmpAddr [9]), .ZN(\i_tv80_core/N256 ) );
  INV_X1 \i_tv80_core/add_944/U35  ( .A(\i_tv80_core/TmpAddr [6]), .ZN(
        \i_tv80_core/add_944/n20 ) );
  INV_X1 \i_tv80_core/add_944/U34  ( .A(\i_tv80_core/TmpAddr [5]), .ZN(
        \i_tv80_core/add_944/n24 ) );
  AND3_X1 \i_tv80_core/add_944/U33  ( .A1(\i_tv80_core/TmpAddr [5]), .A2(
        \i_tv80_core/TmpAddr [6]), .A3(\i_tv80_core/TmpAddr [4]), .ZN(
        \i_tv80_core/add_944/n54 ) );
  NOR2_X1 \i_tv80_core/add_944/U32  ( .A1(\i_tv80_core/add_944/n49 ), .A2(
        \i_tv80_core/add_944/n50 ), .ZN(\i_tv80_core/add_944/n44 ) );
  NOR2_X1 \i_tv80_core/add_944/U31  ( .A1(\i_tv80_core/add_944/n26 ), .A2(
        \i_tv80_core/add_944/n27 ), .ZN(\i_tv80_core/add_944/n25 ) );
  NOR2_X1 \i_tv80_core/add_944/U30  ( .A1(\i_tv80_core/add_944/n22 ), .A2(
        \i_tv80_core/add_944/n23 ), .ZN(\i_tv80_core/add_944/n21 ) );
  NOR2_X1 \i_tv80_core/add_944/U29  ( .A1(\i_tv80_core/add_944/n38 ), .A2(
        \i_tv80_core/add_944/n39 ), .ZN(\i_tv80_core/add_944/n34 ) );
  AND3_X1 \i_tv80_core/add_944/U28  ( .A1(\i_tv80_core/TmpAddr [4]), .A2(
        \i_tv80_core/TmpAddr [3]), .A3(\i_tv80_core/TmpAddr [0]), .ZN(
        \i_tv80_core/add_944/n5 ) );
  AND2_X1 \i_tv80_core/add_944/U27  ( .A1(\i_tv80_core/TmpAddr [1]), .A2(
        \i_tv80_core/TmpAddr [2]), .ZN(\i_tv80_core/add_944/n3 ) );
  NOR2_X1 \i_tv80_core/add_944/U26  ( .A1(\i_tv80_core/add_944/n6 ), .A2(
        \i_tv80_core/add_944/n7 ), .ZN(\i_tv80_core/add_944/n4 ) );
  NOR2_X1 \i_tv80_core/add_944/U25  ( .A1(\i_tv80_core/add_944/n11 ), .A2(
        \i_tv80_core/add_944/n12 ), .ZN(\i_tv80_core/add_944/n10 ) );
  NOR2_X1 \i_tv80_core/add_944/U24  ( .A1(\i_tv80_core/add_944/n13 ), .A2(
        \i_tv80_core/add_944/n14 ), .ZN(\i_tv80_core/add_944/n9 ) );
  NOR2_X1 \i_tv80_core/add_944/U23  ( .A1(\i_tv80_core/add_944/n75 ), .A2(
        \i_tv80_core/add_944/n76 ), .ZN(\i_tv80_core/add_944/n74 ) );
  NOR2_X1 \i_tv80_core/add_944/U22  ( .A1(\i_tv80_core/add_944/n77 ), .A2(
        \i_tv80_core/add_944/n78 ), .ZN(\i_tv80_core/add_944/n73 ) );
  NOR2_X1 \i_tv80_core/add_944/U21  ( .A1(\i_tv80_core/add_944/n61 ), .A2(
        \i_tv80_core/add_944/n62 ), .ZN(\i_tv80_core/add_944/n60 ) );
  NOR2_X1 \i_tv80_core/add_944/U20  ( .A1(\i_tv80_core/add_944/n63 ), .A2(
        \i_tv80_core/add_944/n64 ), .ZN(\i_tv80_core/add_944/n59 ) );
  NOR2_X1 \i_tv80_core/add_944/U19  ( .A1(\i_tv80_core/add_944/n68 ), .A2(
        \i_tv80_core/add_944/n69 ), .ZN(\i_tv80_core/add_944/n67 ) );
  NOR2_X1 \i_tv80_core/add_944/U18  ( .A1(\i_tv80_core/add_944/n70 ), .A2(
        \i_tv80_core/add_944/n71 ), .ZN(\i_tv80_core/add_944/n66 ) );
  INV_X1 \i_tv80_core/add_944/U17  ( .A(\i_tv80_core/TmpAddr [0]), .ZN(
        \i_tv80_core/N247 ) );
  NOR2_X1 \i_tv80_core/add_944/U16  ( .A1(\i_tv80_core/add_944/n36 ), .A2(
        \i_tv80_core/add_944/n37 ), .ZN(\i_tv80_core/add_944/n35 ) );
  NOR2_X1 \i_tv80_core/add_944/U15  ( .A1(\i_tv80_core/add_944/n47 ), .A2(
        \i_tv80_core/add_944/n48 ), .ZN(\i_tv80_core/add_944/n46 ) );
  NOR2_X1 \i_tv80_core/add_944/U14  ( .A1(\i_tv80_core/add_944/n40 ), .A2(
        \i_tv80_core/add_944/n41 ), .ZN(\i_tv80_core/add_944/n33 ) );
  AND3_X1 \i_tv80_core/add_944/U13  ( .A1(\i_tv80_core/TmpAddr [13]), .A2(
        \i_tv80_core/TmpAddr [14]), .A3(\i_tv80_core/TmpAddr [12]), .ZN(
        \i_tv80_core/add_944/n32 ) );
  AND3_X1 \i_tv80_core/add_944/U12  ( .A1(\i_tv80_core/TmpAddr [5]), .A2(
        \i_tv80_core/TmpAddr [6]), .A3(\i_tv80_core/TmpAddr [4]), .ZN(
        \i_tv80_core/add_944/n45 ) );
  AND3_X1 \i_tv80_core/add_944/U11  ( .A1(\i_tv80_core/TmpAddr [12]), .A2(
        \i_tv80_core/TmpAddr [13]), .A3(\i_tv80_core/TmpAddr [11]), .ZN(
        \i_tv80_core/add_944/n43 ) );
  NOR2_X1 \i_tv80_core/add_944/U10  ( .A1(\i_tv80_core/add_944/n56 ), .A2(
        \i_tv80_core/add_944/n57 ), .ZN(\i_tv80_core/add_944/n55 ) );
  AND3_X1 \i_tv80_core/add_944/U9  ( .A1(\i_tv80_core/TmpAddr [8]), .A2(
        \i_tv80_core/TmpAddr [9]), .A3(\i_tv80_core/TmpAddr [7]), .ZN(
        \i_tv80_core/add_944/n53 ) );
  AND3_X1 \i_tv80_core/add_944/U8  ( .A1(\i_tv80_core/TmpAddr [11]), .A2(
        \i_tv80_core/TmpAddr [12]), .A3(\i_tv80_core/TmpAddr [10]), .ZN(
        \i_tv80_core/add_944/n52 ) );
  XNOR2_X1 \i_tv80_core/add_944/U7  ( .A(\i_tv80_core/add_944/n29 ), .B(
        \i_tv80_core/TmpAddr [3]), .ZN(\i_tv80_core/N250 ) );
  NOR2_X1 \i_tv80_core/add_944/U6  ( .A1(\i_tv80_core/add_944/n18 ), .A2(
        \i_tv80_core/add_944/n19 ), .ZN(\i_tv80_core/add_944/n17 ) );
  AND3_X1 \i_tv80_core/add_944/U5  ( .A1(\i_tv80_core/TmpAddr [5]), .A2(
        \i_tv80_core/TmpAddr [6]), .A3(\i_tv80_core/TmpAddr [4]), .ZN(
        \i_tv80_core/add_944/n16 ) );
  XNOR2_X1 \i_tv80_core/add_944/U4  ( .A(\i_tv80_core/add_944/n20 ), .B(
        \i_tv80_core/add_944/n21 ), .ZN(\i_tv80_core/N253 ) );
  XNOR2_X1 \i_tv80_core/add_944/U3  ( .A(\i_tv80_core/add_944/n24 ), .B(
        \i_tv80_core/add_944/n25 ), .ZN(\i_tv80_core/N252 ) );
  XOR2_X1 \i_tv80_core/add_944/U2  ( .A(\i_tv80_core/TmpAddr [1]), .B(
        \i_tv80_core/TmpAddr [0]), .Z(\i_tv80_core/N248 ) );
endmodule


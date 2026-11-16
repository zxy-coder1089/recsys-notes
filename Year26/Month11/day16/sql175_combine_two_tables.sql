-- =============================================================
-- LeetCode 175. 组合两个表 (Easy)
-- https://leetcode.cn/problems/combine-two-tables/
-- =============================================================
-- 表 Person (PersonId, FirstName, LastName)
-- 表 Address (AddressId, PersonId, City, State)
--
-- 题意
--   输出每个人的 FirstName、LastName、City、State。
--   Address 里没有这个人的记录时，City / State 返回 NULL。
--
-- 思路
--   要求"没有地址的人也要出现" —— 这是 LEFT JOIN 的典型信号。
--   写成 INNER JOIN 会把这些人在结果里直接丢掉，是最常见的错误。
--
-- 四种 JOIN 的语义（条件写在 ON 后面）
--   A INNER JOIN B   取交集，两边都有才保留
--   A LEFT  JOIN B   取 A 全部，B 缺失的列补 NULL
--   A RIGHT JOIN B   取 B 全部，A 缺失的列补 NULL
--   A FULL  JOIN B   取并集（MySQL 不支持，要用 UNION 模拟）
--
-- 提示
--   题目只要求"姓、名、城市、州"四个字段，没要求 PersonId，
--   所以 SELECT 里不要多带列，否则结果对不上预期的列数。
-- =============================================================

SELECT
    Person.FirstName,
    Person.LastName,
    Address.City,
    Address.State
FROM Person
LEFT JOIN Address
    ON Person.PersonId = Address.PersonId;

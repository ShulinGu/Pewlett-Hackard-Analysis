--Deliverable 1. Step 1 - 7
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Deliverable 1. Step 8 - 14
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

--Deliverable 1. Step 14 - 20
SELECT COUNT(ut.title) AS "count", ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY "count" DESC

--Deliverable 2.
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_employees as de
ON e.emp_no = de.emp_no
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;



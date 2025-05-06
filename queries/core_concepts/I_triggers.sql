

-- ### Types of Triggers

-- 1. **DML Triggers**
--    - AFTER triggers (fired after the event)
--    - INSTEAD OF triggers (replace the event)
--    - Events: INSERT, UPDATE, DELETE

-- 2. **DDL Triggers**
--    - Database level
--    - Server level
--    - Events: CREATE, ALTER, DROP

-- ### Best Practices

-- 1. **Performance**
--    - Keep triggers lightweight
--    - Avoid recursion
--    - Use SET NOCOUNT ON
--    - Minimize transactions

-- 2. **Error Handling**
--    - Include TRY-CATCH blocks
--    - Log errors appropriately
--    - Handle rollbacks carefully

-- 3. **Maintainability**
--    - Document purpose clearly
--    - Use meaningful names
--    - Keep logic simple
--    - Test thoroughly

-- ### Common Use Cases
-- - Audit logging
-- - Data validation
-- - Business rules enforcement
-- - Maintaining data integrity
-- - Automatic updates

-- To execute in VS Code's integrated terminal:
-- ```bash
-- sqlcmd -S localhost -U sa -P YourPassword -d fttg_db -i "/Users/fttg/fttg_workspace/db/queries/core_concepts/I_triggers.sql"
-- ```
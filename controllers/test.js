module.exports = (app, sql_builder) => {
    sql_builder(app, 'test', ['subtest']);
}
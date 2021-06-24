{% macro to_my(column_name) %}
    CONVERT_TZ({{column_name}},'+00:00','+08:00')
{% endmacro %}
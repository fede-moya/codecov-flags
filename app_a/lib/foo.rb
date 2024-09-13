# frozen_string_literal: true
class Foo
  def issue_one(qqq, status_category_key)
    qqq.arel_table.project(epic_issues_tbl[:id].count(:distinct)).
      from(epic_issues_tbl).
      where(epic_issues_tbl[:epic_id].eq(qqq[:id]).and(
        epic_issues_tbl[:status_category_key].eq(status_category_key),
      ))
  end

  def issue_two(qqq)
    qqq[:status_category_key].in(["indeterminate", "new"])
  end

  def issue_three(qqq)
    coalesce_zero(Arel::Nodes::Extract.new(
      Arel::Nodes::Subtraction.new(
        Arel::Nodes::NamedFunction.new("now", []),
        qqq[:started_at],
      ),
      :day,
    ))
  end

  def issue_four(
  first_param,
  second_param)
    puts "#{first_param}#{second_param}"
  end
end

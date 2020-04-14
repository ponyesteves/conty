defmodule Conty.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add(:date, :date)
      add(:due_base_date, :date)

      add(:amount, :decimal)
      add(:type, :string)
      add(:terms_generator, :string)

      add(:entry_id, references(:entries, on_delete: :delete_all))
      add(:account_due_id, references(:accounts))
      add(:account_pay_id, references(:accounts))

      add(:company_id, references(:companies))
      # add(:organization_id, references(:organizations))
    end

    create(index(:transactions, [:entry_id]))
  end
end
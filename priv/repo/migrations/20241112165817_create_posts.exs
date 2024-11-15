defmodule LiveVueSsrIssue.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :text
      add :author, :text

      timestamps(type: :utc_datetime)
    end
  end
end

defmodule LiveVueSsrIssue.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveVueSsrIssue.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        author: "some author",
        content: "some content"
      })
      |> LiveVueSsrIssue.Blog.create_post()

    post
  end
end

defmodule JBBWeb.PageLive do
  use JBBWeb, :live_view

  alias JBB.Posts
  alias JBB.Posts.Post

  @start_date "2021-02-15"

  @impl true
  def mount(_params, _session, socket) do
    {days, hours, minutes, seconds} = get_time_comps()
    Process.send_after(self(), :recalculate, 1000)

    {:ok,
     assign(socket,
       days: days,
       hours: hours,
       minutes: minutes,
       seconds: seconds,
       posts: list_posts()
     )}
  end

  @impl true
  def handle_info(:recalculate, socket) do
    {days, hours, minutes, seconds} = get_time_comps()
    Process.send_after(self(), :recalculate, 1000)
    {:noreply, assign(socket, days: days, hours: hours, minutes: minutes, seconds: seconds)}
  end

  @impl true
  def handle_params(params, url, socket) do
    {:noreply,
     socket
     |> assign(:page_title, "New Post")
     |> assign(:post, %Post{})}
  end

  defp get_time_comps() do
    {:ok, date} = Timex.parse(@start_date, "{YYYY}-{0M}-{D}")
    tot_seconds = Timex.diff(Timex.now(), date, :seconds)
    {days, remain} = {div(tot_seconds, 60 * 60 * 24), rem(tot_seconds, 60 * 60 * 24)}
    {hours, remain} = {div(remain, 60 * 60), rem(remain, 60 * 60)}
    {minutes, remain} = {div(remain, 60), rem(remain, 60)}
    seconds = remain
    {days, hours, minutes, seconds}
  end

  defp list_posts do
    Posts.list_posts()
  end
end

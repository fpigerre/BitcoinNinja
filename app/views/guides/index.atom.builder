atom_feed do |feed|
  feed.title('Exceptiontrap Blog')
  feed.updated(@guides[0].created_at) if @guides.length > 0

  @guides.each do |guide|
    feed.entry(guide, url: guide_url(guide)) do |entry|
      entry.title(guide.title)
      entry.content(markdown(guide.content), type: 'html')
      entry.author do |author|
        author.name(guide.author)
      end
    end
  end
end
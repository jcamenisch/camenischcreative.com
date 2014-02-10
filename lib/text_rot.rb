module TextRot
  def text_rot_map
    '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'
  end

  def jsstring(text)
    %('#{text.gsub /(['\\])/,'\\\\\1' }')
  end

  def rot_text(text)
    %(<div class="rottext" data-text="#{rot(text)}"></div> #{text_rot_script})
  end

  def email_link(address, text = nil)
    rot_text "<a href='mailto:#{address}'>#{text || address}</a>"
  end

  private

    def text_rot_script
      return '' if @_script_inserted

      @_script_inserted = true

      <<-RET
<script>(function(d){
  var s = d.createElement('script'); s.async = true; s.src = '/javascripts/text_rot.js'
  var ls = d.getElementsByTagName('script')[0];
  ls.parentNode.insertBefore(s, ls);
})(document)</script>
      RET
    end

    def map_length
      @map_length ||= text_rot_map.length
    end

    def rot_char(char)
      if (i = text_rot_map.index(char))
        text_rot_map[(i + map_length / 2) % map_length]
      else
        char
      end
    end

    def rot(string)
      ''.tap do |out|
        string.each_char do |char|
          out <<rot_char(char)
        end
      end
    end

end

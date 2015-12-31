require 'open-uri'
require 'nokogiri'
require 'json'
require_relative  './API/user.rb'

module CForces  

  class Problem

    attr :preTestInputs, :preTestOutputs, :title, :contest_id, :problem_index

    def loadURL(cid, pindex)
      ['http://codeforces.com/contest/', '/problem/'].join(cid.to_s) + pindex.to_s
    end

    def initialize(cID, pindex)
      @contest_id = cID.to_s
      @problem_index = pindex

      @url = loadURL(cID, pindex) 
      doc = Nokogiri::HTML(open(@url))
  
      @preTestInputs = Array.new
      @preTestOutputs  = Array.new

      doc.css('div.sample-test  div.input').each do |e|
        @preTestInputs << e.css('br').map{|item| item.previous.text}
      end

      doc.css('div.sample-test div.output').each do |e| 
        @preTestOutputs << e.css('br').map{|item| item.previous.text}
      end 

      @title = doc.css('div.title')[0].text.delete('.').split.join '_'
    end 
  end


end

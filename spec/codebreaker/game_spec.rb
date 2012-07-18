require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game) { Game.new(output) }

    describe "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end

      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end

    describe "#guess" do
      context "with no mathes" do
        it "sends a mark with ''" do
          game.start('1234')
          output.should_receive(:puts).with('')
          game.guess('55555')
        end
      end

      context "with 1 number match" do
        it "sends a mark with '-'" do
          game.start('1234')
          output.should_receive(:puts).with('-')
          game.guess('2555')
        end
      end

      context "with 1 number match and 1 exact match(in that order)" do
        it "sends a match with '+-'" do
          game.start('1234')
          output.should_receive(:puts).with('+-')
          game.guess('3255')
        end
      end

      context "with 2 exact mathes" do
        it "sends a mark with '+'" do
          game.start('1234')
          output.should_receive(:puts).with('+')
          game.guess('1555')
        end
      end

      context "with 2 number mathes" do
        it "sends a mark with '--'" do
          game.start('1234')
          output.should_receive(:puts).with('--')
          game.guess('2355')
        end
      end
    end

    it "sends the mark to output" do
      game.start('1234')
      output.should_receive(:puts).with('++++')
      game.guess('1234')
    end
  end
end

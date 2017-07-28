require "rspec"
require "ruby_kickstart"

describe "staircase" do
  it "meets the problem requirements" do
    expect(staircase 1).to eq({1 => []})
    expect(staircase 2).to eq({1 => []})
    expect(staircase 3).to eq({1 => [], 3 => [2]})
    expect(staircase 4).to eq({1 => [], 3 => [2]})
    expect(staircase 5).to eq({1 => [], 3 => [2], 5 =>[2, 4]})
  end
end

describe "reverse_map" do
  it "meets the problem requirements" do
    expect(reverse_map(1, 2, 3) { |i| i * 2 }).to eq [6, 4, 2]
  end
end

describe "array_init" do
  it "meets the problem requirements" do
    expect(array_init(2) { |i| i.to_s }).to eq ['0', '1']
    expect(array_init { |i| i.to_s }).to eq ['0', '1', '2', '3', '4']
    expect(array_init 2).to eq ['0', '100']
    expect(array_init).to eq ['0', '100', '200', '300', '400']
    expect(array_init { 'hi' }).to eq ['hi', 'hi', 'hi', 'hi', 'hi']
    expect(array_init(10) { |i| i % 2 == 0 ? i*200 : i*-5 }).to eq [0, -5, 400, -15, 800, -25, 1200, -35, 1600, -45]
  end
end

describe "middle" do
  it "meets the problem requirements" do
    head = {:data => 1, :next => nil}
    expect(middle(head)).to eq 1
    head = {:data => 2, :next => head}
    expect(middle(head)).to eq 1
    head = {:data => 3, :next => head}
    expect(middle(head)).to eq 2
    head = {:data => 4, :next => head}
    expect(middle(head)).to eq 2
    head = {:data => 5, :next => head}
    expect(middle(head)).to eq 3
    head = {:data => 6, :next => head}
    expect(middle(head)).to eq 3
  end
end

describe "print_list" do
  it "meets the problem requirements" do
    head = {:data => 1, :next => nil}
    expect { print_list head }.to output("1\n").to_stdout
    head = {:data => 2, :next => head}
    expect { print_list head }.to output("2\n1\n").to_stdout
    head = {:data => 3, :next => head}
    expect { print_list head }.to output("3\n2\n1\n").to_stdout
    head = {:data => 4, :next => head}
    expect { print_list head }.to output("4\n3\n2\n1\n").to_stdout
    head = {:data => 5, :next => head}
    expect { print_list head }.to output("5\n4\n3\n2\n1\n").to_stdout
    head = {:data => 6, :next => head}
    expect { print_list head }.to output("6\n5\n4\n3\n2\n1\n").to_stdout
  end
end

describe "print_list_in_reverse" do
  it "meets the problem requirements" do
    head = {:data => 1, :next => nil}
    head = {:data => 2, :next => head}
    expect { print_list_in_reverse head }.to output("1\n2\n").to_stdout
  end
end

describe "word_count" do
  it "meets the problem requirements" do
    expect(word_count "The dog and the cat").to eq({"the" => 2, "dog" => 1, "and" => 1, "cat" => 1})
  end
end

describe "first_pos" do
  it "meets the problem requirements" do
    expect(first_pos "The dog and the cat and the cow").to eq({"The" => 0, "dog" => 1, "and" => 2, "the" => 3, "cat" => 4, "cow" => 7})
  end
end

describe "spiral_access" do
  it "meets the problem requirements" do
    two_d = [
      [ 1,  2,  3,  4, 5],
      [16, 17, 18, 19, 6],
      [15, 24, 25, 20, 7],
      [14, 23, 22, 21, 8],
      [13, 12, 11, 10, 9],
    ]
    order = []
    spiral_access two_d do |i|
      order << i
    end
    expect(
      order
    ).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
  end
end

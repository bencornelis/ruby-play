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

describe "String#every_other_char" do
  it "meets the problem requirements" do
    expect("abcdefg".every_other_char).to eq "aceg"
    expect("".every_other_char).to eq ""
  end
end

describe "get_squares" do
  it "meets the problem requirements" do
    expect(get_squares([9])).to eq []
    expect(get_squares([9,3])).to eq [3]
    expect(get_squares([9,3,81])).to eq [3,9]
    expect(get_squares([25, 4, 9, 6, 50, 16, 5])).to eq [4,5]
  end
end

describe "mod_three" do
  it "meets the problem requirements" do
    expect(mod_three([0])).to eq []
    expect(mod_three([1])).to eq [1]
    expect(mod_three([2])).to eq [2]
    expect(mod_three([3])).to eq []
    expect(mod_three([4])).to eq [1]
    expect(mod_three([5])).to eq [2]
    expect(mod_three([6])).to eq []
    expect(mod_three([7])).to eq [1]
    expect(mod_three([0,1,2,3,4,5,6,7])).to eq [1, 2, 1, 2, 1]
  end
end

describe "got_three?" do
  it "meets the problem requirements" do
    expect(got_three?([1, 2, 2, 2, 3])).to eq true
    expect(got_three?(['a', 'a', 'b'])).to eq false
    expect(got_three?(['a', 'a', 'a'])).to eq true
    expect(got_three?([1, 2, 1, 1])).to eq false
  end
end

describe "pathify" do
  it "meets the problem requirements" do
    expect(pathify('usr' => { 'bin' => ['ruby'] })).to eq ['/usr/bin/ruby']
    expect(pathify('usr' => {'bin' => ['ruby', 'perl'] })).to eq ['/usr/bin/ruby', '/usr/bin/perl']
    expect(pathify('usr' => {'bin' => ['ruby'], 'include' => ['zlib.h'] })).to eq ['/usr/bin/ruby', '/usr/include/zlib.h']
    expect(pathify('usr' => {'bin' => ['ruby']}, 'opt' => {'local' => {'bin' => ['sqlite3', 'rsync']} })).to eq ['/usr/bin/ruby', 'opt/local/bin/sqlite3', 'opt/local/bin/rsync']
  end
end

describe "match_maker" do
  it "meets the problem requirements" do
    expect(match_maker(false, true,  true)).to eq               [true]
    expect(match_maker(false, false,  false)).to eq             [true]
    expect(match_maker(false, true,  false)).to eq              [false]
    expect(match_maker(true,  true,  true)).to eq               [false]
    expect(match_maker(true,  false, false)).to eq              [false]
    expect(match_maker(true,  false, true)).to eq               [true]
    expect(match_maker(true,  true,  false)).to eq              [true]
    expect(match_maker(true,  true,  true, false, true)).to eq  [false, true]
    expect(match_maker(true,  true,  true, false, nil)).to eq   [false, false]
    expect(match_maker(true,  true,  true, true, nil)).to eq    [false, true]
    expect(match_maker(true,  true,  true, 0, nil)).to eq       [false, true]
  end
end

describe "match_maker" do
  it "meets the problem requirements" do
    expect(shared([1,2,3], [1,2,4])).to eq            [{1=>[true, true], 2=>[true, true], 3=>[true, nil], 4=>[nil, true]}, [1, 2]]
    expect(shared(%w(a b c d), %w(aa b cc d))).to eq  [{"a"=>[true, nil], "b"=>[true, true], "c"=>[true, nil], "d"=>[true, true], "aa"=>[nil, true], "cc"=>[nil, true]}, ["b", "d"]]
    expect(shared([], [1,2])).to eq                   [{1=>[nil, true], 2=>[nil, true]}, []]
    expect(shared([1,2], [])).to eq                   [{1=>[true, nil], 2=>[true, nil]}, []]
    expect(shared([], [])).to eq                      [{}, []]
    expect(shared([1,2,:c], ['a','b',:c])).to eq      [{1=>[true, nil], 2=>[true, nil], :c=>[true, true], "a"=>[nil, true], "b"=>[nil, true]}, [:c]]
    expect(shared([1,2,3], [3,2,1])).to eq            [{1=>[true, true], 2=>[true, true], 3=>[true, true]}, [1, 2, 3]]
  end
end

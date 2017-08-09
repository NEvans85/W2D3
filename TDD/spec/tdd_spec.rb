require 'rspec'
require 'tdd'

describe '#my_uniq' do
  subject(:array) { [1, 2, 1, 3, 3] }

  it "returns only unique elements" do
    return_arr = my_uniq(array)
    return_arr.each do |el|
      expect(return_arr.count(el)).to eq(1)
    end
  end
  it "returns elements in the order they appeared" do
    expect(my_uniq(array)).to eq([1, 2, 3])
  end
  it "returns an empty array if passed an empty array" do
    array = []
    expect(my_uniq(array)).to eq([])
  end
end


describe '#two_sum' do
  subject(:array) { [-1, 0, 2, -2, 1] }

  it "returns all pairs of indices which sum to zero" do
    expect(two_sum(array)).to eq([[0, 4], [2, 3]])
  end

  it 'sorts results first by first element and then second element' do
    result = two_sum(array)
    expect(result).to eq(result.sort)
  end
end

describe '#my_transpose' do
  subject(:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

  it "returns each element of the original array" do
    expect(my_transpose(matrix).flatten.sort).to eq(matrix.flatten.sort)
  end

  it "length of the returned matrix is equal to the original"do
    expect(my_transpose(matrix).length).to eq(matrix.length)
  end

  it "length of the rows of the returned matrix is equal
      to the length of the columns of the original" do
    expect(my_transpose(matrix).first.length).to eq(matrix.first.length)
  end

  it "correctly transposes a matrix" do
    expect(my_transpose(matrix)).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8] ])
  end

end

describe '#stock_picker' do
  let(:ascending) { [0, 1, 2, 3, 4, 5] }
  let(:descending) { [5, 4, 3, 2, 1, 0] }
  let(:mixed) { [2, 5, 3, 1, 4] }

  it "returns an array of two integers" do
    expect(stock_picker(mixed).length).to eq(2)
    expect(stock_picker(mixed).all? { |el| el.is_a?(Integer) }).to be true
  end

  it "returns the indices of the greatest increase in price" do
    expect(stock_picker(ascending)).to eq([0, 5])
  end
  it "returns an empty array if no solution exists" do
    expect(stock_picker(descending)).to eq([])
  end

  it "does not return a value where the first index is greater than the second" do
    expect(stock_picker(mixed)).to eq([0, 1])
  end

end

# descriptive raise
# normale: raise 1 == TypeError: exception class/object expected
# now: raise 1 == RuntimeError: 1
class Object
  def raise_with_helpfulness(*args)
    raise_without_helpfulness(*args)
  rescue TypeError => e
    raise_without_helpfulness args.first.inspect if ['exception class/object expected', 'exception object expected'].include?(e.to_s)
    raise e.message
  end
  alias_method_chain :raise, :helpfulness
end
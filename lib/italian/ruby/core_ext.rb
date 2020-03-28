# frozen_string_literal: true

original_verbosity = $VERBOSE
$VERBOSE = nil

require_relative "core_ext/main"
require_relative "core_ext/class"
require_relative "core_ext/file"
require_relative "core_ext/kernel"
require_relative "core_ext/nil_class"
require_relative "core_ext/object"
require_relative "core_ext/array"
require_relative "core_ext/hash"
require_relative "core_ext/string"

$VERBOSE = original_verbosity
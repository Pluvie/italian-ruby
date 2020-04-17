# frozen_string_literal: true

original_verbosity = $VERBOSE
$VERBOSE = nil

require_relative "core_ext/main"
require_relative "core_ext/class"
require_relative "core_ext/module"
require_relative "core_ext/file"
require_relative "core_ext/kernel"
require_relative "core_ext/proc"
require_relative "core_ext/errors"
require_relative "core_ext/nil_class"
require_relative "core_ext/json"
require_relative "core_ext/object"
require_relative "core_ext/array"
require_relative "core_ext/hash"
require_relative "core_ext/string"
require_relative "core_ext/symbol"
require_relative "core_ext/numeric"
require_relative "core_ext/integer"
require_relative "core_ext/float"
require_relative "core_ext/enumerator"
require_relative "core_ext/time"
require_relative "core_ext/date"

$VERBOSE = original_verbosity
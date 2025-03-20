// Code generated by "stringer -type Action"; DO NOT EDIT.

package plans

import "strconv"

func _() {
	// An "invalid array index" compiler error signifies that the constant values have changed.
	// Re-run the stringer command to generate them again.
	var x [1]struct{}
	_ = x[NoOp-0]
	_ = x[Create-43]
	_ = x[Read-8592]
	_ = x[Update-126]
	_ = x[DeleteThenCreate-8723]
	_ = x[CreateThenDelete-177]
	_ = x[Delete-45]
	_ = x[Forget-46]
}

const (
	_Action_name_0 = "NoOp"
	_Action_name_1 = "Create"
	_Action_name_2 = "DeleteForget"
	_Action_name_3 = "Update"
	_Action_name_4 = "CreateThenDelete"
	_Action_name_5 = "Read"
	_Action_name_6 = "DeleteThenCreate"
)

var (
	_Action_index_2 = [...]uint8{0, 6, 12}
)

func (i Action) String() string {
	switch {
	case i == 0:
		return _Action_name_0
	case i == 43:
		return _Action_name_1
	case 45 <= i && i <= 46:
		i -= 45
		return _Action_name_2[_Action_index_2[i]:_Action_index_2[i+1]]
	case i == 126:
		return _Action_name_3
	case i == 177:
		return _Action_name_4
	case i == 8592:
		return _Action_name_5
	case i == 8723:
		return _Action_name_6
	default:
		return "Action(" + strconv.FormatInt(int64(i), 10) + ")"
	}
}

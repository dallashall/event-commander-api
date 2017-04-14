editorState = {
  session: {
    auth_token: "auth string",
    user: {
      username: "Users Name",
      email:    "user@user.user"
    }
  },
  events: {
    1: {
      id:         1,
      title:      "My First Event",
      event_date: ""
    },
    2: {
      id:         2,
      title:      "My Second Event",
      event_date: ""
    }
  },
  teams: {
    1: {
      id:       1,
      event_id: 1,
      name:     "First Team"
    }
  },
  team_members: {
    1: {
      id:       1,
      team_id:  1,
      name:     "Jane Doe",
      email:    "jane@jane.jane"
    }
  },
  tasks: {
    1: {
      id:       1,
      name:     "First Task",
      event_id: 1,
      order:    1
    }
  },
  details: {
    1: {
      id:       1,
      task_id:  1,
      team_id:  1
    }
  }
}
class Profile {
  final User user;
  final String? cpf;
  final DateTime? dt_nascimento;
  final String? endereco;
  final int? n_coletas;
  final String? perfil;
  final String telefone;
  final List<String> user_types;

  Profile({
    required this.user,
    this.cpf,
    this.dt_nascimento,
    this.endereco,
    this.n_coletas,
    this.perfil,
    required this.telefone,
    required this.user_types,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      user: User.fromMap(
          map['user']), // Supondo que haja um construtor fromMap em User
      cpf: map['cpf'],
      dt_nascimento: DateTime.parse(map['dt_nascimento']),
      endereco: map['endereco'],
      n_coletas: map['n_coletas'],
      perfil: map['perfil'],
      telefone: map['telefone'],
      user_types: List<String>.from(map['user_types']),
    );
  }
}

class User {
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String password;

  User({
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      email: map['email'],
      password: map['password'],
    );
  }
}
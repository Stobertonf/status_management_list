class TaskModel {
  String descricao = "";
  bool concluido = false;
  DateTime dataCriacao = DateTime.now();
  DateTime dataAlteracao = DateTime.now();
  String userId = "";

  TaskModel({
    required this.descricao,
    required this.concluido,
    required this.userId,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    concluido = json['concluido'];
    dataCriacao = DateTime.parse(json['data_criacao']);
    dataAlteracao = DateTime.parse(json['data_alteracao']);
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    data['data_criacao'] = dataCriacao.toIso8601String();
    data['data_alteracao'] = dataAlteracao.toIso8601String();
    data['user_id'] = userId;
    return data;
  }
}

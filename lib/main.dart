// Importações necessárias
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

// Constantes para a URL e chave de acesso do Supabase
const supabaseUrl = 'https://pouexwwhwxnuzoxvnejb.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBvdWV4d3dod3hudXpveHZuZWpiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxNjgyMzEsImV4cCI6MjAzMDc0NDIzMX0.X6VmW9b-dtkKHAugIpN9U_yFaB4evhOaZ0cMVVsMlgs';

// Função principal do aplicativo
Future<void> main() async {
  // Inicializa a conexão com o Supabase
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  // Inicializa o aplicativo Flutter
  runApp(MyApp());
}

// Classe do aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define o tema do aplicativo
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circuit Coffee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define AddPedidoScreen como tela inicial
      home: AddPedidoScreen(),
    );
  }
}

// Classe da tela de adicionar pedido
class AddPedidoScreen extends StatefulWidget {
  @override
  _AddPedidoScreenState createState() => _AddPedidoScreenState();
}

// Classe do estado da tela de adicionar pedido
class _AddPedidoScreenState extends State<AddPedidoScreen> {
  // Controladores para os campos de texto
  TextEditingController _clienteController = TextEditingController();
  TextEditingController _valorController = TextEditingController();
  TextEditingController _obsPedController = TextEditingController();

  // Variáveis para armazenar os valores selecionados nos dropdowns
  String _bebida = 'Frappucino';
  String _acompanhamento = 'Salgado';

  @override
  void dispose() {
    // Dispose dos controladores para liberar recursos
    _clienteController.dispose();
    _valorController.dispose();
    _obsPedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Estrutura da tela com duas colunas
    return Scaffold(
      body: Row(
        children: [
          // Coluna da esquerda com imagem
          Expanded(
            child: Container(
              color: Colors.purple[800],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/2.png'), // Exibe uma imagem
                ],
              ),
            ),
          ),
          // Coluna da direita com formulário
          Expanded(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Campo de texto para o nome do cliente
                    TextField(
                      controller: _clienteController,
                      decoration: InputDecoration(
                        labelText: 'Nome do Cliente',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    // Dropdown para selecionar bebida
                    DropdownButtonFormField<String>(
                      value: _bebida,
                      decoration: InputDecoration(
                        labelText: 'Bebida',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      dropdownColor: Colors.black,
                      items: [
                        'Frappucino',
                        'Cappucino',
                        'Café',
                        'Mocha',
                      ]
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() => _bebida = value!),
                    ),
                    // Dropdown para selecionar acompanhamento
                    DropdownButtonFormField<String>(
                      value: _acompanhamento,
                      decoration: InputDecoration(
                        labelText: 'Acompanhamento',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      dropdownColor: Colors.black,
                      items: [
                        'Salgado',
                        'Pizza',
                        'Biscoito',
                        'Pão de Queijo',
                      ]
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _acompanhamento = value!),
                    ),
                    // Campo de texto para o valor do pedido
                    TextField(
                      controller: _valorController,
                      decoration: InputDecoration(
                        labelText: 'Valor',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                    ),
                    // Campo de texto para observações
                    TextField(
                      controller: _obsPedController,
                      decoration: InputDecoration(
                        labelText: 'Observação',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    // Dropdown para status do pedido
                    DropdownButtonFormField<String>(
                      value: 'Aguardando',
                      decoration: InputDecoration(
                        labelText: 'Status Pedido',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      items: [
                        'Aguardando',
                        'Pago',
                        'Cancelado',
                      ]
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) => print(value),
                    ),
                    SizedBox(height: 16),
                    // Botão para adicionar pedido
                    ElevatedButton(
                      onPressed: () async {
                        // Chama a função para adicionar pedido
                        await _addPedido(
                          _clienteController.text,
                          _bebida,
                          _acompanhamento,
                          double.tryParse(_valorController.text) ?? 0.0,
                          _obsPedController.text,
                        );
                        // Exibe mensagem de confirmação
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Pedido adicionado com sucesso!'),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[800],
                      ),
                      child: Text(
                        'Adicionar Pedido',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Função para adicionar pedido
  Future<void> _addPedido(
    String nomeCliente,
    String bebida,
    String acompanhamento,
    double valor,
    String obsPed,
  ) async {
    // Obtém a data atual e formata-a
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(now);

    // Obtém o último ID de pedido
    final lastId = await _getLastId();

    // Cria um mapa com os dados do pedido
    final pedido = {
      'id': lastId,
      'Bebida': bebida,
      'Acompanhamento': acompanhamento,
      'Valor': valor,
      'ObsPed': obsPed,
      'StatusPedido': 'Aguardando',
      'DataPed': formattedDate,
      'NomeCli': nomeCliente,
    };

    // Insere o pedido no Supabase
    final response =
        await Supabase.instance.client.from('core_pedido').insert([pedido]);

    // Trata erros de inserção
    if (response == null) {
      print('Erro ao adicionar pedido:Unknown error');
      return;
    }

    if (response.error != null) {
      print('Erro ao adicionar pedido: ${response.error}');
      return;
    }
  }

  // Função para obter o último ID de pedido
  Future<int> _getLastId() async {
    // Obtém o último ID de pedido do Supabase
    final response = await Supabase.instance.client
        .from('core_pedido')
        .select('id')
        .order('id', ascending: false)
        .limit(1);

    // Verifica se há registros e obtém o último ID
    final lastId = response.isNotEmpty ? response[0]['id'] : 1;

    // Retorna o próximo ID disponível
    return lastId + 1;
  }
}

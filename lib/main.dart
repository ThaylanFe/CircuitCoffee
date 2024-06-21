import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

const supabaseUrl = 'https://pouexwwhwxnuzoxvnejb.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBvdWV4d3dod3hudXpveHZuZWpiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxNjgyMzEsImV4cCI6MjAzMDc0NDIzMX0.X6VmW9b-dtkKHAugIpN9U_yFaB4evhOaZ0cMVVsMlgs';

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circuit Coffee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddPedidoScreen(),
    );
  }
}

class AddPedidoScreen extends StatefulWidget {
  @override
  _AddPedidoScreenState createState() => _AddPedidoScreenState();
}

class _AddPedidoScreenState extends State<AddPedidoScreen> {
  TextEditingController _clienteController = TextEditingController();
  TextEditingController _valorController = TextEditingController();
  TextEditingController _obsPedController = TextEditingController();

  String _bebida = 'Frappucino';
  String _acompanhamento = 'Salgado';

  @override
  void dispose() {
    _clienteController.dispose();
    _valorController.dispose();
    _obsPedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.purple[800],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/2.png'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    ElevatedButton(
                      onPressed: () async {
                        await _addPedido(
                          _clienteController.text,
                          _bebida,
                          _acompanhamento,
                          double.tryParse(_valorController.text) ?? 0.0,
                          _obsPedController.text,
                        );
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

  Future<void> _addPedido(
    String nomeCliente,
    String bebida,
    String acompanhamento,
    double valor,
    String obsPed,
  ) async {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(now);

    final lastId = await _getLastId();

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

    final response =
        await Supabase.instance.client.from('core_pedido').insert([pedido]);

    if (response == null) {
      print('Erro ao adicionar pedido:Unknown error');
      return;
    }

    if (response.error != null) {
      print('Erro ao adicionar pedido: ${response.error}');
      return;
    }
  }

  Future<int> _getLastId() async {
    final response = await Supabase.instance.client
        .from('core_pedido')
        .select('id')
        .order('id', ascending: false)
        .limit(1);

    final lastId = response.isNotEmpty ? response[0]['id'] : 1;
    return lastId + 1;
  }
}

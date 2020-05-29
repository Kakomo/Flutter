import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  runApp(MaterialApp(

    title: "Ficha",
    home: Ficha(),
  ));
}

class Ficha extends StatefulWidget {
  @override
  _FichaState createState() => _FichaState();

}

class _FichaState extends State<Ficha> {
//Salvando dados
  List lista = [];
  String texto = "";
  final controleTexto = TextEditingController();




  @override
  void initState() {
    super.initState();

    _readData().then((data){
      setState(() {
        lista = json.decode(data);
        _forca=lista[0];
        _dex=lista[1];
        _con=lista[2];
        _int=lista[3];
        _sab=lista[4];
        _car=lista[5];
        _tempcorAtletismo=lista[6];
        _tempcorFurtividade=lista[7];
        _tempcorMaosLeves=lista[8];
        _tempcorVida = lista[9];
        _tempcorArcana = lista[10];
        _tempcorHistoria = lista[11];
        _tempcorInvestigacao = lista[12];
        _tempcorNatureza = lista[13];
        _tempcorReligiao = lista[14];
        _tempcorIntuicao = lista[15];
        _tempcorLidarAnimais = lista[16];
        _tempcorMedicina = lista[17];
        _tempcorPercepcao = lista[18];
        _tempcorSobrevivencia = lista[19];
        _tempcorAtuacao = lista[20];
        _tempcorEnganacao = lista[21];
        _tempcorIntimidacao = lista[22];
        _tempcorPersuasao = lista[23];
        texto = lista[24];
      });
    });
  }

  File _imagem;
  Future getImage() async{
    var imagem = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imagem = imagem;
    });
  }
  //STATUS
  //FORÇA
  String infoFor ="?";
  bool _visFor = false;
  int _forca = 0;
  void calFor(){
    setState(() {
      _visFor = !_visFor;
      int _habFor = ((_forca/2) - 5).toInt();
      infoFor = "$_habFor";
      if(_tempcorAtletismo == 0){
        _corAtletismo = Colors.black;
      }else{_corAtletismo = Colors.red;}
      _saveData();
    });
  }
  void addFor(){
    setState(() {
      _forca ++;
      int _habFor = ((_forca/2) - 5).toInt();
      infoFor = "$_habFor";
      if(_corAtletismo == Colors.black) {
        int _atletismo = (_forca / 2 -5).toInt() ;
        infoAtletismo = "$_atletismo";
      }else{
        int _atletismo = (_forca / 2).toInt();
        infoAtletismo = "$_atletismo";
      }
    });
  }
  void subFor(){
    setState(() {
      _forca --;
      int _habFor = ((_forca/2) - 5).toInt();
      infoFor = "$_habFor";
      if(_corAtletismo == Colors.black) {
        int _atletismo = (_forca / 2 -5).toInt() ;
        infoAtletismo = "$_atletismo";
      }else{
        int _atletismo = (_forca / 2).toInt();
        infoAtletismo = "$_atletismo";
      }
    });
  }
  String infoAtletismo ="";
  var _corAtletismo = Colors.black;
  int _tempcorAtletismo = 0;

  void profAtletismo(){
    setState(() {
      if(_tempcorAtletismo == 0) {
        int _atletismo = (_forca / 2).toInt() ;
        infoAtletismo = "$_atletismo";
        _corAtletismo = Colors.red;
        _tempcorAtletismo = 1;
      }else{
        int _atletismo = ((_forca / 2) - 5).toInt();
        infoAtletismo = "$_atletismo";
        _corAtletismo = Colors.black;
        _tempcorAtletismo = 0;
      }
      _saveData();

    });
  }
  //DESTREZA
  String infoDex ="?";
  bool _visDex = false;
  int _dex = 0;

  void calDex(){
    setState(() {
      int habDex = ((_dex/2) - 5).toInt();
      infoDex = "$habDex";
      _visDex = !_visDex;
      if(_tempcorAcrobacia == 0){
        _corAcrobacia = Colors.black;
      }else{_corAcrobacia = Colors.red;}
      if(_tempcorFurtividade == 0){
        _corFurtividade = Colors.black;
      }else{_corFurtividade = Colors.red;}
      if(_tempcorMaosLeves == 0){
        _corMaosLeves = Colors.black;
      }else{_corMaosLeves = Colors.red;}
      _saveData();
    });
  }
  void addDex(){
    setState(() {
      _dex ++;
      int _habDex = ((_dex/2) - 5).toInt();
      infoDex = "$_habDex";
      if(_corAcrobacia == Colors.black) {
        int _acrobacia = (_dex / 2 -5).toInt() ;
        infoAcrobacia = "$_acrobacia";
      }else{
        int _acrobacia = (_dex / 2).toInt();
        infoAcrobacia = "$_acrobacia";
      }
      if(_corFurtividade == Colors.black) {
        int _furtividade = (_dex / 2 -5).toInt() ;
        infoFurtividade = "$_furtividade";
      }else{
        int _furtividade = (_dex / 2).toInt();
        infoFurtividade = "$_furtividade";
      }
      if(_corMaosLeves == Colors.black) {
        int _maosLeves = (_dex / 2 -5).toInt() ;
        infoMaosLeves = "$_maosLeves";
      }else{
        int _maosLeves = (_dex / 2).toInt();
        infoMaosLeves = "$_maosLeves";
      }
    });
  }
  void subDex(){
    setState(() {
      _dex --;
      int _habDex = ((_dex/2) - 5).toInt();
      infoDex = "$_habDex";
      if(_corAcrobacia == Colors.black) {
        int _acrobacia = (_dex / 2 -5).toInt() ;
        infoAcrobacia = "$_acrobacia";
      }else{
        int _acrobacia = (_dex / 2).toInt();
        infoAcrobacia = "$_acrobacia";
      }
      if(_corFurtividade == Colors.black) {
        int _furtividade = (_dex / 2 -5).toInt() ;
        infoFurtividade = "$_furtividade";
      }else{
        int _furtividade = (_dex / 2).toInt();
        infoFurtividade = "$_furtividade";
      }
      if(_corMaosLeves == Colors.black) {
        int _maosLeves = (_dex / 2 -5).toInt() ;
        infoMaosLeves = "$_maosLeves";
      }else{
        int _maosLeves = (_dex / 2).toInt();
        infoMaosLeves = "$_maosLeves";
      }
    });
  }
  String infoAcrobacia ="";
  var _corAcrobacia = Colors.black;
  int _tempcorAcrobacia = 0;
  void profAcrobacia() {
    setState(() {
      if (_tempcorAcrobacia == 0) {
        int _acrobacia = (_dex / 2).toInt();
        infoAcrobacia = "$_acrobacia";
        _corAcrobacia = Colors.red;
        _tempcorAcrobacia = 1;
      } else {
        int _acrobacia = ((_dex / 2) - 5).toInt();
        infoAcrobacia = "$_acrobacia";
        _corAcrobacia = Colors.black;
        _tempcorAcrobacia = 0;
      }
    });
  }
  String infoFurtividade ="";
  var _corFurtividade = Colors.black;
  int _tempcorFurtividade = 0;
  void profFurtividade() {
    setState(() {
      if (_tempcorFurtividade == 0) {
        int _furtividade = (_dex / 2).toInt();
        infoFurtividade = "$_furtividade";
        _corFurtividade = Colors.red;
        _tempcorFurtividade = 1;
      } else {
        int _furtividade = ((_dex / 2) - 5).toInt();
        infoFurtividade = "$_furtividade";
        _corFurtividade = Colors.black;
        _tempcorFurtividade = 0;
      }
    });
  }
  String infoMaosLeves ="";
  var _corMaosLeves = Colors.black;
  int _tempcorMaosLeves = 0;
  void profMaosLeves() {
    setState(() {
      if (_tempcorMaosLeves == 0) {
        int _maosLeves = (_dex / 2).toInt();
        infoMaosLeves = "$_maosLeves";
        _corMaosLeves = Colors.red;
        _tempcorMaosLeves = 1;
      } else {
        int _maosLeves = ((_dex / 2) - 5).toInt();
        infoMaosLeves = "$_maosLeves";
        _corMaosLeves = Colors.black;
        _tempcorMaosLeves = 0;
      }
    });
  }
  //CONSTITUIÇÃO
  String infoCon ="?";
  bool _visCon = false;
  int _con = 0;
  void calCon(){
    setState(() {
      int habCon = ((_con/2) - 5).toInt();
      infoCon = "$habCon";
      _visCon = !_visCon;
      if(_tempcorVida == 0){_corVida = Colors.black;}else{_corVida = Colors.red;}
      _saveData();
    });
  }
  void addCon(){
    setState(() {
      _con++;
      int _habCon = ((_con/2) - 5).toInt();
      infoCon = "$_habCon";
      if(_corVida == Colors.black) {
        int _vida = (_con / 2 -5).toInt() +15 ;
        infoVida = "$_vida";
      }else{
        int _vida = (_con / 2).toInt() +15 ;
        infoVida = "$_vida";
      }
    });
  }
  void subCon(){
    setState(() {
      _con--;
      int _habCon = ((_con/2) - 5).toInt();
      infoCon = "$_habCon";
      if(_corVida == Colors.black) {
        int _vida = (_con / 2 -5).toInt() + 15 ;
        infoVida = "$_vida";
      }else{
        int _vida = (_con / 2).toInt() + 15;
        infoVida = "$_vida";
      }
    });
  }
  String infoVida ="";
  var _corVida = Colors.black;
  int _tempcorVida = 0;
  void profVida(){
    setState(() {
      if(_tempcorVida == 0) {
        int _vida = (_con / 2).toInt() + 15 ;
        infoVida = "$_vida";
        _corVida = Colors.red;
        _tempcorVida = 1;
      }else{
        int _Vida = ((_con / 2) - 5).toInt() + 15;
        infoVida = "$_Vida";
        _corVida = Colors.black;
        _tempcorVida = 0;
      }
    });
  }
  //INTELIGÊNCIA
  String infoInt ="?";
  bool _visInt = false;
  int _int = 0;
  void calInt(){
    setState(() {
      int habInt = ((_int/2) - 5).toInt();
      infoInt = "$habInt";
      _visInt = !_visInt;
      if(_tempcorArcana == 0){_corArcana = Colors.black;}else{_corArcana = Colors.red;}
      if(_tempcorHistoria == 0){_corHistoria = Colors.black;}else{_corHistoria = Colors.red;}
      if(_tempcorInvestigacao == 0){_corInvestigacao = Colors.black;}else{_corInvestigacao = Colors.red;}
      if(_tempcorNatureza == 0){_corNatureza = Colors.black;}else{_corNatureza = Colors.red;}
      if(_tempcorReligiao == 0){_corReligiao = Colors.black;}else{_corReligiao = Colors.red;}
      _saveData();
    });
  }
  void addInt(){
    setState(() {
      _int++;
      int _habInt = ((_int/2) - 5).toInt();
      infoInt = "$_habInt";
      if(_corArcana == Colors.red) {
        int _Arcana = (_int / 2).toInt() ;
        infoArcana = "$_Arcana";
        _corArcana = Colors.red;
      }else{
        int _Arcana = ((_int / 2) - 5).toInt();
        infoArcana = "$_Arcana";
        _corArcana = Colors.black;
      }
      if(_corHistoria == Colors.red) {
        int _Historia = (_int / 2).toInt() ;
        infoHistoria = "$_Historia";
        _corHistoria = Colors.red;
      }else{
        int _Historia = ((_int / 2) - 5).toInt();
        infoHistoria = "$_Historia";
        _corHistoria = Colors.black;
      }
      if(_corInvestigacao == Colors.red) {
        int _Investigacao = (_int / 2).toInt() ;
        infoInvestigacao = "$_Investigacao";
        _corInvestigacao = Colors.red;
      }else{
        int _Investigacao = ((_int / 2) - 5).toInt();
        infoInvestigacao = "$_Investigacao";
        _corInvestigacao = Colors.black;
      }
      if(_corNatureza == Colors.red) {
        int _Natureza = (_int / 2).toInt() ;
        infoNatureza = "$_Natureza";
        _corNatureza = Colors.red;
      }else{
        int _Natureza = ((_int / 2) - 5).toInt();
        infoNatureza = "$_Natureza";
        _corNatureza = Colors.black;
      }
      if(_corReligiao == Colors.red) {
        int _Religiao = (_int / 2).toInt() ;
        infoReligiao = "$_Religiao";
        _corReligiao = Colors.red;
      }else{
        int _Religiao = ((_int / 2) - 5).toInt();
        infoReligiao = "$_Religiao";
        _corReligiao = Colors.black;
      }
    });
  }
  void subInt(){
    setState(() {
      _int--;
      int _habInt = ((_int/2) - 5).toInt();
      infoInt = "$_habInt";
      if(_corArcana == Colors.red) {
        int _Arcana = (_int / 2).toInt() ;
        infoArcana = "$_Arcana";
        _corArcana = Colors.red;
      }else{
        int _Arcana = ((_int / 2) - 5).toInt();
        infoArcana = "$_Arcana";
        _corArcana = Colors.black;
      }
      if(_corHistoria == Colors.red) {
        int _Historia = (_int / 2).toInt() ;
        infoHistoria = "$_Historia";
        _corHistoria = Colors.red;
      }else{
        int _Historia = ((_int / 2) - 5).toInt();
        infoHistoria = "$_Historia";
        _corHistoria = Colors.black;
      }
      if(_corInvestigacao == Colors.red) {
        int _Investigacao = (_int / 2).toInt() ;
        infoInvestigacao = "$_Investigacao";
        _corInvestigacao = Colors.red;
      }else{
        int _Investigacao = ((_int / 2) - 5).toInt();
        infoInvestigacao = "$_Investigacao";
        _corInvestigacao = Colors.black;
      }
      if(_corNatureza == Colors.red) {
        int _Natureza = (_int / 2).toInt() ;
        infoNatureza = "$_Natureza";
        _corNatureza = Colors.red;
      }else{
        int _Natureza = ((_int / 2) - 5).toInt();
        infoNatureza = "$_Natureza";
        _corNatureza = Colors.black;
      }
      if(_corReligiao == Colors.red) {
        int _Religiao = (_int / 2).toInt() ;
        infoReligiao = "$_Religiao";
        _corReligiao = Colors.red;
      }else{
        int _Religiao = ((_int / 2) - 5).toInt();
        infoReligiao = "$_Religiao";
        _corReligiao = Colors.black;
      }
    });
  }
  String infoArcana ="";
  var _corArcana = Colors.black;
  int _tempcorArcana = 0;
  void profArcana(){
    setState(() {
      if(_tempcorArcana == 0) {
        int _Arcana = (_int / 2).toInt() ;
        infoArcana = "$_Arcana";
        _corArcana = Colors.red;
        _tempcorArcana = 1;
      }else{
        int _Arcana = ((_int / 2) - 5).toInt();
        infoArcana = "$_Arcana";
        _corArcana = Colors.black;
        _tempcorArcana = 0;
      }
    });
  }
  String infoHistoria ="";
  var _corHistoria = Colors.black;
  int _tempcorHistoria = 0;
  void profHistoria(){
    setState(() {
      if(_tempcorHistoria == 0) {
        int _Historia = (_int / 2).toInt();
        infoHistoria = "$_Historia";
        _corHistoria = Colors.red;
        _tempcorHistoria = 1;
      }else{
        int _Historia = ((_int / 2) - 5).toInt();
        infoHistoria = "$_Historia";
        _corHistoria = Colors.black;
        _tempcorHistoria = 0;
      }
    });
  }
  String infoInvestigacao ="";
  var _corInvestigacao = Colors.black;
  int _tempcorInvestigacao = 0;
  void profInvestigacao(){
    setState(() {
      if(_tempcorInvestigacao == 0) {
        int _Investigacao = (_int / 2).toInt();
        infoInvestigacao = "$_Investigacao";
        _corInvestigacao = Colors.red;
        _tempcorInvestigacao = 1;
      }else{
        int _Investigacao = ((_int / 2) - 5).toInt();
        infoInvestigacao = "$_Investigacao";
        _corInvestigacao = Colors.black;
        _tempcorInvestigacao = 0;
      }
    });
  }
  String infoNatureza ="";
  var _corNatureza = Colors.black;
  int _tempcorNatureza = 0;
  void profNatureza(){
    setState(() {
      if(_tempcorNatureza == 0) {
        int _Natureza = (_int / 2).toInt();
        infoNatureza = "$_Natureza";
        _corNatureza = Colors.red;
        _tempcorNatureza = 1;
      }else{
        int _Natureza = ((_int / 2) - 5).toInt();
        infoNatureza = "$_Natureza";
        _corNatureza = Colors.black;
        _tempcorNatureza = 0;
      }
    });
  }
  String infoReligiao ="";
  var _corReligiao = Colors.black;
  int _tempcorReligiao = 0;
  void profReligiao(){
    setState(() {
      if(_tempcorReligiao == 0) {
        int _Religiao = (_int / 2).toInt();
        infoReligiao = "$_Religiao";
        _corReligiao = Colors.red;
        _tempcorReligiao = 1;
      }else{
        int _Religiao = ((_int / 2) - 5).toInt();
        infoReligiao = "$_Religiao";
        _corReligiao = Colors.black;
        _tempcorReligiao = 0;
      }
    });
  }
  //SABEDORIA
  String infoSab ="?";
  bool _visSab = false;
  int _sab = 0;
  void calSab(){
    setState(() {
      int habSab = ((_sab/2) - 5).toInt();
      infoSab = "$habSab";
      _visSab = !_visSab;
      if(_tempcorIntuicao == 0){_corIntuicao = Colors.black;}else{_corIntuicao = Colors.red;}
      if(_tempcorLidarAnimais == 0){_corLidarAnimais = Colors.black;}else{_corLidarAnimais = Colors.red;}
      if(_tempcorMedicina == 0){_corMedicina = Colors.black;}else{_corMedicina = Colors.red;}
      if(_tempcorPercepcao == 0){_corPercepcao = Colors.black;}else{_corPercepcao = Colors.red;}
      if(_tempcorSobrevivencia == 0){_corSobrevivencia = Colors.black;}else{_corSobrevivencia = Colors.red;}
      _saveData();
    });
  }
  void addSab(){
    setState(() {
      _sab++;
      int _habSab = ((_sab/2) - 5).toInt();
      infoSab = "$_habSab";
      if(_corIntuicao == Colors.red) {
        int _Intuicao = (_sab / 2).toInt();
        infoIntuicao = "$_Intuicao";
      }else{
        int _Intuicao = ((_sab / 2) - 5).toInt();
        infoIntuicao = "$_Intuicao";
      }
      if(_corLidarAnimais == Colors.red) {
        int _LidarAnimais = (_sab / 2).toInt();
        infoLidarAnimais = "$_LidarAnimais";
      }else{
        int _LidarAnimais = ((_sab / 2) - 5).toInt();
        infoLidarAnimais = "$_LidarAnimais";
      }
      if(_corMedicina == Colors.red) {
        int _Medicina = (_sab / 2).toInt();
        infoMedicina = "$_Medicina";
      }else{
        int _Medicina = ((_sab / 2) - 5).toInt();
        infoMedicina = "$_Medicina";
      }
      if(_corPercepcao == Colors.red) {
        int _Percepcao = (_sab / 2).toInt();
        infoPercepcao = "$_Percepcao";
      }else{
        int _Percepcao = ((_sab / 2) - 5).toInt();
        infoPercepcao = "$_Percepcao";
      }
      if(_corSobrevivencia == Colors.red) {
        int _Sobrevivencia = (_sab / 2).toInt();
        infoSobrevivencia = "$_Sobrevivencia";
      }else{
        int _Sobrevivencia = ((_sab / 2) - 5).toInt();
        infoSobrevivencia = "$_Sobrevivencia";
      }
    });
  }
  void subSab(){
    setState(() {
      _sab--;
      int _habSab = ((_sab/2) - 5).toInt();
      infoSab = "$_habSab";
      if(_corIntuicao == Colors.red) {
        int _Intuicao = (_sab / 2).toInt();
        infoIntuicao = "$_Intuicao";
      }else{
        int _Intuicao = ((_sab / 2) - 5).toInt();
        infoIntuicao = "$_Intuicao";
      }
      if(_corLidarAnimais == Colors.red) {
        int _LidarAnimais = (_sab / 2).toInt();
        infoLidarAnimais = "$_LidarAnimais";
      }else{
        int _LidarAnimais = ((_sab / 2) - 5).toInt();
        infoLidarAnimais = "$_LidarAnimais";
      }
      if(_corMedicina == Colors.red) {
        int _Medicina = (_sab / 2).toInt();
        infoMedicina = "$_Medicina";
      }else{
        int _Medicina = ((_sab / 2) - 5).toInt();
        infoMedicina = "$_Medicina";
      }
      if(_corPercepcao == Colors.red) {
        int _Percepcao = (_sab / 2).toInt();
        infoPercepcao = "$_Percepcao";
      }else{
        int _Percepcao = ((_sab / 2) - 5).toInt();
        infoPercepcao = "$_Percepcao";
      }
      if(_corSobrevivencia == Colors.red) {
        int _Sobrevivencia = (_sab / 2).toInt();
        infoSobrevivencia = "$_Sobrevivencia";
      }else{
        int _Sobrevivencia = ((_sab / 2) - 5).toInt();
        infoSobrevivencia = "$_Sobrevivencia";
      }
    });
  }
  String infoIntuicao ="";
  var _corIntuicao = Colors.black;
  int _tempcorIntuicao = 0;
  void profIntuicao(){
    setState(() {
      if(_tempcorIntuicao == 0) {
        int _Intuicao = (_sab / 2).toInt();
        infoIntuicao = "$_Intuicao";
        _corIntuicao = Colors.red;
        _tempcorIntuicao = 1;
      }else{
        int _Intuicao = ((_sab / 2) - 5).toInt();
        infoIntuicao = "$_Intuicao";
        _corIntuicao = Colors.black;
        _tempcorIntuicao = 0;
      }
    });
  }String infoLidarAnimais ="";
  var _corLidarAnimais = Colors.black;
  int _tempcorLidarAnimais = 0;
  void profLidarAnimais(){
    setState(() {
      if(_tempcorLidarAnimais == 0) {
        int _LidarAnimais = (_sab / 2).toInt();
        infoLidarAnimais = "$_LidarAnimais";
        _corLidarAnimais = Colors.red;
        _tempcorLidarAnimais = 1;
      }else{
        int _LidarAnimais = ((_sab / 2) - 5).toInt();
        infoLidarAnimais = "$_LidarAnimais";
        _corLidarAnimais = Colors.black;
        _tempcorLidarAnimais = 0;
      }
    });
  }String infoMedicina ="";
  var _corMedicina = Colors.black;
  int _tempcorMedicina = 0;
  void profMedicina(){
    setState(() {
      if(_tempcorMedicina == 0) {
        int _Medicina = (_sab / 2).toInt();
        infoMedicina = "$_Medicina";
        _corMedicina = Colors.red;
        _tempcorMedicina = 1;
      }else{
        int _Medicina = ((_sab / 2) - 5).toInt();
        infoMedicina = "$_Medicina";
        _corMedicina = Colors.black;
        _tempcorMedicina = 0;
      }
    });
  }String infoPercepcao ="";
  var _corPercepcao = Colors.black;
  int _tempcorPercepcao = 0;
  void profPercepcao(){
    setState(() {
      if(_tempcorPercepcao == 0) {
        int _Percepcao = (_sab / 2).toInt();
        infoPercepcao = "$_Percepcao";
        _corPercepcao = Colors.red;
        _tempcorPercepcao = 1;
      }else{
        int _Percepcao = ((_sab / 2) - 5).toInt();
        infoPercepcao = "$_Percepcao";
        _corPercepcao = Colors.black;
        _tempcorPercepcao = 0;
      }
    });
  }
  String infoSobrevivencia ="";
  var _corSobrevivencia = Colors.black;
  int _tempcorSobrevivencia = 0;
  void profSobrevivencia(){
    setState(() {
      if(_tempcorSobrevivencia == 0) {
        int _Sobrevivencia = (_sab / 2).toInt();
        infoSobrevivencia = "$_Sobrevivencia";
        _corSobrevivencia = Colors.red;
        _tempcorSobrevivencia = 1;
      }else{
        int _Sobrevivencia = ((_sab / 2) - 5).toInt();
        infoSobrevivencia = "$_Sobrevivencia";
        _corSobrevivencia = Colors.black;
        _tempcorSobrevivencia = 0;
      }
    });
  }
  //CARISMA
  String infoCar ="?";
  bool _visCar = false;
  int _car = 0;
  void calCar(){
    setState(() {
      int habCar = ((_car/2) - 5).toInt();
      infoCar = "$habCar";
      _visCar = !_visCar;
      if(_tempcorAtuacao == 0){_corAtuacao = Colors.black;}else{_corAtuacao = Colors.red;}
      if(_tempcorEnganacao == 0){_corEnganacao = Colors.black;}else{_corEnganacao = Colors.red;}
      if(_tempcorIntimidacao == 0){_corIntimidacao = Colors.black;}else{_corIntimidacao = Colors.red;}
      if(_tempcorPersuasao == 0){_corPersuasao = Colors.black;}else{_corPersuasao = Colors.red;}
      _saveData();
    });
  }
  void addCar(){
    setState(() {
      _car++;
      int _habCar = ((_car/2) - 5).toInt();
      infoCar = "$_habCar";
      if(_corAtuacao == Colors.red) {
        int _Atuacao = (_car / 2).toInt();
        infoAtuacao = "$_Atuacao";
      }else{
        int _Atuacao = ((_car / 2) - 5).toInt();
        infoAtuacao = "$_Atuacao";
      }
      if(_corEnganacao == Colors.red) {
        int _Enganacao = (_car / 2).toInt();
        infoEnganacao = "$_Enganacao";
      }else{
        int _Enganacao = ((_car / 2) - 5).toInt();
        infoEnganacao = "$_Enganacao";
      }
      if(_corIntimidacao == Colors.red) {
        int _Intimidacao = (_car / 2).toInt();
        infoIntimidacao = "$_Intimidacao";
      }else{
        int _Intimidacao = ((_car / 2) - 5).toInt();
        infoIntimidacao = "$_Intimidacao";
      }
      if(_corPersuasao == Colors.red) {
        int _Persuasao = (_car / 2).toInt();
        infoPersuasao = "$_Persuasao";
      }else{
        int _Persuasao = ((_car / 2) - 5).toInt();
        infoPersuasao = "$_Persuasao";
      }
    });
  }
  void subCar(){
    setState(() {
      _car--;
      int _habCar = ((_car/2) - 5).toInt();
      infoCar = "$_habCar";
      if(_corAtuacao == Colors.red) {
        int _Atuacao = (_car / 2).toInt();
        infoAtuacao = "$_Atuacao";
      }else{
        int _Atuacao = ((_car / 2) - 5).toInt();
        infoAtuacao = "$_Atuacao";
      }
      if(_corEnganacao == Colors.red) {
        int _Enganacao = (_car / 2).toInt();
        infoEnganacao = "$_Enganacao";
      }else{
        int _Enganacao = ((_car / 2) - 5).toInt();
        infoEnganacao = "$_Enganacao";
      }
      if(_corIntimidacao == Colors.red) {
        int _Intimidacao = (_car / 2).toInt();
        infoIntimidacao = "$_Intimidacao";
      }else{
        int _Intimidacao = ((_car / 2) - 5).toInt();
        infoIntimidacao = "$_Intimidacao";
      }
      if(_corPersuasao == Colors.red) {
        int _Persuasao = (_car / 2).toInt();
        infoPersuasao = "$_Persuasao";
      }else{
        int _Persuasao = ((_car / 2) - 5).toInt();
        infoPersuasao = "$_Persuasao";
      }
    });
  }
  String infoAtuacao ="";
  var _corAtuacao = Colors.black;
  int _tempcorAtuacao = 0;
  void profAtuacao(){
    setState(() {
      if(_tempcorAtuacao == 0) {
        int _Atuacao = (_car / 2).toInt();
        infoAtuacao = "$_Atuacao";
        _corAtuacao = Colors.red;
        _tempcorAtuacao = 1;
      }else{
        int _Atuacao = ((_car / 2) - 5).toInt();
        infoAtuacao = "$_Atuacao";
        _corAtuacao = Colors.black;
        _tempcorAtuacao = 0;
      }
    });
  }
  String infoEnganacao ="";
  var _corEnganacao = Colors.black;
  int _tempcorEnganacao = 0;
  void profEnganacao(){
    setState(() {
      if(_tempcorEnganacao == 0) {
        int _Enganacao = (_car / 2).toInt();
        infoEnganacao = "$_Enganacao";
        _corEnganacao = Colors.red;
        _tempcorEnganacao = 1;
      }else{
        int _Enganacao = ((_car / 2) - 5).toInt();
        infoEnganacao = "$_Enganacao";
        _corEnganacao = Colors.black;
        _tempcorEnganacao = 0;
      }
    });
  }
  String infoIntimidacao ="";
  var _corIntimidacao = Colors.black;
  int _tempcorIntimidacao = 0;
  void profIntimidacao(){
    setState(() {
      if(_tempcorIntimidacao == 0) {
        int _Intimidacao = (_car / 2).toInt();
        infoIntimidacao = "$_Intimidacao";
        _corIntimidacao = Colors.red;
        _tempcorIntimidacao = 1;
      }else{
        int _Intimidacao = ((_car / 2) - 5).toInt();
        infoIntimidacao = "$_Intimidacao";
        _corIntimidacao = Colors.black;
        _tempcorIntimidacao = 0;
      }
    });
  }
  String infoPersuasao ="";
  var _corPersuasao = Colors.black;
  int _tempcorPersuasao = 0;
  void profPersuasao(){
    setState(() {
      if(_tempcorPersuasao == 0) {
        int _Persuasao = (_car / 2).toInt();
        infoPersuasao = "$_Persuasao";
        _corPersuasao = Colors.red;
        _tempcorPersuasao = 1;
      }else{
        int _Persuasao = ((_car / 2) - 5).toInt();
        infoPersuasao = "$_Persuasao";
        _corPersuasao = Colors.black;
        _tempcorPersuasao = 0;
      }
    });
  }

  String infoArmor ="?";
  int _armor = 15;
  void calArmor(){
    setState(() {
      int habArmor = ((_armor/2) - 5).toInt();
      infoArmor = "$habArmor";
    });
  }

  @override

  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;

    double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage('imagem/AppBar_sheet.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      body:  Row(
        children: <Widget>[
          SizedBox(
            child:
            Stack(
              children: <Widget>[
                Container(
                  height: altura*0.95,
                  width:largura*0.18,
                  child: Image.asset(
                    "imagem/Status_background.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: altura*0.06),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: altura*0.1,
                          width: largura*0.17,
                          child: Image.asset(
                            "imagem/Status_sheet.jpg",
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: altura*0.007,),
                            Row(children: <Widget>[SizedBox(width: largura*0.055), Text("FOR", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                            // SizedBox(height: altura*0.007),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text("$_forca", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.03)),],),
                            SizedBox(height: altura*0.0025),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text(infoFor),],),
                          ],
                        ),
                        SizedBox(height: altura*0.088, width: largura*0.146,child: FlatButton(onPressed: calFor, child: null),),

                      ],
                    ),

                    SizedBox(height: altura*0.03,),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: altura*0.1,
                          width: largura*0.17,
                          child: Image.asset(
                            "imagem/Status_sheet.jpg",
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: altura*0.007,),
                            Row(children: <Widget>[SizedBox(width: largura*0.055), Text("DEX", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                            // SizedBox(height: altura*0.007),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text("$_dex", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.03)),],),
                            SizedBox(height: altura*0.0025),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text(infoDex),],),
                          ],
                        ),
                        SizedBox(height: altura*0.088, width: largura*0.146,child: FlatButton(onPressed: calDex, child: null),),
                      ],
                    ),
                    SizedBox(height: altura*0.03,),
                    Stack(

                      children: <Widget>[
                        Container(
                          height: altura*0.1,
                          width: largura*0.17,
                          child: Image.asset(
                            "imagem/Status_sheet.jpg",
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: altura*0.007,),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text("CON", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                            // SizedBox(height: altura*0.007),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text("$_con", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.03),),],),
                            SizedBox(height: altura*0.0025),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text(infoCon),],),
                          ],
                        ),
                        SizedBox(height: altura*0.088, width: largura*0.146,child: FlatButton(onPressed: calCon, child: null),),
                      ],
                    ),
                    SizedBox(height: altura*0.03,),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: altura*0.1,
                          width: largura*0.17,
                          child: Image.asset(
                            "imagem/Status_sheet.jpg",
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: altura*0.007,),
                            Row(children: <Widget>[SizedBox(width: largura*0.055), Text("INT", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                            // SizedBox(height: altura*0.007),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text("$_int", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.03)),],),
                            SizedBox(height: altura*0.0025),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text(infoInt),],),
                          ],
                        ),
                        SizedBox(height: altura*0.088, width: largura*0.146,child: FlatButton(onPressed: calInt, child: null),),
                      ],
                    ),
                    SizedBox(height: altura*0.03,),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: altura*0.1,
                          width: largura*0.17,
                          child: Image.asset(
                            "imagem/Status_sheet.jpg",
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: altura*0.007,),
                            Row(children: <Widget>[SizedBox(width: largura*0.055), Text("SAB", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                            // SizedBox(height: altura*0.007),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text("$_sab", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.03)),],),
                            SizedBox(height: altura*0.0025),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text(infoSab),],),
                          ],
                        ),
                        SizedBox(height: altura*0.088, width: largura*0.146,child: FlatButton(onPressed: calSab, child: null),),
                      ],
                    ),
                    SizedBox(height: altura*0.03,),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: altura*0.1,
                          width: largura*0.17,
                          child: Image.asset(
                            "imagem/Status_sheet.jpg",
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: altura*0.007,),
                            Row(children: <Widget>[SizedBox(width: largura*0.055), Text("CAR", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                            // SizedBox(height: altura*0.007),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text("$_car", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.03)),],),
                            SizedBox(height: altura*0.0025),
                            Row(children: <Widget>[SizedBox(width: largura*0.05), Text(infoCar),],),
                          ],
                        ),
                        SizedBox(height: altura*0.088, width: largura*0.146,child: FlatButton(onPressed: calCar, child: null),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Stack(
            children: <Widget>[
              Container(
                height:altura*0.95,
                width: largura*0.82,
                child: Image.asset(
                  "imagem/Status3_background.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: altura*0.070,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: largura*0.105,),
                      Stack(children: <Widget>[
                        Container(
                          height: altura*0.366,
                          width: largura*0.608,
                          child: Image.asset(
                            "imagem/texto_sheet.jpg",
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 5),
                            Container(
                              height: altura*0.366,
                              width: largura*0.608,
                              child: TextField(
                                //maxLength: 150,
                                onChanged: (text){texto = text;_saveData();},
                                controller: controleTexto,
                                maxLines: 1000,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Caderno",
                                  counterText: '',
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: altura*0.0145,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      ),
                    ],
                  ),
                  //SizedBox(height: altura*0.0250,),
                  Row(children: <Widget>[
                    SizedBox(width: largura*0.085,),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: altura*0.373,
                          width: largura*0.414,
                          child: Image.asset(
                            "imagem/foto_sheet.jpg",
                          ),
                        ),
                        Container( //STATS
                          height: altura*0.373,
                          width: largura*0.414,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Align(
                                heightFactor: 0.95,
                                widthFactor: 0.9,
                                child:  _imagem == null ? Icon(Icons.add_a_photo) : Image.file(_imagem),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: largura*0.341,
                          height: altura*0.286,
                          child: FlatButton(
                            onPressed: getImage,
                            child: Text(""),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: altura*0.366,
                          width: largura*0.243,
                          child: Image.asset(
                            "imagem/Status2_background.jpg",
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: altura*0.0250),
                            Row(
                              children: <Widget>[
                                SizedBox(width: largura*0.0365),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      height: altura*0.1,
                                      width: largura*0.17,
                                      child: Image.asset(
                                        "imagem/Armor_sheet.jpg",
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        SizedBox(height: altura*0.022,),
                                        Row(children: <Widget>[SizedBox(width: largura*0.044), Text("ARMOR", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.0145)),],),
                                        // SizedBox(height: altura*0.007),
                                        Row(children: <Widget>[SizedBox(width: largura*0.05), Text("$_armor", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                                      ],
                                    ),
                                    SizedBox(height: altura*0.088, width: largura*0.17,child: FlatButton(onPressed: (){}, child: null),),

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: altura*0.007),
                            Row(
                              children: <Widget>[
                                SizedBox(width: largura*0.0365),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      height: altura*0.1,
                                      width: largura*0.17,
                                      child: Image.asset(
                                        "imagem/Status2_sheet.jpg",
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        SizedBox(height: altura*0.0250,),
                                        Row(children: <Widget>[SizedBox(width: largura*0.05), Text("VIDA", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                                        // SizedBox(height: altura*0.007),
                                        Row(children: <Widget>[SizedBox(width: largura*0.05), Text(infoVida, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                                      ],
                                    ),
                                    SizedBox(height: altura*0.088, width: largura*0.17,child: FlatButton(onPressed: (){}, child: null),),

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: altura*0.007),
                            Row(
                              children: <Widget>[
                                SizedBox(width: largura*0.0365),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      height: altura*0.1,
                                      width: largura*0.17,
                                      child: Image.asset(
                                        "imagem/Status2_sheet.jpg",
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        SizedBox(height: altura*0.0250,),
                                        Row(children: <Widget>[SizedBox(width: largura*0.055), Text("INIC.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                                        // SizedBox(height: altura*0.007),
                                        Row(children: <Widget>[SizedBox(width: largura*0.05), Text(infoDex, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.022)),],),
                                      ],
                                    ),
                                    SizedBox(height: altura*0.088, width: largura*0.17,child: FlatButton(onPressed: (){}, child: null),),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  ),
                ],
              ),
              Visibility(
                visible: _visFor,
                child:Stack(
                  children: <Widget>[
                    Container(
                      width:largura*0.73,
                      height: altura*0.30,
                      child: Image.asset(
                        "imagem/habilidade_sheet.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height:altura*0.03),
                        Row(children: <Widget>[SizedBox(width: largura*0.097), Text("Força", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corAtletismo), onPressed: profAtletismo), Text(infoAtletismo,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Atletismo", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[SizedBox(width: largura*0.073),FlatButton.icon(onPressed: subFor, icon: Icon(Icons.remove), label: Text("")), Text("$_forca", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066),),FlatButton.icon(onPressed: addFor, icon: Icon(Icons.add),label:Text(""))],),
                      ],
                    ),

                  ],
                ),

              ),
              Visibility(
                visible: _visDex,
                child:Stack(
                  children: <Widget>[
                    Container(
                      width:largura*0.73,
                      height: altura*0.44,
                      child: Image.asset(
                        "imagem/habilidade_sheet.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height:altura*0.03),
                        Row(children: <Widget>[SizedBox(width: largura*0.17), Text("Destreza", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corAcrobacia), onPressed: profAcrobacia), Text(infoAcrobacia,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Acrobacia", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corFurtividade), onPressed: profFurtividade), Text(infoFurtividade,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Furtividade", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corMaosLeves), onPressed: profMaosLeves), Text(infoMaosLeves,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Mãos Leves", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[SizedBox(width: largura*0.073),FlatButton.icon(onPressed: subDex, icon: Icon(Icons.remove), label: Text("")), Text("$_dex", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066),),FlatButton.icon(onPressed: addDex, icon: Icon(Icons.add),label:Text(""))],),

                      ],
                    ),

                  ],
                ),
              ),
              Visibility(
                visible: _visCon,
                child:Stack(
                  children: <Widget>[
                    Container(
                      width:largura*0.73,
                      height: altura*0.30,
                      child: Image.asset(
                        "imagem/habilidade_sheet.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height:altura*0.03),
                        Row(children: <Widget>[SizedBox(width: largura*0.0486), Text("Constituição", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corVida), onPressed: profVida), Text(infoVida,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Vida", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[SizedBox(width: largura*0.073),FlatButton.icon(onPressed: subCon, icon: Icon(Icons.remove), label: Text("")), Text("$_con", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066),),FlatButton.icon(onPressed: addCon, icon: Icon(Icons.add),label:Text(""))],),

                      ],
                    ),

                  ],
                ),
              ),
              Visibility(
                visible: _visInt,
                child:Stack(
                  children: <Widget>[
                    Container(
                      width:largura*0.73,
                      height: altura*0.585,
                      child: Image.asset(
                        "imagem/habilidade_sheet.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height:altura*0.03),
                        Row(children: <Widget>[SizedBox(width: largura*0.073), Text("Inteligência", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corArcana), onPressed: profArcana), Text(infoArcana,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Arcanismo", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corHistoria), onPressed: profHistoria), Text(infoHistoria,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    História", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corInvestigacao), onPressed: profInvestigacao), Text(infoInvestigacao,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Investigação", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corNatureza), onPressed: profNatureza), Text(infoNatureza,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Natureza", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corReligiao), onPressed: profReligiao), Text(infoReligiao,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Religião", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[SizedBox(width: largura*0.073),FlatButton.icon(onPressed: subInt, icon: Icon(Icons.remove), label: Text("")), Text("$_int", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066),),FlatButton.icon(onPressed: addInt, icon: Icon(Icons.add),label:Text(""))],),

                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _visSab,
                child:Stack(
                  children: <Widget>[
                    Container(
                      width:largura*0.73,
                      height: altura*0.585,
                      child: Image.asset(
                        "imagem/habilidade_sheet.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height:altura*0.03),
                        Row(children: <Widget>[SizedBox(width: largura*0.122), Text("Sabedoria", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corIntuicao), onPressed: profIntuicao), Text(infoIntuicao,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Intuição", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corLidarAnimais), onPressed: profLidarAnimais), Text(infoLidarAnimais,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Lidar com Animais", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corMedicina), onPressed: profMedicina), Text(infoMedicina,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Medicina", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corPercepcao), onPressed: profPercepcao), Text(infoPercepcao,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Percepção", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corSobrevivencia), onPressed: profSobrevivencia), Text(infoSobrevivencia,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Sobrevivência", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[SizedBox(width: largura*0.073),FlatButton.icon(onPressed: subSab, icon: Icon(Icons.remove), label: Text("")), Text("$_sab", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066),),FlatButton.icon(onPressed: addSab, icon: Icon(Icons.add),label:Text(""))],),

                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _visCar,
                child:Stack(
                  children: <Widget>[
                    Container(
                      width:largura*0.73,
                      height: 350,
                      child: Image.asset(
                        "imagem/habilidade_sheet.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height:altura*0.03),
                        Row(children: <Widget>[SizedBox(width: largura*0.17), Text("Carisma", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corAtuacao), onPressed: profAtuacao), Text(infoAtuacao,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Atuação", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corEnganacao), onPressed: profEnganacao), Text(infoEnganacao,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Enganação", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corIntimidacao), onPressed: profIntimidacao), Text(infoIntimidacao,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Intimidação", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[IconButton(icon: Icon(Icons.whatshot,color:_corPersuasao), onPressed: profPersuasao), Text(infoPersuasao,style: TextStyle(color: Colors.black,decoration:TextDecoration.underline, fontWeight: FontWeight.w400, fontSize: altura*0.022)),Text("    Persuasão", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: altura*0.022)),],),
                        Row(children: <Widget>[SizedBox(width: largura*0.073),FlatButton.icon(onPressed: subCar, icon: Icon(Icons.remove), label: Text("")), Text("$_car", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: altura*0.066),),FlatButton.icon(onPressed: addCar, icon: Icon(Icons.add),label:Text(""))],),

                      ],
                    ),
                  ],
                ),
              ),



            ],
          ),

        ],
      ),
    );
  }
  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/data.json");
  }
  Future<File> _saveData() async{
    lista[0]=_forca;
    lista[1]=_dex;
    lista[2]=_con;
    lista[3]=_int;
    lista[4]=_sab;
    lista[5]=_car;
    lista[6]=_tempcorAtletismo;
    lista[7]=_tempcorFurtividade;
    lista[8]=_tempcorMaosLeves;
    lista[9]=_tempcorVida;
    lista[10]=_tempcorArcana;
    lista[11]=_tempcorHistoria;
    lista[12]=_tempcorInvestigacao;
    lista[13]=_tempcorNatureza;
    lista[14]=_tempcorReligiao;
    lista[15]=_tempcorIntuicao;
    lista[16]=_tempcorLidarAnimais;
    lista[17]=_tempcorMedicina;
    lista[18]=_tempcorPercepcao;
    lista[19]=_tempcorSobrevivencia;
    lista[20]=_tempcorAtuacao ;
    lista[21]=_tempcorEnganacao ;
    lista[22]=_tempcorIntimidacao ;
    lista[23]=_tempcorPersuasao ;
    lista[24] = texto;


    String data = json.encode(lista);
    final file = await _getFile();
    return file.writeAsString(data);
  }
  Future<String> _readData() async{
    try{
      final file = await _getFile();
      return file.readAsString();
    }catch(e){
      return null;
    }
  }
}

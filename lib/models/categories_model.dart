class Categories_Model{
  final String name, pic; 
  final List<String> songsList;
bool isFavourite;
  Categories_Model({required this.name, required this.pic, required this.songsList, this.isFavourite=false});

void setisFavourite(){
  isFavourite=!isFavourite;

}
}



mixin InventoryMixin {

    int _stock = 0;

    int get stock => _stock;

    void addStock(int quantity) {
      _stock += quantity;
    }

    void removeStock(int quantity) {
     if(quantity < 0 ) throw 'La cantidad debe ser positiva';
     if(_stock - quantity < 0) throw 'No hay suficiente stock';
      _stock -= quantity;
    }

}	

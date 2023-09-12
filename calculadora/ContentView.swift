import SwiftUI

struct CalculoIMC: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var imc: Double?
    
    @State private var backgroundColor: Color = Color.clear // Inicialmente transparente

    var body: some View {
        ZStack {
            Text("Calculadora de IMC")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.bottom, 110.0)
                .frame(width: 500.0, height: 150.0)
            
            VStack(alignment: .leading) {
                TextField("Informe seu peso", text: $peso).multilineTextAlignment(.center)
                TextField("Informe sua altura", text: $altura).multilineTextAlignment(.center)
                
                if let pesoD = Double(peso), let alturaD = Double(altura) {
                    let calcIMC = pesoD / (alturaD * alturaD)
                    Text("\(calcIMC)")
                    
                    // Define a cor de fundo com base no IMC
                    if calcIMC < 18.5 {
                        backgroundColor = Color("BaixoPeso")
                    } else if calcIMC >= 18.5 && calcIMC <= 24.99 {
                        backgroundColor = Color("Normal")
                    } else if calcIMC >= 25 && calcIMC <= 29.99 {
                        backgroundColor = Color("Sobrepeso")
                    } else if calcIMC >= 30 {
                        backgroundColor = Color("Obesidade")
                    } else {
                        backgroundColor = Color.clear // Caso padrão, transparente
                    }
                }
            }
        }
        .background(backgroundColor) // Define a cor de fundo aqui
        .padding()
    }
}

struct CalculoIMC_Previews: PreviewProvider {
    static var previews: some View {
        CalculoIMC()
    }
}

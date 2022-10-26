//
//  ContentView.swift
//  Drawing
//
//  Created by Sebastien REMY on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
    
//    @State private var colorCycle = 0.0
//    @State private var insetAmount = 50.0
    
    @State private var rows = 4
    @State private var columns = 4
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 16
                }
            }
    }
//            VStack {
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .padding(50)
//            .onTapGesture {
//                withAnimation {
//                    insetAmount = Double.random(in: 10...90)
//                }
//            }
        
        
                //            Text("Triangle")
                //            Path { path in
                //                path.move(to: CGPoint(x: 200, y: 100))
                //                path.addLine(to: CGPoint(x: 100, y: 300))
                //                path.addLine(to: CGPoint(x: 300, y: 300))
                //                path.addLine(to: CGPoint(x: 200, y: 100))
                ////                path.closeSubpath()
                //            }
                ////            .fill(.blue)
                ////            .stroke(.red, lineWidth: 10)
                ///
                /// Shape
                //            Triangle()
                //                .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round,lineJoin: .round))
                //                .frame(width: 300, height: 300)
                //                .padding(50)
                
                //            // Arc
                //            Arc(startAngle: .degrees(0), endAngle: .degrees(220), clockwise: true) .stroke(.blue, lineWidth: 10)
                //                .frame(width: 300, height: 300)
                //                .padding(50)
                //
                //            Circle()
                //                .strokeBorder(.blue, lineWidth: 40)
                //                .frame(width: 500, height: 500)
                //
                //            Arc(startAngle: .degrees(0), endAngle: .degrees(220), clockwise: true)
                //                .strokeBorder(.blue, lineWidth: 40)
                //                .frame(width: 500, height: 500)
                //
                //            Flower(petalOffSet: petalOffset, petalWidth: petalWidth)
                //                .fill(.red, style: FillStyle(eoFill: true))
                //                .frame(width: 300)
                //
                //            Text("Offset")
                //            Slider(value: $petalOffset, in: -40...40)
                //                .padding([.horizontal, .bottom])
                //            Text("Width")
                //            Slider(value: $petalWidth, in: 0...100)
                //                .padding(.horizontal)
                
                
                //            // Using imagePaint
                //
                //            Text("Hello world")
                //                .frame(width: 300, height: 100)
                //                .border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)
                //            Text("Hello")
                //                .frame(width: 300, height: 100).border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5)), width: 30)
                //            Capsule()
                //                .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.2), lineWidth: 20)
                //                .frame(width: 300, height: 100)
                
                
                //            }
//                ColorCyclingCircle(amount: colorCycle)
//                    .frame(width: 300, height: 300)
//                Slider(value: $colorCycle)
//                    .padding()
                
//                ZStack {
//                    Image("Example")
//                        .resizable()
//                    Rectangle()
//                        .fill(.red)
//                        .blendMode(.multiply)
//                }
//                .frame(width: 400, height: 300)
                
//
//                ZStack {
//                    Circle()
//                        .fill(Color(red: 1, green: 0, blue: 0))
//                        .frame(width: 200 * amount)
//                        .offset(x: -50, y: -80)
//                        .blendMode(.screen)
//                    Circle()
//                        .fill(Color(red: 0, green: 1, blue: 0))
//                        .frame(width: 200 * amount)
//                        .offset(x: 50, y: -80)
//                        .blendMode(.screen)
//                    Circle()
//                        .fill(Color(red: 0, green: 0, blue: 1))
//                        .frame(width: 200 * amount)
//                        .blendMode(.screen)
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(.black)
//
//                Slider(value: $amount)
//                    .padding()
//                Image("Example")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 400, height: 300)
//                    .saturation(amount)
//                    .blur(radius: (1 - amount) * 20)
//            }
//    }
}
    
struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        // lopper over rows and columns, making alternating squares colored
        
        for row in 0..<rows {
            for columun in 0..<columns {
                if (row + columun).isMultiple(of: 2) {
                    // this square should be colored
                    let startX = columnSize * Double(columun)
                    let startY = rowSize * Double(row)
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}
    

struct Trapezoid: Shape {
    var insetAmount: Double
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    func path (in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}


struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Circle()
                    .inset(by: Double(value))
//                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
                    .strokeBorder(
                        LinearGradient (
                            gradient: Gradient(colors: [color(for: value, brightness: 1), color(for: value, brightness: 0.4)]),
                                        startPoint: .top,
                                        endPoint: .bottom),
                        lineWidth: 2
                        )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        if targetHue > 1 { targetHue -= 1 }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Flower: Shape {
    var petalOffSet: Double = -20 // How much to move patal away from center
    var petalWidth: Double = 100 // How wide to make each petal
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Count from 0 to pi * 2, moving up pi / 8
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffSet, y: 0, width: petalWidth, height: rect.width / 2))
            
            // apply our rotation/position transformation top the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // Add it to the main path
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
              
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxX))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insetAmount = 0.0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
    func path(in rect: CGRect) -> Path {
    
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2 - insetAmount,
                    startAngle: modifiedStart,
                    endAngle: modifiedEnd,
                    clockwise: !clockwise)
        
        return path
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Drawing
//
//  Created by Sebastien REMY on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Triangle")
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
            
            Arc(startAngle: .degrees(0), endAngle: .degrees(220), clockwise: true)
                .strokeBorder(.blue, lineWidth: 40)
                .frame(width: 500, height: 500)
        }
        .padding()
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

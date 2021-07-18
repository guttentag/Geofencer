//
//  MapTargetShape.swift
//  Geofencer
//
//  Created by Eran Gutentag on 18/07/2021.
//

import SwiftUI

struct MapTargetShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let size = min(rect.width, rect.height)
        let radius = size / 2
        let path = UIBezierPath(
            arcCenter: CGPoint(x: rect.midX, y: rect.midY),
            radius: radius,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: true)
        
        path.move(to: center.applying(.init(translationX: -(radius/2), y: 0)))
        path.addLine(to: center.applying(.init(translationX: -(radius/2)*3, y: 0)))
        
        path.move(to: center.applying(.init(translationX: radius/2, y: 0)))
        path.addLine(to: center.applying(.init(translationX: (radius/2)*3, y: 0)))
        
        path.move(to: center.applying(.init(translationX: 0, y: -(radius/2))))
        path.addLine(to: center.applying(.init(translationX: 0, y: -(radius/2)*3)))
        
        path.move(to: center.applying(.init(translationX: 0, y: radius/2)))
        path.addLine(to: center.applying(.init(translationX: 0, y: (radius/2)*3)))
        return Path(path.cgPath)
    }
}

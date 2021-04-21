//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Archeron on 20/04/2021.
//

import UIKit

class QuestionView: UIView {
    enum Style {
        case correct, incorrect, standard
    }
    
    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }

    private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            backgroundColor = UIColor(red: 200.0/255.0, green: 236.0/255, blue: 148.0/255, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Correct")
            icon.isHidden = false
        case .incorrect:
            backgroundColor = #colorLiteral(red: 0.9522046447, green: 0.5272625685, blue: 0.5785809159, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Error")
            icon.isHidden = false
        case . standard:
            backgroundColor = #colorLiteral(red: 0.7497624755, green: 0.7689997554, blue: 0.7860534191, alpha: 1)
            icon.isHidden = true
        }
    }
    
    var title = "" {
        didSet {
            label.text = title
        }
    }

    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!
    
}

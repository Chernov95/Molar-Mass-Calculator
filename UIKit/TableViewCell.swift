//
//  TableViewCell.swift
//  molecular wedth
//
//  Created by Filip Cernov on 21/01/2020.
//  Copyright © 2020 Filip Cernov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var massInMolecule: UILabel!
    @IBOutlet weak var numberOfAtoms: UILabel!
    @IBOutlet weak var percent: UILabel!
    
    override func prepareForReuse() {
        symbol.text = ""
        massInMolecule.text = ""
        numberOfAtoms.text = ""
    }
    

    

}

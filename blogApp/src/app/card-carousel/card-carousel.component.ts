import { Component } from '@angular/core';
import  * as constants from '../shared/constants';

@Component({
  selector: 'app-card-carousel',
  templateUrl: './card-carousel.component.html',
  styleUrls: ['./card-carousel.component.css']
})
export class CardCarouselComponent {
cards=[
  {title:"Recruitment Fraud Detection System",description: constants.FRAUD_CV_DESC, bitmap:"try.gif"},
  {title:"Docktor - The easy appointment App",description: constants.DOCKTOR_DESC, bitmap:"try.gif"}

] 
}

import React, {useState} from "react";
import { assets } from "../assets/assets";

const BgSlider = () =>{

    const [sliderPosition, setSliderPosition] = useState(50);

    const handleSliderChange = (e) => {
        setSliderPosition(e.target.value)
    }

    return(
        <div className="pb-10 mx-2 md:py-20 ">
            <h1 className='mb-12 text-2xl font-semibold text-center text-gray-600 sm:mb-20 md:text-3xl lg:text-4xl bg-clip-text'>Remove Background With High <br /> Quality and Accuracy</h1>
            <div className="relative w-full max-w-3xl m-auto overflow-hidden rounded-xl">
                <img src={assets.image_w_bg} style={{clipPath: `inset(0 ${100.2 - sliderPosition}% 0 0)`}} alt="" />
                <img className="absolute top-0 left-0 w-full h-full" src={assets.image_wo_bg} style={{clipPath: `inset(0 0 0 ${sliderPosition}%)`}} alt="" />
                <input className="absolute z-10 w-full transform -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2 slider" type="range" min={0} max={100} value={sliderPosition} onChange={handleSliderChange} />
            </div>
        </div>
    )
}

export default BgSlider;
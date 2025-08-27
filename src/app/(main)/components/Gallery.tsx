'use client';
import { H3, P } from '@/app/components/global/Text';
import SectionWrapper from '@/app/components/global/Wrapper';
import { useKeenSlider } from 'keen-slider/react';
import Carousel from './parts/Carousel';
import GalleryNav from './parts/CarouselArrow';

const thisYear = new Date().getFullYear();

export default function Gallery() {
  const [ref, instanceRef] = useKeenSlider<HTMLDivElement>({
    loop: true,
    breakpoints: {
      '(min-width: 300px)': {
        slides: { perView: 1, spacing: 38 },
      },
      '(min-width: 768px)': {
        slides: { perView: 3, spacing: 38 },
      },
    },
  });

  return (
    <SectionWrapper id="gallery">
     <div className="flex flex-wrap items-center justify-between mb-[38px] gap-4">
  <div>
    <H3 className="mb-1">
      Galeri <span className="text-primary-500">Antareja {thisYear - 1}</span>
    </H3>
    <P>Kami kembali untukmu di tahun {thisYear}!</P>
  </div>
  <a
    href="/galeri"
    className="inline-block bg-primary-500 text-white font-bold py-2 px-6 rounded-lg shadow hover:bg-primary-600 transition-colors"
  >
    Lihat Semua Galeri
  </a>
</div>

      <div className="relative w-full">
        <div className="relative w-[90.8%] sm:w-[97.1%]">
          <div
            ref={ref}
            className="keen-slider w-full mx-[21px] max-h-[294px] md:max-h-none"
          >
            <Carousel />
          </div>
        </div>
        <div className="absolute flex justify-between w-full top-16">
          <GalleryNav
            onClick={(e) => {
              instanceRef.current?.prev();
            }}
          />
          <GalleryNav
            onClick={(e) => {
              instanceRef.current?.next();
            }}
            right
          />
        </div>
      </div>
    </SectionWrapper>
  );
}

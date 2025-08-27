import SectionWrapper from "@/app/components/global/Wrapper";
import { H3 } from "@/app/components/global/Text";
import Image from "next/image";

const images = [
  "image-1.jpg",
  "image-2.jpg",
  "image-3.jpg",
  "image-4.jpg",
  "image-5.jpg",
  "image-6.jpg",
  "image-7.jpg",
  "image-8.jpg",
  "image-9.jpg",
  "image-10.jpg",
  "image-11.jpg",
  "image-12.jpg",
  "image-13.jpg",
];

export default function GaleriPage() {
  return (
    <SectionWrapper id="galeri-page">
      <H3 className="mb-8">Semua Galeri <span className="text-primary-500">Antareja</span></H3>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
        {images.map((img) => (
          <div key={img} className="w-full h-64 relative rounded-xl overflow-hidden shadow">
            <Image
              src={`/image/galeri/${img}`}
              alt={img}
              fill
              className="object-cover"
              sizes="(max-width: 768px) 100vw, 33vw"
            />
          </div>
        ))}
      </div>
    </SectionWrapper>
  );
} 
'use server';

import cloudinary from '@/lib/cloudinary';
import { UploadApiResponse } from 'cloudinary';

export async function imageUploader(file: Buffer) {
  try {
    const upload: UploadApiResponse = await new Promise((resolve, reject) => {
      const stream = cloudinary.uploader.upload_stream(
        {}, 
        (error, result) => {
          if (error || !result) {
            return reject(error || new Error('Cloudinary upload failed.'));
          }
          resolve(result);
        }
      );
      stream.end(file);
    });

    if (!upload) return { error: true, message: 'Terjadi kesalahan' };

    let data = {
      format: upload.format,
      url: upload.secure_url,
    };

    return { error: false, message: 'Upload sukses', data };
  } catch (e) {
    console.error(e);
    const error = e as Error;
    return {
      error: true,
      message: error.message.includes('not allowed') ? error.message : 'Terjadi kesalahan',
    };
  }
}

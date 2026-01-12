Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8273A3876B8
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 18:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768243222; cv=none; b=VTZ5d09C7chIh973w/XEHysG/v2ujAiKzMQTn/t07fI/VIE6IxHD6CQwggM7MPQ7AJ3KCun9DBja3GdHtZuE7d7WYgw78YcAC7wHmu7Xqgo9y0WeBU7l95ZQbG8trNpBzQso2XjNIEGPLUhlMLyGSyCmacSX4d1M8wPAFcSK4fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768243222; c=relaxed/simple;
	bh=OHkSGWM5a5FZr3JBVwSXr6B5AKsLU8wsvNWyrg0chB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMLzF3HrpCrymnleuoBSUj/YLXHsZfd7LT5zBQhTTZkxJjbt2tibtJ6qCzoYDFsYZIrO5uCcefU3u1Y/zlQQ2wClgzV1xlY0LG/OrEL2N2cQmBLm1BXuVL3NAeFOL1LCF1b+1rg9WGpKrXYNaUHGhlw81Sv3l3zIVJJ/spUq5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xe3E98Lo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xe3E98Lo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so630309b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 10:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768243221; x=1768848021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr07liZHmLMip6iIdHqEY9V1UWyAejdLE5Am+TnacVg=;
        b=xe3E98Loir6wo2PwG2HTsGA7kMoNbmiJzUpdFjJqrSRT2XHicb/lAzhN43dmYZ8gSU
         nf2CAEUTXifkBN6c2+2v1eoI8UoRCgbZ/HkWAPSH5Bar7dvJqkjmT2BwQZCygJWMrTIm
         0Dz8ue4hB2Zw9inw9cSyFA7dVuOU0dKSQWMX49INrhsFfhmX2e34KpWSE1jYbzVh2QE4
         htoc5/ld7zUViaoskOLdaRCROKCEVXxJS8HCV1pLua4oBkR7+Mh3+58ZAFezxh8N0ysN
         5Cfux07mhjO1mm+jd1LATeSiJ1ehMH55Rj85iEcK3C/OGzqKPcT5dNkXhCUxVu7/bBwk
         vKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768243221; x=1768848021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr07liZHmLMip6iIdHqEY9V1UWyAejdLE5Am+TnacVg=;
        b=NpDPw6Lo6HSWJk2fsxUD7AGkNksgQZNuuF3NBJUjJxbEOOFZDXo9vwL26Pk8bE7qdg
         DhihSMBMlNbSPhzUg2+zZgPdoNgeG+/YecKeckkw/wk4SSXnUYLtOJlHHZ2YTg9djhek
         hGKVHV26lshhvE5Bhca2C5wi5pmiJEWcMG0Z++MOwVbxKH0MDFy82xa5CPIhq0Ob13Eu
         xpk+Pd4zNyxJOL9MsQ8y+t5QbVGgkp3p6M7obUmrwWvNDYmXcAk7j36yvYWcQCAquafJ
         TDuX+BNu5T/PbqdAz0ddZ3UvonXQc38N3fmz6/81GlcPmVnO9NOujhE3UaPKAUjCK8wl
         OcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7qMy/MriRSI1fCUvxPboW/DJ6stYCGiNhKul88ihJDxbpDjrIaAjgR7IxiIAMp4mSBZEyuNfSSgFrvQ78rGLk@vger.kernel.org
X-Gm-Message-State: AOJu0YwNXyKzZtXls4zFY8jE4uTJBlQ7F6ECsPjqE4k5mDhsJpUAnSYH
	0rVghXtmilEQV3rT02iCy5XWRxwfqgpVeddTJACitNdGO+FHFSZGwh8w4skynzdr/SQ+WN+u1YO
	mMd29D4k=
X-Gm-Gg: AY/fxX4d6suu2iuO7Ol6/eNRpEFYwQvDb8EvolNp7tEBL7+GAIh4dSDs0f6yIhsUaMW
	H1Il/rs5mp2s5Hm/uWiF28Nj1f+iVGJxjUMAYk2eoPvsuoGk8lWjbaIpad3gTSaZb5lQHfPE5Ik
	WPJR+n8pOeotE1yAzK9PDZCRQZCNx2ZbvS5cXdbRpGdo7FyUqJn3z9RiaF0KWaMMcNI3ZRPU/rr
	NWfJGwHFG0zEW3RF0tT5CXHHL8F4R+qxEuAMrYfpKiN2iF/jNS2vJrPcC/A1iR9ZaowiWgtfu1J
	wapjsnIN74hQj2xKbqU39j3RXFCySZXnpbCsKTJjkrYHmLcIhkwCKBMF+tutyDv/13XJerzuwPF
	eMQ1j7o/WFUT6TLFfQlP4IbUhu/SZgSd/V4QMZidveg/r3xigMOo5F6QzxBP2hCX4YxIQbMZ46F
	edlUR+MN7PeolaIQ==
X-Google-Smtp-Source: AGHT+IGrMkc1tFeu+yIg98c9dBtyifSkZILXyTwGqp+tAakj7s4ZxhyfK0zW2ZSm5XlFZ/RJ/jEYOA==
X-Received: by 2002:a05:6a20:6a03:b0:37b:e946:e279 with SMTP id adf61e73a8af0-3898f9f8c56mr17966540637.57.1768243220710;
        Mon, 12 Jan 2026 10:40:20 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3da8:ab6c:764e:f9aa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c59b024cfb4sm5762895a12.14.2026.01.12.10.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:40:20 -0800 (PST)
Date: Mon, 12 Jan 2026 11:40:17 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Kery Qi <qikeyu2017@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: virtio: fix uninitialized buffer use in
 rproc_virtio_get()
Message-ID: <aWVAEZ5ZWgRkOgtf@p14s>
References: <20260108192336.1826-1-qikeyu2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108192336.1826-1-qikeyu2017@gmail.com>

Good day Kery,

On Fri, Jan 09, 2026 at 03:23:36AM +0800, Kery Qi wrote:
> rproc_virtio_get() returns early on out-of-bounds access without touching
> the caller-provided buffer. Callers of virtio config accessors commonly
> pass stack storage and do not get an error code back, so stale/uninit
> bytes may be consumed as device configuration, leading to unpredictable
> behavior and potentially leaking stack data if later exposed.
> 
> Always clear the destination buffer, reject offsets past config_len, and
> clamp the read length to the available config bytes before copying.
> 
> Fixes: 92b38f851470 ("remoteproc: support virtio config space.")
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index c5d46a878149..8fa8c8a86b4b 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -298,10 +298,13 @@ static void rproc_virtio_get(struct virtio_device *vdev, unsigned int offset,
>  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>  	cfg = &rsc->vring[rsc->num_of_vrings];
>  
> -	if (offset + len > rsc->config_len || offset + len < len) {
> -		dev_err(&vdev->dev, "rproc_virtio_get: access out of bounds\n");
> +	memset(buf, 0, len);

I think this should be done in the caller, not virtio_config_ops->get().  I am
willing to reconsider if you include this change in a patchset that changes all
the other virtio_config_ops->get() function.

Thanks,
Mathieu

> +
> +	if (offset > rsc->config_len)
>  		return;
> -	}
> +
> +		if (len > rsc->config_len - offset)
> +			len = rsc->config_len - offset;
>  
>  	memcpy(buf, cfg + offset, len);
>  }
> -- 
> 2.34.1
> 
> 

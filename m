Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B44D597A
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352062; cv=none; b=Ee0lZjmsaI+AgNx+5uXqlAVK6RIRm37Lm9d6bWITbjWtsd9yChvubrECeWxzyxjcp/YiZ2unnMnhezUueSbYpTuzvuk7RZzmBQByWvyvw31I6HWhmczLR0rcBF8x6L74eChcUc9dFFZPO3NvZSEe2Ip3kjm0QQxkfAwuVl5foHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352062; c=relaxed/simple;
	bh=LwkiBRQLkdHrrUPlICjBGPbg8XGIp8uCBdZgKfAsGwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juDoSif39j21iaL+p1H14ZWSr0EwQ9xd3basoaTRDiY82zR7UT+94J767/ya3C2Po05DPeuoZmDXAOqR85eBWxWFKt+AEeoH6wPXSSlL3EPpcyo3c30dp2wp5Q5hg+VVaObFzaITkjNlA26Tx11KL5+Wi6UkO67BzH+slhTd5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLET+PUq; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLET+PUq"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd54610so279110a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790352060; x=1790956860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNt75hu8DqQhXGUaFQJP3Ps42RUKw7nC/8rcsC581w0=;
        b=yLET+PUq3fu5rQdAYKV+Y+wdsuL4KZeEnoOw+eL6mpH5zxmsDmGcI7Xt4Qzi2BPc7Z
         8nai/5Bodqohn1X1wxt0rX35citQlxWpZrJ+WZWcDvO99/KyybVmYQVljpYdzUUYv5zz
         VHj5JLwOK2BFkljtUc6dQlKQPU9lC54m9omozQSHs1OSD4zt3NWb0J5aanQVDXmcT1kq
         cy/8xdX9dG4hlVG0Xwm+0XjUQ051r5ZpU2rtsqFQrnSL2MA3M4dFMZypMbIgRCL+rxi2
         icU1tgSwuH/o7O75o3+YU9JkRzj5cBefmP5qInqXMBO8mOECCy3VDtF2atDvnK8AT0Vp
         v/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352060; x=1790956860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNt75hu8DqQhXGUaFQJP3Ps42RUKw7nC/8rcsC581w0=;
        b=CwLaA0fni4yDRlZTNyAkULP/6c/E5yPUBeriJihVeWdUQZKg8uJZ3Wfsb9mbDjJYFS
         5zw6/9NY/dti+Y1IVgSsVLgMJHk5ZY3RIqil+7PUhL8sR1OuWQBSvgz+oyfVrVyF5Bo2
         1MfPXNVnRs9LY5wbrh0Va6udNiXFjlKLQJMw+DurzEl3WxCzquylGEqiwC8cYPg3nZ/T
         CxNylefjKvdn1W+CeD00b5r8xSpD+z0VBQhHFJe6dxQOrBxAq7jO3WgDCcFgMaAdPlCi
         U+34V85EXwNBVygYFKFr3qu4Djdz7ZBrXgCSzmY0Zr5yvKq0p8Sv9YLp7lbTlGEN5Kmq
         p8AA==
X-Forwarded-Encrypted: i=1; AKwUvBzxrrGAIj3keEFMapqnWjMwyHxBrtyNU1IYQX/+SMUFf31AMlj345wQFCNm7Xpsnk8IhkrTLDObqWy+pTQGi5oJ@vger.kernel.org
X-Gm-Message-State: AFuF++lOIXePby+wNtvzQXHhAsS90pC6w+BiYCei6AXbQDzEAzmYzns3
	b7pLpdwVDobcunAULy+4DLkZxgjU+urOp8mI/PYSTcGdjstaZWieeRnwWJQcThwQW++CSsxWZuo
	r8RFj
X-Gm-Gg: AYBFou0VtOAxKF6CCWc9/wcjRHk+5XNH2mCoHul3FklmO0WD7Jq2/RpxRA+ZvhOoPhA
	oBtNgFFP+3hQ43MmVu78QkxP7uvzDtfTBLgbuWU1JGe/tggo2rsSdBiGeljUeiWbFMIreJ0rTTM
	Me3Bp/Ca8LIYYUwVTmXO6D/IQnDZWJgW9pLbZX3u66uMzmlhczcebQKUUEkkQgANyFjpy8bVzy3
	er7h/XwTqFPGuENU+/GDmhdDbhzaVk70QKRv9mHKYE/zFFAstrOPnrBvryREVi2dfi061s8YvrK
	3Tm2G9gLs9Cvch5fHZTWCB43c0aqx2ZuhsXTO06lf4hkPt1biyszHZgfDmM+AaBqi0pOdXw9/o1
	BtqfUApzJZsqfMqcfcyJKhFlrztEcWPUXQShl8ZD/OpBeV1AZHEg439KyjN+eSsxkGshhxgYng6
	YIPe3xuoah6L8uKXe7zWJziAkfXNRNKyi7hduPJIx50DomEBwhQioZmRElPyKeahbyrtO/pDs2p
	BdfPsQYJGS7
X-Received: by 2002:a05:6a20:432a:b0:3dd:a196:30a3 with SMTP id adf61e73a8af0-3de0e9b1d50mr5860898637.83.1790352060028;
        Fri, 25 Sep 2026 09:01:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:448f:6909:f2ff:6dca])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm1592606a12.32.2026.09.25.09.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:00:59 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:00:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Siddharth Karanam <sid9.karanam@gmail.com>, afd@ti.com, b-padhi@ti.com
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: Add ti_sci_dev_ops abstraction
Message-ID: <araauCZDetNL85ZM@p14s>
References: <20260922191453.324983-1-sid9.karanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922191453.324983-1-sid9.karanam@gmail.com>

TI people, please review and test this patchset.

Thanks,
Mathieu

On Wed, Sep 23, 2026 at 12:44:51AM +0530, Siddharth Karanam wrote:
> Instead of invoking ti_sci_handle's ti_sci_dev_ops member directly
> in the driver code, this abstracts the property read of
> "ti,sci-dev-id" and the function pointers supported by
> ti_sci_dev_ops such as is_on, get_device and put_device.
> 
> The goal of the patch is to maintain a single source
> of origin for all ti_sci_dev_ops call sites. Any stray calls
> to any dev_ops function pointer members in driver code should
> eventually be abstracted through this header.
> 
> The second patch abstracts certain device ops' firmware logic 
> even further (such as get_device/put_device) via pm_runtime.
> 
> Siddharth Karanam (2):
>   remoteproc: Add ti_sci_dev_ops abstraction
>   remoteproc: k3: Abstract ti_sci_handle's dev_ops calls through
>     pm_runtime
> 
>  drivers/remoteproc/ti_k3_common.c         | 16 ++--
>  drivers/remoteproc/ti_k3_common.h         |  4 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 14 ++--
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 13 ++--
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 40 ++++------
>  drivers/remoteproc/ti_sci_dev.h           | 89 +++++++++++++++++++++++
>  6 files changed, 127 insertions(+), 49 deletions(-)
>  create mode 100644 drivers/remoteproc/ti_sci_dev.h
> 
> -- 
> 2.55.0
> 

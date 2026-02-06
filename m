Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0E2264CF
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Feb 2026 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393684; cv=none; b=LulDDw0QbIcCr272Ole3vO38nuERq4exVVuzNdXqXPQoU1jiMHqZTd6MO1G+WCqsNvP6kQh/6R7FoLZ8rC8oTnFz2mVeciQGnxMyUns7hzvLwr0c08Fy/i8u4W00dELU0gjS8wPNUFAvWMF2TYeqjdIGKk4PRpJqWmFu0JhLwJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393684; c=relaxed/simple;
	bh=IV7QAjuyUw85XIDcqG151gFu0X7JrvrKBJ7KMcj6Wyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E76ahfMJMRAQeP+iIusmugaX6BgnjaitjqoG46/jli1lH572q7b/aWshlSVaw2LuCeU9IyKFj/N5V7vMSI/adnR14QzInbDahzfTDfU4GbGjHj4jt/ODoKPOK4iAGZ1dkRWxvRUG8JJXaWJXfJ1p6foMcOiTVAzEFGM065SwIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEvYpIjU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEvYpIjU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso16340045ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Feb 2026 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770393684; x=1770998484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XMf0JguzxHjMSjmKuASfsYMf0I7uSocPhP7aGXcZdPo=;
        b=sEvYpIjUTPZRhj5Hd+4D5pZFVYY70SIUf9QNSq571FxPhA6BWrGAm4SGMnCym2+AEL
         R0sa2B+9jvWG2P4YJOUQJJbM9dOXAKQcJyS7oL2RLp2w7BYB5RpXMnTfX+Jg0nB4oXtA
         SD584KYtfmpJiDYm2BO5GsDbJ9O6edHU7GAfK1wrFPteGfoUlkeli6yfwqleGNYj7Lld
         9eB+HsV2PTlSX3qk3uE+oO74pXsAbxo5s/McmbA1CtLxASUCJ8bcad/+LIpI9KqxUOHw
         0meRw0YUiIiu1g/uDTeBcIZ2GsOHJh/bRLztUpvsbezzp3jOuxDzAxNC4DbY6Y1idwDv
         FZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770393684; x=1770998484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMf0JguzxHjMSjmKuASfsYMf0I7uSocPhP7aGXcZdPo=;
        b=FnmQibpR+yUqfDnPsczyfvVebvy1ucnLXABOCrkIIm8lEVgKXUWz1BQUscBbR8prco
         rfxpcVnVF73oZX83mA2lsg8hHo/H4ZP1qbyafklCwHqGLYd/fXdoimpQnGoUBxegYf7Q
         oodGtmubPz7qKS+dyRDIX2DvCi2XFVerpYv3MFdda2ar9kr6jDzWNB48WgEVVUMeGhwR
         gwueE6hjYBoCfc3aRZ1WF/FzvAD4O+cTGA80PdFCyVl5fKKiwDi9Rz3/bzvUjD4s3X/P
         rXfTxfvLsglZ9G1Ha+UeV1cxe9N82Pvx1QbHdi9a0a1tTmuVF1g8oE4pn/0J3+Uxp30P
         MG1w==
X-Forwarded-Encrypted: i=1; AJvYcCU5ztz2/nHOCW8WT8HEfnHS0iCvYaoDFPn9VXWH6jdbTnTaeUf98BqhSgKVb5a7z+Z3nx5BQqLzIHBKtZoC9n3n@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPJ3+fr7ZcNj61q686gIEdTR5jfWfoUDtyQ5cxTMWmcdcmsmW
	nsmKh1f9rmGxgARPmmp0f3KKqsQHGgg15J5z7/u66RpA2Ro7LTSq7bStLEYWJAKPkxg4k4lpqYx
	Oih6b/AM=
X-Gm-Gg: AZuq6aLHW+QfXmXkkXJzCdEUIlnHw/tENOSdm6+yKnpcfYBzBcrZlmqiK3CljfGzRlY
	ddJIBxs/ai/36G+/33GN+BvX/ylUtp/86lbRQ9VIHrZnJhDfa4S/2MqGNoTewHTh2aRiOxSUbRw
	636qx5rDGmiTWvvYTd4UAtE9ZJjtNOHuMgkKSdHQqldlJ2q+QnkC3h44bY7ok2ewdj/bAUVxOsa
	M5ccfF5pvjDfWRQZA4pty55GAjwTaZ0u2uAnSfpkwp8lUaLBY1KfDBIFXe+4knXVXuSpJB0y+LH
	nm2ar597dhN28VwKYyXpfWqIg+bmrkldSF4XFHkC6tgBal+dSyAX6gapm3Ui7kJGea6sOXumXAJ
	YMU+tz/INczqpy08ND0tqTBU+zAhxLjiY4wCA19Uo8qSO2ofiSwL/ACg70nCP+HrTmKlY8+Mf08
	a5OGgHo9I58cVz
X-Received: by 2002:a17:903:19c8:b0:2a0:f47c:cfc with SMTP id d9443c01a7336-2a9516d530fmr30153565ad.34.1770393682517;
        Fri, 06 Feb 2026 08:01:22 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fa3:e3b4:3597:587a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638b5sm36621555ad.11.2026.02.06.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:01:22 -0800 (PST)
Date: Fri, 6 Feb 2026 09:01:19 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tim Michals <tcmichals@yahoo.com>
Subject: Re: [PATCH] remoteproc: xlnx: fix sram property parsing
Message-ID: <aYYQT7OGEuGeOP9G@p14s>
References: <20260204202730.3729984-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204202730.3729984-1-tanmay.shah@amd.com>

On Wed, Feb 04, 2026 at 12:27:30PM -0800, Tanmay Shah wrote:
> From: Tim Michals <tcmichals@yahoo.com>
> 
> As per sram bindings, "sram" property can be list of phandles.
> When more than one sram phandles are listed, driver can't parse second
> phandle's address correctly. Because, phandle index is passed to the API
> instead of offset of address from reg property which is always 0 as per
> sram.yaml bindings. Fix it by passing 0 to the API instead of sram
> phandle index.
> 
> Fixes: 77fcdf51b8ca ("remoteproc: xlnx: Add sram support")
> 
> Signed-off-by: Tim Michals <tcmichals@yahoo.com>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index bd619a6c42aa..970a9ef97945 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1005,7 +1005,7 @@ static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
>  		}
>  
>  		/* Get SRAM device address */
> -		ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
> +		ret = of_property_read_reg(sram_np, 0, &abs_addr, &size);

I'll pick this up in two weeks when 6.20-rc1 comes out.

On a separate note, it would help if an example that includes an "sram" was part
of the xlnx_r5 bindings.

Thanks,
Mathieu

>  		if (ret) {
>  			dev_err(dev, "failed to get reg property\n");
>  			goto fail_sram_get;
> 
> base-commit: 85ab651885e1b542ee0bb9ec4642ef0b11716997
> -- 
> 2.34.1
> 
> 

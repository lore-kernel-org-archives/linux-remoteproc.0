Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5C1C5D5E
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151001; cv=none; b=n2LqprqGeML9+y177UQYINfjuoFIEvmM8uvZz5rQwpjtHhKeLFJb7tDZVSRTaHd5S0778pixIrjnNep1xg2IUtq4+TLh+EGUj6sQ5QLP8BD/y+ukE99CklBe3ms9H4lvdHZmqRwuLhVd08FeFXaGf5da9beNnDZYU2hWO7D405s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151001; c=relaxed/simple;
	bh=6V2CpHTmhKt8CXsxhZNW1CrZ0nQaLGnJAyPEhDFtCnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfL5EjYr1lEs+zMHJphYK84yhtz/EuhaKT7/URy575N1l3/mN090wytizkKCMo7RFC1lAHLYxgA6uidZgg/ws7rVfLoHC6w0psBK/HV9IcpKg9ehZvSvaOoznZ2VsDRRibS86FBt3switN/s9DOeZofmiJtVmlNWshS/WwVCG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2PPOnRG; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2PPOnRG"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84236f9b638so2100868b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782150998; x=1782755798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALF4suzKTcfcvIWAEHl1j9uOThw4EM7gFWBHfreRwZ4=;
        b=S2PPOnRGpazD2aBq/lBnWeymNp31ZU3HQxzJtDxXy7QYhomd2bvq4Qlk7mq/ey/aml
         ZtCnxLNX/iZTN+iJgOMnDJ10+l/wNmBhrzQW0E99doJwL1dAWtLGjKFcsGcDPYs9Dpdc
         CXy1IIGCzHU8M6v7kuyVVNKfTmz1QBaq0LfPorNMUfFDYnjgU0HNJYnUI33V00uReepQ
         vnxxgSuOCJSlvXH0hitQAngK22MBWp6lyeMJ2vhs5fECs8N/euVaT8G/65vVUSaOo++M
         INJXPA0zYFC6RoMGu8Yc/L5LU6KBdAwvbDiBXwQjYQ7thcVfkvUNfOy+0XX8UZyZqreb
         aY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782150998; x=1782755798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALF4suzKTcfcvIWAEHl1j9uOThw4EM7gFWBHfreRwZ4=;
        b=cZ+k6Cawu/xezYUc4z9M6VG+4mvxzZ/aXFEBRD+R551toxLQSlz8MYIHhGZzC1vlB7
         TApTEVTvA7yKxKyOIGBTJMDTRKnoLk9tHSvVnQhsyuH9Trmre9PpQDHOqqHhu7r6ijDj
         uBGEOJN0g+qSXZj7gaFxFvKB2mSMyQjfXYypywVGW5Xz4xrlLBffvX44gndm42g4METX
         lntqkEFXPQlv3FRtHIXsmF+chxBh1zdP91EatzYE3VMiWmOPswB+fknpuqLwdNTkPR3K
         Kxeu3/sTFqpWsKdq/9RzHT8Fk6eyHVTKu4bT+DL6alCrFsLajdlhFbdccSb4fLH9Pf/C
         Rqmg==
X-Forwarded-Encrypted: i=1; AFNElJ92/aL4eEKvCPOV9II0gjFEC/pi2hFbV+QIxsbyeGUekUCrV4Wupebcu0jrgjc33t7DXIhoIsfsrONfAzUEnmVf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EGBQYGKB2WM5S1xUswR4ZPBdzVaTwMXHBcuJ1pPHFS5QOPPC
	Arb4YJMqu7XVLEBF9G1+qzcbJfLrUbBKlDZ9OMq4reqVCe/t4Udonxr6jVNzxHBg4v0=
X-Gm-Gg: AfdE7cln+O51zKmotRtVyTUaVJjUlsKonhT+Zf96DewnHWFxZiJ0YzdXTrp8+LZ/BhF
	ViEi8adywZvia0abY0EC27xy96D/kWzK9Hg38rJMxnBI5y2Xwj8vDTsnyfN5R7g/uTAqD1eLz/N
	rXDNCbLrzaEFAref2GzWS02yC5F6WRaznYBKHTqtz2GKiM3Di9gwfYF8vRvzXHNMylpiQoFlOue
	ei4kppxYk9ZYBERwAyacPPaqvBXjVeQD/0EX7Ue2ajp0W3Hx+74fm9ORH7Yjn7Jl+bf8HFCXP5Z
	aBn/gUB/uERRklscFT2howAiP07QrpX/FGO7lepfan6mA/kW/n6eVKNW3IIaV3XYxNVxYzhONLI
	REw9uI1C/ved3P/O7MRDfD0Ir7yCXOy3xOA+HZtN8bDRSuWnhHmLIRvGs2WfJGWS9r2lWQy1xGj
	4EyaKEbmDpc3OcUIQf
X-Received: by 2002:a05:6a00:2d98:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-845507f8ca6mr15619847b3a.19.1782150998393;
        Mon, 22 Jun 2026 10:56:38 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b36f:3823:3d45:dff4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebcf45sm7685766b3a.48.2026.06.22.10.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 10:56:37 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:56:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Use presence checks for syscon props
Message-ID: <ajl3U87N9IUxV979@p14s>
References: <20260612214959.1884404-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612214959.1884404-1-robh@kernel.org>

On Fri, Jun 12, 2026 at 04:49:58PM -0500, Rob Herring (Arm) wrote:
> The OMAP and Keystone remoteproc drivers only need to know whether
> "ti,bootreg" and "ti,syscon-dev" are present before parsing them.
> Reading those properties as booleans misrepresents their DT encoding.
> 
> Use of_property_present() for the presence tests and keep the existing
> phandle parsing for the actual property values.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/remoteproc/keystone_remoteproc.c | 2 +-
>  drivers/remoteproc/omap_remoteproc.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index e7fde5509786..83763d640c4e 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -317,7 +317,7 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
>  	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
>  
> -	if (!of_property_read_bool(np, "ti,syscon-dev")) {
> +	if (!of_property_present(np, "ti,syscon-dev")) {
>  		dev_err(dev, "ti,syscon-dev property is absent\n");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index cb01354248af..6ed0f28edac9 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -1140,7 +1140,7 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>  	if (!data)
>  		return -ENODEV;
>  
> -	if (!of_property_read_bool(np, "ti,bootreg"))
> +	if (!of_property_present(np, "ti,bootreg"))
>  		return 0;
>

I'll apply this when rc1 comes out next week.

Thanks,
Mathieu
  
>  	oproc->boot_data = devm_kzalloc(&pdev->dev, sizeof(*oproc->boot_data),
> -- 
> 2.53.0
> 

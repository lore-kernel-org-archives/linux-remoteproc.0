Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E247F1474C3
	for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jun 2024 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718040358; cv=none; b=Es8gdc+CC43mhAxx+Xi4ML+Wodd1PP61jU0Sn/4RzX/mzsVpioLcCx+Vg4LVJ6AdUj0KCXzyJNlkDmyQ3TSw/i3FoH6FjvcaixNMlntauPEhEjQhSjDm50IEZae1a3JGigFbyUCAGKSVGv+A78rFLMU64OpGe4C6iaGnXiVi6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718040358; c=relaxed/simple;
	bh=3m4/S4G2Yh24KJS9ZtKS2EJOg00cUqAvaAz79rtTSWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiD6wcA0+cnz0x3mngTDKZUilq20lIKqG1APFY6CEK+SVcB+rIJ9nyTyo0r7seIvpRpyYbuycPrUmCMYq+GDkSAMfi4PzGgoGykl+0hi514bKpxVOEVcOb4FC1EmjCAwDLL0QdOZm68kFqMUsy+28T8HA2ocpqjf9ky1sW2+Nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t1YrASoQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1YrASoQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f6f1677b26so14242905ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jun 2024 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718040356; x=1718645156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=abr2ue7yuPh0+wQBY3PyFrKJ/pZr3cN2Ly9RsxIqGXM=;
        b=t1YrASoQzEV04/Jsy5xWnQ7Wp3OKDgt851PCeUvNzJYb3eh2LbF4zuxDcvrVXngB8C
         S4FtvwsjrDo+qKMfYOnlTjT0S/cDVV1cRuIkHgNwlSe9W6n5kZDqTbUhOB2sppZOGium
         9Z9lL8gqF6Zqo/emMWuG8pAwEBOfH4oQc5TP1HjycaIROg4GuzrWVuLK4yND57QAsjCq
         J1cIGoKc8F8ha5rk13SutILtSVR2MY/2nOloAyZWZnXmANeyGBODlM2JHwZ4H6m55XwA
         1ZYvH47utQfZiJ4imZH91xuEYU3C6rK4VdcQvbt8/J/FW5vCvmrK2bwJ7AhzLjE/D5hx
         MGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718040356; x=1718645156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abr2ue7yuPh0+wQBY3PyFrKJ/pZr3cN2Ly9RsxIqGXM=;
        b=msaXtpi0xerpL6cUfP/N5aEa7Ml0P+MZ5Y/6Aed13k6EqLQF8hZ7V/BCBmHRukl3Q3
         9efjq1ucqLh/igmgQsskWnd9ed0iPzHGL5P1Oh9n/l8n80kRo6o0HMmfDzYqT1/V4tLV
         lTEtSnZRBRwhej3RkSf6PXAyBuafPmAieAkEbSH2+G/lVKup3P+4nLml6jOGgjcdrqzu
         46hkWUYyH2Et+NPGr4WQl/iGmgMeh14KFPffdi1Tt0GrQzwqNza6ob8I4Dp0jUbEkMnr
         aqCz7g4k6eWXeRa+uTT5VrseExzldgm1xO2n6fWdK9890jEpz6UmmnQYnStWxScfv1KG
         XsUA==
X-Forwarded-Encrypted: i=1; AJvYcCXBXba6DJgckkJBi+xxwwNA2Qd4L7su5V/aNm5v1e1VQTVJy9hPc0wDI67kok5IMR5gtFT3xcyHH1sxmKW4F7Fc4vSCn5VSCryMcHf6KNBDGw==
X-Gm-Message-State: AOJu0Yz74t8I+RZh45SpwjfaH3oAXLBTwZSxjBkLK1kiactRGWIQ+NiE
	47ur7b2ar/jNNGGE46pVMWkDPm88f02j5EEsjfPAnL8yMoVvGrdhwBLOoC0WlNg=
X-Google-Smtp-Source: AGHT+IGG9+tJMQkgqsvCDc/nEkepy3d2r8n5n6dXzQzqVihO3brF8FWb4ywE8Wcq3W8Wme+D5vSwgg==
X-Received: by 2002:a17:903:230e:b0:1f7:9a7:cd33 with SMTP id d9443c01a7336-1f728792081mr3720315ad.3.1718040355962;
        Mon, 10 Jun 2024 10:25:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9b34:fecc:a6c:e2bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7f7ea0sm86056265ad.270.2024.06.10.10.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 10:25:54 -0700 (PDT)
Date: Mon, 10 Jun 2024 11:25:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rpmsg: char: add missing MODULE_DESCRIPTION() macro
Message-ID: <Zmc3H6PN8WPpgXNN@p14s>
References: <20240604-md-drivers-rpmsg_char-v1-1-675453267fc6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604-md-drivers-rpmsg_char-v1-1-675453267fc6@quicinc.com>

On Tue, Jun 04, 2024 at 06:53:44PM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index d7a342510902..73b9fa113b34 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -566,4 +566,5 @@ static void rpmsg_chrdev_exit(void)
>  module_exit(rpmsg_chrdev_exit);
>  
>  MODULE_ALIAS("rpmsg:rpmsg_chrdev");
> +MODULE_DESCRIPTION("RPMSG device interface");
>  MODULE_LICENSE("GPL v2");
>

Applied

Thanks,
Mathieu

> ---
> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
> change-id: 20240604-md-drivers-rpmsg_char-02914d244ec9
> 

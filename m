Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92754379980
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747655; cv=none; b=M2GrCp3lhi4+uuRuSdUbWYiGobbrmGO5dpJF4ChrVhMm2aBdwIz96Y9sl9GNPjGxgvMpqcSH9XcnRelh0eumr8zcS0kGpUlD0r1eImkonvZ1yKs6s2pTBmPlMfGVhpYZ1z7MnQY3Cr/SaVtbAyVNkXsageR8Z0JbG01SIzXxbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747655; c=relaxed/simple;
	bh=MNQAGoz+ALol9NKgyryDO7AijFzal2oIIYJVBa0fMPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrVzYgWxY5IvEmv8etXh12XRfrzhn0vvBeoM17gVo5yN0coAV4xsli6EdCJJ5C+WyTcj4A1wOa82iMkQiHtTyHV64UR/bhx6bzYyKALCasn49JOaZESeyX8FMYhjkyqiOAxNl13Sb42bVSPJq9FZHse4p9rKDT03/QE+rE028fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=br2Yr/uU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="br2Yr/uU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37e11438c66so1387249a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782747654; x=1783352454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9uvIhHDWUitzJSG00xb1K4ynHXiRoqOBFZ3s7K0F87w=;
        b=br2Yr/uURrtwbOg8COxnsdKoTmHpWGv/2eWgnlLQAS6ikyoYgcQpICv+waUo+ZCucI
         iT8jFw5AI0rqwKbYiRGexatJV+NMCZO1TpAye6GKCZQaZXC3Bb7uxrT1XHTbB14+XVQ5
         DXH56xUJampR30ptS2AXkI0eox+24co13xcfgiQiwbiyUEcClVCE27cIJo5BWjDaq8SY
         420lOrn7uuxb9b9yK8cCsxjH2B7hRnE2O6WWlSAbny+haUMb1wyqbws82occDuq7wflX
         6JtkXLhn4AjnDhtDIv+/l1mrc9ohLycI/RQr2vrGxJVkDKGW2cvUMvGsqP+gyseM7mft
         HYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747654; x=1783352454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uvIhHDWUitzJSG00xb1K4ynHXiRoqOBFZ3s7K0F87w=;
        b=Eawk4O0mChWMp83IcE+EBBm/B65L4OOWpIbGC9B4I8dyjZiJfEtVUdAgOa2oTjmyi7
         Hsagk/61rJbP6oaoUVgInz0mlhVdteCKvX8yVE0N498SU3Jxd7f1fiFCB/w/ShEpU0nv
         tOOG/pw/qc6S53efkFGyVtSdh2SrQPPrdnmYUKMTSTVWdgdagjBPpe78mG0xLhMRfzeR
         zkRfy0ouK1dpQTbS03uvCaMovhszAHefFqVaY48dIr5izyTwu/dVAVnDAvjPa0sxDZBK
         tzo67zSeb2Bm2qd+85GAx4v17q42pivjYFqE0whoCIHJaR+TW3Vmyj5ZIwqzESJgBOqS
         kUUA==
X-Forwarded-Encrypted: i=1; AHgh+RpkI8WQhZGgKK6CE9iIlpaXu0hDPXbB9h4sZAaJrs6L8ExIKB8PGclzrGgwhakvBiguPoTElpxG4vVP7sXlm52A@vger.kernel.org
X-Gm-Message-State: AOJu0YyPoGRvqEAPMuql7R4Hg7RuZwmv+R9ZYpYKfftTBFaYpwHO9WSz
	jfB6M7awTNsbcNKYF1SCw/ONaTM9QR3eIW1K3BmmOX1ApZgB8geq4QQCLLKJTjc09LI=
X-Gm-Gg: AfdE7ckJJilwGuhxVE3cpeuFazMBtFX5H3TE0P0Gshnv4w+c+u7XwtsBoxmNUU8lboh
	H+fXcqXgm9u3ijfqJRwuxj1m480aK1gqd0j/p19hYsT6WmhrHIQ17SXlQfLyv4imuBhIFhHLc6I
	r25ii2oqdtmhmNKvPnKerFI3LKE74fZDV2sEKOhKED6B95irLyE74kgl55jtz8nMTQi6ExeBT2G
	TMPGeoW1X95yiq+mgtHSYAtShJIcQhUgca0iMYjyzNrVDUBwdj7gfezIfwSdJtxZI+Du6a9L6nk
	5LWFJCVSmd8VbXn5xkfqxhGVH6bWScysIsn9UyhDG3w1Adwx1g5bccQdMNeJr7qr4nulkxGmGVQ
	Q3V8WPuLkjkqFwexZOo4shVeEW6qsRS9dNTRgZbRfxEHxYeP+9Qgs1Pm7mMn3LJeZ742vsZboV8
	/y9kfdz9k+A2D809uF
X-Received: by 2002:a17:90b:5746:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-37dfa1ef948mr14589310a91.19.1782747653873;
        Mon, 29 Jun 2026 08:40:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fa9629f8fsm5405003a91.8.2026.06.29.08.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:40:53 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:40:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Use presence checks for syscon props
Message-ID: <akKSAxNw2u4y7Sy2@p14s>
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

Applied.

Thanks,
Mathieu
 
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
>  	oproc->boot_data = devm_kzalloc(&pdev->dev, sizeof(*oproc->boot_data),
> -- 
> 2.53.0
> 

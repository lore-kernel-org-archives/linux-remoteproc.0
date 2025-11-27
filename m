Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB023126B0
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 15:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257783; cv=none; b=Eb/1aEXyvTybTj9T6FIR2ESPKsZ9+wiC+7zJWK3Q9OtTSgGkMWmSm4MFHay72jJkQPxposQ+W4fBaPEDZWo2bK9i1eHQvvqsbrTl02AapE2KB+B43uRwX/nAbzcZTN8Mg+4b3AAzKxxkNvTYV+SgMPAFLBfLid/azmdjS+t6j4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257783; c=relaxed/simple;
	bh=7RZk2pHlQUj40DVRyxyznQQjK2EyOPEd1zVgC1z1Y0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h82lNZGjdBBC7sD1BA2WpjBXSDW73fBooAxJCoi3kYcZ3OKmSq4hk1jO0iRvWVUeYK/lXcK5LXzW8gV8zWyL7eeFsK3p++hMm6FhlOo31OURLqVEv3mmKR/h3D8fyJHyzHKJr0tvL+DqToPEQ90qfe/qfZJ72LXb234C42TuuNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=naydhTUd; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="naydhTUd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-794e300e20dso1095360b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764257780; x=1764862580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6siSnDiVGTZsS7iG2F0xSpzoZMH3VN+sYpf9IBWS2/I=;
        b=naydhTUd8mcEiTA4knyZPkeb88VyILNGtqpL6zTi/Jxod93ul3uwakk1UxDF7nPFv4
         kYwBe5OpN3QLM0w6BJ8GafOnS9ebYpfelDBLoDF8lnPFe6Y6JI7rlmC+buxpYHTMZzMQ
         G7cO6xdda2CGGzZo1eSnPrFt6zVvf76+JeaLu6RAPESFQTm9wgfgSVDzuNgrRavU9mKm
         G+EIFBG9uvUsvDs4+A1I40EBZPIp3PmW7ZTapVVbErAz4cwBEHGOtq/RuaJMlFsLMpo4
         GHrfD5OfIcNkocCa02sv7f+V4uQ2hrxHgG5BikMLJzB24ySZQtK7GM+31BsbmKxt9w/I
         iaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257780; x=1764862580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6siSnDiVGTZsS7iG2F0xSpzoZMH3VN+sYpf9IBWS2/I=;
        b=kqRIAJjE3+ir3Cvu1eoDnI6l7DF9FHck56DcRWsTC6pZubVBSqQ6jLVkOkDKAqmmoz
         qHMFpdJ2hVWh1feDJCwg3nI77Dj2eVHRomB/SP+sU3Lj/t8dyGH+beQ50EA6Iooe70p8
         L7wMPFynX+iBzEErfzKMWWo8cevBXuRHU/L5v/7EAElR00G8SqQrS/ujqeRG91svdw64
         mBjhd1K/yWWvUZ9UkLydTB2ASouyetGXEU5Sii1qHv+msDAprqiKPnFKQiazyckoyIbD
         kxeS/ys15NXc4Cf7E16sHGk7t2U2V1+9cKhA2Zj7+bn4UBq+4tr1yrv8/3rtbgg0+4QX
         7UwA==
X-Forwarded-Encrypted: i=1; AJvYcCWESB1hrU1u6hQZRUqeZ3VSmWN6FJB9SKCtN/f7Gc888k0QcYwTZ7xIeUFQLSlXAFk8oNIJIYYtEUVgS0axMkcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgrFE8jQhq6XhaYoJtGUAMm1sVsxfTrz+er7rUH/362OMFkZpF
	hIFXaEVW6vlY+fmgc1KvmutQUAv6OdS+WN4uiF3vMzTOx7XfiTt39gJ+xqXewu7v0HY=
X-Gm-Gg: ASbGnctP4OpnZyATJzcxa6TVv2PutStCtBmS5lOjwy6xtAQp7jBiNk8bevSYaWj4UEa
	SJv0gjCkTqhAY6pDAZN9r3Yq9S5CnBna2TxmvivYw4HSk5jlXc7wcvqzlWzanAbzFSOMlYE540W
	aDWumtOmA1CSDdaLrVgsF/jteSFyHgZ2/b4I5vfBJ1VZF3uIT4SaNr1j2emF6/2uG6ZQ4VRfHOr
	DJRvuP4FCpKjF1dto0r+RJ2g1Z0AeLZdEfQUVBkuufTxu66PTwswhHzRw2G8OiRh9+DoEjr5MI9
	vaiXs1ZikqKgWRj/9czD2NsxJnx1RwiCGnU0Fow8vYRoYGfP4m7BmbqfKPtjiMQgogLNpnQ8ay9
	wJBhoK9JP+lWHLZxabAhwm+ZtNOWnxYePxdWoGt9QB1DsQoRYBmGfovvqH2jvfpphW5o77QbCWS
	1xq8JKSCbv3g0QhQ==
X-Google-Smtp-Source: AGHT+IFazut7ZcKlnL0DT/Iw4tQemIOZ/nMnozSi86+NKtlcAazOOXJ8k38JC8Q24R2278AB7f5H0Q==
X-Received: by 2002:a17:90b:38ca:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-347331be358mr22188175a91.5.1764257780482;
        Thu, 27 Nov 2025 07:36:20 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475e87fc99sm5019619a91.0.2025.11.27.07.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:36:19 -0800 (PST)
Date: Thu, 27 Nov 2025 08:36:17 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: st: Fix indexing of memory-regions
Message-ID: <aShv8UtdOKcN0Pof@p14s>
References: <20251126-st-remoteproc-double-index-v1-1-3b0a8b21ac18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-st-remoteproc-double-index-v1-1-3b0a8b21ac18@oss.qualcomm.com>

On Wed, Nov 26, 2025 at 12:17:59PM -0600, Bjorn Andersson wrote:
> The recent transition to use of_reserved_mem_region_to_resource()
> changes the while loop to a for loop, but the increment of the "index"
> variable was left behind at the end of the loop, as highlighted by the
> following error/warning:
> 
>   error: variable 'index' is incremented both in the loop header and in the loop body [-Werror,-Wfor-loop-analysis]
> 
> Drop the extra increment to avoid skipping over every other
> memory-region in the loop.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/remoteproc/st_remoteproc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 747bbe7f6f7c6be160f4f6a0202eb8df20dc5bc9..a07edf7217d21a3f08d26592e8a14814608507f8 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -155,7 +155,6 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  			return -ENOMEM;
>  
>  		rproc_add_carveout(rproc, mem);
> -		index++;

Really good - applied.

Thanks,
Mathieu

>  	}
>  
>  	return rproc_elf_load_rsc_table(rproc, fw);
> 
> ---
> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
> change-id: 20251126-st-remoteproc-double-index-29a2e40e74bb
> 
> Best regards,
> -- 
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 

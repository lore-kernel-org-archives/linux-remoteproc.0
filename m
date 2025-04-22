Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42852F3E
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Apr 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310087; cv=none; b=mBxb0Gm7EQfjisdzLC8GB4TjKjDefsDsduFSQXRrQnQmb6ClkOs/M1k3cH1WZitWXYwege7Lh9BgolC/JdJRl2ra/MsWfIE7UzcyzLQRAbYx+59RwEKvLvIBQlUxW+TXafVuHfa7bH4F6ly50XL3q720JF4cWVj3wCvYJGRoElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310087; c=relaxed/simple;
	bh=jpRL4uJSEdZLr7FL6t1JTRk0auYOuocwYz9sSV+moUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrcFI2jqCUeWXB4oBizDphOkwEtPc0sI0s7D3Fa1Y0sV0gOCJ6QuiR8NWixZcwGbN1DGolXpzAbIQALt9kX8FFO8JqxqXpoQy63fF+zhDqfCIPaH6FkGJ4rMgb5nB1SODQG5kmS9Iz7KaP4UllU2QylclMz8jLJnDQ9LLvcDSnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TivrMAQL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TivrMAQL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2843106f8f.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Apr 2025 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745310083; x=1745914883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TuoukROcO2ElaqlkQLbNy3B557q2zcJ5qBkhA4bvFAU=;
        b=TivrMAQLFWx6Cn73WaO66dKGfJsdzVnoy/zPOVAbwif/nja7cHH2iQhRQ1fcfbAXpb
         wop0ifOeniF1JI+ruIVNGylpVpsdWc+4t79QO5ObGLhlmCeiRpihu+iPRGGbDyLKQSaG
         8mSopqRwueuI3Bj/uA2gSgodpZ264A/FlOrduEWWjgo952bQRqS5b3xBqny41kUeLXLz
         SaqvnbGrrJc2jJPTgYgpqV3PLR24XJ1i1xDn0tNPjY+wGP+f+t6Yn3C4+8Yu6PU/csJL
         6p2kuAM7vqpaAuf+6R/BE7mhy/Tp3z94xPlBPxku2EDGZrd1xrTpIWm88bZ36rFnXS1r
         kT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310083; x=1745914883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuoukROcO2ElaqlkQLbNy3B557q2zcJ5qBkhA4bvFAU=;
        b=JR4vFam94RARfRCYEyvb5ut1PsUD+xHgw4qDBNBqW3bUx+T6JYc2WnjrYh8YJ3DW3T
         CIwoPcNj7u1w4A6MxRZbs7v0ribw88aY7MP/89SXkv+p0ISMJQ6wL+GkOybGpK1OGady
         mPyIQK9C8Ug7JhSC8/3iP8B0T+qPszbaiYXtBZhwP1OurXTr63CWcoA+byPcS0yy9IbX
         K6fO8UYjcajOu9kxX4qsOUEeTSXFkR14wKKuBLf9jUTEp8cz7Bis7T5WKcAXYTPTi1PU
         vBsxoxhX+dCKQFwHv1jgujqPJdhHkQJD1VBCXUQdCxo8IUvQ3L9yo4N7lIVsOlFCGoZV
         WGBw==
X-Forwarded-Encrypted: i=1; AJvYcCXCC3aj+gO7SZTX4vhsKsqFn1AegOZjBtW/6wjJWgIept2T+4Wq0DTFIHe8WdUAjqAARGFRfdprU9dAHnmBQyMw@vger.kernel.org
X-Gm-Message-State: AOJu0YzUklHeHLxpwKNYeKrH1Yl41zdXV01/0Wt0PXEdg+XdFQIotlCb
	sDl5OBd/NrD8nhVECX0XHOkbanfyMdUpoYvN98eGtlZpatKPC8rGaKWIpLuWP3U=
X-Gm-Gg: ASbGnct7PZ96jO2GZzcdKHh49PbaSoSAfTrQe44PA9THPbd3y/rXaqdcNGkarPkEd9H
	ku9fbCw7yNn50NA4r3DV6VUW7JbPo27Ojifjopm09UqC6vHB0zsywgnyR6mCdX16r8gP/VaOpo/
	XScm+UTuuN3frg0q6d0hczFg8/n9Hp4jdu3sTSPCN9wJNt//oduzBGMB0+Qj3Ix01MdcZJAniaL
	By6c8wZlJUE0uwXH6xsXZuAB31nnJtE3o6BakcBTbNaHj/M9AHjWBn74EmRxWgYM4OQcXPO81q2
	+40xdWyOTTiqcmdxa+hGP+WiUNAVXSe7EQEtKOXkYyx5079vd4HfFRczn6YuGyM=
X-Google-Smtp-Source: AGHT+IH9tuae0RqMiAjlvkLAuiChQYIp6/1WIla4R14zZPg7A3cy3CyoOen4tg78+umwpPgStlkyhw==
X-Received: by 2002:a05:6000:40db:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-39efbd68416mr11766494f8f.13.1745310083047;
        Tue, 22 Apr 2025 01:21:23 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:28ea:ef8d:b4cb:c00c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4331a9sm14597808f8f.36.2025.04.22.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:21:22 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:21:18 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 0/2] Fix fallback qcom,ipc parse
Message-ID: <aAdRfirB9AnAOlH8@linaro.org>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>

On Mon, Apr 21, 2025 at 04:04:15AM +0200, Barnabás Czémán wrote:
> mbox_request_channel() returning value was changed in case of error.
> It uses returning value of of_parse_phandle_with_args().
> It is returning with -ENOENT instead of -ENODEV when no mboxes property
> exists.
> 
> ENODEV was checked before fallback to parse qcom,ipc property.
> 

Thanks for the fix!

Would be good to mention clearly that this fixes booting 6.15-rc on SoCs
that still use qcom,ipc (e.g. MSM8917, MSM8939).

Anyway, for both patches:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org> # msm8939

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Barnabás Czémán (2):
>       rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
>       soc: qcom: smp2p: Fix fallback to qcom,ipc parse
> 
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  drivers/soc/qcom/smp2p.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> ---
> base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
> change-id: 20250421-fix-qcom-smd-76f7c414a11a
> 
> Best regards,
> -- 
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 

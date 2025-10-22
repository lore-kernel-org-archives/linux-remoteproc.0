Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6B72C21EA
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 17:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154893; cv=none; b=mH8UbAC/xn5hATfFTgKC/RjStD+aefUvUHZ3h/Bn+BgWaktYZWdM+fzY5eOXOHVDv/ZMSZu+QPkdfZ+Y4IuHJ3hoFte4LHe+E9LY1SjgeoVVSQafVkgoYVTLGgpwtyQamx4jz7fvUwoy0J8vWC4ejY+IIJ3et6LNey9vaOrFNsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154893; c=relaxed/simple;
	bh=HLBPhheU6Sdkv+wRlRlVzbDRgyBTZMrIiQW9rt4vggY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II5roxtH+RPEzD3V1YApGSQxreKbabFCEwpD9n1qcsTh/KQsR2b3xKeZlaBPqTMz4pxVgtXNAnIsHtE1OC8l/PMoVeJ96PSXa9GCMi+dZRK7KZf8WlnYarFSYJuNWqdfm5ENu/kJzWmkxFT2mvdyEDX3YnoCtIdxKxeXlMsnnhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jb34y15d; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jb34y15d"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a26b04bfc8so917522b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 10:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154891; x=1761759691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/yVbcNYBKxI7HZmam8giV90V8J7uwfsDvse/7ETWpU=;
        b=Jb34y15dFuzwpYPsSIhaX1Cr1AR7lDSiRuuIiaS6+c+KuINzsKJB2kTk7GN43rdDMi
         wjatJ0vVMnlAhk15gK33TZowcqCApwLU4wSNY/EiJc8tLiHbBaO6MVvBTGaZjiGDx9Os
         CdxLoIRxvico/WD57SxZlSea/ymKKU9/Nj9xA6XuD99yRTvZrBXnaciWNoaOMnDJsUOx
         DQB42mg2uqeqyE2vOFdE9uK3GXPFFcofe1WaWtq5Fe9MkIJYfpcqKPaA3pbrxDtchPk2
         wX6RGejlAe7KECtRqZurXEghXA1gAk/do+U6gCT1RMVTZRdRXuVWSVYE4Ih8q9SrszWv
         72jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154891; x=1761759691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/yVbcNYBKxI7HZmam8giV90V8J7uwfsDvse/7ETWpU=;
        b=ClQdMwwCb5WfBWjhihb+aDSLB5RQnYhgkcKiM4AhdZzQbdJ1twyqBCRRi2Pj8DShfn
         m7M47w6Towh+Z5SkGIy0VUXu4cVfckS/p2jd1KtVSRqiatBT8eWsFTCnv4mKyZAPm2WW
         gqMwoP7geVzvkS1053Mb3UED7kBEzkN1kRmsUkVVfFBTcqsJXve3utyKJZby6HVCCZqM
         bgjo3eDQAoZj7HVTKQPQAdSORiyh78oajF8/4GCvGShKdFiA3oNgCvACqnQiuq4dgN44
         YqXpLRpzBbCuYELcgO4SPGirWCBLMIqgPbF1yutZcS6X/RP6VL3UsX7hbqN3BSqHVVPn
         bQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgw66BiQ/PGeCXQT+RWnbwHlY44NH3b0jm1b7hJxOLvBm0FFgmdGYQcJl3uvvfktAFprAAX2iJeXQEI/oi/Kqb@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8TEHcVEA1gTsg9ox4VXBJibUsmEaf7pr5RuccFPaAjqFjXJR
	OkGa9QTEVEfwjmJN9W20/9dmNMPQ7RA2RFumou9iWwgy3JfQx1GeWSQIfkYdMyUu0xQ=
X-Gm-Gg: ASbGncuEfK1algboJFbjNRZ4oCYaJu5R9R3F/CQ6kwVwkLIg8ak8WQP8hG/18RsWUd2
	H7pXWDZneqzkETgdTcaBt/EKGcJ3yCgifulrdg42EXJfSUmoxVD8F41BtBGWoe7TQj7E+S0zPgl
	UQS3X8dhCjBB87B+ARd4WiCdeXgEyv661xfD0RO8PbY+cIfYyoY/bKpiHKm+u9nFUm48tNM14GZ
	estLn2bmMuhxG2VbtHnjIZVYiLXNaicCHNdspI4PObjyihsAogM8BGEME/B9cL4W4hoCPgTul43
	lgmqnSML2a4LbBkVWkxlAd+TGCbojFjyQn6w9irPSSEjOdAz/7tirYiyGatC97ZganaBtkdW+GF
	N0EXoMKJD8uOpgEr81J6S+Z0YBqltpu0tK6hvBDSHAmKlHAxqtG7DQoLhbVGIEzD5RS1BoYZuYV
	TNkjTJ8eJuX0vyIg==
X-Google-Smtp-Source: AGHT+IHjwdJFhyPffGM4FBkB+w0a69ezxil2LnB/hHwjzMGVo9Ioll+93XMe3fLrl1LPLka9UTkijg==
X-Received: by 2002:a05:6a00:9a0:b0:771:ead8:dcdb with SMTP id d2e1a72fcca58-7a220a7e712mr26747780b3a.8.1761154890617;
        Wed, 22 Oct 2025 10:41:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7843:84f1:e4ca:d99d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff39654sm14983897b3a.31.2025.10.22.10.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:41:30 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:41:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] MAINTAINERS: Add an entry for i.MX remoteproc
 driver
Message-ID: <aPkXRy7TsPCrq_s-@p14s>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-5-b4baa247358d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-imx-rproc-c3_1-v3-5-b4baa247358d@nxp.com>

On Wed, Oct 15, 2025 at 09:52:59PM +0800, Peng Fan wrote:
> Add an entry for the i.MX remoteproc driver
> 
> Acked-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c9cdb95dc150a55df405adc3cb853c61f4c2b467..02dea709a5a5d591f156becd35640dfd93fe62e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18610,6 +18610,15 @@ F:	Documentation/devicetree/bindings/clock/*imx*
>  F:	drivers/clk/imx/
>  F:	include/dt-bindings/clock/*imx*
>  
> +NXP i.MX REMOTEPROC DRIVERS
> +M:	Peng Fan <peng.fan@nxp.com>
> +M:	Daniel Baluta <daniel.baluta@nxp.com>
> +M:	Shengjiu Wang <shengjiu.wang@nxp.com>
> +L:	linux-remoteproc@vger.kernel.org
> +L:	imx@lists.linux.dev
> +S:	Maintained
> +F:	drivers/remoteproc/imx*
> +

Here I am suggesting:

M:	Daniel Baluta <daniel.baluta@nxp.com>
R:	Peng Fan <peng.fan@nxp.com>
R:	Shengjiu Wang <shengjiu.wang@nxp.com>


>  NXP NETC TIMER PTP CLOCK DRIVER
>  M:	Wei Fang <wei.fang@nxp.com>
>  M:	Clark Wang <xiaoning.wang@nxp.com>
> 
> -- 
> 2.37.1
> 

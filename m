Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5642581
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728627792; cv=none; b=FkeLAXeKgC1kCSwZ4rDhuaY1hbW87NxTFcJ2ADtLbvcjFyyMI2qLaOb+crNe4PcZqzFSVQxhpOj42DQgwpdoAdY9Y6vl8O552sRwpLAXzYzLhfhgsPWMBNqPWnb3qSB+hGG85g8642dR3grUHWFSmO//nI0fx0IqHfWBc9I69gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728627792; c=relaxed/simple;
	bh=lGL2zudva3PRMRclo8atT5JbtWZx5V8a+DPc/vc+m6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYzKiSSPIlrkdLUplre1TLdqFNW94G26G7PzbM4cAU9gTQzxinBq99PJm/dlkXT87aZONt159znd/qcrUO4T99hmX/puNkEYuDZkwGLdBDi6kyrmeeQ5sCF7FEC074/9nN1HOS0olC3QVL4qkBTsfnIda6j4hLiaI66V9S4gY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+Q9cXhn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+Q9cXhn"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fac787f39fso18162841fa.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Oct 2024 23:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728627789; x=1729232589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+66qBP5RTplFkJY/8jD5uvkbysV5iQP1YfCKZCtuPZo=;
        b=T+Q9cXhnqyR4kRiCw4O6nypQ3tBWIx5nurSdDsKt5luMJyxOId2rdiLPznpFhhws2H
         Ys01RSy8yCt6ogBoJOi5HjI3y39qt3nvSIRcApK/u8aUuis35BTieLuC/lA/lVK4brz1
         fpCBb0BHNsPR6dTaSaWYQMtNDgIOlBm4Gf2UQHri18ycCttO0vqbAVrmOx+PkcaXo3ty
         WC2OMB4CKJUEyk6Ld6g5wc+YjWmGZCsKi9KC1anVFYn0+h5Zpg+FUFS9rMgzQmHha8+Q
         a03nOX1pDX3bf9cK5wOeeDQXqQ0rnxV/ttLPboVN95dThkZw4iI9+f/85qnnlwLYvqAJ
         mEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728627789; x=1729232589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+66qBP5RTplFkJY/8jD5uvkbysV5iQP1YfCKZCtuPZo=;
        b=IkFlkrhLg/y3I0b+PKabM2wasdh86Lu3enQ+bJeqhyJQdgiITzzNNsAeLS9EfLISXf
         vOQiVQdjRIf8jsYHmiFHHgSt6g965Cu0SjiIam1nKMji059AhIr87uKN2PobsKChCSft
         2lniumhKoSg4BZzsXtwy0NZYJJSUFmRXZgYDRXUZdwqvhxWr3ttW4VAES0xs9uf9Cs5v
         XXIf4qlpRfLPcXOS22JPFjAtt8P2dDGDky9pGlK0Okzmss3gxJauF5qLzF4NYFp8CDZj
         QwB4QAkISWSiTyk1rrky+x7+7M/MH/Zeb8RmyF0Cs8dLiWEDXvnimeWgJ48nozoCG7mF
         kiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Q1xeGCcWuDincr4GZk6VgcULhhxRyGosOG2IwaKBrCdlmPRzbYXIAtvBcJNiEH2Vir50YqkviObyqcb5jMqa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+NRTYXZyPl3+1FLUhH1c7UsvEQdoj5AppSX/yp4qfmqRJAT2M
	IS0fO5XosQsBHV8wm556PviFwYVdZ0tAKYZ1DdkKaM3M7P99me2b9EHAeq3raeo=
X-Google-Smtp-Source: AGHT+IHCIfQJ+SRkd4XZpTCXVrOgDK7K7sE9IEMPhnapSgMoQpsDW9JbBAmGMcFr5pJNJdu1Wq8RaQ==
X-Received: by 2002:a2e:bc07:0:b0:2f6:484d:cd61 with SMTP id 38308e7fff4ca-2fb329b2f39mr5886351fa.43.1728627788822;
        Thu, 10 Oct 2024 23:23:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb245b16cbsm4056301fa.62.2024.10.10.23.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 23:23:07 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:23:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Shiraz Hashim <quic_shashim@quicinc.com>
Cc: neil.armstrong@linaro.org, Mukesh Ojha <quic_mojha@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge
 support
Message-ID: <rbek5diyuwhquhbhk6pukzv474xug3pupcqqc2svrceyodvem5@obah2ahgmcox>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
 <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
 <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org>
 <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>

On Fri, Oct 11, 2024 at 10:35:18AM GMT, Shiraz Hashim wrote:
> On Thu, Oct 10, 2024 at 08:57:56AM +0200, neil.armstrong@linaro.org wrote:
> > On 08/10/2024 08:21, Mukesh Ojha wrote:
> > > On Mon, Oct 07, 2024 at 08:22:39PM +0530, Mukesh Ojha wrote:
> > > > On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
> > > > > On 04/10/2024 23:23, Mukesh Ojha wrote:
> > > > > > For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> > > > > > translation for remote processors is managed by QHEE and if the same SoC
> > > > > > run under KVM, remoteproc carveout and devmem region should be IOMMU
> > > > > > mapped from Linux PAS driver before remoteproc is brought up and
> > > > > > unmapped once it is tear down and apart from this, SHM bridge also need
> > > > > > to set up to enable memory protection on both remoteproc meta data
> > > > > > memory as well as for the carveout region.
> > > > > > 
> > > > > > Enable the support required to run Qualcomm remoteprocs on non-QHEE
> > > > > > hypervisors.
> > > > > > 
> > > > > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > > > > ---
> > > > > >    drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
> > > > > >    1 file changed, 40 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > > index ac339145e072..13bd13f1b989 100644
> > > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> 
> <snip>
> 
> > > > > > +		struct of_phandle_args args;
> > > > > > +
> > > > > > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
> > > > > > +		if (ret < 0)
> > > > > > +			return ret;
> > > > > > +
> > > > > > +		rproc->has_iommu = true;
> > > > > > +		adsp->sid = args.args[0];
> > > > > > +		of_node_put(args.np);
> > > > > > +		ret = adsp_devmem_init(adsp);
> > > > > > +		if (ret)
> > > > > > +			return ret;
> > > > > 
> > > > > Why don't you get this table from the firmware like presumably
> > > > > QHEE does ?
> > > > 
> > > > Well, AFAIK, QHEE(EL2) has this information statically present
> > > > and does not get it from anywhere., but will confirm this
> > > > twice..
> > > 
> > > Double confirmed, device memory region required by remoteproc is
> > > statically present with QHEE.
> > 
> > Right, in this case why those tables can't be embedded in the elf
> > .resource_table like it's done with qcom_q6v5_adsp.c by calling
> > rproc_elf_load_rsc_table() and let the remoteproc framework load the
> > resource table and setup the devmem ssmu_map ?
> 
> Mainly for two reasons -
> 
> firmware images on platforms where we like to bring additional no-qhee
> support do not have resource table.
> 
> QCOM PAS implementation for secure remoteproc supports single TZ call
> of auth_and_rest that authenticates and brings remoteproc out of
> reset. And we don't have provision to authenticate resource table
> before it is used for devmem/iommu setup.

So normally TZ / QHEE have the platform-specific resource table? Isn't
it tied to the firmware binary?

-- 
With best wishes
Dmitry

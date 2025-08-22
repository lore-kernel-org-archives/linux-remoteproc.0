Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D4A2868B2
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755879988; cv=none; b=R4AveL0DtYlKLc6MU65ByxlybGxUnZ9KfGb6TZBwPhUp7NQLBt4Q722a/eHzSAPQVNG2cX/D0bmyj1IVuipm9UeK9V6wts+42AeDvng7R5nj6afi8zv26HGyuqtWT4ntdAvH5pER++5VmjV+/c1KZQMOpJSNloGtaN0wRL2obvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755879988; c=relaxed/simple;
	bh=mxyLcgsxU4cWWi9F7ul8/tsDTeLFy4cOZvkdp5AASzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2ZH5PrYLh3R7RLnKfwKCqXvZ+STAmfaClU0kE5fP/GcBubZOmkcxzZXH1QmcIFYryHOA9vsQcVlB4nhzreA9TJNgPdq9oZupDmd6sSbHUc2xkLNL5oO0M3aj6KqVJmNugrx/RzLQ1TbfgPN8W8WxTWkI7nzI7mUmUsQldv5VyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z52u08De; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z52u08De"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so18956275e9.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755879985; x=1756484785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P725ykDzVet6+jFt/VbB3WZRd67bIf5RvVxJA2aNQrc=;
        b=Z52u08DeZqsicJ7xNwafQT+2De6bNmStSUH8K3iB7JF43T7jxVUVQIy9bvK2K32PL1
         y89gfkGdC/3Zwz8H65//JvP4/gLtri+oIgVsGoMdDi7akKW/ij4xg/SJ8bJiH3BFIkFu
         3K2QqoMDn5nanxMUmljM9T6woqGYqJMlC5BMfapGHSuKXl3i/BV5go8MCMzMw/+XoP+a
         RRCJXbFaYA4YmqtkA+SRh241bJHsbm/FEPf1XPNxt1p6zT4Y4riOUjCL0ElgZiPYX619
         985RstA/IaQi0f1eouZflOLR5Tef5lm/WmEW3theU9B+NbFnJbJAgLc4HgFLsqQcVWBE
         5z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755879985; x=1756484785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P725ykDzVet6+jFt/VbB3WZRd67bIf5RvVxJA2aNQrc=;
        b=mjl7U6cd2X698NMFDXvFKBBhFNHvnhaBuOgTNw65oDsiwGjg2T36ie1AbLTINwxO1V
         +rzaQ79zuJwqSQy3uOnIrE6stxAhA8pYeTGLUb9zq+clNkfFALyE7uXqnGvAXi481niM
         p5NZAj2WNTXAG2uM5lUrEdfwOj9uNMQftexIH/OrA4xWMDVkolQrkc/xuTsxkRwr+Vgx
         AdNKAkQXapqW6fy/pcZGVP72LvQ8DOIWmDosvvgMjTgXWfUSVQptFVY+aUvV4lvK/OdH
         vRvDus0j+j9akWlqOxFp68kA17UhORAvFgmPX6tj7rp2oO9JFG+OIJMpybdQipe4HPVB
         408g==
X-Forwarded-Encrypted: i=1; AJvYcCVyxWVYPsjYeX0q2u2YKxLGJhTLnKIaM7Tjs+Ed9ZC8Ge/UO3kicqAIyWstRcOZbKhjXY9pCVSPqDUzgY1JWrl6@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFRQGHFmpOIUJU4M77f4dWcnvhZtsLgDubmkBnIeHdeXg5BAC
	YcUvIOJ24sX4/44IG/FnZ5pd6fQGduIx6oq9jZ0TX2UUYpGc7OncFATyIC0SP/E4gzc=
X-Gm-Gg: ASbGncs1Mqw5OJ5idXaNOk0UFjAxxJtvyM4tash0+qERPA69+hU919F7p+3OBRE1fyY
	FusaT6adUGzLAokXUoauXpUmmN/BaK4GAvReC/kWdbwpapOIRhPFtchF1kBWfIQzLSjTxi3ry5s
	2TpS4qckUasUewsJZcFwxwanZuDrjNz1ETx75IN6WPUICjwG7GxxLWq79wV8yl1gHw6WfEwfYOC
	W9DCuG75Xff2GbuB0VkhSA4EXJEvCFShGdWJrckJ7ZOcmJuwrPA2XLtKgR5WxxgvgsPw2f5E3GM
	iZfuq6AFSucpcyHrQ0zK2sfesxM2ovEBvdRpq2LH7E/u3B8iHzce2hykQVR6Mh/VKFiyozkRmFP
	lGV4H2ZqrvfbdCRqN++JFX8NmqnGfVzqj
X-Google-Smtp-Source: AGHT+IHaMKfNGJO+VhkkDQn+ODLTdkpwVQhfV+Xh1dBzCWDIxaQTy7uymuz/hWmsYGH1xFeLJ+hrGg==
X-Received: by 2002:a05:600c:46d3:b0:459:dde3:1a56 with SMTP id 5b1f17b1804b1-45b517d2ab6mr30590955e9.28.1755879984629;
        Fri, 22 Aug 2025 09:26:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:41d7:483a:fa:b4a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5748e743sm5191305e9.17.2025.08.22.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 09:26:24 -0700 (PDT)
Date: Fri, 22 Aug 2025 18:26:19 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <aKiaKwkpdKHSH9YS@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>

On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > >>>> +int iris_fw_init(struct iris_core *core)
> > > >>>> +{
> > > >>>> +	struct platform_device_info info;
> > > >>>> +	struct iommu_domain *iommu_dom;
> > > >>>> +	struct platform_device *pdev;
> > > >>>> +	struct device_node *np;
> > > >>>> +	int ret;
> > > >>>> +
> > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > >>>> +	if (!np)
> > > >>>> +		return 0;
> > > >>> You need a dt-bindings change for this as well. This is documented only
> > > >>> for Venus.
> > > >> You are right, wanted to send device tree and binding support separately.
> > > >> But if required, will add with the series in the next version.
> > > >>
> > > > You can send device tree changes separately, but dt-binding changes
> > > > always need to come before the driver changes.
> > > 
> > > Do you mean to update the examples section[1] with the firmware subnode,
> > > something similar to venus schema[2] ?
> > > 
> > 
> > Sorry, I missed the fact that the "video-firmware" subnode is already
> > documented for iris as well through qcom,venus-common.yaml (which is
> > included for qcom,sm8550-iris). I don't think it's strictly required to
> > add every possibility to the examples of the schema, since we'll also
> > have the actual DTBs later to test this part of the schema.
> > 
> > I would recommend to extend the description of the "video-firmware" node
> > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > TrustZone, so the description there doesn't fit for your use case.
> > 
> > I think we will also have to figure out how to handle the old
> > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > handles IOMMU from Linux). Simply checking for the presence of the
> > "video-firmware" node is not enough, because that doesn't tell us if the
> > PAS support is present in TZ.
> > 
> > I have been experimenting with a similar patch that copies the "non_tz"
> > code paths from Venus into Iris. We need this to upstream the Iris DT
> > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > which doesn't have functional PAS when running in EL2.
> > 
> > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > or directly with the registers. I don't have a device with the new
> > firmware to verify if that works.
> 
> You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> video-firmware's iommu property is also important.
> 

Yeah, this sounds good.

> > 
> > I'll try to send out my patch soon, so you can better see the context.
> 
> Are you saying that you are going to send patch to support IRIS on
> x1-el2.dtso in non-secure way i.e., non-PAS way.
> 

The background is the following: I have a pending patch to add iris to
x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
was to disable &iris in x1-el2.dtso (because the PAS way seems to be
just broken), but then I saw that e.g. sc7180-el2.dtso does have working
Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
code as-is from venus into iris works just fine for x1-el2.dtso, so
disabling &iris in x1-el2.dtso just because the "no_tz" code is
currently missing in iris doesn't sound right.

As far as I understand the approach you use in this series does not work
without the TZ changes for older platforms like X1E(?), so adding that
code in iris seems to be the best way to move forward.

I started working on a patch for this a while ago, it just needs a bit
more cleanup. I'll try to finish it up and post it so we can discuss it
further. I think the IOMMU management in my patch would even work as-is
for you, you would just need to toggle a boolean to use the PAS instead
of accessing the registers directly.

Thanks,
Stephan

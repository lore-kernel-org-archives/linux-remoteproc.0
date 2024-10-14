Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB541A724C
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Oct 2024 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728909510; cv=none; b=RZteOWGOzVwNf8lQ/GwzaHxvYkEFVlMhr3pcXccktKoDwLWP6ofJ7ZB6oWKb9ZlpOWweGzmkJZqFHFFpJQugtyR2KGLnUHTa/MySBlBI32I19nOfohguMFGFBZYd8Fhzb62PjLLrpd4fVBJf63Lqyq9ZKKiyOxwUgRf4OObnRiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728909510; c=relaxed/simple;
	bh=oHa3sg3yHV3049lI3ps4FusUnEkYwbD8hi5+N5Daiy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERuPEweA8LD4gi4jTRWEi74a9p1IBbeLxwnV9TcMNckf/D/a+6hUKJnBwDrMxgfyWhYLf6vt50dal4qFpGEYFVowjuEP5Iifqc197MvmsDcPk0uzT8T8aWuNGOeZgICA2dj0F7J3cWEUJWANjcPaKOjFEroPWlXt1y9+yt5tICY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xc1d5mKy; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xc1d5mKy"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e3b7b3e9acso823067b3.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Oct 2024 05:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728909507; x=1729514307; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1KbYaY8K1HyomNgb7KZneANES2HAfN5golvwRDEYq0=;
        b=xc1d5mKyHrNYrV0HIPZ7QND5PJkJ5nYSfiy1q+E6MhW5lylBK6PaPLAU9ofIU8+JU1
         U0i3fDuvm6Wvq33IfHWOKUx39u7Exi5QWtoKFkQFG8vII+Y8Kj5ZeAwl/XXCdUF2TZMM
         bR+KyUPoWq8+nto5ClQfE2/n45bekjIwJ2dvbruwczhdEGsgYVlhcmnXiGaSY20VJmGr
         rCve7xk7jBEq7jZkTkDB39wAZGTw6ScvCwlSQUyadS4XCL7gc+RHhJS9QKXUuAnHzywX
         qYgy5YMTSHKBoI8J3W3aIKv0sXiqwSmNH71jEf7rW7bx9OS4iWbgbrPMn+PI1jclNBlA
         1IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728909507; x=1729514307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1KbYaY8K1HyomNgb7KZneANES2HAfN5golvwRDEYq0=;
        b=BzUlTBVLgcmnA2rcK/4K+LQ5PB+YQISnXyKVU6k/Q8ycjQ5aXf15yhoBjGg3vSaAD1
         D5vM86Xtt83iu/v1VgGZ5O6LAHIIAHcv3Hz/F2VJVPk97OpgV40Q5aeHwJBntzPQbKFi
         rqUGm4rBzAoRT8YbPTmMB8nMYooNG7an8q1+etHZJW76xBA19i1PwssbSEeC3p81PV39
         Rv5NhWmDjz+lmWrwRekLJIIg+1Q53Qorws4A4luytoZ0tOCIbv47smrS5DNv1WcHmCzt
         YGmJzpl5061a1+77Pk+ilyQPvrdU6WacH9qcjrVbilI5oVBgh9hbcs79Xm7dEwXmqo4M
         PGFA==
X-Forwarded-Encrypted: i=1; AJvYcCVY4doizbHoJbFvBXpyc4KANx/iTLFDl/wjzD/TWXJriBLf44ZF96Elzz/JCrFm8mH08ZPNWiYWxaVoQy4b2of4@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrNpFo9rpTflUBhkmdzaI/nJlFn9jFxsRU3dpzlwsUyg+kB23
	cuj7pEt65snqg0Dby1fKe76k1XP4/jleV5xeIGcJDvLLKheMgZruZOLT694DwaZJGFEwFsmYo6l
	9VHgRkCBo9/Rfh85fXv3YkUsPhKbmaig4QpgG2w==
X-Google-Smtp-Source: AGHT+IEKIdxBvlCxcN3OTA+lxiBN4vMcu1QKbPOFmZXvDAC8Wzl1E/L2HknIRkdKPJzI017CldPFHbvAP7ZSwnk5K/U=
X-Received: by 2002:a05:690c:d90:b0:6e2:ac0a:8926 with SMTP id
 00721157ae682-6e364107deemr49225887b3.9.1728909507273; Mon, 14 Oct 2024
 05:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com> <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com> <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
 <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org> <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>
 <rbek5diyuwhquhbhk6pukzv474xug3pupcqqc2svrceyodvem5@obah2ahgmcox>
 <20241011070907.GK1421305@hu-shashim-hyd.qualcomm.com> <CAA8EJpr7KmTXv8WyxuhAprHoPku_YCt0fz74gd+44OeOT0uKqg@mail.gmail.com>
 <20241014123135.GB2147073@hu-shashim-hyd.qualcomm.com>
In-Reply-To: <20241014123135.GB2147073@hu-shashim-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 14 Oct 2024 15:38:16 +0300
Message-ID: <CAA8EJprhdRf5Kk2WAMHKEoqZ9JWXfd_sitknxM0NGrRiQeiFoQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge support
To: Shiraz Hashim <quic_shashim@quicinc.com>
Cc: neil.armstrong@linaro.org, Mukesh Ojha <quic_mojha@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Oct 2024 at 15:31, Shiraz Hashim <quic_shashim@quicinc.com> wrote:
>
> On Fri, Oct 11, 2024 at 10:12:09AM +0300, Dmitry Baryshkov wrote:
> > On Fri, 11 Oct 2024 at 10:09, Shiraz Hashim <quic_shashim@quicinc.com> wrote:
> > >
> > > On Fri, Oct 11, 2024 at 09:23:05AM +0300, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 11, 2024 at 10:35:18AM GMT, Shiraz Hashim wrote:
> > > > > On Thu, Oct 10, 2024 at 08:57:56AM +0200, neil.armstrong@linaro.org wrote:
> > > > > > On 08/10/2024 08:21, Mukesh Ojha wrote:
> > > > > > > On Mon, Oct 07, 2024 at 08:22:39PM +0530, Mukesh Ojha wrote:
> > > > > > > > On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
> > > > > > > > > On 04/10/2024 23:23, Mukesh Ojha wrote:
> > > > > > > > > > For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> > > > > > > > > > translation for remote processors is managed by QHEE and if the same SoC
> > > > > > > > > > run under KVM, remoteproc carveout and devmem region should be IOMMU
> > > > > > > > > > mapped from Linux PAS driver before remoteproc is brought up and
> > > > > > > > > > unmapped once it is tear down and apart from this, SHM bridge also need
> > > > > > > > > > to set up to enable memory protection on both remoteproc meta data
> > > > > > > > > > memory as well as for the carveout region.
> > > > > > > > > >
> > > > > > > > > > Enable the support required to run Qualcomm remoteprocs on non-QHEE
> > > > > > > > > > hypervisors.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > > > > > > > > ---
> > > > > > > > > >    drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
> > > > > > > > > >    1 file changed, 40 insertions(+), 1 deletion(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > > > > > > index ac339145e072..13bd13f1b989 100644
> > > > > > > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > > > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > >
> > > > > <snip>
> > > > >
> > > > > > > > > > +         struct of_phandle_args args;
> > > > > > > > > > +
> > > > > > > > > > +         ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
> > > > > > > > > > +         if (ret < 0)
> > > > > > > > > > +                 return ret;
> > > > > > > > > > +
> > > > > > > > > > +         rproc->has_iommu = true;
> > > > > > > > > > +         adsp->sid = args.args[0];
> > > > > > > > > > +         of_node_put(args.np);
> > > > > > > > > > +         ret = adsp_devmem_init(adsp);
> > > > > > > > > > +         if (ret)
> > > > > > > > > > +                 return ret;
> > > > > > > > >
> > > > > > > > > Why don't you get this table from the firmware like presumably
> > > > > > > > > QHEE does ?
> > > > > > > >
> > > > > > > > Well, AFAIK, QHEE(EL2) has this information statically present
> > > > > > > > and does not get it from anywhere., but will confirm this
> > > > > > > > twice..
> > > > > > >
> > > > > > > Double confirmed, device memory region required by remoteproc is
> > > > > > > statically present with QHEE.
> > > > > >
> > > > > > Right, in this case why those tables can't be embedded in the elf
> > > > > > .resource_table like it's done with qcom_q6v5_adsp.c by calling
> > > > > > rproc_elf_load_rsc_table() and let the remoteproc framework load the
> > > > > > resource table and setup the devmem ssmu_map ?
> > > > >
> > > > > Mainly for two reasons -
> > > > >
> > > > > firmware images on platforms where we like to bring additional no-qhee
> > > > > support do not have resource table.
> > > > >
> > > > > QCOM PAS implementation for secure remoteproc supports single TZ call
> > > > > of auth_and_rest that authenticates and brings remoteproc out of
> > > > > reset. And we don't have provision to authenticate resource table
> > > > > before it is used for devmem/iommu setup.
> > > >
> > > > So normally TZ / QHEE have the platform-specific resource table? Isn't
> > > > it tied to the firmware binary?
> > >
> > > Yes this table is with QHEE and not firmware binary. Now with no-qhee
> > > case, this patch series is proposing to get it from device tree.
> >
> > If it is platform-specific (rather than being device-specific), then
> > it should go to the driver, not the DT.
>
> Just to be clear, your reference to platform is SoC specific and
> device is board ?

Yes.


-- 
With best wishes
Dmitry

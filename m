Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCAD41A80
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 20:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716410567; cv=none; b=Tp+ouN1v2oEuULI/BRVziCDW+8wGL1z0cyubwwcml4KMbDat/9e6ykSsfIok5nAXC+mOmkGfO8Sfw8MJjLc5SnYdzJP91im7/bUlFlSvAYx/mipHrWPnA3T+8N5C1DkcpTwnEzwBbeEck3PpJ+8twyoRbcXeIEtokXr2ULL05fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716410567; c=relaxed/simple;
	bh=GH8a9YWFjmrvE5LV9apSXfEDSz8b8pwNnV3zU4znXIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnP4JclzbU9GraW0JNo2kVNBoxA9RTD53ZK+nvlVkPTCN3NtNrmlhv5U0i184v7ldOq0BibX7WGtE7/HGe8/inTEhVfUFRNoT5Ws4cE8gFEme8zj8srHVwG2ezp8Q6HzKXgLGR7eH+3qiBaN29wnIPUahoWvXXm0G6IR/dnIrho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KTU6CVYL; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTU6CVYL"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-620390308e5so16470467b3.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716410563; x=1717015363; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PCB4Xldgcwvrmyw7KvTXZs/6ZjPvLBzZXr/4OPpupIs=;
        b=KTU6CVYLyEATrzqPoDlRe81jkONpUZQfTqrSHK+794YzxEiXFuG2VTSG/evcZ9AtpZ
         HtJg8yrNyGIwW4JAgHPO29fq8j6oFQAV3QkC8NYFmw/b+OkVADUboLNUa1HbkKu/PWgv
         Ua0LW5MCUBFLdrIqSXkd3Ex4qmiYk9r9T05IFZmcYqYA2wGCk+FDZIu/hEzCqEYhhXyX
         4zp8Y/60Pmyoq04o0buvOjwRx5LPqnXLOUHBFhUl6XIBC2mHQPdLA/JzBo48KA5aMXbL
         4kSaUrpqvT2m1iDdjhibZGEFMIZNQ7uckR+8bvAY/sdUNBKBI7IpSjq7Is3JuaOe9M96
         Ig4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716410563; x=1717015363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCB4Xldgcwvrmyw7KvTXZs/6ZjPvLBzZXr/4OPpupIs=;
        b=lsoa2ArCdg7PYuyJWn1KRo3RiQfH9OFCRYCpH6oNGhIFx4BUtOMURGKNO89eJTWl5s
         wlVHDWHsk4oEWDxiGFdBz+VEcf2FJuEzR3AFP87z7IZdF9OOsjgVREDld3Z77XqfZ8gd
         C2VEpvKhv765V4ikbWqBm/7riBX2D3bSTBfXymqIE69gV5BnVrB4KtbTAVCy5JZvKPVZ
         c5/FS03XiENgG/1ZiURZjhGSm7741fgq4D09uIcB86KH5AohcNLsyjv9qGlPTFLHJ/9Z
         Vi4LH+lgyF00LlTUMUMIED+BrHs/bXNmyoPOvRz1+eFmGr7+FbP7XZNdZFjAOOR2hxWx
         uyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuUuc0KzoUtsAsCg105x5cXvK5ItreKW5ljUmTXLoZFeyX4yhK05fT2Pzf/kLKDFcgSASoGXTqVwUbdsLOQ47BLoL+VuhLM+DO9KpkOZWpYg==
X-Gm-Message-State: AOJu0YyInF+jIJCKJ4vp5VKnjfW2VS76q+Pb6hjLxl1W9cQCbLSUeHzB
	tz+hZzpx8Bux3CJJ9m1cjupNq85PxTOPKtyO+l00snk9xYLfX+DUEJs6Dsa8D95guLEWR0jZWGV
	FMuAXodOOgT4S9E8vBjL6RsKJKY413hsCuhA3Xw==
X-Google-Smtp-Source: AGHT+IFKh82a/T/1EdhDgnq7pT7B4LlEUERKT7+vPD5V13fvsAaTJt13srw//4tUDRv6+XNQBbRyhIn7lND7BWa0odc=
X-Received: by 2002:a05:690c:f07:b0:61b:e643:58c7 with SMTP id
 00721157ae682-627e472b21fmr40846087b3.28.1716410562525; Wed, 22 May 2024
 13:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-qcom-firmware-name-v1-0-99a6d32b1e5e@linaro.org>
 <20240521-qcom-firmware-name-v1-9-99a6d32b1e5e@linaro.org> <a553622c-7576-4662-abac-68abe7ea7918@quicinc.com>
In-Reply-To: <a553622c-7576-4662-abac-68abe7ea7918@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 23:42:31 +0300
Message-ID: <CAA8EJpoU+C03QC0PaUOYF8oVT+qY+eCRODZPjHCuT3FzQc1WKw@mail.gmail.com>
Subject: Re: [PATCH 09/12] remoteproc: qcom_wcnss: make use of QCOM_FW_HELPER
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, wcn36xx@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 May 2024 at 22:22, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On 5/21/2024 2:45 AM, Dmitry Baryshkov wrote:
> > Make the driver use qcom_fw_helper to autodetect the path to the
> > calibration data file.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/remoteproc/qcom_wcnss.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> > index 421a3943a90d..45fc578ae30b 100644
> > --- a/drivers/remoteproc/qcom_wcnss.c
> > +++ b/drivers/remoteproc/qcom_wcnss.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/remoteproc.h>
> >  #include <linux/soc/qcom/mdt_loader.h>
> > +#include <linux/soc/qcom/fw_helper.h>
> >  #include <linux/soc/qcom/smem.h>
> >  #include <linux/soc/qcom/smem_state.h>
> >
> > @@ -555,8 +556,13 @@ static int wcnss_probe(struct platform_device *pdev)
> >       if (ret < 0 && ret != -EINVAL)
> >               return ret;
> >
> > +     fw_name = qcom_get_board_fw(fw_name);
> > +     if (!fw_name)
> > +             return -ENOMEM;
> > +
> >       rproc = devm_rproc_alloc(&pdev->dev, pdev->name, &wcnss_ops,
> >                                fw_name, sizeof(*wcnss));
> > +     kfree(fw_name);
> >       if (!rproc) {
> >               dev_err(&pdev->dev, "unable to allocate remoteproc\n");
> >               return -ENOMEM;
> >
>
> can you cleanly bisect to this patch? seems it depends upon patch 10.
> should 09 & 10 be swapped, or perhaps squashed?

Yes. I think I got this mixed during rebasing and squashing of the
changes. For v2, if the approach is found to be generally acceptable,
I'll squash them.

-- 
With best wishes
Dmitry

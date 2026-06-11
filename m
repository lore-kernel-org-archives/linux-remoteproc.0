Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954743F20F4
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199981; cv=none; b=AX7Rn7UgpzvnMZIiIVYUY9eESt8DI7FrhaetWz3hgXkFs2mXzTyNaYAqi2H9FR1KikG13mN8ums2KQIiZYWG0VHU5kw6pOlUgCcCq8oJPOFlhxheTrlUM9b/vEUU76k6ZuyEQFpACFsrOumPqpOqKxXyaiYrZD+NYAKPdpSxCBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199981; c=relaxed/simple;
	bh=/VS4moAxewMl/vne0QAz7t4DDUEl2YS3zv0+upLp538=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/pPTNguZVhn5eLq4c7ZWjGJNvuXwM+j2bDEqalkvZ9jFvKrAMEIFDRni8MeQuK2qEQjv3z3x2xP9uxKWcMHkpIXd0f24v4Kt+Qs+HECSoAqdkyWH3TMkOUqQqm9PDFSnkqMN+XbsPaZRONUpir4PkyucWp0Vr1oakXam4b8T2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZUPfDl0j; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUPfDl0j"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf1f074a12so1734465ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781199979; x=1781804779; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2N81ClsT3Q+ECsWMKxKdQQqfKQLKD2xchENp4OvvnmA=;
        b=ZUPfDl0j9mZIjp3FJxv7IIBkNYEHtWSK8j3d3VenTHCSn+ukQd3BBDTHrwjCwWc0Ti
         y0aUr+yfiY3j15hNdNP8+60gtBa9cBBPTElNFKZR2DTvsT48PKjofcd0ULzWAHuOkHFn
         jWlBZ70MvUCpqCItvCOXi3+LiFjXcA0ZA8e8zIe+X4tPVAhLk1uTpcJVDF/Z5x+4gBx2
         AuFgBUc2ld/NLueoXhAUo1NFqdbyy+YeUP+XGMi6noudK8RP3u88Mr3WrnqpIZ4d/zJ1
         J77S+vr3/sT16p3BRhan5rSbnCNkTxzS4IF6qyEIjH+C7CjMJryXQBJp2G3CHFEqe1ko
         6C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781199979; x=1781804779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2N81ClsT3Q+ECsWMKxKdQQqfKQLKD2xchENp4OvvnmA=;
        b=I0vfBzxdVE14l1jiCbHa7qJWT3NigAYdL6gWNMSUYYC3JjCrYAF2WAKBC+qKdYnD2o
         eJ3TZCWPc3SzCCRD9yo6h0KF66Wk/IUXgJijtat3uZ2SXLJlMtbPbu40XGlGkaASNUP1
         j+9g6Y/1VqbXq9emBjXYKVvqi8RWiaeiGA5/M/0snAJlF/oEblGAs398nttJm/4YYHsc
         +KkObV3atGzpeByY9HD0axTqPBrUfNVMWDwZyfz61T3WGkzZ47zG3X+XhJcyf+bNgSyz
         8raEue81NOyqE/WjM9bFO2jClq/d50yIsnyPEkDkvSpGuWJ4NuYervwaHjOfRICL+kAx
         HSwA==
X-Forwarded-Encrypted: i=1; AFNElJ/N0edD/k2DEtTyMp4waRvSmw5RmzJI5XvKAVUzhmLovDvOOiG2luepYvCpQFMPPYhKIR2crTHCfYUpa1iPtEMF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3WOXFkxl5JwiZuFItRTEGHaTVoz5OuadLs2rJQeoBZ2fm/raR
	j4e4FkMiOM3bN45wFQHuZ1fJ4zwDmg/vWDzyI9rA+zRQKdYWLSeSZigpHAYv+paw0b4=
X-Gm-Gg: Acq92OHvh4+MjqPi0Jcp4fM/MAkfpkNal8L7XRWQ1/Vu8WWVmGDaf1OcOCCoaUPGM6R
	L2XSbM9Zo2lL5CyUcyJv+vyHJZAv3vXxgCeJDXIKlMyoo9cTfr8hKdovPOYBL9zZhl6CQhRT1XQ
	XnmapdTSPR1L38NxilFftsZyl6HuHUcq+Y9hXbQvmKXCaMaexozFJAAutjO/3tk+bPrAoGmBjwX
	+yULqrUDRW/xLNuRTTbeik1Lnjexs7DOA5BPptbA2hqeeb9LM6mYCjHx1IREmbb2G7JSAkPW3mA
	zImXUFLeVXdNH5LpNSd9Jgh+zp2lHabwp8r+/jYGJ++uEQNTYhM0T8QDV7+W5uJpdC+GovuJgyL
	I9RU8uWOMABC5/tIYhXSPTf07lEujByRYAe3nJeRCEpkFil6Xsea0qpYYe++SEByodB+GtAllaD
	w0Kuj6KjT/QSQl1Mvm4s483ITsjdE=
X-Received: by 2002:a17:903:946:b0:2bf:379b:53f4 with SMTP id d9443c01a7336-2c2f1eba6a6mr42688705ad.19.1781199978790;
        Thu, 11 Jun 2026 10:46:18 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5bde:8634:433a:e780])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e2e2sm280025525ad.49.2026.06.11.10.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 10:46:18 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:46:16 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	divin.raj@arm.com
Subject: Re: [PATCH v3 4/4] samples: rpmsg: add MTU size info
Message-ID: <air0aKkAtTb9YRjc@p14s>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-5-tanmay.shah@amd.com>
 <44c03148-9ff2-4fad-846d-ffe3d71adac1@foss.st.com>
 <e0660a16-d9e4-4988-8e58-d682d1712f51@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0660a16-d9e4-4988-8e58-d682d1712f51@amd.com>

On Thu, Jun 04, 2026 at 05:28:13PM -0500, Shah, Tanmay wrote:
> 
> 
> On 6/2/2026 3:34 AM, Arnaud POULIQUEN wrote:
> > 
> > 
> > On 5/29/26 18:43, Tanmay Shah wrote:
> >> RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
> >> Add log to the sample driver that prints current MTU size of the rpmsg
> >> buffer.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>
> >> Changes in v3:
> >>    - Check for error when retrieving MTU size
> >>    - %s/mtu/MTU/
> >>
> >>   samples/rpmsg/rpmsg_client_sample.c | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/
> >> rpmsg_client_sample.c
> >> index ae5081662283..55afa53189af 100644
> >> --- a/samples/rpmsg/rpmsg_client_sample.c
> >> +++ b/samples/rpmsg/rpmsg_client_sample.c
> >> @@ -52,6 +52,7 @@ static int rpmsg_sample_probe(struct rpmsg_device
> >> *rpdev)
> >>   {
> >>       int ret;
> >>       struct instance_data *idata;
> >> +    ssize_t mtu;
> >>         dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
> >>                       rpdev->src, rpdev->dst);
> >> @@ -62,6 +63,14 @@ static int rpmsg_sample_probe(struct rpmsg_device
> >> *rpdev)
> >>         dev_set_drvdata(&rpdev->dev, idata);
> >>   +    mtu = rpmsg_get_mtu(rpdev->ept);
> >> +    if (mtu < 0) {
> >> +        dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
> >> +        return mtu;
> >> +    }
> >> +
> >> +    dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
> >> +
> > 
> > Do you really need this commit? rpmsg_send should return an error if the
> > buffer size is insufficient [1].
> > 
> > [1] https://elixir.bootlin.com/linux/v7.0.10/source/drivers/rpmsg/
> > virtio_rpmsg_bus.c#L517
> > 
> 
> Here, I just want to demonstrate rpmsg_get_mtu() API. Now we can have a
> configurable size of the RPMsg buffer. So rpmsg_get_mtu() API can be
> used to check correct buffer length before even using rpmsg_send() API.
>

Since this is a demonstration, I think there is value in showing how to
use the API correctly.  There is certainly no disadvantage in doing so.
 
> I think I should check msg length against mtu size as well.
> 

I agree.

> 
> > Regards,
> > Arnaud
> > 
> >>       /* send a message to our remote processor */
> >>       ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
> >>       if (ret) {
> > 
> 

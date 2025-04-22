Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978420E6F9
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Apr 2025 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344193; cv=none; b=SdcDrhPUpH8lAg2yOUag0/C528e1kNyS9vMLpL68j76ea+Dku6mgH195XnPhzApPSRuOGtrFn8DpiXX/Q78s2dN5d3HIbarJkWwM05ERd/1zKDm0QAOBQbYZDNcqGySYpJv2aH0CHU7yWNc8V4FE1OLT3m6RCP7WZk3k5fokOIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344193; c=relaxed/simple;
	bh=KLQi+z0ACwlFz9ZbLyqfwIt8qa5Lxh81zDr6UDorl7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSWeoq+FYLZ8id+9DyB9elQ0r+52dNoywvpdYJT1A20alrwn8K31Tw1ZsgrG79sIRaGZ1qopWANVSuJ0LeKi+TxAdyQSlJbkq1D3UAQzrMBIZx+iL7qGAZhSlIdJPfDwhEfEwIwNUhIOQ0QSVIYsmhFSBEg9G2dS4LsFBEEgDCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IkUQCqoS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkUQCqoS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso7876456a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Apr 2025 10:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745344190; x=1745948990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fpG9W7SDN8EuvqFXYfDUvD424TP++3YcyI7qbI7RVys=;
        b=IkUQCqoSsvbmJZobBfZfqNEd8juLpSa75MPis5ovxr6Rm7TG4n9uHlW19ycjjp0mIp
         AK6eWzINdeWsk8t2fe2/nfozXlJzOxKctygqWtIu0PFV9jcwQwV1Y44/9+k9naa3YPv7
         pkL+9n68wYBp5oPi87R3VMJge4whiUbU1skb/Jj2ThbJl//qq4xugm9Zo650befl2PJM
         /l4JC+r1fvX2YLM/RMgGXA1Q5OwvYFaOmDJZtc5OAd374gauFRw9Xc3i+w4rbwvrUtge
         8YxGXHRZD8cD27Rdxl4R84+20U7Sd9fkwjwoyWOgZKNEBLgauROrzskgW+SJTpW59yLQ
         zAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344190; x=1745948990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpG9W7SDN8EuvqFXYfDUvD424TP++3YcyI7qbI7RVys=;
        b=Z3FoE7HfmabJIp0uBo/q9+Gf5+nWzUpvyR07Xv7szIoPG1ETxHF7zYr+b6fWVclkSa
         oxauV/po3bMiBEvb2jHGYZelWTAe5r0YIFmqinf6rg348JlPKun2RgRzLVPAfxXGb/aq
         jHBH1+bPqcn1yfYt1eigF67MT+yGSVGhN1FOuuqcreHmy99t6xP6ZyUIML5hQErrt6Kt
         lFt04o3E37K3nfc2cZMKg8YKqWzy54naA/Pk+sc5+aXbGLB5gWg8IAyDxDhRMQuslglM
         27fecjCGrALTJ9Ob31uRp28n6P1Yd/WrugXpO3K0L0kfE/9q3phz7hcZKa1efcUUbZEC
         WBhg==
X-Forwarded-Encrypted: i=1; AJvYcCXNo5JLT4UTGZhAFVbHmrjKjKY60DY9dkBmMofbl9HEdQtVy/p3fvyIw502GovD83t6XTUHAQd7nGtflguWIA+8@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWXwidUeAdeh8j+xaPjFem5gKWt9KIGBbwFAVQ4WDHDJhcYgn
	AyKlqZR7f9djbqVY8XMRMPhMRTLAilKWTiPPFPO59KqI26OHqa2DR8zrXjKnrQiArRdkWoGBLCe
	BwRNja0OXMu/XP0sdNVj2ND+HcKdgB2fpWHz1JQ==
X-Gm-Gg: ASbGnctns5rIg3QkKRbg0TjNfFOrnDwLsFOMstCUaUOsA+bV+QlzBqGRIfCM+RZw3wF
	wAWWVlMyptagUWSKalH6IFaA6ZdCcSY2J8tdpsDEWLKDlcaM8CT9M17Wh860++PU/dZjvJv0pCT
	0u26k6iKBYkYicUF7DJXwbrRU68fj4T4p7IGhpUKmDrcCskrvu0PSjQXFO
X-Google-Smtp-Source: AGHT+IF082irkvGuWqbNJrgDGvzzill1KS5KY/0o1UO6awot+Tg4DLEc3+Y0l21XSqr/7CEo+BjQncxpVrlQf0NZcTY=
X-Received: by 2002:a05:6402:430d:b0:5f5:7c7e:4107 with SMTP id
 4fb4d7f45d1cf-5f628621dbdmr11785472a12.29.1745344189500; Tue, 22 Apr 2025
 10:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414184600.1166727-1-tanmay.shah@amd.com> <aAe80OlwWENHI2I9@p14s>
 <072f2139-a860-406b-96b8-aa59a83950ee@amd.com>
In-Reply-To: <072f2139-a860-406b-96b8-aa59a83950ee@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 22 Apr 2025 11:49:38 -0600
X-Gm-Features: ATxdqUGRLKjR-TRghu4jLx6CoHjZVS-CNK5SiVm29m6LptEOatjHqt618H_Cl2A
Message-ID: <CANLsYkzDCy1QWY23uwVz_35tjdUdATqc66QA=sp5=gSY2vUnRQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: xlnx: avoid RPU force power down
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 10:10, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
>
> On 4/22/25 10:59 AM, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Mon, Apr 14, 2025 at 11:46:01AM -0700, Tanmay Shah wrote:
> >> Powering off RPU using force_pwrdwn call results in system failure
> >> if there are multiple users of that RPU node. Better mechanism is to use
> >> request_node and release_node EEMI calls. With use of these EEMI calls,
> >> platform management controller will take-care of powering off RPU
> >> when there is no user.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>   drivers/remoteproc/xlnx_r5_remoteproc.c | 29 ++++++++++++++++++++++++-
> >>   1 file changed, 28 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 5aeedeaf3c41..3597359c0fc8 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -380,6 +380,18 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
> >>      dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
> >>              bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> >>
> >> +    /* Request node before starting RPU core if new version of API is supported */
> >> +    if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
> >> +            ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
> >> +                                         ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> >> +                                         ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> >> +            if (ret < 0) {
> >> +                    dev_err(r5_core->dev, "failed to request 0x%x",
> >> +                            r5_core->pm_domain_id);
> >> +                    return ret;
> >> +            }
> >> +    }
> >> +
> >>      ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
> >>                                   bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> >>      if (ret)
> >> @@ -401,10 +413,25 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> >>      struct zynqmp_r5_core *r5_core = rproc->priv;
> >>      int ret;
> >>
> >> +    /* Use release node API to stop core if new version of API is supported */
> >> +    if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
> >> +            ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
> >> +            if (ret)
> >> +                    dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> >> +            return ret;
> >> +    }
> >> +
> >> +    if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) < 1) {
> >> +            dev_dbg(r5_core->dev, "EEMI interface %d not supported\n",
> >> +                    PM_FORCE_POWERDOWN);
> >> +            return -EOPNOTSUPP;
> >> +    }
> >
> > Here I have to guess, because it is not documented, that it is the check to see
> > if zynqmp_pm_force_pwrdwn() is available.  I'm not sure why it is needed because
> > zynqmp_pm_force_pwrdwn() returns and error code.
> >
> Hello,
>
> Thanks for reviews. Yes you are correct. Actually instead, the check
> should be for version 1 of PM_FORCE_POWER_DOWN. If version 1 is
> supported, only then execute the call otherwise print the error.
> Hence, the check should be something like:
>
> if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
>         error out.
> }
>

The above still doesn't answer my question, i.e _why_ is a check
needed when zynqmp_pm_force_pwrdwn() returns an error code?  To me, if
something happens in zynqmp_pm_force_pwrdwn() then an error code is
reported and the current implementation is able to deal with it.

> I will fix and add comment as well.
>
> > Thanks,
> > Mathieu
> >
> >> +
> >> +    /* maintain force pwr down for backward compatibility */
> >>      ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
> >>                                   ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> >>      if (ret)
> >> -            dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> >> +            dev_err(r5_core->dev, "core force power down failed\n");
> >>
> >>      return ret;
> >>   }
> >>
> >> base-commit: 8532691d0a85ab2a826808207e904f7d62a9d804
> >> --
> >> 2.34.1
> >>
>

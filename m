Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA181A76BB
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Apr 2025 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349076; cv=none; b=uurhKtpujjiJCo1hKmRpAqtL20otpcgYOlWHqAcf2k+MFvOMOP0VpXR12j2GOr3i9AySPax9SH2GlANfjTbNr7KkS1Xb+rWwvJwwcg2DXOFQL8rBGpmkfbSTcKjmRlrPma1N0zSa4WEQw1EampcD1i0LKrkcmkJrkJa58JdVQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349076; c=relaxed/simple;
	bh=j8nV+sHe/LHXmCHF6buyEIZmeUIhiJdQKHRmx4AZIWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdGT9Jw1tNv5CCFRrK3T/4hehnnJlEJ0k5hQisZ9YBNxNtIqte6SPOUaYSRY5yC37ROrSBDkqxn+zeptLyW4lQyFVhtn60dfvV3jwbNj9OBYaRAFFPXlbKbtSXlvqGoaXmT1wpPe/1/UQVR38YoOXejHoxgAqk/jfyUmzed9OE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xP9B24Fe; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xP9B24Fe"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so51968961fa.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Apr 2025 12:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745349072; x=1745953872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpbEfbM3UtW7vg1mNRw00lE2jDVYFZq31LN0I6w3KDY=;
        b=xP9B24Fei32Bppvd63aIo1AHNZhT3c3oLlQb53pL5ZA78ZKrG3Sa/Cp6PQmUaunR+9
         RrGePKLkPNol73JkPj011YqvdzkHVJKnV43eUjqXRbZKfsc22vxkbZoZHhnBzJ6VpS+o
         mRku8vlct6+Z5DaYs+FqOPGt+tK0xDg9TpwMYIFks07VwGB8w+cq+5xQR34N0SC62BME
         FUA00JZX7Bss0C96xpY3sq5VpBtT7r8p3Sj5VwpC/tHj9G1QAnelTof8nakqJsi0nLl9
         NJTQAyEns8p9cH+V/loriQ3kPJfO+Qoo9g7XWKDVcovVng7Zgo6F2ooKfa5GWvwAYi4m
         D9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349072; x=1745953872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpbEfbM3UtW7vg1mNRw00lE2jDVYFZq31LN0I6w3KDY=;
        b=g4BnZJgdhcU1HAnmJ6Dg3MgFhQFwRqzVO2UxGPjyZQLlm6bfZ+BBXldIx/VKmbAflh
         zaA90aqODNoKCiSKkDmXvmOq9zz5NicO1zOJI5H/Gf+Zh1UV3W6u1AwuMNEYycA/watI
         TRpfKAlplmmKNLEZIrzDJTapuOg4COH0wUHfSs3WR9SI8f+y8ZeVRvsjrxkbimagPE4G
         mVJ2m188NCG3A+RG/zMODFdS45qY1BS4v4P+689wzrfpGgvu1fdDLF49JoNat4eTlZ1s
         3QDqXqe69z1yR5aZdYgclL3Qq09BLcUxFBXshoQbWCj1PUtK4oE6pdTAQLb1Jvx1jG9R
         r3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU4PpAHOtT6/KbZrzu/4pdgjjxgwlf4IWjriqo/gwvZ4kguoSrloU/5XvQmncDuY2NJAHVT+v2cSfhvlOW8cQQN@vger.kernel.org
X-Gm-Message-State: AOJu0YxfVUtdZJXiSuPXM0XYT4rUyxh+0tyQ1kXX47An81pCz/LrbrPI
	SdcJaqCOfaKf0R+6CqAuXAQRj2cxGIv0tGoOhMKCBiD3srvhtc0VCGlnidCru7YBHOferCgTibx
	6zOrR3xZkrn3WJB4wVna1/qqg/p9zpS2oY7+zshUEuz3blclr
X-Gm-Gg: ASbGnctCvKcQ1vPMKBmYYu1B18CkSqA2FMjgnNU3M222gZkGcrtXqws3pvRVexo4ut0
	40sHZRLGSYEgxIsdBnvoz0jZcx25xaHGFtgQlKrIn+MSDNC29faQw6HSBBCNr2MRRR8GHqiaAFa
	rkDMBjpS0nTOJUxMUL7uC4DuwOIi1vwVSV+wQt7pFwx7mRsLArZhMR6Urm
X-Google-Smtp-Source: AGHT+IFWMrTFZSA5fWLkuZhF2Ql7ye8cedAlejpw7QNWx/pxL4ApNEY1VYb955HYcUjFvYPrSBxPD4zJWMo2+Xxw+gg=
X-Received: by 2002:a2e:bc1d:0:b0:30c:3099:13d0 with SMTP id
 38308e7fff4ca-310904f1f0cmr53078741fa.21.1745349071548; Tue, 22 Apr 2025
 12:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414184600.1166727-1-tanmay.shah@amd.com> <aAe80OlwWENHI2I9@p14s>
 <072f2139-a860-406b-96b8-aa59a83950ee@amd.com> <CANLsYkzDCy1QWY23uwVz_35tjdUdATqc66QA=sp5=gSY2vUnRQ@mail.gmail.com>
 <7dba1e4c-a7b8-4e18-82a3-db2a7f4fbe5c@amd.com>
In-Reply-To: <7dba1e4c-a7b8-4e18-82a3-db2a7f4fbe5c@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 22 Apr 2025 13:10:57 -0600
X-Gm-Features: ATxdqUGTytN2MVaoed89zzbIWCdTFa1yxr9BjrcvC6ivhwLTIPi8WceCJoFHAC0
Message-ID: <CANLsYkwadvmNiADUoMLM2rfoeKhLxJUtr-pY_6CvER1eSzd-UA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: xlnx: avoid RPU force power down
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 12:30, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
>
> On 4/22/25 12:49 PM, Mathieu Poirier wrote:
> > On Tue, 22 Apr 2025 at 10:10, Tanmay Shah <tanmay.shah@amd.com> wrote:
> >>
> >>
> >>
> >> On 4/22/25 10:59 AM, Mathieu Poirier wrote:
> >>> Good morning,
> >>>
> >>> On Mon, Apr 14, 2025 at 11:46:01AM -0700, Tanmay Shah wrote:
> >>>> Powering off RPU using force_pwrdwn call results in system failure
> >>>> if there are multiple users of that RPU node. Better mechanism is to use
> >>>> request_node and release_node EEMI calls. With use of these EEMI calls,
> >>>> platform management controller will take-care of powering off RPU
> >>>> when there is no user.
> >>>>
> >>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>> ---
> >>>>    drivers/remoteproc/xlnx_r5_remoteproc.c | 29 ++++++++++++++++++++++++-
> >>>>    1 file changed, 28 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>>> index 5aeedeaf3c41..3597359c0fc8 100644
> >>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>>> @@ -380,6 +380,18 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
> >>>>       dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
> >>>>               bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> >>>>
> >>>> +    /* Request node before starting RPU core if new version of API is supported */
> >>>> +    if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
> >>>> +            ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
> >>>> +                                         ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> >>>> +                                         ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> >>>> +            if (ret < 0) {
> >>>> +                    dev_err(r5_core->dev, "failed to request 0x%x",
> >>>> +                            r5_core->pm_domain_id);
> >>>> +                    return ret;
> >>>> +            }
> >>>> +    }
> >>>> +
> >>>>       ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
> >>>>                                    bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> >>>>       if (ret)
> >>>> @@ -401,10 +413,25 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> >>>>       struct zynqmp_r5_core *r5_core = rproc->priv;
> >>>>       int ret;
> >>>>
> >>>> +    /* Use release node API to stop core if new version of API is supported */
> >>>> +    if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
> >>>> +            ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
> >>>> +            if (ret)
> >>>> +                    dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> >>>> +            return ret;
> >>>> +    }
> >>>> +
> >>>> +    if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) < 1) {
> >>>> +            dev_dbg(r5_core->dev, "EEMI interface %d not supported\n",
> >>>> +                    PM_FORCE_POWERDOWN);
> >>>> +            return -EOPNOTSUPP;
> >>>> +    }
> >>>
> >>> Here I have to guess, because it is not documented, that it is the check to see
> >>> if zynqmp_pm_force_pwrdwn() is available.  I'm not sure why it is needed because
> >>> zynqmp_pm_force_pwrdwn() returns and error code.
> >>>
> >> Hello,
> >>
> >> Thanks for reviews. Yes you are correct. Actually instead, the check
> >> should be for version 1 of PM_FORCE_POWER_DOWN. If version 1 is
> >> supported, only then execute the call otherwise print the error.
> >> Hence, the check should be something like:
> >>
> >> if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
> >>          error out.
> >> }
> >>
> >
> > The above still doesn't answer my question, i.e _why_ is a check
> > needed when zynqmp_pm_force_pwrdwn() returns an error code?  To me, if
> > something happens in zynqmp_pm_force_pwrdwn() then an error code is
> > reported and the current implementation is able to deal with it.
> >
>
> PM_FORCE_POWERDOWN will print redundant error messages from firmware if
> called for feature that is not supported. By doing above version check,
> we are avoiding those unnecessary error/warning messages. Other than
> that, you are correct we don't need to do version check as
> PM_FORCE_POWERDOWN will send respective error code and we will fail
> here. But version check helps to differentiate between actual error log
> from firmware when call is expected to work.
>

That is the kind of information that would be useful as comments in
the code.  Otherwise there is simply no way to tell...

> >> I will fix and add comment as well.
> >>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>> +
> >>>> +    /* maintain force pwr down for backward compatibility */
> >>>>       ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
> >>>>                                    ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> >>>>       if (ret)
> >>>> -            dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> >>>> +            dev_err(r5_core->dev, "core force power down failed\n");
> >>>>
> >>>>       return ret;
> >>>>    }
> >>>>
> >>>> base-commit: 8532691d0a85ab2a826808207e904f7d62a9d804
> >>>> --
> >>>> 2.34.1
> >>>>
> >>
>

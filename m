Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFCF3DAC02
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069932; cv=none; b=mp/trCRso/Pl6BJK6DPA/ssswdXe9Y7O5q1C1I5r9reNE2K1y/6oDlhjmIvknMByEI7/YTbkZ6EWtTcZXxfG1G9A22eGI8la/MuOxcxVKHl+sMv2NeXM8gXG9xvZkWdp8FOTM3k8CrGaFhUHO7N9QGZBaPunsojFYVOAHrSkQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069932; c=relaxed/simple;
	bh=fLdlgK54rTn34EKZI8AHzVRLbm2SJ8RTjlamikvXF3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFSIqKYut9lBUzyKd5H/KveP4CrMHwCOdv9ZtJuyB6glsi/EDHun7GvKCwCqRUxBMfx8RLWnUSpx482kYJFI2Ybk9+98qyy2/LvRCv2OAgm3TdGPk2/n2f9fRYBAPIH9jDpJfeXtVCgSCyH8rB6A0tG/S2DvvakHIXYmRaM0XH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TfzUYh+B; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TfzUYh+B"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so6156182e87.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773069929; x=1773674729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=TfzUYh+BUDnQh31j1IOzPljjfQogGf47ltG5YAmIW848lyytTPPXuz8FWQGDh1CJTt
         orZV/TYwTxb39OUo0KvYHhHlmxZvgwptrzu8gZX4btVd0RMVuFYUZOvn3r+cA90MtzTt
         Pr1qyOgliMTt3RuNN6JjriZjVp/7AtoLpgddo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069929; x=1773674729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=wndovEukr20StpU//6P2799yMksr0eeQ+a1TvUshfOA724Q6J8oxSmbRFl0i6ogLtG
         o/9mGlrhprW8DR3zYzOMjL1S2mdUl9Xbx7+0o9t716Im5VcyWBrU56xj/zXVoOSc3yoz
         Q+e7wn27J5bxSY77V8AEqMJU4btfv36+ndoRdnBFrg9D8pTwVXwoVrQ13TPeaDmylxiT
         geI7KhGCJvzEsYRkHnDRwIiHkrccomtuifL9yv3gG43IcdPp2G2XtQJT3MKhexSAvyoq
         T2a4/6K/rsGtFyhOnrNeGUn6eUVKqmqTRtOqxYolxryUXVLo2Plf921vRysr3Do8ZOVn
         aQdw==
X-Forwarded-Encrypted: i=1; AJvYcCWexVb/iVn4abjZ85bj6IWNGXsA303wfO2hfT0KraZZMqkwwspxPRZGImSUhqBOwP5TQux/NqDEhppYhN8KX5C4@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqS6LcMEf9d1fXTbDVos6hTPduCL6RFTMPViaSsOpBtxLWNP4
	5XD0w5uY+exhI1S3QXhOc1rVRkioVysEUZXWWNZu0cGn4AzRsHIKEdP6dJ7focuR+PwYoNk2E2I
	Hm+5+seiw
X-Gm-Gg: ATEYQzy2GE6yGSzEJqY17YB/ABLyz5zl9Pq0q6BYy4WXNg2zKvRKWO+Hjv+lzWqirm1
	w5Y/NVenAt8PBMzTxwdZJIlH0xnOkT+b89SU3k6H/HmcB9ta2c8Tsun4bLHyiBPzW/x+7wHA6hE
	6IGZIP506xNjhEJY6FhQYtiS0eOXrEBblevyFtD1Jr6IpHWyCU8jltB4lLJTwYKnbv4AHbnMvMj
	GQRW0dCyxAXQdeVuRIXix0DKfO0pMRlmKiJJBpMeztrMeAhb+H5DOZML1rLQg0emOhj0KKO5+/9
	DatL4qc+ZFYBZTe1OxYpqL5amr9kNVBKwCGXX0q6X8gcPA//q5fQAQainLTAy6Ev5s/VvBNLspn
	TtaZxmOrTbSD9g/mB80IjWj6D8+USl9IW4WW5uFYDu4XXUshH6uA6+h1HVEIKbt6x5643aT3b+K
	oE+k78XV1z6NaBBvf+gs7cN9ISSNLkxQ60u57paixTAqyylCAXAlMDUj2xbqe8Ng==
X-Received: by 2002:a05:6512:3b9c:b0:5a1:3e92:4f8 with SMTP id 2adb3069b0e04-5a13e920566mr2983399e87.30.1773069928688;
        Mon, 09 Mar 2026 08:25:28 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d03d841sm2124069e87.39.2026.03.09.08.25.28
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 08:25:28 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so6156120e87.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 08:25:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsUaE9qBvxVaTh0pddJQrFiobOtpV6e8+iJE3xtwolqejkb4JCYQCM7N01N9EeYE5Ie0xFzB6HfVnCiXMqKX5I@vger.kernel.org
X-Received: by 2002:a17:907:1c2a:b0:b96:dcc0:2e19 with SMTP id
 a640c23a62f3a-b96dcc03e2bmr431706766b.56.1773069586848; Mon, 09 Mar 2026
 08:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Mar 2026 08:19:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
X-Gm-Features: AaiRm52PitiYzwSf40xttz_JauQBZgQS8kA13tji_SRNQ2F75XcOox36FcsJy20
Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jassi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function
>
> Douglas Anderson (15):
>   mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
>   ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
>   firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
>   firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
>   firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
>     message
>   irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
>   remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
>     message
>   rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
>   soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
>   drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
>     message

Just checking to see if there is any addional changes you need from me
on this series. It looks like it's -rc3 which is maybe an ideal time
for this series to get some linux-next bake time? A good number of the
patches in this series have Acks from maintainers so they could all go
in your tree, I think. For those that don't, I guess worst case they
just don't land right now and I can re-post them later. ...or if you
think they would be OK to pickup that would be cool too.

Thanks!

-Doug

Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5731C5F27
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188597; cv=none; b=S8I8l/FHl9+ccLfOq4u5/NK0k9oIfxJtTLYu+WVGgDZWglezoCfZS/ue7a8hfUoROMzC+ZVXI8q91hcth2Co3T3LjBydjPPGrn7faaWmir096w+JoP5P22OMwXH84H8W7Eq+J2yzzGjyjO4/wfxGvCEAVCPnC2HA/Yw3HdO5658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188597; c=relaxed/simple;
	bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lytBzAb2iLYAt+5L14RgP4ZnYCEAU3NxG0ZLbkUe4YgM3bwD7P4WWDIWL1tvT9vG/5dYtKcpenRXme/K11TBG87O2pvJdkzmbj9Y5P6Gbopa6ihAWm7uRN5RnA4V9bLAHzGGrbO/1CBfyt/wZ2HPZCldNmBvNyphcr60VuPE7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dJq/1JVc; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dJq/1JVc"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9358bc9c50so1540014666b.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773188592; x=1773793392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=dJq/1JVcGic8bis/nwrh15qzB7HQ43V830l1Iwm8ApHpSOsOSR3cP2rOkoAvIDJlHV
         nQFXaUkztYCditTTFapY4MFkkNqfG4aZPy/x02sgdcPqCLQFXzjxdPpCt7cRrlDSdDbD
         Ar+ZzrnsD1OSWAD3KAI4xIIYWpFEUP8LWqB6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188592; x=1773793392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=W/8BY0RHK4nRrQCo5p8/lougoPeTPwQ9Zu1C6xeJsvoNCaEl5BHhWW1fZpf2T06pZa
         wMRuVFepU4VA1dikfDg1n4lctwZm0xj+7RYbnMA+H9I9EIU41hbYkjTz172K+LXDrTBW
         orVBmsy1fX0PjCsXIVlTeQz5vwPOVm86ecY/5SYjUbh74zLo13gKMHzYnb2h+ATaS/vY
         EL4m3MtkVxCHXJbrIUtZ03DfGGWPlzULEvTSkviMII1M4AkO3hcwC9NVf8TDOsl5XdWp
         uhxqIc6qIDWBq8XbN+rFfuGWy3cpFKQsBndT1GYf1WWx7q9H0j7CGpd4ciLdJKwi8nRr
         ATyw==
X-Forwarded-Encrypted: i=1; AJvYcCUQjNNtYuwglw8HRIseMLEoQxSwbL6N1Eh5HR95kzAim7J0eNYmHQAR9p4O/XN9lByejq8gff2GjyJuboo/hPcC@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzRVwaDPBeKYy4uLVjM2lKm6svB+jrlz9ZGaWG4XSy2B2WsrL
	/bywIpTBTW40tEblYnmNG/kkCWX+Tf4QHdztbXHb6qcoJv/mfZRFfBEtcEdLdqVPwTTC68Ktdjr
	Laka+G27/
X-Gm-Gg: ATEYQzy/0V0sa3aa320bnfoVvIi9lZlS6YfCKcdZ9Rj5qASeQwqhebrE9C85G90lKyZ
	oON3GFNMdU6md41NUJgPiqhY4U36bktUnijnoik9rqLfdhB32axfJwUfcY/9NboTmsguNA+yWeR
	S76m+dxdXca5rRsFE5NXTjyZ5rMKNgRDpawfimM/mrcrJc5KjPXo96bjXp+2jF4gtfvOmlyQRqj
	GAbHOXJGu0ovIXmX9u1ZwUQVdH/k48eOXQm46X/oNw1Kid85IvIvryH3X8sgdy0+uJFgIjyFFeh
	iCR8ei7CfBJsjyaEuWkRWsWfRhi3yv5VeMH3f29NDjbfQj/i0XOKhuczgbsJsLPK8hPrHiNM+uF
	Bqw+oeXn0j/cxf3joygbQM/R9AML+eapyb6LjKuutqP1GPNJ/0+VKnvHW7ZHgXU3iHnjxL4sMnP
	WrOheGkyBuvtyeIB2VWoLHfswHDm7ZJn9n5bw7T+kdSt0PQ8nyg6kvWbYY2T3knLBm4yWal4L1
X-Received: by 2002:a17:907:7f8b:b0:b96:f0a0:c7be with SMTP id a640c23a62f3a-b972e4e65c3mr24291966b.24.1773188589568;
        Tue, 10 Mar 2026 17:23:09 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e1be452sm13597566b.65.2026.03.10.17.23.09
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:23:09 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so46168985e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 17:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVY+OTm9Y9M1Wr0Vtz6MDQjZn79MuP82bvnA00ud+be05nLybnUPOY3ioF5YeQINUL1KfeIWO0V058kgptKb4j7@vger.kernel.org
X-Received: by 2002:a05:6000:2913:b0:439:b3d2:3768 with SMTP id
 ffacd0b85a97d-439f81c8cc0mr1467675f8f.21.1773188179252; Tue, 10 Mar 2026
 17:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 17:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
X-Gm-Features: AaiRm50L1dSQfXqKqL2lF5VIOHGsndPMM8bpxj2iTcUPN8asbNOQBrAMfnlkmEo
Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
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

Hi,

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

In case any mailbox client API users want to comment, Jassi has
proposed an alternative to this series:

https://lore.kernel.org/r/20260310234616.334498-1-jassisinghbrar@gmail.com/

Feel free to join the conversation over there. :-)

-Doug

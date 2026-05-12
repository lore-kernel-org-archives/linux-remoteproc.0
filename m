Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EDF3B9943
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599285; cv=pass; b=WBTRXXTDNuxurMsE4p3+Cklri7YkrvhlqGrkBCbYHYvpLrU9PF7Pak65uDNS2raihgWb88LbQpG36BkAVlBGzcFs9Np0HwVcC6dbyUlCoG3ny6NuKpJIKdCGbT6sIqC36zhwmyoO1T/S85p6v+4sg1pEzEJhWGemF3cD06GIr30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599285; c=relaxed/simple;
	bh=d6Ai2oZGfRKCbsGfMKcyIjj6RolLAPQ0oieRpFAWaes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PuBDKHtBk4hleL0LAk2XhkuVfeIVP8d4No67p6jBycWWi+u3QbpENrMwa2Z73v0OWSKLCnQlmoABnck9LaCwSeAQ6dMKjm63rB494D0fxHx5vl3zixR7me5aztHmLsJSAl9efxGw5jHOAVt/qmAzlI5cqKddyKd9X6dpNmkCTqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4RH5Bxu; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4RH5Bxu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so9595806a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 08:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599282; cv=none;
        d=google.com; s=arc-20240605;
        b=bTQmIeP8VY2zWXw8XzHaCtdCz97JWQcVc4tVkfbz7E4NTGutaSU+PzQAQiBHVxUdD6
         4cgKaUWDSuIoxx/GJBCCoOMKNpXl3o8RioRNFUqRX0/V6lgGIURVNeydQrtl4CgbsLjs
         hcWOykRiLurFrhITGAsCKTR4dAaPfsWY0iIR0L8j2k5yDltIwuk0IDM5YK5+7PtCOkoa
         bs+TrgSw3U/My7EGEHpz+xoqk7SLZNCreHGDyUpscC6L82f4KrvvHtrTcPVFN8z0afgH
         SCABXXb1IpkqKSI15edkaw7Ebywwbo0HarwhotwafTy/o4IuoFhKnFYoGC9xrQlmY93H
         HoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        fh=3puQKbNH0ThQ1IMn3KcbYR0B+0L/nBIOi3tLOtTYvJs=;
        b=FqTO25RasfQtS/o4FgoJPk4MzIDsKINfEK2B39+Ip09b3ratA5EtJ8J6xnL0sfIv37
         MqhhFVVIQPr/U+vZZMm33OAH5D9n3n5FaqmlAxqhRL5mq5YH/DiQVijIJ8dzQdk09DzP
         lvVYr2KS8aqg/XeyfgOBLZvhYjKcsDDsuVzvUHgNhmGBCSXVHXJ9Np3ajiRMIfNhTJO8
         zadHOUhedeHdDZ3w3F9fMqi1HwxfctiHc/5dgcN+pkRXr+3xxibBK+o8eOhV9/Yu0X9e
         bIfJKceCPJiD4hjLiYVpO3q7QDRnldzqo+owVDnxN8E9GlhjaNi9jB0mbOTXRMNAVWXL
         tg3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778599282; x=1779204082; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        b=Q4RH5BxuUtXZ5bNxuocVfhVepTorYWk17UQerZ1sE267yfrWRTVhDcT3u40DBZzyuy
         fju/g9f0gnWEaDM0ruVcJ/bOE4JrWJFIlGWN0Qzoidvp7bOHz70iit+3yNsCnEm2Je3w
         Y30eUW9JZYdgEtpZq1prESK9fOrr06Wczjg+4aRtry3e9JokzBdfzkgfE4lokgE6p7VD
         qZzHoT0FiAgiGar+7st5qVCh0p2LE2T7YMuOpQbJPloStKSO/Q5BrPNZUtdMDtq/7G/C
         +wZhh/7UNRkszwWrLb9UOmnEuppG9f8RnoB+p6piyNhdvOeZl5/WMwijUVRRd/DFYD84
         yUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599282; x=1779204082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        b=X2jQH69jidZv0pg1zyIc7XX80U/v2POY7NIlhWza35byozjfrb0mhhf9brgF2gEHbb
         dRKeRdLwPJqBhclrc+xXDaztC/Dkigf9bR9sJCvdS7SdLt/0Q6rxtho5ByHVBwHxSYrR
         r6NVMf0KTOS1g1F//u6AiuaKFxs3NZ5PCYS/UlkE4UUPkKBBoljlhr8AceCnt2ovrH/2
         09A8Oqz+eK9EcBM/fJBXEkSTVrQrZClDtavBzBixVl12tuUyMI9KPTR4e+rASFTEQIgN
         xxriFDjhGbnL7jl3mdxFJQbNVi4wqCdSo5l8A0zb24umF/6o30MAv5gDqrx+329bxXSH
         ALbg==
X-Forwarded-Encrypted: i=1; AFNElJ9x+ppQywuKCDEagIBuZXnWfg88fsSPQ65SOj1MckUAFBkASqUipEg9VNiLR0BSRyhC+kQat2X1PDjHlZlH/KIv@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjmsue2JLgiGziPOEViFYQ3vctTEf5VudlB6P3ouaQunEOlrt
	jeloT0A+hxrGVeyi4gU+KwBhlmnSRM47uYozi42jChCXNhBBXYAvqsZVDOTVePnrqgnp93ByFse
	RpQZbM8EzeFOvHF1y/3x7fAiKTfEhkpCQz61UbiX48g==
X-Gm-Gg: Acq92OGItvge7uFFO3KvqmkEcwi9Z22w0VCKwtrjjyJtWSOVHui0Iuv9tl2v8H8rD0V
	+RDkx3I93ktYuuE0vzbO2Io+TAteq8IniZgwGuKhNT8hi9iQhNZdcintirZW4KKBHEbb0k291eL
	2ZeUKJ4pnFKm3zb/01J4QS1k5e37M8QeJA3FEG3frgtTET0lkI/4lrCf4tWdrGHpgusf1EkQSnC
	eo6PKw4BpSdrhPIoNAa05edGfcrIaPrbVS7ol6VD9Zuqtlr5rf7DQ7pnDY1rn5LWivIGRprZ49x
	Mypp93Azr6BME9/1HG+3+UH9t4EFgZjEMA2Zrwgx5A==
X-Received: by 2002:a05:6402:4315:b0:66e:8ca6:e79f with SMTP id
 4fb4d7f45d1cf-680cf3642bbmr2086182a12.13.1778599281971; Tue, 12 May 2026
 08:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com> <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com> <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com> <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com> <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com> <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
In-Reply-To: <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 12 May 2026 09:21:09 -0600
X-Gm-Features: AVHnY4LT22IVt808sLwJL3ajF9BoO5QglODlYYWO0TdL8CMLNQDb8uF-T1sOSus
Message-ID: <CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: tanmay.shah@amd.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Beleswar Prasad Padhi <b-padhi@ti.com>, Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 12:18, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
> > GPIO controller.  The remaining issue it about the best way to work
> > out source and destination addresses between Linux and the remote
> > processor.  I'm running out of time for today but I'll return to this
> > thread with a final analysis by the end of the week.
>
> How many of the participants here will be in Minneapolis next week for
> the Embedded Linux Conference? There is even a talk about this:
>
> https://osselcna2026.sched.com/event/2JQpx/building-virtual-drivers-with-rpmsg-key-design-principles-challenges-trade-offs-beleswar-prasad-padhi-texas-instruments?iframe=yes&w=100%&sidebar=yes&bg=no
>
> Maybe we can get together and decide on the final design after the
> session.
>

I will not be in Minneapolis next week.  At this point I think things
are converging into 2 main takeaways:

1) A serious refactoring of the protocol to include only what is
available in the virtio-gpio specification [1].
2) The specification of GPIO controller number in an extension of the
namespace announcement [2].

Shenwei proposed embedding the GPIO controller number in the
endpoint's source address [3], something I'm ambivalent about and
still have to look into.  I also have to read Tanmay's latest
comments.  I'm hoping to be done with all that by the end of the week.
With the above (1) and (2), a new patchset will be required to reset
this thread.

Thanks,
Mathieu

[1]. https://lwn.net/ml/all/afjyH5JT0JS2j0L5@p14s/
[2]. https://lwn.net/ml/all/afzIABSh1xtMEGbf%40p14s/
[3]. https://lwn.net/ml/all/PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com/

>         Andrew

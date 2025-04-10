Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88D283681;
	Thu, 10 Apr 2025 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287832; cv=none; b=fPCnA0GHHXKhpoerfJmETZRHMPg6p1qHbI5gd595dYQm5qmAQslTPIOVCQsBmY7PrOIct45AnTcnsoPq8fdW29zNpTjw43HfQnjldCUPN39fwzXG0zohb5C4q1d1NEpTIR8S1EZgtf3TekHGun7QMRJA3xuu2vX/XxiXhKKQBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287832; c=relaxed/simple;
	bh=WQ/Zg5pbALkIDSUKET7wO/sepfxFHacC6w9xaLnf7Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRqR3w9WhP0qqEOPtXWQWRYxovdIUZ6wX01Y3yx6VvBOEiWoUaadw92RrPBIbFEWHbBv4/+MtXomDaY8dIUMX4WsRUyVNskdh1arUKcLQAcWD0MCdYxOntqr82Vbb9+PiJDT1RHmnmGUqUSLcysvveLiGW56g8+V6O8jJV54ygo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emieav6m; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emieav6m"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso5573635e9.3;
        Thu, 10 Apr 2025 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287829; x=1744892629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PpGCun6OnLyj/iO45IrhWhjo8NHmRNo/yGae+dtnKsQ=;
        b=emieav6msJEpYGCuYwiMJqWGLeHEUtdTayoDgQOu+NXneVuXH0fJ+3Fw56OKsjEuDk
         NYgAVoUApd9F1D0BUac8v8kpQn3cdNeK8nDzdxSVnEM8EDlqiv2OgB72IwXPOwUrhmyk
         I6+sspW2iVBl56XFSaMcln7XWRmkTjRMb4TzClfgCeghbF+hkyleOCW63cpIgw0VNfEz
         THrH2Sx0uVuUEU9nwMJOO5bU+FBsvcLZEuf1DjAyjcXjyUkm0LnsNHPJ9gU7tkntkg3+
         kZfcDrjFDg0zU6/JGIw7v6Mrzanr32RmaLNFTfkziLwm+ZdvG600VUV2kBMVY+gdGR8B
         Ntrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287829; x=1744892629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpGCun6OnLyj/iO45IrhWhjo8NHmRNo/yGae+dtnKsQ=;
        b=O/XL0wgSYY3TCPobLU4K2yelraZRIjCxh1WeHVfEoIUTf36tPcdy0CSMc4k0UnhHUH
         eMHgr5H+SxALIpbnwCGQUl4qbiwjwVXaKUAFbDhl0MDhsHQWfLBFf2v83kzXJVn8Tj57
         t+S+MD5o0hqGYmQdWD0IkTwc2h9DPRl3PWBagdK4pr+1yx6w9QRTn6D/dJa34iFirxut
         tJvHfygmEWubS2IK3Lwgkzy0wVn7NrsABL/m0dmr1TiLDNjY4DeErwZ9VwYFu1xxoeGZ
         r/3oLrq+uA42vfxtOAf6brxNc076UUK/a26ZcpNQShpKrStk5Nb2Zv/Boji4hDox9Rjj
         p5vA==
X-Forwarded-Encrypted: i=1; AJvYcCV1rseZdA4SeHcrBJFh964VxZYlUZ5W0kbgMFYNq6XEiDWDVcRypseUrv36jp/wNcuaai/rfW8EO6BN@vger.kernel.org, AJvYcCV8Tf9KdKywvhDuJG4T9g4o3zocCwp/YbgCrV/OtganwBHRZszBLQOd6wYPuprcs2KyLy5nGalIgkcdklUb@vger.kernel.org, AJvYcCVs69oqkfOvUHEu11hPoogZldAKCzyesvrPEwx4aZ9ZnLKP5znTYkfNW+s4dNUnAQsFRXngTTXFwTk3M021zfxWEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw15+EbPgisTNgkY9vh1cflduYglngp4szVABhl5MYyAzyof/wH
	2+HwncREu8iOSnkhhzb2wegT2OJvcn4UknZbFJczkdnpWd4igAKd
X-Gm-Gg: ASbGncub/CV1L0sTQ/8qg1EZ1UIudDnuHJU9E95BZA6DbjTtcmyho2FsMIMza0AgH17
	uwdsKcc6ZJwjFxM0lCwHevBofzvJc2zgu7mNEPXiD927yVX6+FABLuBeVJZS+8uh8mtAA0TNOVt
	8mpIGRlim/iPi9a0BKjvYGOFgi3pG7p8OZCm+0Bk4NRqwVjO9bMWdjLUMSEHgr8fc/WwepXYFeV
	BsxiPKJYM82ORtf5TwG1LYFFCA7aeUuXL5fAbNs9LhAmBe5lB/p40wkFD/nG70nUiXXgscltMYg
	SRzyTWGK4eulmhy7YGIVWwhjJk4CoDTGPR84hbUkH2MSpkA3c1qudgof+c81xe4/LA9C1A==
X-Google-Smtp-Source: AGHT+IHJYqLm2bNlTIV0OaPKSdoxtU3W2Hk6krFGdZj7Augauu5oSQ67P5k0PX48vM11HcU7mHRvqw==
X-Received: by 2002:a05:600c:3c91:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43f2d7e932emr33093865e9.16.1744287828716;
        Thu, 10 Apr 2025 05:23:48 -0700 (PDT)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm54736005e9.9.2025.04.10.05.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:23:48 -0700 (PDT)
Message-ID: <fb40d405-9f76-4117-88f9-423ea5fac3f0@gmail.com>
Date: Thu, 10 Apr 2025 15:23:45 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org,
 robh@kernel.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com,
 daniel.baluta@gmail.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com,
 iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/20/2025 2:09 PM, Daniel Baluta wrote:
> DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
> enable various applications:                                                                                                                                                            
>         - rproc/rpmsg framework, used to load for example Zephyr samples
>         - Sound Open Firmware, used to enable various audio processing
>           pipelines.
>
> Current dsp node was configured with SOF in mind but it doesn't work
> well with imx8mp-evk dts. SOF controls audio IPs from firmware side
> while imx8mp-evk.dts preffers to control audio IPs from Linux side.
>
> So, configure 'dsp' node to be used with rproc scenario and later will
> add a separate dts or an overlay to configure the node for SOF.
>
> This patch series configures and enables dsp node to be used with rproc.
>
> Changes since v6:
> 	- addressed Alexander Stein comments
> 	- enable mu2 separately in patch 5/5
> 	- put "status" always as the last in node definition
>
> Changes since v5:
>        - do not enable mu2 node by default
>        - fix dt_bindings errors
>
> Changes since v4:
> (https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810/T/)·······························································································
>        - after comments received on v4, we implemented the run/stall
>          bits using reset controller API (changes merged ->
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250311085812.1296243-1-daniel.baluta@nxp.com/)
>         - drop patches related to DSP run/stall/reset via syscon
>        - picked up patch related to using run_stall via reset
>          controller API.
>
>
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Enable DSP node for remoteproc usage
>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 +++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
>  2 files changed, 29 insertions(+), 7 deletions(-)
>

For the whole series:

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

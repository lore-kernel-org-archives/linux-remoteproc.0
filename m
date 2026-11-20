Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190637;
	b=XXQ970LhpXgfGv+zLfJKfxvmM/nA+eCgvFTqUPZJIgfoElUS4sjPReGIotBApkVhiMsV
	 VB/IbbjxBKQPw1LpRQbPrr2JhaN/K3zWEpIrSnbR2uS0hWyBTPZvTWpfUv76fImgU2doE
	 C0vwEZTwBgLdxAei7hd5H9C0p+IR3VA0MbYEJ3C2b40tWBx59bHH630mgxjZRfWRc3IDZ
	 /B8JqF4IUagEFthKmkcWyIwyUVI58eHo3XF8mV5JigM9lUXlRv0hhK8NhZZ+WrU/gm4Uk
	 fcWaH1MMkRINW+/A+njovgdiI78xZItsvow85oRYCv8nNK3lTkHOd961WlGw31dCL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
	b=riZD9cd+zCoYRvTPzRJ+IvvIEpqycSteg4eqAayb62ixe9/4RBZkp0C4/yqnCOgmrjBP
	 ksNAS8V/JnKTR450ybrUV91OBRdW1Qh3nSB2Tkr5Ldolv/qH2BMSOpCmU5DIA4CVSTjKF
	 1ucF1fo9vDLexODm77pd/WFn/ydCexW3eU7veq8RpMOehayXpj0JRb6zQn4jrSD/a9p+z
	 Rf2MXgnn2gsHccFIwAx0MrvW3O1m+3IJdQrSlwqAb1MA2Iuz4SxlxvZV4xIHlu7PCtg/7
	 wjhDZHuUZs1QCpOsKHsaJl4Za5IJLX8bQe7QahWEo5wZ/S+bR3wp63zsWEFwIlIg8yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hrq3427c;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A3606A332
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 16:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 309A3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hrq3427c
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1979643a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 08:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795190636; x=1795795436; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=Hrq3427cOfucxEjOLLtbn2V4Cn1I00ecESZQvbznHtS+Ajucudltlbk5Kck6unjyzP
         OmK8MbnL7Mf7FADR5bFMEwielqji3tE/hegkZl1JBYBqibn9fMx/M/kWY0bt6bCvutKF
         aBQMtnl8cZdm7a7ZsFjCMIBIT1A8QH/yolEFsIptwyyjBiF11Qfuv8TYl0ESY/4y3Z+T
         SMZbAQ50cOmBtYaZBCkC1hhEYLjpZTkyDu80tlezaOgXID8A4rFu8+EU7yDlqYusjYqU
         JlKmHzP49QAQaxUb3+eRiyMnJ5lAq7crkIfXr5wGkh2+st4AwCOhOmjwHuob3zb4wrc9
         qpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190636; x=1795795436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=WSxT44vN5igfPbPyRLNOd2x3EfDfQ04Yz006pArf/3O5Q4bYhvgQCxFCl74lOMrNGl
         Hp/uvR1J/qq8Mwp4HthrB2bcIO+bWmgPT2PlvjOz/f0OdJNKOi8QsZGCENZqLLl6mm1O
         Fir6JYAPBqjpcQF94VAN93OqKlQYruvVCI+hO/SVAOi+fix+ir9z9dl2Wwgu63S1c0xb
         PsFUo26WnRvZS5IZyiebqJmfQbapiq31hlQpGpxCb7TBX5UvDH0r2AJQ0Cfko9kF/Zgo
         W3t0TmYYUsjE0I0pEZ3pvzTFKomGgXDzgLiXObbA7hMwu+SmbfuAgTFxWcGZHZF8Jcu4
         iyog==
X-Forwarded-Encrypted: i=1; AL+hErEk1uBim+IsnPZcteCsaqK//KorpqPpTV0b59AQtXsTdWDQv+k2leCJ1YWSLAAZNBU/EBWcR85Y4tD+IsTDMvlH@vger.kernel.org
X-Gm-Message-State: APuU4Z8dSQ9IxGDQGrTfQsez10ZHaMNOo5qWJY9rEcJRHBF6g0cXDuZG
	A1NUPHlZnyuDEumAqTKjJ3q3oh1fK8PfIa3Pll1z5e/HBbmZlg30IlGHTvOndpKfsyA=
X-Gm-Gg: AZFdTZfjpZqCZiq6Qpu3hLxRHXi5PmmsUsXgqR8cx/qpC6Jwdz6HHPx3yOxUBbLsqv0
	d8+zn1lFyD7mcOGS5ovKfHO9uLI+8V27meZHHzaI+BaHMnC7U6bPCo8ci9PgjRTGniazD7DraNe
	pfDpGzacX9k1KTOwiYhD5p3VeihueXZJIeKUGAN9xP+M11FL/6MoqquV9dWXtpNJ7PzYOH43kdp
	tdUXwFe6eHTGf7N/4zbtrNVh4ZbER1iuWOjw28CZruFechcVve66L089p+4bThD/sUApjh+TfgJ
	WQIM4C1ceTaSC1T8r3sHNdAGVEQt7yPkSE1yS+RkQ0jsvkUBUGo59Yw0bkhlWONuilYkMWQHL4Q
	lxLNwHOcL0JjHWuELP+Lf2SZJALPZqpCJ/7wXf3U/9VRw/XtzLxGoqHXcMvo04Tkutj2VIAHQl8
	1pYXGhL1ePAs/vrz2Bu5LK14XEaGQ+VJPcLjdulzv29wlZXS0/XPR7YF1mwXiGqTxOBmI74HIDB
	yCmw69kncdBu1nghbsBjBLZdZil1MtCLGsD4io4QBtV/q3jznAUHZ1vCqdZv/WEolSXd/sR9kih
	OxESZ9XYjfJlkex9OU62Znr/myKweYWx
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr2249223a91.33.1795190636291;
        Fri, 20 Nov 2026 08:03:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm4809307a91.15.2026.11.20.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:03:55 -0800 (PST)
Date: Fri, 20 Nov 2026 10:03:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Enable DSP device for i.MX8ULP
Message-ID: <awBvaca7Az__X5Te@p14s>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>

On Wed, Nov 11, 2026 at 11:18:03AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The debug reset control is one of the HIFI4 DSP’s reset mechanisms used
> by the debug interface; add documentation for the optional debug reset
> controls and update the driver to use both the soft reset and debug reset
> controller APIs (the soft reset is already documented).
> 
> Add a HiFi4 DSP node and enable the DSP on i.MX8ULP.
> 
> Changes in v3
> - Split the previous patch 1/4 into two patches
> - Update the commit message to explain why the reset properties are
>   required for i.MX8ULP
> - Update the commit message of patch 3/5 to clarify the switch from
>   direct register access to the reset controller API
> 
> Changes in v2:
> - Update commit messages for all patches
> - Require the reset properties for the i.MX8ULP HiFi4 DSP in patch 1/4,
>   as suggested by Sashiko
> - Use sim_lpav as the clock provider for the ipg, ocram, and core clocks in
>   patch 3/4, as suggested by Sashiko
> - Rename the reserved-memory node from dsp_reserved to memory in patch 4/4,
>   as suggested by Sashiko
> 
> Shengjiu Wang (5):
>   dt-bindings: dsp: fsl,dsp: document debug reset control
>   dt-bindings: dsp: fsl,dsp: require resets for i.MX8ULP
>   remoteproc: imx_dsp_rproc: use reset controller for i.MX8ULP
>   arm64: dts: imx8ulp: add HiFi4 DSP node
>   arm64: dts: imx8ulp-evk: Enable HiFi4 DSP
>

I have applied the first 3 patches of this set.  The remaining two will have to
be picked-up by Frank or Sascha.

Thanks,
Mathieu
 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  4 +
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 23 ++++++
>  drivers/remoteproc/imx_dsp_rproc.c            | 76 +++++--------------
>  4 files changed, 82 insertions(+), 55 deletions(-)
> 
> -- 
> 2.34.1
> 

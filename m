Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2B93CAE84
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788387; cv=none; b=piFJyzsYh2cRGYa8cTX/QYMMfaFul1SeN3UxVKZvhZjfteUou3fEZbnUTL7h8dFHGk6AvKpOBoKmCbL+HBdMItwmPz8SkpNM8SGmzWsqQjhcxYg2w6XQddXFKhgi5TPoTbypyXNcKgEGsVQ4cthvjdYoJMR9jv8mBo+dL/yZZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788387; c=relaxed/simple;
	bh=sDQfXgRKI/MoYauIBPUhxS7ErHC3UJ7F2mE+sueO31E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfvYKbFVX7TDKO8U1RVU5MF8u9xw6p3btz/IQggP35dWERGPWckgD5jRdscL0ArVCaAHC+19pls4B5fARun9JueTfBbnNYzh5ZalghlfFWoXe1Vj15FlU0tws4n9l6p4fXlUx5fA7cBXFtCeHIlvViq4vK3KyVJCdxLDQ+pAFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f4OU0Hvo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f4OU0Hvo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495635a85d2so2655925e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784788384; x=1785393184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=;
        b=f4OU0Hvom8wddjN+ULWj9NrvyHQRUbHFPDvk/QVlVwr1b9E4N2E807/xjgpctqYv3s
         TIpzMV2nn1nphNkq0HUPSh2XFofxJM9Hq9y3cOJy584rcvF5Ivir+JZgrX02XVNFA9TI
         PRbYny5px5GXCx8Ky1Kcdac5jZ4w0JDbb++wUCmbqoKiNRwDVUP7cfjza5AHz94vCtAs
         z3LJ1P+ghbfgKwFNdtoUMDYe46kAb2wUOEdiYlJhDjjsgS5MBj/xNSBKMEVL8FpkBitW
         uJdwuwFW/YcvPlyCWSk4gLysrq4gmjrljIt2y0x/2EiKUJ9PfmV+9ZVR3Ub0ikbVJ+qC
         S7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788384; x=1785393184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=;
        b=FgmNEwTdcIAaG4sSTrfPtBE/VICSL02KzkHJXQhgJkdzPiv3BugJtKaCrc+McpIAZt
         dHfP1/SpdGUZ2/U3+w0Fjf3861C2n1Fplayaar4rbO+G74pjhPEl+0Fstmg+6ZFL3jIV
         D0Xo6oxihBB3hwbFNpKfXorfAw4AdNoAVhyyXA0Gzp4S79HT3vHPTcwhEod+L7OrbQX5
         cLol5a7+Tpk4vHaGfgDGy7b3jhPWjYpHvrW9QkSWt/KC5DMe8ASG2U8ejwHdDN6ikGDx
         0aniwjV6fNsoobVMNqwRRcBsZH8W+FdPP8iMvQAUZYdywMXpQFvD3G4f3KUNNNOQZY3Z
         ZYrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9cbcTyENaJCcltJ1PJLbdpaEaOPI2w2vQp5eAu9icK8Six+Pvig4h/8GkElxzGRR24jDIHkhiBiESscK1+6Jp@vger.kernel.org
X-Gm-Message-State: AOJu0YwiG4Vf2hHFbECl/MEuKMoiGAbcK/0Tvo3hKBiJB/2BPDvp4JWE
	QYoscLkeixQH9xBGmk/+bQd0wM4fgcpaFjzNppJzLseVgGTbNYcL/e4j7CfLsxeBstY=
X-Gm-Gg: AR+sD13JLgka/EM2Rf2OH/QzHFu+RpRPhVYfoHDJt/YXfStPNj1r26iy/+3OzBtxQcN
	8VbndqJ4pywkfYwm/3qUAKrR1r94eq/mrHnxLAr2PcOGUPYWNdn2qxmkV+Lo+Ohd+dPN8eQPvNZ
	1rZyQmn1jI67/kq4K9EXyueBAvj2kAYAm5z4AO+tebXZGlQahn8WxSZafPh54pa5Um1xIxbIN/v
	AlPFiurlz+xTtfDeMXpxB1hrCco8UVzdxgTqfXFIwPiTUdJVSs3QR0zFVvZdupd4gcIyBWBw4il
	gBp3rzhgc34LeObxZ/4DOyxK1+cKjl5gSXncTtZdvZpTPweUbBTDWQg8D0vEN4onuf8REdyj5P0
	m6pBHAx0tNhCDsRLWkOeb4VTF5bK5+61L2buDgK/lTODBHei+32HVyyZhG3HypU9fWQh2EvIktn
	V5Ch6kc80=
X-Received: by 2002:a05:600c:c08f:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-49573cfd688mr15528255e9.25.1784788384211;
        Wed, 22 Jul 2026 23:33:04 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c531basm12160604f8f.19.2026.07.22.23.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:33:03 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:33:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <amG07XSER0tqQTDs@monoceros>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-5-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tnjgjfvpvmj54rn"
Content-Disposition: inline
In-Reply-To: <20260721204704.400781-5-shenwei.wang@oss.nxp.com>


--3tnjgjfvpvmj54rn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
MIME-Version: 1.0

Hello,

On Tue, Jul 21, 2026 at 03:46:47PM -0500, Shenwei Wang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/rpmsg.h>

<linux/rpmsg.h> includes <linux/device-id/rpmsg.h> and thus provides
rpmsg_device_id already. So please drop the include for
<linux/mod_devicetable.h> which will go away soon.

> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name = CHAN_NAME_PREFIX },
> +	{ },

no trailing comma after the list terminator please.

> +};

Best regards
Uwe

--3tnjgjfvpvmj54rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphtZsACgkQj4D7WH0S
/k7/awgAj2vySxmy5vP1QwUkRZfLQnnTNKmx1EuDKoXg/nw4qRoyCtymTNF6iUvm
bSf7sZlRAqszzyqHR6g/qzf5yiGVUiAQAfxOlSYgB3SkP/7geaQXcPhlxzHxYU/8
aSWjMJ047hhilAq0C6ntgCbsBuUbHyGKC354E+EZYMESs0gKbdk1cWlNuay34k4A
Akaf2SEW/aZ/E/X1znyI/vRJyIqv1QBeI4+coopWyFigk2eNA1adyWif2iunnxtt
Z7EV690/VGZmcpQwDl/IAevcLh4cg2nhiEh2J5iIpJsvbmiDLQng0G5V7BQxJ9OO
7GNNyk0IGXtulJ1RztaEG5a7Kvc/3g==
=H5Si
-----END PGP SIGNATURE-----

--3tnjgjfvpvmj54rn--

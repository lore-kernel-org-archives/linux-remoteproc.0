Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887196;
	b=IdgsJ2sK8DX9iKbGYmLXbNkj69fn6LOR1imicnWmetOBlH8za5BUr5l4DpvKnxAxyyhN
	 RdrTUocR9cP8TryfgkVFUaYwJEEoTBHqLVMcPfP9XFTCwggIDmzdu2tb6DY2otiPWTznt
	 0T8JwaH1J/6gYmybEPeEhwhWQ3u21kZzNfpqH5Unt4zN2Tc2Km0hohV95VOJlpmLN4H3J
	 0yD/q3soClVfPOzAC/qyhhfKb27vRmMiKsyzHSh0kg8bvA8WkhtTj8sII9Weq3Td0RMv/
	 FxQH6jW3k+hDiWq1kibmVF66YVq33wqbHJINSVsbpcCmRqouNimpURbd83ke/MQDP3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
	b=eLXAd+yM2ItDPxhJ+p246WzaWUb+tRYoh8HQPQ7QhlHhJM/6Z3ploMRrkDwItTPZ5k3o
	 jZWJYcwO5Y7+ukkYrGRzUCmq4rjjq3HvAZKvJ53miODL21pOubDAt4sLXfkdfa5/sXirE
	 4GlvVKDaWmFtSpmStpDoOh07FZDl6YzIQhYInt7QBWwejjk4ILuxvevlSJ9mz3vXfG7E4
	 nQyyhsr9S4R+npshmmj6YpWFOgQ0jzr3DOSsM2zR4IraUMPMSSRjdf4RU+tLEDJvlMd4F
	 xqgg0Wy4U5KY5DKu0RXeWvnA3atVJ6vIqUZj/6sVFf1E5v3G0oyxZA3EnFg+8VN20fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="SU8EB/5l";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D4606A328
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 13:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84D4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SU8EB/5l
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13112445e9.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887194; x=1794491994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
        b=SU8EB/5l1TjO4SR/ZHfVurcBTZbviwe8Nvokm+g3goN3ssYVBwEQd1KNYBghk+IBAn
         UPgYM/9MOmdy3MZFzi5hffeEWAoioYQmvG1eAggddRsJr8jpml5MMp1fiKg3poEuB4Op
         PsAUqk8Ee4I6Nq1jS4e9CNkIX9bRl8Ww3+m3TfE5LyxzdAXAFyzXytTwQnSixgCrZxtJ
         BbSj40LqKDs3RHuqIj6pJIEfXncRWmKOW8LujwPQd8dbB5OG/P5E/BzrM5xR0xfCrRm/
         m5eAxF4mvBYJy0ku96BAEmJJX4mGG/cr/w+eYHTpPCieMbwLOQknvWORhQKErWQOeQak
         aKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887194; x=1794491994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
        b=WuMk9VNYJtpc3sqql9o/Fj8QdaslYRSbNzmY454EiW8CY0c/LLzFQ1G7XqxWpt0BiO
         tlTlMURFJhHnddxPsYCDSeFc13p/zylyg8RBK+Uv6Y2YPL2ciTuBqO0vaIpFV1/dogQm
         C2MaJxtIqvTHaoHdQChCBS1HqQGJoj8e1bH4OiBjZvhXtwcJWPZ6EFAplD3yqKTChsm8
         NiTtiJvh0Xf/YkIiL1KatmKV5Ms1e4iMenkhGc8CfgvxmsgD2BMCIKDgLSCcT24teZRd
         XizL6NlhXtjy3rLHmDLOgXiusyPd8VRIS8qgnTf9s9j6GXkM4cwsM0v03LDuNY4QB3Lq
         KUSw==
X-Forwarded-Encrypted: i=1; AKwUvByaCE8YRMAXMyIkwkzzZaIzuORivQY/32i6z3MfWJCvcbM5mlkNUV36ALEeRh7m8mZ/meHCK4Lf04Tlw75Qyx70@vger.kernel.org
X-Gm-Message-State: APuU4Z+VwqtpUk0REsDR0y1SsrlpOeC43xsRLEVa17Q7hXiTSOjVJ5gM
	pdEzO9uW3SHYArWgbSfxiqi1EBJzZ7CMpVkAqdMZJEYXqLbs+A/cunCyG/V9mbYqG2Y=
X-Gm-Gg: AYBFou1tApWN0eKdJKBJgO4sp+OzqptljFPHLTcoT2XdOWsysHN8gV8Yb6IhE5it+VR
	dOW6IiJbTRSVmrcbASckkoqMYrWTlw39gnRAeuEWbfW3dS9YnbcHjl/XxNg1LVqSWsBNPuPdXYj
	ezoZ5QlgxMs4FmczI5xmzPUrNYp6b402TLmZKtCp6atYdZPM7WEQUgtYKR7MCotgiQwPJg022oI
	qksujycaf0Z31vsxZ3wZIUO+hJYuE1d/T8ac6d5uHrVntTxqXM+isJXY4hxis1xEmTX+5UXJq3J
	2ikQY8X8JW4TWwbR7jJYPH4Xo64IRxrIdBYcPT6RdYQ4yzdtrqkDzjinKfLsGGo2oN5jIpe1PWc
	Iwk/uO7kE7zzh1Myi7wdJw3raLY8WMW4gOHaoJbVycY11YXh6C1Fw91BJLgaVb60pJ7D19YU04K
	wrb+hVjSl/8IlczyIGbrd8gQHoBNx2Q+HU6l7yIN2QPBsRF/H/kME5y/SS3WjP9/L3I/noTspmu
	xf8lVFaZ70IoJoFt3I8ksRYpBkVdBqVaegJh9Za30bSHnbXAY6gQ8dfv5VijXh6uNF6pGittGHX
	UfPFn/sPXJzGATcLQDZWo//6wW0=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr259029715e9.35.1793887194037;
        Thu, 05 Nov 2026 05:59:54 -0800 (PST)
Received: from localhost ([194.213.108.9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56e2ae73csm69855805e9.1.2026.11.05.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:59:53 -0800 (PST)
Date: Thu, 5 Nov 2026 14:59:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] remoteproc: sunxi: Add Allwinner A523 XuanTie
 E906 driver
Message-ID: <auyLnRhPv0jz1roG@monoceros>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-5-tcmichals@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bvyb3kuhcvop66ue"
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-5-tcmichals@gmail.com>


--bvyb3kuhcvop66ue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 4/7] remoteproc: sunxi: Add Allwinner A523 XuanTie
 E906 driver
MIME-Version: 1.0

Hello,

On Sun, Nov 01, 2026 at 12:57:32PM -0600, Tim Michals wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

As for patch 2: Please don't use <linux/mod_devicetable.h> and rely on
<linux/platform_device.h> to provide of_device_id.

Best regards
Uwe

--bvyb3kuhcvop66ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsi9IACgkQj4D7WH0S
/k5Wggf/YfIQ7WHmvvey+xjJQnqBBC6pD6WMGs1N8zOjBs47xKTlmoiTy704ncA/
SHYjg0IkCpwOICXXvfiXJZFK8h5M7+y5jrB6VR4gKwnHKcUzaD8baV2tzCTRxFzk
q7fKaeI3n7fNH1aRrXWMimidD77eQ9VgIocGQaE05rZOFLWYznwN1IejorHjVYp/
vlaPrjtYabWXJydNPSHUrC4QQNwhhpon6qjxkgmEXkcW4zWORnfjI58d7MJv7jNd
i46zZKPpVOXafx2kCKmbSiggE5i1cPr6O3e+3Muw64B0kJenSgxjkPD0kzt1TMDL
MrWyYaGIU8+0pgKPYFIeJQiOoD98Ww==
=7Net
-----END PGP SIGNATURE-----

--bvyb3kuhcvop66ue--

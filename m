Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887137;
	b=4oKFK9mWi1kmVIsI9+OlaSZ0Jp1niYdVWgHApeQ89Lqa0lBkn6noyR1PtQOv4r+iwmyO
	 Lwf09ZMQCflIJJncYQ7Z87eUbixdm+zeMsw1NX6Yn9zFFwNxL4AgJ+NulQfVevls28t1Z
	 b0yMbruanLzJsB8qKVLy8ZJdpvxUTv2f33xYSof1oa84f3w7SKKLoF/2K2+p4G7Klb+50
	 ir2b2nbvm31T8/lCPG+n+dGT33iR6aFahZEnd10l8qZRJsq550RjM1odY+SqSoDR5nlzC
	 +kq6dp37xo0qSq8DekKB+2IyGsR6dzGu6A1PWglFlmCy0XlyqLeqrJcfy15tTfnPgMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
	b=DMN1jD6BnHVGlKZeqZUKwF8bDYtWi8x0UdhefBmkyveJsSekHJk26al9TFMkoF2ODTjM
	 El/RIY60E4NtXgdazm12gDt5czleAeSl/vgWHKJlXSxNC3UOn2hL8fAgW/+QkwGlP8WSu
	 W9Y5ARQqn0ETUQeUpLP5c3VTABYSVhtIr1aGWVlEFkmuXpwDfpvFJeELwEZj2qLuKkV5y
	 2BoZUGhCjShi9XeXgd7lvkkqmWlWTLySbSJ5iHWB5FMLgpPlPQ8MvbcxA3KjUBbRVsGQb
	 F9VLoO44OHcr2lc793wNuMuG7zL7LR/L1aD31of3KtLF8s3iyQ9M67iwMh+/wTY3GNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C2606A332
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9C2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13770775e9.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887129; x=1794491929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
        b=E0ibYapTp+snHAaLfFV5C5kwF9bCnW48/3xjOj38X1Awn0rWjO2IHMNwe2sdoJi2Xi
         NhkIaFCvlExF3CunDrqNLZ1BIIvnetZfKieCryQ2Gy3j1wqLADFAsc8CshWNWk7uQ1dY
         XyvQB++g1KA08c/s3njsnCmi0inrSKlArTCe0sVwQzLJ5fNVX8WT6EtdW/qCLhpgoyNy
         jgSQen9y+B0oSNAZJ1B5Zu9ziznXalyeQ4KZi/a0IJmncqqhwgt+mlLGB+bGU7OtYhsa
         Ew4E1J9yz69l37hI/lMxYXUih5vde6EJMuEZAPgxqAMGaH4LX+L1pnUe0fTkPNPLDxuh
         CU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887129; x=1794491929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
        b=JvQ1SKTyFZlYIN06HEAb6geTKNGSDhq/NNGJGwrocpn8XYTWC0hgPUnBlxZIHimF4I
         CWx06x3/jrbDJ+gYZose3FXyy1ZsFnlYPodU03SLZAlGWXInIH91M36Po2qPN05X3XAB
         qFStYlgoD2QOfDwQcJGdRbYO2EF4W1kWehefGaSXxu12YYXPn/j5h4WQH9U7Sy3dYkBX
         /8meLJDfFBPSVO/6/jR4xiuEfZxHDQHqURhvA6VArPJiUYSzXZRlLs8IHKSJfBA/ggy/
         zFd6aWnyKViG9VCMliaILZUQCMu512Qxe3nd2dXvAIYxElFtDb8XCNldCzjkBP5XydYg
         DVHA==
X-Forwarded-Encrypted: i=1; AKwUvBwqoYJl/b+zI1bMufgx6Bd91KrNgnbxW+LXIOJodJ5j4G6P0xZEU+8uYrjIila+dGzBdlZUypJmj7niDUGSaUai@vger.kernel.org
X-Gm-Message-State: APuU4Z+yh3SEDjFmguW22Roe+JamHu3jgh6vGfMkd+egyz4NLxDwsKuK
	QuHbwtRWNiGYjqrVtReEnmIk7RMOQqYdZILRiCJQoacpVNTQV/G15zjgz8v+Eq0sA6w=
X-Gm-Gg: AYBFou0EQl+fnZlmnbVquQRlf9qrWt/pCSQRO3+PSHCAqat9qGw6RsotXgjE42LxZae
	ZO+GGQWS6IF+5ftt2kEPZ8AzXu5TjWObi5TI+VTTO5JHAzqb1VQaD6fV1ZzA2KMduO50QxJj66Y
	rEhfqzCGW4qaO1u+vIHANcRgwn1axZLnakjCQjf88/b87qipnJLMiM2RhxrNCAMKQA535qwmqWw
	XKoMmzPJu8a5vrREVlsYZOg4eSxldg21MhB/X5lswmhU5Scd27ej4y2GBbd2hMl++yBzu14SLWA
	xqVauUg7LWbma7BzSnoLqjjTgNYZFawBDHXk3nOlFB9C3HyqxWE/ld1pAThJkg5Vap4jqiX5EHn
	0WxrP/lBC+wHDAoOq7xUnktKW5Fi/lyS4GXTMVdEy9fqIaHw0FaWrAZV8Q0YrXbD8iLqmg6qvJ/
	09HEln+4T6nOrpetx6wxDNXZhK1bb8szEyoU9ZWZcREylZgvvCPMLruviJvsecCYEC+qQfhuznR
	RXP2us2EHAaYMupENZxvEh8HcEDQFkayvHntC5GvVFFVToTXYSmKi7yMQ12X4bU3ic9ItREIneT
	Lnz9lwsXpjimGlFfi9zWqF8IZ9vf
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr375702725e9.22.1793887129505;
        Thu, 05 Nov 2026 05:58:49 -0800 (PST)
Received: from localhost ([194.213.108.8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56ba6bc36sm75097435e9.0.2026.11.05.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:58:48 -0800 (PST)
Date: Thu, 5 Nov 2026 14:58:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] mailbox: sun55i: Add Allwinner A523 message box
 driver
Message-ID: <auyLOc4djmm29Bnz@monoceros>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-3-tcmichals@gmail.com>
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
	protocol="application/pgp-signature"; boundary="6jfoalgweekh6k4p"
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-3-tcmichals@gmail.com>


--6jfoalgweekh6k4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/7] mailbox: sun55i: Add Allwinner A523 message box
 driver
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 12:57:30PM -0600, Tim Michals wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as this pulls in a lot of
unneeded build dependencies.

<linux/platform_device.h> already provides of_device_id which is all you
seem to use here. If you want full iwyu include <linux/device-id/of.h>
instead.

Best regards
Uwe

--6jfoalgweekh6k4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsi5EACgkQj4D7WH0S
/k5vhQf+JI5oqB8wirr4Mfq53+EuIcbqVBMYKSJ4VvYsL5NgmUbk5OmelFsyFXLh
1cTpKfp/pSXjaY74bSTdw8Wzj26UAD6h5WcL7M+Y0R76ERavh1U/j83g7GfDBxJr
eHota1nXeLkRvpDqW7tWDBWn66eu0IeVsO8nlokpZTVhmLk/uFlIIITHp+IbJSUS
oBmB5o0SK31zlNe1wrqwI8jCXjAUPyVcVouZEhNQ5mtIja4FE782+wlnw7agZe69
vl3MG/TIihE7J63RC8U2iKs7BsfN9oB5xF5H8YMQYZ8/3uAj4eNkgFSjpbU8xXtp
IDWe63lnv5ShurGsD35Z20wJbKGEKA==
=hD40
-----END PGP SIGNATURE-----

--6jfoalgweekh6k4p--

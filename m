Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F490376BC2
	for <linux-remoteproc@vger.kernel.org>; Sat, 14 Mar 2026 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773498519; cv=none; b=fg8htJqo/rDqBGsef1o+7dnNFXM8e3ZaTOcbxw5tVGFGoUK/YdllPBHohmiJgc221SZfTIOX5vxZYnM6p3JaJ3eLTRlqnuugxUtPYnfjDp6Xm/QWuRA+l6wi5IoQMUn25pcpODHs7kbrIEJ/6x1XLFkignQrYsJQ1eh4Yej27PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773498519; c=relaxed/simple;
	bh=XpZU3k937Pg1EDwk3hoUh1d/FQnXttxyeM0NFBMxMTI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=G1pZhryHkThafbZ6z57HRW2OKMSo6p4uW6hLa/pims6qCAtTYOcbnzaSa7IdGaZbmy5km9N6iibK9mcPvVY3UklE8KQdvj6L5xU5r0WizRbwmZr6W7/LLzEpCJWdghqQI5MeTW5Fpl/qdPjXIqu7vDnbNsOtgn1yDjWyUdGz/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RN+bru/A; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RN+bru/A"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so24991295e9.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 14 Mar 2026 07:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773498515; x=1774103315; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C+2Tn48ZTy8YJup8oy5qnpSHZErDyfJTbe2tIPOLqQk=;
        b=RN+bru/ApmfvfP4+0T9nmFML9bHW5MpEghE9vgIBqtb7HC++oSoi7XCguqJTw5hwRy
         bkvt22F1uv3XauCItw/BfDV1TuW34fpg4spQ1uUtaNjXZuBJaQGZ94sfAM2NZojcTD97
         Z1j8Xm0ahPMnIW1pULg+wYL5zbBzO1XTEQmyN5nkANijHRiNSvYqkMzuI8SSEBuGCAfH
         WRyU1xZoFxANfaOD7/SSRedk6iy8yIfbmXbUP7bRPA7DTSBeICU2S1fSSOFYnhXOX9Vh
         nMpju9KmXNTCZy202Sb8Y2tWiFCVA4mnM/HB28TFePVyD8dxvd3p3hvITWw9c5Y7ooVP
         hbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773498515; x=1774103315;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+2Tn48ZTy8YJup8oy5qnpSHZErDyfJTbe2tIPOLqQk=;
        b=TG1OtckMbFKhXiILwvwQ02CQBTxag/y35CGBSH5amFSt1hTzXWP20kcGqSfp61Ocz8
         6WOeiKG6BbyRhHG5+B0RcJTtEVKQ//DRhEByvwSjzAM3P1UlK8hZNpW1CXfRH27DN1vd
         ZIce0lRqoK1AECgwCmQqwERObNPXEpJoHQbMveg0bnHREuLZbSuGrc5dghblgMWyrsbw
         9n14stA1QjizpEKiNkeMLeYyS0t+zu6PqQ9Rxn/gLpZeYjXh0MVYjQ0PD1aLzFhWmh9b
         ifMqigG1Muwq3UNqUXaf9nhp5Unrqon5rf9mi1P9hkowsnWjTFiOaFYCopRfltGH5rVj
         m4jA==
X-Forwarded-Encrypted: i=1; AJvYcCVwNNxg0eFUO1gL83vqqRm5Ke/TC/v9BZs+1Vy/TFJA0F008jo8xpOaW2eSqrkgik7urt4P0tstcIaPReYC+aDX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0HTuAtye8JIJWRw1sMbDW48dfeiUUqHQRs4J8eexK+iaxwW0
	6SA7P8hfTVtwgZ3PNdwhGR7O6h1kWlbAjXL+DBDNUjib2KDCcdwWdcZpF28YK19uMMU=
X-Gm-Gg: ATEYQzwhwLRgmY7Yh7+oeI+GLzvYMd2JfTOdIZUMyVv5PsnXSVpFpgmAqLPCX9GQYfM
	aJ02OzASjAfuWDxfM+hOn7n0DF7xALeAVt7qMXRpEVDxNQcwsK4UFwg1CFulTbburCwIDIzFgGY
	bj3eAy9aAFwR9wBPcBtShUso8R20LaQjRTdyIJhVmxJunWI/m0Hla64/oFtG9ur7A1mV7BYlXH+
	0qvIH5IpMOaa3iOWLTRlJI9610HCL7G42eTpVDBw9jQ7W+CsSVgCYFAhGRYRikVudv1FUTH0f9w
	WOmf0JUBCv/fulJfF7X44eLUI77xnV2kdCxpXmN6UZAiwUdVXHENGmYlBZbfcJKrSaM3XXOfzYt
	+zXrO/dXAtLPvKjVyG1xfx6CsEuuftGNk2QVUrJmKs4gF9G/AQpg4nAkJ13nzpMstIwhwIa0flW
	OcXkyf2wGtn6Zre4M=
X-Received: by 2002:a05:600c:3550:b0:485:3983:aba2 with SMTP id 5b1f17b1804b1-4855670b64emr125739085e9.23.1773498515112;
        Sat, 14 Mar 2026 07:28:35 -0700 (PDT)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm753413325e9.2.2026.03.14.07.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 07:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2594bdddbece5ae68bc65d0e181a463f516ad51c50de981b59b6999a2bd2;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 14 Mar 2026 15:28:25 +0100
Message-Id: <DH2KR1W7CWZW.35FWVV4MNS0NE@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Conor Dooley" <conor@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Mathieu Poirier" <mathieu.poirier@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Suman Anna"
 <s-anna@ti.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Vishal Mahaveer"
 <vishalm@ti.com>, "Kevin Hilman" <khilman@baylibre.com>, "Dhruva Gole"
 <d-gole@ti.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall Willis"
 <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com> <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com> <20260313-quantum-modest-prawn-896bde@quoll> <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com> <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org> <20260313-kettle-craftily-aa087e6b74db@spud>
In-Reply-To: <20260313-kettle-craftily-aa087e6b74db@spud>

--2594bdddbece5ae68bc65d0e181a463f516ad51c50de981b59b6999a2bd2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Mar 13, 2026 at 5:18 PM CET, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 04:49:14PM +0100, Krzysztof Kozlowski wrote:
>> On 13/03/2026 14:38, Markus Schneider-Pargmann wrote:
>> > Hi Krzysztof,
>> >=20
>> > On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
>> >> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (=
TI) wrote:
>> >>> If memory-region is used, require memory-region-names.
>> >>
>> >> Why?
>> >=20
>> > This was a suggestion/comment from Conor in the last version:
>> >=20
>> >     Is this really optional? Shouldn't it be made mandatory so that it=
 is
>> >     easy to tell the difference between the two configurations?
>>=20
>> Then write it in commit msg. You have entire commit msg to explain why
>> you are doing things, instead of obvious what. We can read the diff.
>>=20
>> >=20
>> > https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58@s=
pud/
>> >=20
>> >>
>> >> I don't understand also why this is a separate change, but maybe answ=
er
>> >> to "Why are you doing it" would cover it as well.
>> >=20
>> > I made this a separate patch so the git tree never has any
>> > binding/devicectree warnings for memory-region-names even in-between
>> > patches. That's why I created these patches in this order:
>> >=20
>> > 1. Add the memory-region-names as an optional property.
>> > 2. Add memory-region-names to all users of memory-region.
>>=20
>> So what is the point of this if it is optional? IOW, what does this
>> commit achieve? Almost nothing.
>>=20
>> > 3. Make the property required if memory-region exists.
>>=20
>> but only required here? You need to organize your work in logical hunks.
>
> My rationale for my original request was that the meaning of the second
> memory region is modified by this series. Previously it was always
> "firmware image sections", but now it can also be "IPC resources".
> Nothing changed in terms of the number of memory regions (it was 2-8
> before and 2-8 after), so without making memory-region-names mandatory,
> there'd be no way to tell which of the two configurations are being
> used.
>
> This patch should likely be squashed with the patch adding
> memory-region-names, so that it is easily to provide an explanation for
> what's going on.

My goal was to not introduce any warnings in any of the patches.

That is the reason why I only added the requirement for
memory-region-names at the end, after adding memory-region-names to all
users.

The alternative patch order as you suggest is:
1. Introduce required memory-region-names
2. Add memory-region-names to all users

After patch 1 there will be new warnings about memory-region-names
missing for every user of r5f memory-region until patch 2 is applied. I
can happily squash this patch into the patch introducing
memory-region-names. I can also update the commit message to describe
why I split the patches this way.

Let me know what you prefer.

Best
Markus

--2594bdddbece5ae68bc65d0e181a463f516ad51c50de981b59b6999a2bd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCabVwiRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOB
igD/WvYTEC75LExS0Z+nmXUcqQeFFHaNPYlU8r3MTTmbi7ABAIE3q9wziwZ5bY8H
oyiuJEgonYJvR0yiRjyuJx6FJmUG
=5pep
-----END PGP SIGNATURE-----

--2594bdddbece5ae68bc65d0e181a463f516ad51c50de981b59b6999a2bd2--

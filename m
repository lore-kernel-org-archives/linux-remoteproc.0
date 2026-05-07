Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EDA3F0A84
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 May 2026 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159681; cv=none; b=SEFXBhA7CUX41WS/rVpV/xtd+7JgTdCUHkiGFw5l9FfqzsdbxOc7oXlp15LA/DKcEHKE7ePCDtHjmGN3qVYFYsO1i27mOPGLOz8RglGDW6h1ZEQ9efAPAKb4E0rKxTXbk3zVET+OUY+YuFmr7NDZQGmCzyxScMlJsE9RiFWex6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159681; c=relaxed/simple;
	bh=ZhTdEpf2MNFijll5W3x2vK+23ZDC6tNbNnY9iCWqGvM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=fAPc/E+DqQi3cFmyUbQ8BvZKO2FTkyHRjRmqM1inoLZhlp0pcwCvINgroj2xty/J/dnAHy2a+dP1u6L3UG7oXDzATPdWSdeGL0uMPZgFYOcjVkKl0JGOM0+z16VGf32/w9wJCeX7xTlggo1RjyQxOV8kQNlqNn6Qx5Jl3gDva2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=UNzrdjiu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="UNzrdjiu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488d2079582so9323625e9.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 May 2026 06:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778159677; x=1778764477; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PMTg4x+eEXsPu7Tgk5l8N+6jmxWHQBVR0ARsPIG0eJ8=;
        b=UNzrdjiuoS4fURntiwfLsCitXt7+3TAnqCOn45Zk/ctypBCltkbr8ly38X6SvsdaIO
         C0U9eQ5kAePnPtTTvj1T0xVZv48CBRWTPWx/xdFwBMPWb2y9zzBdhFOQ+Sua79Ht1SUp
         MCXUchgU+6aSld2KG7BbfwuJ7eflw0cICGiBxM+3qelmsfmiWZoc8WCMRe18Kv4JvaBZ
         v2FcdNBqX/OUaSjz5WoaouN7RmWPpI8rPScWgWMJu13n4OJ3bXn5fEaeW9E/6Sd6vbb8
         l+RU12AS0ZYDJCmWYBx07hyqvNNPbKk12Qj/hghKtaxJN1AlfRUSLIIQ2pPCRVtnQXnE
         niXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159677; x=1778764477;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMTg4x+eEXsPu7Tgk5l8N+6jmxWHQBVR0ARsPIG0eJ8=;
        b=rZKJBZknyVeD26SjOC4/qvuMaJEnHAzFZV6juU2d7KwQyjMaLtTfgFu2pTfcaIlNM3
         zrTiBexDDfLsk7uzmzxNQihkGBUiuOCH6PdFNkCF2Q6IJMW2CXyZbGH4XorxuJwigr7t
         aCa/X0CYS+dvF907XoeglAc0/76YMkrI/Mybq5rSvpk2tKYPnIRquTkgDoDbMtn3XTTB
         CWAkSD+d3VluaASiegmk5Guwdi/myQYtiwQbK64GyY87PZvvZh2RBvjubuQ5YvL1hHWZ
         0jUxlRUCEkyBWrJZFEf/IrnkdEqz0UUDI/MxAVYkyRrdpjGz3Pvwrap88jj52cPMO0hL
         PNjA==
X-Forwarded-Encrypted: i=1; AFNElJ+pcQWl/pIsiI0tdPSutzdXDM+8z3sZqgO6NSIoztmZqkBTGhwHaVhkoESR1rEywf6JHPzXhKM6WkDwNGhTxDQu@vger.kernel.org
X-Gm-Message-State: AOJu0YxpprM9/MBM5yNugV0VuHoAhtcZDen2inVtbLSXUVkW0Xnf0s16
	quvGOpyjoaTSLZczk8+/m9fBZosg2eH7nD7cnAep6cFJ4+WDdGWTAhaAA4cTfK6w+f8=
X-Gm-Gg: AeBDieunLn3tljVdl9h67atncqd8F94dWsVHnwa9Q0efoqK9bxuQj6Kn8SldTXgPsc3
	S/GXslI7kZNJhyDNNDi57k4aKxbv0DlVgx1Ho3tuK91g6P1vscGGuQS4cGDN6OVsrcdql08ul1D
	Ai0sNVHa51nODwurqP+C4j6ANIz4VExzGmiKiNc9MXCZ6w+9zIrskD/gmN+vBj6hoKC7Y1EyM5U
	1n8mbFjAp+gNVbx9vKMp289dtX2tO9IpcEc9WNpn0/G4s1L2Emcvy8me8wQr6dyv8a16MCZztYL
	1bWsbWOqKRiYd2eZRFOuXKW1N4lljbqxQN8GNGDt7bcm3giBMyp/l6P37fKIB6M8DwfCHuEDrxj
	gGPD7Wd7eVDJhK+NriAcU5zad2u9q9XXmK9s425ruWhEoUpB4vmMg7wcX4fIfGHpEwGYCefBj6I
	pTx+TI1EGo49ggRLWopXKEulvdSc9QCqzzXX3Cjv+B
X-Received: by 2002:a05:600c:4f51:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48e51f3054cmr140580965e9.18.1778159677055;
        Thu, 07 May 2026 06:14:37 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:9bf6:accf:de42:f1be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891163sm136382465e9.2.2026.05.07.06.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1cd2ce29e617ccf25a0057d7944a172c6840176cfdde9913103d3dc41b58;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 07 May 2026 15:14:25 +0200
Message-Id: <DICGZTCMDWHK.HMQMCB8M32ZV@baylibre.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Nishanth Menon" <nm@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Suman Anna" <s-anna@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, "Vishal Mahaveer" <vishalm@ti.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>,
 "Sebin Francis" <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>,
 "Akashdeep Kaur" <a-kaur@ti.com>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com> <20260429-topic-am62a-ioddr-dt-v6-19-v4-1-fc27d6ac753c@baylibre.com> <20260505124121.hffywentvo5pusfx@glowing>
In-Reply-To: <20260505124121.hffywentvo5pusfx@glowing>

--1cd2ce29e617ccf25a0057d7944a172c6840176cfdde9913103d3dc41b58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nishanth,

On Tue May 5, 2026 at 2:41 PM CEST, Nishanth Menon wrote:
> On 15:22-20260429, Markus Schneider-Pargmann (TI) wrote:
>> Split the firmware memory region in more specific parts so it is better
>> described where to find which information. Specifically the LPM metadata
>> region is important as bootloader software like U-Boot has to know where
>> that data is to be able to read that data.
>>=20
>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 ++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62a7-sk.dts
>> index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..6f2ee93c7be141ee5ae3f1e3=
324d3a060db069f6 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 =
{
>>  			no-map;
>>  		};
>> =20
>> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>
> Looks like you have'nt addressed Vignesh's comments from previous
> revision.
>
> https://lore.kernel.org/all/DHS46FH9ZYZB.3BG6HVH832NAE@baylibre.com/

Sorry, I was trying to understand the issue in that thread but I didn't
and didn't get a response so I couldn't really address it.

>
> We dropped wkup_r5fss0_core0_memory_region here..
>
>>  #include "k3-am62a-ti-ipc-firmware.dtsi"
> In this file:
> https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git/tree/arch/ar=
m64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi#n27

This file line 27 is
	mcu_r5fss0_core0_memory_region: memory@9b900000 {
		compatible =3D "shared-dma-pool";
		reg =3D <0x00 0x9b900000 0x00 0xf00000>;
		no-map;
	};

But my patch is removing wkup_r5fss0_core0_memory_region and not
touching the mcu_* definitions.

> https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git/tree/arch/ar=
m64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi#n68
>
> I am not clear where wkup_r5fss0_core0_memory_region is now defined.

It is not defined anymore for k3-am62a7-sk.

> BUT, in the patch, we introduce:
>
>> +
>> +&wkup_r5fss0_core0 {
>> +	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
>> +			<&wkup_r5fss0_core0_ipc_region>,
>> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
>> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
>> +			<&wkup_r5fss0_core0_lpm_rest_region>,
>> +			<&wkup_r5fss0_core0_dm_region>;
>> +	memory-region-names =3D "dma", "ipc", "lpm-stub",
>> +			      "lpm-metadata", "lpm-context",
>> +			      "dm-firmware";
>> +};
>
>
> So we go ahead an override the definitions of ipc-firmware.dtsi for
> wkup_r5fss0_core0 here - explaining why the build does'nt fail. I am
> confused why the ipc firmware dtsi was'nt updated instead? is this
> something different firmware dtsi now? if so, we should split the
> ipc-firmware.dtsi accordingly. Commit message does'nt mention the same
> either. This right solution is to make up our minds if ipc-firmware.dtsi
> is meant for LPM mode support or not. if not, split the dtsi, if yes, do
> the mods in the ipc.dtsi

We can update the firmware definitions as well. I currently only did
this for am62a and am62p as these require the new format so IO+DDR
works. But if you prefer I can make the changes to firmware.dtsi
instead.

Best
Markus

--1cd2ce29e617ccf25a0057d7944a172c6840176cfdde9913103d3dc41b58
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCafyQMxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNz
QwD+K6cqc767M67zBw7vaL0hUeEw8dOTuH2ND3M1gilCBQkBAMKU6KOE5lZ9FFu5
88v+RbDSuYzP0g6h//QRzeC/V+UI
=J7j8
-----END PGP SIGNATURE-----

--1cd2ce29e617ccf25a0057d7944a172c6840176cfdde9913103d3dc41b58--

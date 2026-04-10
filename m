Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB2E3C5DA0
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2026 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828580; cv=none; b=V56cSa3m11YRCiwESY5jhFeKwvCEiTzLTqhcHaVmPEmgG/IvGX/6Ua/E+nz/8w2Bp8hMb9TRAcwTCeTS9TDvgDyzP5k+AW/4NnF8dCzjvyXYeyleAsWPnVGNb2daJPLZnd/zyjmjsUI3J+FGF6O2o7ENtkYAUlcAJWsFl76F6UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828580; c=relaxed/simple;
	bh=GgmsqU/3VJqXdv/a2nne/1eSvDgmwL+akJ6QRheZVMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tNAgtQol+/HDAj3lywn9RwHBcX8PYbGNrxlM97jHjKtccXj67ebDsQNizLumXIAHoguKhsVrxsDr8elJjvFdkXNIyQDu42kD2UtfbvbAUeHSsBhkRVd4gcUKLsoFFw4wlPnp/wVw6SOJfujm20no8k/jtDUOEFDKHOYBNjFG+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=HGCSpMH3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="HGCSpMH3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso1344948f8f.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2026 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775828575; x=1776433375; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LqP6MZ/X3JZngH/ljagVF5jBd2WE3YkVVyVY71Hxwg8=;
        b=HGCSpMH3wrSDVEwKaEsa8/eUDvEoc3mDfwxF/IkpdXL9HNP1RPvOPhKS4GeMollxgf
         baqwLWjyRNAoGkE/BgnTwlDztFLs8xWdWya/fvMCPlKkhU+3ul2cH5vljbG8gqGV2Aci
         NiBdBkpNqWrHsO5+9QRU1/wSto5Tqs6bviIR72rHA+wHuo0z89CgSlTK67evxPDZsCjS
         Zuvnv5Kjz4TLDClaO5L5OvjPuuA7AtOzmZ/E9OiBAetws4EzpjLJpO3iKxwIB2nW9ugf
         hBcayjMf1D7Z8Q/AhWz2+y6Hu91+KoAI0bjEB+8n9bfHpRYRQ9THKCYIlt3zS5JgnlER
         YKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828575; x=1776433375;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqP6MZ/X3JZngH/ljagVF5jBd2WE3YkVVyVY71Hxwg8=;
        b=RJ6ycjEPuLxSPrwopjj3c7mMf9JdCkONgtMeZmEb6rgzmOo51eURh1/RXqIZRpZyMP
         aGYrHx+A7Kib79P2Mj60Y6nFoEUTgM2G6esbadWSOinTo0cf+NsuiFteF/5oYLS3Toeh
         E9KxXAte13iFqo1uvlCSaZ+YoryTSxzcu0ekoAtG0ETrv9oUefSIuaWQv90MOFCByqT3
         Od/NdQAbz6xuPa11m7mXl0yZcfgla82pyQs/reSBo6r6Y/k66QbM8GA6uwKZdoLzvN4+
         qWCIwE9UCioqD/tECVWeidL6ZID+TmeZvv1J7tFgZsPgqJxCqvp1+n1uqrGVn8+3oPZr
         JvdA==
X-Forwarded-Encrypted: i=1; AJvYcCUcp1oGTfd3YsILoJMTRlUDMYocdfxWQ3uKacUJqhPphPtzVvRlMpAp4sj4vOobHz7efFLjNVT7WXnxj7NmnWz9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9MQZ3LCe6R3kC2tHkzsDXV3PnkaRa2XpNTC2U/kyMrABckIKj
	JOAKr+VUNtP/7M1Tke5+Qs4TITUx0ZC4idH38Z9eSRL+uxZxbd8GLs01au3vcwpQ5UI=
X-Gm-Gg: AeBDiesCKA/VmZZGTgG/aM4eh8hPq9RwaH+rUUu+nY5aoo6iW2W674XUuRfSeq0XWaj
	bvd2sRTLGR4h3gv7U8GEI4I37hdu/sajTfDWIqHIAdcIRuhP7+foTkYj5sygi2X5B3KlUU3jfPF
	Of0uMs5SI99NJrztxnuP2EKWi9P5JnOj72gTnRY/S+DDV0/M/IF5DMD21NTektq2ye3B0GLl4Fi
	ZuMijJHq3hmNLG3MyzUP/T07EL0RQxOqICzG/YT0kcbO+mAadDrMjfx6Mv3yv1P17405gXIscdb
	Ky7NjpnypgRIF1kKjo7j+JT/CCNl836A1wZcfG+QCGzEurFibLQH6N9UkQ5rAfrNIzUHiqFNTyb
	cuyxFO5pHWSf3YVd1rgZxgvbM9ilEg2Qh8jA63chM0uYvfOQ0L2EYRJowWuadUKhNTOGW42VBX7
	LsTDKLiViO9zpiKw==
X-Received: by 2002:a05:600d:8449:b0:488:b683:a421 with SMTP id 5b1f17b1804b1-488d683d51bmr33002115e9.19.1775828575183;
        Fri, 10 Apr 2026 06:42:55 -0700 (PDT)
Received: from localhost ([195.52.170.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b3cbb2sm76078325e9.13.2026.04.10.06.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=fce1b4727364f5973feb041246ca85370b02d5848da19ed76fba443450be;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 10 Apr 2026 15:42:48 +0200
Message-Id: <DHPIOTXA81M3.AHBN8M49ENG5@baylibre.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Suman Anna" <s-anna@ti.com>, "Nishanth
 Menon" <nm@ti.com>, "Tero Kristo" <kristo@kernel.org>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com> <20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com> <8673745d-aad2-49d3-b3af-556de7037b69@ti.com>
In-Reply-To: <8673745d-aad2-49d3-b3af-556de7037b69@ti.com>

--fce1b4727364f5973feb041246ca85370b02d5848da19ed76fba443450be
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Vignesh,

On Fri Apr 10, 2026 at 6:30 AM CEST, Vignesh Raghavendra wrote:
> Hi Markus
>
> On 18/03/26 20:43, Markus Schneider-Pargmann (TI) wrote:
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
>> index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9ac5=
bcdff745a9559a89 100644
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
> There are still references to wkup_r5fss0_core0_memory_region in
> k3-am62a-ti-ipc-firmware.dtsi (same comment applies to next 2 patches as
> well)
>
> Dont those need to be updated too?

I only updated the sk boards as these are the only ones that have IO+DDR
support that I know works and need the new memory region layout. But
thinking about this, updating the memory region structure shouldn't be a
problem for the other boards either, of course I can't tell if IO+DDR
would work on them, but the new memory region layout shouldn't break
anything.

I can respin the series or do a followup series with modifications for
all boards if you like.

Best
Markus

--fce1b4727364f5973feb041246ca85370b02d5848da19ed76fba443450be
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCadj+WBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOm
TwEA3u6RqiPdFMVzltU2VOokKlHJ2REIqs5yRIMNmRsfRb0BALqUuasImLphT+IM
k1FzSwoCFPxGLFA9l7C4E3YR3HIE
=b2//
-----END PGP SIGNATURE-----

--fce1b4727364f5973feb041246ca85370b02d5848da19ed76fba443450be--

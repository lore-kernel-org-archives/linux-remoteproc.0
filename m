Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083D43E314D
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701589; cv=none; b=eEZPb31hTJGz03Pa/cGJkQO0bqVQwJ9cKwjvxsH7AE8F84/Ph3MNFj0gEiGov01aftEhh6bGCBQzkaRSGmF28Gh6U2OVA17wr65qu7KrlUhCskBOIdytQEEDMNHr3kdpsmBGW0L1vdISwlN22EsZhcHdzQhli3P+hdYaqR/utv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701589; c=relaxed/simple;
	bh=2+pxe1kU4fEfdSxs26jAJpTMIaMSl6lYnVxeYKl+0io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vhs5gc48NYq/YIn7hu+VU/JeA9Ixk6ynZCkg0Fds/7y2rViIZnZ745/orTX2vy+o/5R3cjvlJ8ozWzu6IN4FPM4ggx3lL5iulXvtBgbbcAVFSODy9gMQY7v8ckBTVIMfSkTHiOFeTahKLMycgwBkQHrsWJEtLvnP6wsHOeZK8GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XY7Dy1J0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XY7Dy1J0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49048e043e5so18958695e9.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 02:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701586; x=1780306386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=;
        b=XY7Dy1J0v9GjqHUP3kCcP+HunkHtpw3HSWpkzPjG3wO3iaWW+TmQPTmRL7ok3OstKU
         atJTDISqf7EPVmQiTbaGlvCcByuWcug6z5NjcY8BymOblQxWfAWduXiBU7POLJC4QwF4
         Hg0vvxKnVkLGiOTaIVua/zx0z4Lg5KIH6Y2SXfP4Ti9/zyCsgWgLdg00zpru25WzaBou
         7HZNjPlxpW5X/h+KxBgVYLoUADWVVn/ysn9xmo7OZ8AmvQFtC8hh60muO8bcG8Qh4oK4
         DOG6F5rN4o+TSu/UE2H0h6JjYpJ70Hqrgs3hTfZWlykiJmQKzGsRXla5I5zDXtAsLNEo
         t+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701586; x=1780306386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=;
        b=S6OssFEPEg1uFo/lt4oD/90KpDqdfajG07yxiosyocQ2maMjt1p7/crjyseBOYLVfb
         gyn0WvJsyXq0KdjUwuVNaikU6i5/BSStLoqcjnQtLB0Wgh7c1NAbw5meYqqQ8gFem31B
         TOdql/oIGm311tYepvbMdAgyhgXiZ64jj2Yp83hzmMcA8uobOU0vE+xWtMcif3wbj25C
         AaMzW/sAUm0bgQDCuuW2eLU6ozX0udlQGwlfiJGfqIV1iqMIAv5kuzSDSptUeKwirlMa
         khaX0BmfXss5cD5Fp0yh7ny+1BWes1+c8lkcznW2T3I7tghlKExaJkdIoMcm4awha81l
         b6Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/0YiltEpTlH3p2zz3YjIniNnK2aXMpv5BYlBfsAgkzClJToJxYVIL2WEUpS5otTr+MibdHVc5lLAwQd7pBBrHx@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzBwSiP5eATaSMak2FiFJ840ls1rUpZyHPBAWW7wqSn7orOHU
	NssjjUZIKcTngI2xswpe1yMZ4iMW8KW2NIeEHYG/MosjdBsQNDJA8AnI
X-Gm-Gg: Acq92OHh4xaI98gOMSt/Tg/BUrpSNRBBHPzIco3KeBENO/dGf74eZhpvtlkc4dc1KTL
	NeD16bknv40cWI8ZuvZFI2Y38acufascgIEtt7GNYwmOQJwpdjtUw4201L9ewYmHYkmMiCHtRCS
	43ZRMnt9sFyzBYhte/32mOzWFSsTRrJj6A6VVAtpdbcSeTI0+Ifw9DuG0Mg2XPfPa26cL0sZ3HX
	YT5VHiHWgNlrxAUtOfEbDUibFuSZ6Pa12L2UBZqpfDtT8XFoKv8Y5BHtse4QeLjhzRhsXBV6bvf
	daiGO70AOXDzKlX1oaqD5vSey0SjsSEZH0W96dO9T6pCEBXbSIHT4D1zWMZHki3cICmhXiShb5I
	erafQ+egBItqeWlZXFDQly0SJtzndooBLylaOmT6dpuCNDsrBBOx0mKcHOQe0jNYYp4C7rJyIzN
	HvMR/yQYFWYlXO1gx7rjSPdOJrPDImI3p5tH60IpYrxceX4Q2OAGkhIRtj
X-Received: by 2002:a05:600c:8484:b0:490:3c94:a3c6 with SMTP id 5b1f17b1804b1-490428e205cmr231028375e9.26.1779701586132;
        Mon, 25 May 2026 02:33:06 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904333146bsm135468715e9.0.2026.05.25.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:33:05 -0700 (PDT)
Message-ID: <3c2bc7b9-33e8-4840-af41-ce6e7308ae2f@gmail.com>
Date: Mon, 25 May 2026 02:33:02 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7
 node to SoC DTSI
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-4-laurentiumihalcea111@gmail.com>
 <ahOwvnij7Fwxh3La@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ahOwvnij7Fwxh3La@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/24/2026 7:15 PM, Peng Fan wrote:
> On Fri, May 22, 2026 at 04:18:47AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The CM7 remoteproc configuration is common to multiple MX95-based
>> platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
>> Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
>> channels using <>.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++++++--------
>> arch/arm64/boot/dts/freescale/imx95.dtsi           |  7 +++++++
>> 2 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> index 7d760470201f..c94a63a3bf8f 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> @@ -145,14 +145,6 @@ reg_wifi_en: regulator-wifi-en {
>> 		startup-delay-us = <2000>;
>> 	};
>>
>> -	remoteproc-cm7 {
>> -		compatible = "fsl,imx95-cm7";
>> -		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
>> -		mbox-names = "tx", "rx", "rxdb";
>> -		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> -				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> -	};
>> -
>> 	reserved-memory {
>> 		#address-cells = <2>;
>> 		#size-cells = <2>;
>> @@ -204,6 +196,12 @@ vdevbuffer: vdevbuffer@88020000 {
>> 	};
>> };
>>
>> +&cm7 {
>> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> +	status = "okay";
>> +};
>> +
>> /* SMARC GBE0 */
>> &enetc_port0 {
>> 	pinctrl-names = "default";
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 3e35c956a4d7..f8760ac067fa 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -272,6 +272,13 @@ opp-1000000000 {
>> 		};
>> 	};
>>
>> +	cm7: remoteproc-cm7 {
>> +		compatible = "fsl,imx95-cm7";
>> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
>> +		mbox-names = "tx", "rx", "rxdb";
> 
> Please not put mboxes and mbox-names in dtsi. Some demos may not
> require them and boards may use different MUs.
> 
> Regards
> Peng
> 

Not going to insist on this.
Frank Li, are you ok with dropping this patch and handling this at board/SoM level?


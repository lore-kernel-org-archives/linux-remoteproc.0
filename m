Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1113635C;
	Tue,  2 Sep 2025 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816663; cv=none; b=KcFcNB8TXA0Z7D068ZWF1Nd6VoHrzsXp0pcE+oHk+xrDumU+EHDoM++Y6Qbm9VNrcFK6SWvaYagx2uEPiC0kH2Q9cMWLsT+d3vln3tIz6nVl6TpEolIYzMTxvIWMaIrX/98bJ8eLwH2iJ9pdTdlyZ0oCK05E0TaiwOz+u2WrCSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816663; c=relaxed/simple;
	bh=zrwsApuUuDkrPpYq2G0KGa4cIKPy0wKf5vnpWxFs5QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H+gPX9ek6YjtmK5H9U7627/FZVMW43h1VyE9uecyotenNbQpxTqfZ2eSfrPN4NYtktzhHotk32F3pDo2qvX3HXjZDyV6QgnrelweW+ASivdElrmWDe+qnZy5ySgAcN5m4X1PgQ8Cw6T23ffr0CSqtrm6uos4rTdUMgOaFqZhAxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=sxUBENY9; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="sxUBENY9"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582CXPwC010299;
	Tue, 2 Sep 2025 14:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xWK5LjYNDXJb1VRRWLnTGxLcmQ0F3SifvZSboP4ZaLo=; b=sxUBENY9z1oeaQHw
	M1iHcy8NoLBIUzDfpqy3OpvGE+eNMD7FZpT0IsisQBl+ReuUChLMC4vUw49jN23p
	W9anD+Jrv5Su7COecZmfw3tfv2fDl7D4jTHsEInThvvu52PbalpdF4X49GB1uSyy
	mEUq84xvFgp7NXQ2/9/Sum7DATQczFGChM5Z+01DvU+drc4q3a97IEfCvvP/U9fv
	DYathoeSLQYz9VVq5qzqTePnvq5yWv+jBSVpXXXveKL4CzDe5vaZh+otaU+rF13d
	s1utOxI3xBGCTI/GpXhlI5JAZptYIrTcFoWanY/v+k9h6Pk3dLe5rHT8Bo+DEB7/
	AEL1rQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7bxyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 14:37:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 37E9D40046;
	Tue,  2 Sep 2025 14:35:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfcas1node2.st.com [10.75.129.73])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BE9B39EDA7;
	Tue,  2 Sep 2025 14:34:39 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFCAS1NODE2.st.com
 (10.75.129.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 14:34:39 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 14:34:38 +0200
Message-ID: <f335dfa3-be7e-4321-8625-d6862bb4d574@foss.st.com>
Date: Tue, 2 Sep 2025 14:34:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Mathieu
 Poirier" <mathieu.poirier@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-4-shenwei.wang@nxp.com>
 <CACRpkdZq25n4gZSesV8z8zrBs6kqU1a8=vwVkPBwM+hFb9JKwg@mail.gmail.com>
 <bb5cb154-0f7a-4e21-afe3-453ff5ee9373@foss.st.com>
 <PAXPR04MB91859E0AACFBC1FC913019848907A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB91859E0AACFBC1FC913019848907A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01



On 9/1/25 19:22, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Monday, September 1, 2025 2:27 AM
>> To: Linus Walleij <linus.walleij@linaro.org>; Shenwei Wang
>> <shenwei.wang@nxp.com>; Bjorn Andersson <andersson@kernel.org>; Mathieu
>> Poirier <mathieu.poirier@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
>> Conor Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>;
>> Sascha Hauer <s.hauer@pengutronix.de>; Bartosz Golaszewski <brgl@bgdev.pl>;
>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
>> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: [EXT] Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>>
>>
>> Hello,
>>
>> On 8/21/25 11:01, Linus Walleij wrote:
>>> Hi Shenwei,
>>>
>>> thanks for your patch!
>>>
>>> On Mon, Aug 18, 2025 at 10:45 PM Shenwei Wang <shenwei.wang@nxp.com>
>> wrote:
>>>> On i.MX SoCs, the system may include two processors:
>>>>           - An MCU running an RTOS
>>>>           - An MPU running Linux
>>>>
>>>> These processors communicate via the RPMSG protocol.
>>>> The driver implements the standard GPIO interface, allowing the Linux
>>>> side to control GPIO controllers which reside in the remote processor
>>>> via RPMSG protocol.
>>>>
>>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>> Since this is a first RPMSG GPIO driver, I'd like if Björn and/or
>>> Mathieu have a look at it so I'm sure it is RPMSG-proper!
>> Could this driver be generic (platform independent) ?
>> Perhaps i missed something, but it seems to me that there is no IMX specific
>> code.
>> Making it generic would allow other platforms to reuse it instead of duplicating it.
>>
> The driver uses the RPMSG channel just as a transport layer, so the implementation is actually
> platform-independent. However, it requires the remote side to implement the same communication
> protocol and behavior for the GPIO controller.
>

Yes, pending implementation is needed on the remote processor, as is 
already the case for the rpmsg_char and
rpmsg_tty Linux drivers. If a generic remote implementation is needed 
for this series, then it could be
implemented in  the OpenAMP project as done for the rpmsg_tty and 
rpmsg_char [1].

The idea here would be to have an equivalent of the virtio-gpio driver 
but based on the RPMsg protocol instead of the
virtio one.

[1] 
https://github.com/OpenAMP/openamp-system-reference/tree/main/examples/zephyr/rpmsg_multi_services

Thanks,
Arnaud

>
> Thanks,
> Shenwei
>
>> Thanks,
>> Arnaud
>>
>>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
>>>> a437fe652dbc..2ce4e9b5225e 100644
>>>> --- a/drivers/gpio/Kconfig
>>>> +++ b/drivers/gpio/Kconfig
>>>> @@ -402,6 +402,17 @@ config GPIO_ICH
>>>>
>>>>             If unsure, say N.
>>>>
>>>> +config GPIO_IMX_RPMSG
>>>> +       tristate "NXP i.MX SoC RPMSG GPIO support"
>>>> +       depends on IMX_REMOTEPROC && RPMSG && GPIOLIB
>>>> +       default IMX_REMOTEPROC
>>>> +       help
>>>> +         Say yes here to support the RPMSG GPIO functions on i.MX SoC based
>>>> +         platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
>>>> +         and i.MX9x.
>>>> +
>>>> +         If unsure, say N.


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825D76026;
	Thu, 13 Nov 2025 22:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763073274; cv=none; b=mqR/v2DWF4yggWfzXtNXzTwKcBYFk+QViHWZfPhZik2A18EL7ebZaenMIKcQzVKctldaYEAS1LSLv+EvfYeA3w6BrRU8thsRbmO4GK6mdZkSpAXcdYfXyR4giB6BuPW3cA/KBGeXQ50DWWDygbWTfXuO+WG05fEKziHci8nVhMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763073274; c=relaxed/simple;
	bh=IKaqYh5FTlwHvhByay4VeK+Ue+9R1/kNxroMbxuEdO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMlpn7FRaVE0MKa5JupeSYAX1/FLjydQq04CMJlw8smDSsSIk3gK7WcA5mI/zoSx5+uQoYSVmDQl+t7VqbgTk6AFkEgXMUeMGjvqIfgz1tpm5FzI+zt2+NKL2MNwd6pzloQD7fbhkRbUdpeTeSaZoAc8VWiTZv3d5bWMRfLDV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mMvp/yTD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mMvp/yTD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IAH0ljWgr/r7rtXP8CHeFZ266fhcWeM8ywYAtKpwpc4=; b=mMvp/yTD9SPaIQlUi1UFT0cpy8
	2e5XRvbZbB1/z8djasK2KUJxtN+W1llaOPDGS0CeGuICL6IHPyhAEHVTeRMc3PWy0OnMZuefFCSJ7
	E/BAj5KOmuo0WjXta7c1yui762WouZhvmb9UFj9SBxHTLMHmxLbdpYBGqZelybbZMwJfY1BziTdiH
	83T7QVKoDu7xZoDnG5ZNGiSYqmrxBKWiHe6bcF6GH1kplubId45+QPCaIlLUt6tcNB21ATHB5jPO3
	eAj9Uv70j4JWpfRwrgAfgdph0qPDzLxgB8JTjdFg1ru5JmDbwstrDy1WjytM4dH0+bN9LryzO3Grg
	PzXuCWFw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJftd-0000000BBsF-2zge;
	Thu, 13 Nov 2025 22:34:29 +0000
Message-ID: <6757912e-c729-4114-8aea-44a34a9c3a3d@infradead.org>
Date: Thu, 13 Nov 2025 14:34:28 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <20251112125741.GB1319094-robh@kernel.org>
 <CAEnQRZB4ymvSERKhJW=PAk5xA2JYD=i4wzkbumj_g5S8BjONjg@mail.gmail.com>
 <1dd236fc-26f7-4c02-b183-c3fc13d24767@infradead.org>
 <PAXPR04MB9185B7827B1CCD1CD8D0E9B389CDA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <PAXPR04MB9185B7827B1CCD1CD8D0E9B389CDA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/13/25 2:23 PM, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Randy Dunlap <rdunlap@infradead.org>
>> Sent: Wednesday, November 12, 2025 3:18 PM
>> To: Daniel Baluta <daniel.baluta@gmail.com>; Rob Herring <robh@kernel.org>
>> Cc: Shenwei Wang <shenwei.wang@nxp.com>; Bjorn Andersson
>> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>;
>> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
>> <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus Walleij
>> <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix
>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
>> Peng Fan <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
>> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
>> Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
>> On 11/12/25 5:35 AM, Daniel Baluta wrote:
>>> On Wed, Nov 12, 2025 at 2:59 PM Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Tue, Nov 04, 2025 at 02:33:13PM -0600, Shenwei Wang wrote:
>>>>> Describes the gpio rpmsg transport protocol over the rpmsg bus
>>>>> between the cores.
>>>>>
>>>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>>>> ---
>>>>>  Documentation/staging/gpio-rpmsg.rst | 202
>> +++++++++++++++++++++++++++
>>>>>  Documentation/staging/index.rst      |   1 +
>>>>
>>>> Why is this in staging when none of the drivers are?
>>>
>>> I guess that's because remoteproc.rst and rpmsg.rst are in
>>> Documentation/staging and that's because when converting them from
>>> .txt to .rst the author didn't know a good place where to move them.
>>>
>>> Would Documentation/driver-api be a good place for these doc files? I
>>> can move them and then Shenwei place the gpio-rpmsg.rst in the
>>> Documentation/driver-api also
>>
>> Documentation/driver-api/gpio/ if its driver documentation.
>> Documentation/userspace-api/gpio/ if it user API docs There is also gpio
>> documentation in Documentation/admin-guide/gpio/ which could also be
>> appropriate depending on the nature of the document.
>>
> 
> Thanks Randy!
> 
> Do we have a final decision on where to place this document?
> My thought is that Documentation/driver-api/gpio/ seems more appropriate. 
> However, it’s worth noting that while this is a driver-related document, it doesn’t describe the driver API itself.

I agree that in driver-api/gpio/ seems to be the best place for it.
(even though it's not my call)

-- 
~Randy


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3402874ED;
	Wed, 12 Nov 2025 21:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762982296; cv=none; b=m9g66A1OJjgnMqmvCDYXqDck0RUJGG1qg442pkhHDNS0tc4ugNfWnyoEC2/elubCobxG2gA9HDArf/GWPNli7WRA7pJWCssQcY/3cYRmXPVBdX0F31TfMvhjYFJ91tcwPq+cNG+lz2ep6NrscCBZBFLdtL0KKIP0wl7GiGCsgso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762982296; c=relaxed/simple;
	bh=cw8aLLstIpkNY61VL2Zf1icBfgfy27WtaHcCKq84PYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJ67RAnxvmIxgn6Aib4R+L09MQx6znFDAdny/ambkxnM4xYqM86wVuCoQ5g+ISan/EZ+nqokfbojMw5JLEQCXy82lhtcJO7+2GtmHgJ9nYYPp60/m2bRKv4KW+n9C4oPNZaU6POhC+wb8I9uqJUwfYG1RpCAztiyIkBQyZ+8q50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=G1lxgetf; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="G1lxgetf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gdSVwVNFWa3UDXoRV1/YfYWA8WTDmQgTkzVuCwG7akc=; b=G1lxgetfC7Zd7s86zg/08QZrTc
	Whr63hWvH1OMA9Foe7hxbzxeXVZSGhbueF4cV72JQ9GqPqt1rBcPr0gS7ZxMaM28pYZKoTeLgJcoC
	WWiRgCfgri/C042sU1nOHCQMFC/knOU+VZcNYYN5KFNbFTCO3FABOTnrxAJpFgsA2kgz3jvE1CUZL
	/WTVNDygkdnn3dsUdKeslaluUKlvWoGYfUeoYnVP7QBkl6QQuDIg36L/uu1yVsXz2ykCe0pNSmDCT
	ptfdh+XcpjW02zTXN/Wx8a2+fNSh8OUjHgwYxmgJhQ3jrDSZT/yRlbsWBopkYKcU/SW5CiHMHkGzq
	pMwA29iw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIEB-00000009Wvw-0PB3;
	Wed, 12 Nov 2025 21:18:07 +0000
Message-ID: <1dd236fc-26f7-4c02-b183-c3fc13d24767@infradead.org>
Date: Wed, 12 Nov 2025 13:18:06 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
To: Daniel Baluta <daniel.baluta@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-imx@nxp.com
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <20251112125741.GB1319094-robh@kernel.org>
 <CAEnQRZB4ymvSERKhJW=PAk5xA2JYD=i4wzkbumj_g5S8BjONjg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAEnQRZB4ymvSERKhJW=PAk5xA2JYD=i4wzkbumj_g5S8BjONjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/12/25 5:35 AM, Daniel Baluta wrote:
> On Wed, Nov 12, 2025 at 2:59 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Tue, Nov 04, 2025 at 02:33:13PM -0600, Shenwei Wang wrote:
>>> Describes the gpio rpmsg transport protocol over the rpmsg bus between
>>> the cores.
>>>
>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>> ---
>>>  Documentation/staging/gpio-rpmsg.rst | 202 +++++++++++++++++++++++++++
>>>  Documentation/staging/index.rst      |   1 +
>>
>> Why is this in staging when none of the drivers are?
> 
> I guess that's because remoteproc.rst and rpmsg.rst are in Documentation/staging
> and that's because when converting them from .txt to .rst the author
> didn't know a
> good place where to move them.
> 
> Would Documentation/driver-api be a good place for these doc files? I
> can move them
> and then Shenwei place the gpio-rpmsg.rst in the Documentation/driver-api also

Documentation/driver-api/gpio/ if its driver documentation.
Documentation/userspace-api/gpio/ if it user API docs
There is also gpio documentation in Documentation/admin-guide/gpio/ which could
also be appropriate depending on the nature of the document.

-- 
~Randy


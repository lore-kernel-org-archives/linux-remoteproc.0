Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388229A0;
	Mon, 14 Oct 2024 17:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728926793; cv=none; b=GBQO2iYzGePghwygtCKUcfgcAvPFszDMC7iKNHtDXsI8RyA+NxywTVl+VUJDRPrNajKwnHWzIw3Mj+Njq6Xbq3cEfnPTBeVGGuVQD77szUIs6wjfhtq6p7+I7yAjxCrue22x1K12ZieJNTSq+PANj3mnq5aazmTXmODELIR2jMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728926793; c=relaxed/simple;
	bh=E7nk6IoQSblWHJhwYKMKPcOHYgaJGc9Gr7thEAwwr60=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bQjv6wK3VU7cQvhQfNnSY/YN8kG/EBXUE10O6UwMA0ykIpLWTQhsCBxT0+rp3OCWp33oXwXwe9WQhhbyAeSCa3AeAq7MmlRPwN4ohs1JGUi4zvufwnm7b7j57gLpX+tHYMT/vrAkr7xSLgzx4NSeZCPEtlQDlkdI3U55Q5SXjDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yTzIZ4Vx; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yTzIZ4Vx"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EHQNk7119951;
	Mon, 14 Oct 2024 12:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728926783;
	bh=pd6KlbS4/3pcFfLXpZuC4BuPG9Peiiptz14abFf48iU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yTzIZ4Vx0y684Eq+RH0p3c7CvTGCLr49MeHzdAHfTsB30HbALJwjOEZsxvhBVGl70
	 Oi25DG68HkPdY6M0vJn73ldOvsOyDLOW7ATTIw1qSVbz+pxTofmLVl+EQOYzu+QIRX
	 wmJtD9Nd4HI7DLcBddjIb28ZOFajwnqGL2c1XREk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EHQNjo065796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Oct 2024 12:26:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 12:26:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Oct 2024 12:26:23 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49EHQMIA108140;
	Mon, 14 Oct 2024 12:26:23 -0500
Message-ID: <585e5471-8a49-43cd-afba-055855be8e75@ti.com>
Date: Mon, 14 Oct 2024 12:26:22 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
To: Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>
CC: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Martyn Welch
	<martyn.welch@collabora.com>,
        Hari Nagalla <hnagalla@ti.com>, Jassi Brar
	<jassisinghbrar@gmail.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241007132441.2732215-1-arnd@kernel.org>
 <4d8a9786-ee4b-43b8-9207-e048c66349fe@ti.com>
 <e6c84b91-20ce-474a-87f8-9faeb64f3724@app.fastmail.com>
 <20241014165238.nbllvtnxrxbwg344@frying>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241014165238.nbllvtnxrxbwg344@frying>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/14/24 11:52 AM, Nishanth Menon wrote:
> On 15:43-20241014, Arnd Bergmann wrote:
>> On Mon, Oct 14, 2024, at 14:56, Andrew Davis wrote:
>>> On 10/7/24 8:23 AM, Arnd Bergmann wrote:
>>>>    config TI_K3_M4_REMOTEPROC
>>>>    	tristate "TI K3 M4 remoteproc support"
>>>> -	depends on ARCH_OMAP2PLUS || ARCH_K3
>>>> -	select MAILBOX
>>>> -	select OMAP2PLUS_MBOX
>>>> +	depends on ARCH_K3 || COMPILE_TEST
>>>> +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
>>>
>>> This line is odd. IMHO "COMPILE_TEST" should only be added to ARCH_*
>>> dependencies, as often only one ARCH can be selected which prevents
>>> compile testing drivers with various multiple architecture deps in
>>> one compile test.
>>
>> I generally agree, but the TI_SCI_PROTOCOL interface
>> definitions that were added in aa276781a64a ("firmware: Add basic
>> support for TI System Control Interface (TI-SCI) protocol")
>> appear to explicitly support the case of compile-testing.
>>
>> See also 13678f3feb30 ("reset: ti-sci: honor TI_SCI_PROTOCOL
>> setting when not COMPILE_TEST").
>>
>>> Normal dependencies, on the other hand, can simply be enabled if one
>>> wants to compile test its dependent drivers. In this case, TI_SCI_PROTOCOL
>>> cannot be enabled as it has a dependency up the chain that doesn't
>>> allow selecting when not on a TI platform. We can fix that as I posted
>>> here[0]. With that fix in, this line can be simply become:
>>>
>>> depends on TI_SCI_PROTOCOL
>>
>> That's certainly fine with me, but if we do this, I would suggest
>> also removing the stub functions from
>> include/linux/soc/ti/ti_sci_protocol.h, and the dependency in the
>> reset driver.
>>
>> Adding Nishanth Menon to Cc, to see if he has a preference.
>>
>>       Arnd
> 
> While I am OK to do the cleanups and make the drivers independent,
> I am also looking to make TISCI stuff independent and be a module
> itself. So, dropping the stubs will probably get in the way as we move
> ahead with those plans.
> 

Not sure how having the stubs would help with that. TI_SCI_PROTOCOL
can already be built as a module. The stubs are what cause this
issue here. When built as a module, the stubs are not active so any
driver that depends on this module that is built-in will cause a
link error.

Stubs only make sense for optional components, like GPIOLIB, where
the driver using that component can continue when it is not available.
For all drivers that depend on TI-SCI it is not optional. The dependent
driver *will* fail to probe and error out. These stubs do nothing, and
I'd like to just remove them.

Andrew

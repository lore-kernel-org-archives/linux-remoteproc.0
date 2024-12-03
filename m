Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DB11F6696;
	Tue,  3 Dec 2024 15:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733239201; cv=none; b=uUU0ubZyhEs1+yV8qWjlRrxhiUW7s7seQuYaPeCp2EOSrgDYqRhU8p96OL0KrvuXQSaSDUopHZDOYBzrKtIKxShRkm85JGEs3dX8XD/2c6qxWrvOpZUEtySJcN1uH1V0j4Ljyo465ZbcYfpNKJeOpw5UgFJTraMBWXd/9RHRf6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733239201; c=relaxed/simple;
	bh=r8NHlGKkvzFAcT0SZ0mYCr04LfccRcl89uBcbns51b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rhPz8HDJlfUoNggVObHi22LkIl9RB8CQUZnFwAYU5QEELK/PnJELTbySeFET4ZBkN+Jy/aU6D0ItSfVtcMr1LXAEHMVMQNaYAAPPEDzn/H4AeFKnV84D+AZVD4ctF+SNo5E1lzFmcgWMvko8Bm8IcsORk7mIq3YhJpTrH20i60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eVLx43up; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eVLx43up"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3FJWpj1464508
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 09:19:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733239172;
	bh=LGUqq64qZLiuZtNZdz+BkB7/VMcZ/uuulFU7fJU5las=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eVLx43upvD6/yOlNy1zscdtMSq+iFWVDzy2SQ3+IXUtZZPZEkJSQ5C3i+5a/cimOH
	 303zQM8WdkEtbSHPAepO5il8jU+fun3x5MQwXc0KQO3CuJKeTRp4Wd2Eb6zJvo+31V
	 DIG+pZgweuCnoTJvsTZbgYtxvPMmel6vBeE3jiI8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3FJWer016438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 09:19:32 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 09:19:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 09:19:32 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3FJVsZ062351;
	Tue, 3 Dec 2024 09:19:31 -0600
Message-ID: <901d75f1-76ad-4c32-920b-1e9b10270236@ti.com>
Date: Tue, 3 Dec 2024 09:19:31 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg_ns: Work around TI non-standard message
To: Richard Weinberger <richard@sigma-star.at>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Richard Weinberger <richard@nod.at>, <upstream@sigma-star.at>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <upstream+rproc@sigma-star.at>,
        <ohad@wizery.com>, <s-anna@ti.com>, <t-kristo@ti.com>
References: <20241011123922.23135-1-richard@nod.at>
 <3194112.zE8UqtGg2D@somecomputer> <Zw6suCNC62Cn4fE0@p14s>
 <3518312.cLl3JjQhRp@somecomputer>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <3518312.cLl3JjQhRp@somecomputer>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/15/24 1:00 PM, Richard Weinberger wrote:
> Am Dienstag, 15. Oktober 2024, 19:56:08 CEST schrieb Mathieu Poirier:
>>>> In my opinion the real fix here is to get TI to use the standard message
>>>> announcement structure.  The ->desc field doesn't seem to be that useful since
>>>> it gets discarted.
>>>
>>> This is for the future, the goal of my patch is helping people to
>>> get existing DSP programs work with mainline.
>>> Not everyone can or want to rebuild theirs DSP programs when moving to a mainline
>>> kernel.
>>
>> That's an even better argument to adopt the standard structure as soon as
>> possible.  Modifying the mainline kernel to adapt to vendors' quirks doesn't
>> scale.
> 
> Well, I can't speak for TI.
> But I have little hope.
> 

RPMSG_NS_2_0 is a compile time option, you can turn that off and rebuild
the firmware to go back to the standard message structure. Our new firmware
doesn't use that anyway (and it was only introduced to support some OpenMA
firmware that had multiple channels. It was left on by default in some old
firmware SDKs which is why NS_2.0 is in more firmware than it really needed
to have been). Is there some specific firmware you a working with that cannot
be rebuilt?

Andrew

> Thanks,
> //richard
> 

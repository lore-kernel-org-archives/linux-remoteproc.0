Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC33D2264CF;
	Wed, 26 Nov 2025 21:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193164; cv=none; b=YWAAzlv1ysPMjvlVtj5tlPWiYEjst3HykhZ2KQRZu9tJIkYTUAkz5xXcKq8OpvX2G4PDoU7uk60AkTUK1KCKrfghlO8V3wM9wkX0A0kgnCHGOGkYgWoZvw5x5mVkthsPteh8ztdZTnpQXBd+mDM4mt6wNRNsaSFGkaic+Ttyrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193164; c=relaxed/simple;
	bh=hsx2CLGiJQ0ikCWHC/BeAjp14wsMPk11sZ5AUqc6Pz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=roaPvsW8++xjtVYhTkyvz99zicvY7zCDC9PpFqnxE3Y+qImoM93yqwb8Ne8I+gHFUqeCigeHQJH/GpPSsOOt8wYuhgzquhQUPbdquVSQ9+GJrcHOIUPvCdM6w0N+5gDw6A4wGXIZTxy1c2ePY3mFsaTNzJz12Au041dIXUHFnlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AnpJan75; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AnpJan75"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=DlZbXQkdh9lD8koDS2VCLi7VDrqMoezYJ0q3CMVE7YM=; b=AnpJan75Py+T3DagZ7ig3urHDk
	0YsR+OzqP/3HFtc1Kr9gtiyb+3bQat2654z1OzSUhqTBcSnjGZb+pYMh5G/Z2ZTCENC0T5tuFvP2u
	0Q6zA+KH1+werWArk/QbvWbi+xUXPUcQO1a61CshASY8fUdBuDfI67dyZ/Ccr74488mfa7uI4sS2M
	WH6Az9gUWJryGuHpW5ACkTJyChGxnNWCy5NM33whoqc7ry3L43105KeiPc6xj1b+rhfhxr0L/0gvg
	XMGMYGoILK960mH+1cVYibPqCuPxHuoMWuShid4LeZ4Kr8hn6jWjdfhtt8N8lM3j+5gKqUKeigXCF
	PN5FQbOw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONEP-0000000Ffpq-2p6N;
	Wed, 26 Nov 2025 21:39:21 +0000
Message-ID: <ca787761-8a1e-41d8-a970-cae761b201d1@infradead.org>
Date: Wed, 26 Nov 2025 13:39:21 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] docs: Update documentation to avoid mentioning of
 kernel.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20251126205939.2321498-1-andriy.shevchenko@linux.intel.com>
 <e5ca4be6-6919-4855-bb7f-bd36761eab0f@infradead.org>
 <aSdwIN6qA-66hYhm@smile.fi.intel.com>
 <8d68b0b7-ee9e-4121-aa85-19fbf8470fdc@infradead.org>
 <aSdzHqxI-iDsksao@smile.fi.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aSdzHqxI-iDsksao@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/25 1:37 PM, Andy Shevchenko wrote:
> On Wed, Nov 26, 2025 at 01:33:13PM -0800, Randy Dunlap wrote:
>> On 11/26/25 1:24 PM, Andy Shevchenko wrote:
>>> On Wed, Nov 26, 2025 at 01:18:29PM -0800, Randy Dunlap wrote:
>>>> On 11/26/25 12:59 PM, Andy Shevchenko wrote:
> 
> ...
> 
>>>>> -The header file include/linux/kernel.h contains a number of macros that
>>>>> +There many header files in include/linux/ that contain a number of macros that
>>>>
>>>>    There are many
>>>>
>>>>>  you should use, rather than explicitly coding some variant of them yourself.
>>>>>  For example, if you need to calculate the length of an array, take advantage
>>>>>  of the macro
>>>>
>>>> Otherwise LGTM. Thanks.
>>>>
>>>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> Thanks!
>>>
>>> Can you also test it? I hope it will be not so broken (as some of the files
>>> seems never were before in the generated docs).
>>
>> It's not completely happy:
> 
> A-ha, thanks for trying!
> 
>> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:125: ERROR: Unexpected indentation. [docutils]
>> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:123: WARNING: Inline emphasis start-string without end-string. [docutils]
>> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:126: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> 
> I will look at it tomorrow, but can you remove this (or even fix) and check the
> rest meanwhile?


That was the only docs warnings caused by your patch (at least in my testing).
and now easily fixed.

-- 
~Randy


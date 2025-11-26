Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588972264CF;
	Wed, 26 Nov 2025 21:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193254; cv=none; b=O7NjDUccc3SGQ8z60ZKxXKn9pcQ4bucdvhsor+dIe3o4CjvtPxQJyqBMOK34wKo44rk1Uipxld5/EqC+1jOe2ZkzPQCpp/RlwXV/mNvXh5bsqJkJcyCv92NTrcm9kNo3jlnRB5Q87AIOt+94GTu1QwRnUQAxxHODsLkV/3MA8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193254; c=relaxed/simple;
	bh=fCHn+wOZddG56V0Fl218Of8koEdGekwWb2DvOVZfYlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYsW9/UKWJOwZfzoe4NVD4px3CVsXYNdX3GtuY+/YSUQYFiBqcrvwt1BimAusPqqzby8jV/75/7EeQwBcuxDIGMpHXep/BDt/ynb+Ynl03gdNdRa9adiHSjNx75wf+k916nsypuixbwRUo9ZMoRn4wMpY3VcfIc4K+yktduhsjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kLl8cZe5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kLl8cZe5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/ukPcoTeVqdwrVdhhKlMoEPLOFLxDXAWlk8l3UPtGXI=; b=kLl8cZe5SuMJwscASewvmVA8W5
	yCUYSlYtXQqPR/0i/74PZLc0RyfKnEfjWeLmyeuM+1lSVc9u2OzTJbN7g8TmKXKLgIiHzhAF1g9j/
	jdRmZGR2TOdW1VEOzi8jQP1iYV0w1b2x1TVpTniPfNUCB8KnMrrwiazD2EbF25VadRUELKRd0Z8Nf
	HqOby7dT5p7Ny9lUQPg4v6HVuezCCa0r/Fw+c5Wz5GH40ib73BxuqrSbV1G3+ZGqW+AYIUTsTwGSk
	PSpC7B1oa/0n0tXFA5+9zv0rluWPbdDAMWQA/t6jctR/2dqPh4qtDUEtDWtY49RZePxYqSSgKWTd2
	gqqs5xFA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONFs-0000000Ffsg-3XKA;
	Wed, 26 Nov 2025 21:40:52 +0000
Message-ID: <3eb62c5d-9dbb-413f-aa8a-5128054eeaed@infradead.org>
Date: Wed, 26 Nov 2025 13:40:52 -0800
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
 <aSdzHqxI-iDsksao@smile.fi.intel.com> <aSdzo8aOns_3oPQA@smile.fi.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aSdzo8aOns_3oPQA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/25 1:39 PM, Andy Shevchenko wrote:
> On Wed, Nov 26, 2025 at 11:37:40PM +0200, Andy Shevchenko wrote:
>> On Wed, Nov 26, 2025 at 01:33:13PM -0800, Randy Dunlap wrote:
>>> On 11/26/25 1:24 PM, Andy Shevchenko wrote:
>>>> On Wed, Nov 26, 2025 at 01:18:29PM -0800, Randy Dunlap wrote:
>>>>> On 11/26/25 12:59 PM, Andy Shevchenko wrote:
> 
> ...
> 
>>>>>> -The header file include/linux/kernel.h contains a number of macros that
>>>>>> +There many header files in include/linux/ that contain a number of macros that
>>>>>
>>>>>    There are many
>>>>>
>>>>>>  you should use, rather than explicitly coding some variant of them yourself.
>>>>>>  For example, if you need to calculate the length of an array, take advantage
>>>>>>  of the macro
>>>>>
>>>>> Otherwise LGTM. Thanks.
>>>>>
>>>>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>>>
>>>> Thanks!
>>>>
>>>> Can you also test it? I hope it will be not so broken (as some of the files
>>>> seems never were before in the generated docs).
>>>
>>> It's not completely happy:
>>
>> A-ha, thanks for trying!
>>
>>> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:125: ERROR: Unexpected indentation. [docutils]
>>> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:123: WARNING: Inline emphasis start-string without end-string. [docutils]
>>> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:126: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>>> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>>
>>
>> I will look at it tomorrow, but can you remove this (or even fix) and check the
>> rest meanwhile?
> 
> At glance seems like colon is missing, should be :: instead of : in near lines.
> 

Yes, that's what I sent earlier :)

-- 
~Randy


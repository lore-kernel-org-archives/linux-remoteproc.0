Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D391F584C;
	Wed, 26 Nov 2025 21:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192796; cv=none; b=c8SfKekFCh0r25zj6vpX9HYLzpSTqkCmY2zGZzgSy36hx1zs/YHtLanEF53uYCrqDWCHwcsq3r/RycW2OJXSxZ0LM3qdQsQ0nHuDsWimxkX0mhQAz8Vq0EVA9MK0xs1nKKe/9iz2m7I+LAhZPbQKmRvwesfTloZBHz+pRX9P2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192796; c=relaxed/simple;
	bh=bzvKCp2XGC+UsVOzGwEL1jo+pB3Uj2lnoipAsxDMocI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OG9GKQ+5+6mgTcA31gGEwZXPTnnd3CWgZhZ2jqtCKT5jXv4rJawcea8DH4I5pnZkD4slsiE6+FwCF/hs/1CObZ1BBKzhZZdVue5cJomqq9pB9/YpbZO/4crLohynlXx3s525WSoWx1ND6kd1bK366qhLu6xVCTMo6o8mwsxYbB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vUGgITZr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vUGgITZr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Dvc27Kmz393f16UW/dA/KN0RwwpMouBH+bVxwdYfBCU=; b=vUGgITZreRPPiO3PGqQBtQ4TqA
	H6whNMvPrV+DDe+I9067vNiYwGk2ddNLdIN14CH0ANPJavcv98WeO3L3gzELqH9ptwIQgacw6ZNEA
	jM0uT+ETUZcnTMyyVx8iuCsSDAS8sBkwe0e9dlH0XX/iRFJ+K2WVg85+jP0CoDfqIp6UGnxbQO/mw
	z9DadepFD7l3zIUrRAMc6ygg1egktQcld4ffr73A+CdDNxpU0ujKdenO5dV3/4MbUstppAZRr5Wlr
	0cgNMt0gOUDeZuLzUgCFNCwtnvnJi9Z+zt7jLF+kTgGJsvG3okURvihhsxFzxiJ76enql9SR9SiZ9
	k05dqf7w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vON8T-0000000FfhT-2tAj;
	Wed, 26 Nov 2025 21:33:13 +0000
Message-ID: <8d68b0b7-ee9e-4121-aa85-19fbf8470fdc@infradead.org>
Date: Wed, 26 Nov 2025 13:33:13 -0800
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
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aSdwIN6qA-66hYhm@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/25 1:24 PM, Andy Shevchenko wrote:
> On Wed, Nov 26, 2025 at 01:18:29PM -0800, Randy Dunlap wrote:
>> On 11/26/25 12:59 PM, Andy Shevchenko wrote:
> 
> ...
> 
>>> -The header file include/linux/kernel.h contains a number of macros that
>>> +There many header files in include/linux/ that contain a number of macros that
>>
>>    There are many
>>
>>>  you should use, rather than explicitly coding some variant of them yourself.
>>>  For example, if you need to calculate the length of an array, take advantage
>>>  of the macro
>>
>> Otherwise LGTM. Thanks.
>>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks!
> 
> Can you also test it? I hope it will be not so broken (as some of the files
> seems never were before in the generated docs).

It's not completely happy:

linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:125: ERROR: Unexpected indentation. [docutils]
linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:123: WARNING: Inline emphasis start-string without end-string. [docutils]
linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:126: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]


-- 
~Randy


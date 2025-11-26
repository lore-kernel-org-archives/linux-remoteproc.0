Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316689463;
	Wed, 26 Nov 2025 21:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193008; cv=none; b=UVU8qXxDiDnm4gZ5f5b0Zm8HZYFGyYbBm0O+xxXV6VeXIy4cDXJXGoPWrbA/3aC7SP2XXLfTKVLcNmgEuZYtKimA2ZGmbW5Ix+bNfFe2wYydky8qX+iDpM75ltgzH7LIqTWApVD9w2aE0MiMdUiaHfF9kJ7vuQSNvldSXrUDSYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193008; c=relaxed/simple;
	bh=9zYIei9jrMxH2mtlN0ZzAlvhwrrySNdoeFuhLA/GTDg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MhtQaSw/2Vk83LO7RHSy/HiR5nH0RXXd4ctxdvWeJg/lvVuZML6z5xENr8/xNwCLnkfjdilhU+kR0rEbPH4zxr+LsAGafluGDZoyE5DD0J68vqXwxkChfcRoXBtKexVJJEAMNIKoHK0XVTqMJiApSWsTp/lN5jGnEg/M/vEmL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Gj2PmheI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Gj2PmheI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PnP5c/40Umvanvbvi/zBUX6u7/2RyHnMAubQyynh6iU=; b=Gj2PmheIRsO10JVUlSQRZNOzIP
	shJAmNEy1FBCSrlrufJs8oBT5O9VOWjnh0mAAky12tNJum5RywPy/LMlx3dbrR7fgAJKg3rrMG2bg
	xvWAdv9bO69grvmQfcuSJA4oSPB4dgxUz4ssiwrtz5apur1TuCOWUYxjut5+J6HWB12sfHQ/2SY7o
	2LE2DoD44gEo3mWAOc470bbuI/mNe2f08oEJz/pSRvPDpxkFh+EXxxbDQFZL34Yo1AwMrraUe6fDZ
	RJ9/yPT7QyKYjaX2WimeGM5Y8kxvZdtOMAhzckt89Fy7VmrYJkn+MmYqt0CnLnUoQHoyLjgb7qIxy
	4zjdhqTg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONBt-0000000Ffla-2SqG;
	Wed, 26 Nov 2025 21:36:45 +0000
Message-ID: <9e0b0711-b558-4f58-9f6a-3463cbc50669@infradead.org>
Date: Wed, 26 Nov 2025 13:36:44 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] docs: Update documentation to avoid mentioning of
 kernel.h
From: Randy Dunlap <rdunlap@infradead.org>
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
Content-Language: en-US
In-Reply-To: <8d68b0b7-ee9e-4121-aa85-19fbf8470fdc@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/25 1:33 PM, Randy Dunlap wrote:
> 
> 
> On 11/26/25 1:24 PM, Andy Shevchenko wrote:
>> On Wed, Nov 26, 2025 at 01:18:29PM -0800, Randy Dunlap wrote:
>>> On 11/26/25 12:59 PM, Andy Shevchenko wrote:
>>
>> ...
>>
>>>> -The header file include/linux/kernel.h contains a number of macros that
>>>> +There many header files in include/linux/ that contain a number of macros that
>>>
>>>    There are many
>>>
>>>>  you should use, rather than explicitly coding some variant of them yourself.
>>>>  For example, if you need to calculate the length of an array, take advantage
>>>>  of the macro
>>>
>>> Otherwise LGTM. Thanks.
>>>
>>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>>
>> Thanks!
>>
>> Can you also test it? I hope it will be not so broken (as some of the files
>> seems never were before in the generated docs).
> 
> It's not completely happy:
> 
> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:125: ERROR: Unexpected indentation. [docutils]
> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:123: WARNING: Inline emphasis start-string without end-string. [docutils]
> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:126: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> linux-next-20251126/Documentation/driver-api/basics:130: ../include/linux/util_macros.h:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> 

This little change fixes it for me. Just include it in your patch, please.

---
 include/linux/util_macros.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251126.orig/include/linux/util_macros.h
+++ linux-next-20251126/include/linux/util_macros.h
@@ -119,7 +119,7 @@
  * a fuss about it. This makes the programmer responsible for tagging
  * the functions that can be garbage-collected.
  *
- * With the macro it is possible to write the following:
+ * With the macro it is possible to write the following::
  *
  *     static int foo_suspend(struct device *dev)
  *     {



-- 
~Randy


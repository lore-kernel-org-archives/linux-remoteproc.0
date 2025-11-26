Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6CF18CC13;
	Wed, 26 Nov 2025 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764191916; cv=none; b=IEHabCsL/k0Sw7utga4/T2DozOejOr9NE0pLLgiEK+7bF3n7hXTIkMaQ0eG2W3Ajh6ZSHI1cv46iy0uWLKHAcEbreewcHB4p3oJs35KrWSN0u2Cfzd8zye823IkwLvhiiYDu9d3j7w0BB03PpKJMKzHkIBm8kNkbF/KGLVN2cGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764191916; c=relaxed/simple;
	bh=KWWvwkL5WqXzAE0/1K+ALzLNzVTX6crL4x/VZuNt9fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVL6KMuuMbxUl1drtqN+6hNkiYFak++62m/y8lZYnRqnU5eZnQ3OrTcHJv8grMgW1e+rY3bR2kRm5A0IGyrBWoqazkPaRJG89IZBL3IanLl+boSvsWaQjgdJCZP0YVnasHgE6pZAjeGWQ+sbajScEyQfyYU335VTL5/w1MvOWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W7aH67aR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W7aH67aR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=V+Qreg6M2mVqQ7IZlg7liWXgqKSSjn4qbwTueF8u5a8=; b=W7aH67aRnBiFbOMYaHtVvbDr3n
	0OrsZ6OCt5bNnFtXubO1XCMULnXE1Np5pklqLd2OS3+Mh+snquMWFMi+lP1WX4ul3y6tT8PJTlL9Z
	+5TDfbyrEhPvySKzB9ZYoE7me+vuk1tkgHluGYWOrTV7GCaz1zcj6/v7fSD0rsTe9j1cl+X0IK8C2
	jCvP/YrbRs5t7EmD2diGMAlVlgQAgq9niuvnr84Q7OLW9HbWwa6DFn3+4yAmaIzWckZaUFkFSWZe7
	FN22/EctP1hVEd5MpC6MKdeF+K7HDwvw28G6Ty3y3iXZp+t/FSq4N+8U4ntgBlFdW2WsEkl+OuszE
	DZQoIQdg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMuE-0000000FfHi-1m4I;
	Wed, 26 Nov 2025 21:18:30 +0000
Message-ID: <e5ca4be6-6919-4855-bb7f-bd36761eab0f@infradead.org>
Date: Wed, 26 Nov 2025 13:18:29 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] docs: Update documentation to avoid mentioning of
 kernel.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20251126205939.2321498-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251126205939.2321498-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/25 12:59 PM, Andy Shevchenko wrote:
> For several years, and still ongoing, the kernel.h is being split
> to smaller and narrow headers to avoid "including everything" approach
> which is bad in many ways. Since that, documentation missed a few
> required updates to align with that work. Do it here.
> 
> Note, language translations are left untouched and if anybody willing
> to help, please provide path(es) based on the updated English variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/core-api/kobject.rst              |  2 +-
>  Documentation/dev-tools/checkpatch.rst          |  2 +-
>  Documentation/driver-api/basics.rst             | 17 ++++++++++++++++-
>  .../driver-api/driver-model/design-patterns.rst |  2 +-
>  Documentation/process/coding-style.rst          | 10 +++++++---
>  Documentation/staging/rpmsg.rst                 |  7 +++++--
>  6 files changed, 31 insertions(+), 9 deletions(-)
> 


> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 2969ca378dbb..d63ea0bffdfe 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -1070,7 +1070,7 @@ readability.
>  18) Don't re-invent the kernel macros
>  -------------------------------------
>  
> -The header file include/linux/kernel.h contains a number of macros that
> +There many header files in include/linux/ that contain a number of macros that

   There are many

>  you should use, rather than explicitly coding some variant of them yourself.
>  For example, if you need to calculate the length of an array, take advantage
>  of the macro

Otherwise LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

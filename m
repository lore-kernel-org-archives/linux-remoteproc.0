Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F222083;
	Thu, 27 Nov 2025 00:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764203172; cv=none; b=imOB3VndYzCV9oBeMggVqX5wGmD1gjW10ZLlcg850h9sSenjKX39b52j+kCUsk/0EeZkUc3rPjqr5fu99xF0SmO3XQ9gZ0BBfYXgFfXkoBgXyLMTkqorp87GyXgrhYM6pi/fcpzSd1f9koTHWf+ZcNhJXOmMUIXf0WdMbRSVTUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764203172; c=relaxed/simple;
	bh=J+0frs1Jw18gqCxZyrrjPuylOVGRUev4RwoODgPXzvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=queov3/2ZJeVGc7gnjfFQNnevLggmndH+ilcKNgsAlwfyMoOYvBODUpsTpJAH/J5i92sKk71tfKoas1Om3chAP3kZGqHQGTI+OiwkBN0DEkQvh+2eGnXJn9ovJ1ivq8v0qkR8OvhHQpit7Jqzzdtnv0SYDI4JTaQJKe8FjVLUYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WrG9Ip/g; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WrG9Ip/g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Wq2hRRHw3uwK7n7ReUBUG9hyJPvVDkZT3JJwxzZrWbI=; b=WrG9Ip/gPBfvrLaOel6g8NOCPa
	gRzSRLAFpucSIXQ0fxdJXdJfA3Nwhpkz4jJDl+eLi0facTc5Nd8Gue5jvyGeFMQaLf74negZqHsok
	PAswvwj2LljbrUNDNXbDcT+sT3paybpeOz7eGeRLFBE2iR2ndbp1V3XzoI/MioX62iXu7shA4nm9Q
	ayaDN3uRZjbkf5oSL2TBBEFJvr2sOR2Y2wDIlnnThvR+uPgtBxUpIqXvT7EKThFJIpaWnLN0ag+zN
	w1zaniz4g189q3lWlZnSoh5ABJ2IrprfuZwXL0i293gdbxpxQFaNfuDgFljRsSNGcF6HIx7s6MPCB
	/1JmxiAQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOPpl-0000000FnTO-2ESJ;
	Thu, 27 Nov 2025 00:26:05 +0000
Message-ID: <a731c794-1b4c-4ea7-9cf1-0210b95eaa4d@infradead.org>
Date: Wed, 26 Nov 2025 16:26:04 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] docs: Update documentation to avoid mentioning of
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
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/25 1:46 PM, Andy Shevchenko wrote:
> For several years, and still ongoing, the kernel.h is being split
> to smaller and narrow headers to avoid "including everything" approach
> which is bad in many ways. Since that, documentation missed a few
> required updates to align with that work. Do it here.
> 
> Note, language translations are left untouched and if anybody willing
> to help, please provide path(es) based on the updated English variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
> v2: collected tag (Randy), fixed util_macros k-doc (Randy, me), fixed spelling (Randy)
> 
>  Documentation/core-api/kobject.rst              |  2 +-
>  Documentation/dev-tools/checkpatch.rst          |  2 +-
>  Documentation/driver-api/basics.rst             | 17 ++++++++++++++++-
>  .../driver-api/driver-model/design-patterns.rst |  2 +-
>  Documentation/process/coding-style.rst          | 10 +++++++---
>  Documentation/staging/rpmsg.rst                 |  7 +++++--
>  include/linux/util_macros.h                     |  2 +-
>  7 files changed, 32 insertions(+), 10 deletions(-)
> 

-- 
~Randy

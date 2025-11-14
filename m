Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EDF2EDD5F;
	Fri, 14 Nov 2025 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147040; cv=none; b=qDrNBHS6EGCTP1gorXbGH3E/fZaYsEbigeaHKnXPD0cx2Pq8Zy5Jb1Rd7NJHn8btXGXwvJ4cnXQ3sjOh5ubxSacIp+gNJ5rEpGSA/VXqIMN3jyanYiXxF2QLOvngrQI1YDvWXgwKSNr4BDM1Kg4Q+t1kGVnbyFQUZ/oJE5Do2SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147040; c=relaxed/simple;
	bh=3CkkRuE1FdwMwjSKf3Cpy9HAP5CsfS7q7j+KXEvLT50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGSWQ2krE35FuVd3aDlHVbxjt8PKaTHIYddOdb3lE47tj3RMyShAAbwm+blHsZf3+5fLW5RG7QkPG86ZA6z1D7ZLB1JinYrCk5L04kKsGX5gNcOmDhoRZnzWoh2yZJjtVLbirm1f71QJB2cfEggITJ7DQZVMOFkotHtyDX1n5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bQwmYsyU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bQwmYsyU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=A+JwxMF4OOVjReE58nxUSmjT7dPbEJlzwbqZ8WMSmJ8=; b=bQwmYsyUPyr4P+h1rUUFJRewJ+
	ZSXFAJly0zyAJU+XO0p8M/kf+rEKhA+PX4gWfzNAqUYlakohYpWtyk0+I/Ph7RwoiehbB9eE25PoS
	rObuAgLz5dIIGyBYAxIM3aLxsrJaD9YNOSRagnZ5NNLE2PobkrvgYr+qdImLkqvamL09uUt7nylSg
	SY7m24h16MO+/tAwwvjopSsfz94DVshfMTkcqndBvm7cxPOkzmiILLAWACOJCa/JZdGvHq7iBOw8N
	MlSqbgbmqmllcvi5vooNpIafkzzbGzW4xnA8jTXkFtfmLHwGyo4c9ylP3P5LYOMUYfL9npvfYmQUm
	iax58VmQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJz5P-0000000Czw6-0sKF;
	Fri, 14 Nov 2025 19:03:55 +0000
Message-ID: <0d2cba11-f64d-4669-ada6-683790b64e05@infradead.org>
Date: Fri, 14 Nov 2025 11:03:54 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
To: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
 andersson@kernel.org, mathieu.poirier@linaro.org
Cc: dan.j.williams@intel.com, cedric.xing@intel.com,
 pasha.tatashin@soleen.com, kevin.tian@intel.com, skhawaja@google.com,
 yesanishhere@gmail.com, taimoorzaeem@gmail.com, linux@treblig.org,
 arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 daniel.baluta@gmail.com, imx@lists.linux.dev
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251114065746.901649-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 10:57 PM, Daniel Baluta wrote:
> Fix rpmsg and remoteproc filenames references after moving
> them out of staging.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/driver-api/remoteproc.rst | 2 +-
>  Documentation/driver-api/rpmsg.rst      | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/remoteproc.rst b/Documentation/driver-api/remoteproc.rst
> index 5c226fa076d6..d7ff4694aba6 100644
> --- a/Documentation/driver-api/remoteproc.rst
> +++ b/Documentation/driver-api/remoteproc.rst
> @@ -357,4 +357,4 @@ rpmsg virtio devices this way, if desired).
>  Of course, RSC_VDEV resource entries are only good enough for static
>  allocation of virtio devices. Dynamic allocations will also be made possible
>  using the rpmsg bus (similar to how we already do dynamic allocations of
> -rpmsg channels; read more about it in rpmsg.txt).
> +rpmsg channels; read more about it in rpmsg.rst).
> diff --git a/Documentation/driver-api/rpmsg.rst b/Documentation/driver-api/rpmsg.rst
> index 40282cca86ca..a50c4db6679f 100644
> --- a/Documentation/driver-api/rpmsg.rst
> +++ b/Documentation/driver-api/rpmsg.rst
> @@ -5,8 +5,8 @@ Remote Processor Messaging (rpmsg) Framework
>  .. note::
>  
>    This document describes the rpmsg bus and how to write rpmsg drivers.
> -  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
> -  (also a resident of Documentation/).
> +  To learn how to add rpmsg support for new platforms, check out remoteproc.rst
> +  (also a resident of Documentation/driver-api).
>  
>  Introduction
>  ============

-- 
~Randy

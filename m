Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24D1A285;
	Mon, 22 Dec 2025 22:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766440828; cv=none; b=h0UA8PJ9J5jDU3PP0yzXcd5buwHiKtI2W9FSZB9ppD6QBK6fkmtakhlHanyze5wxpgtSu5fAleFjspAHd7rR65rPNfZAvW5dJaUjMXH9x1q7hNU5snx3ruK29N1ijJc+gwngFoKiEy5in+wxZfOzEomfeSZdTAL0IOCCjBo7yEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766440828; c=relaxed/simple;
	bh=xvrDhOkAeMiPDexkfJjs18iDaXRC47ZCm6XfIeEcNDA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zp9nEWZs/EI9zmLkMqywgbWP+1GVHqDNNk4i9sow3pz6YkMzaUbq6riEMeEvHS1D7RPQs1PWGrU/sF8NNc6kHohsQojIRX5nKRT7bukmkwGgcYC8IH1GdT3KXYjTKT07cH1tLfo/g1tgWGcL4H311vzdJc7wzb9EklkzvFNkfqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PA6AEv2b; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PA6AEv2b"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 737474040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766440825; bh=VcjgOtB4J4XNm3fkSgKQA1+M5DHuO36Tcyg0mxlcLnA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PA6AEv2bni0DDl6bFY/5Fsnus44UDawz2V44ysVSh59cc3nP0ooqgrD73QtqozleD
	 dpUn+XM2fO31Zeh8A+7rGtsNdOXysbMIRskM964EGSopD1dnwo/2ruFCzD8E21937t
	 Qlvk4SP7/0rVv3uWrVHlRGldElqWjZJMpDIJ5mXJlinymST7ruO/9mFeHdBmjVqhHV
	 uCfyco59nyOOshFe1gSHcGzkfW5CAz6kMxNeoDe8NAk/gjLV1hcOIJajw976I8sCZK
	 CtLbtMv5j7jvCKWgXsRkzhUK3SRd9k0J9s7NX9AG7/bpUiky7bY7ZXOiOgWf7KCY5F
	 WvF6yzJTk8ppA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 737474040B;
	Mon, 22 Dec 2025 22:00:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/1] docs: Update documentation to avoid mentioning
 of kernel.h
In-Reply-To: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
Date: Mon, 22 Dec 2025 15:00:24 -0700
Message-ID: <87fr9218jr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

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

Applied (finally) thanks.

jon

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC72EE612;
	Fri, 14 Nov 2025 19:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147043; cv=none; b=kn+OpEc8coXhB2xTplDXvqGUzQsGjrVWAPzQY5Nwjbvom7Qx4WGnpNfaQTOHf3ISJB0lO29KM7m1fI4gjnsQxEgC31S9Orgizc8OeZ+U4sp8yiq9YOJSF3MyEFecgsaHkb3Fqhefnvd+6uW+VGWTxrc8ncfpBfOAwL7qCLwmJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147043; c=relaxed/simple;
	bh=wSZZgNkBlC1zkhanuH4WO8LqLi6PdeF9uVe48OFpo1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkGgtp0qStWEluwWN0qVM4SMTFy//Tt3fJqfK7AKxwliGZpS6+dKDOzecpLCV7/Lkn+DIEfr30d2oRkFRR1hvDd85NPetHcd+AiIs8cVYz1MOheVPSPR8Eh/+FxH/jTAOXGMzsFV9onEX15f2O5ZnHXFLU7wysmPZKYpLagYqPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JVAAZ/Ut; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JVAAZ/Ut"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IaJ8CT4aVK5btlewRI7OcFWeIb7NC8owqtOQqSRcxEk=; b=JVAAZ/UtiP6YT8ucvpDxZRmjkE
	DPTo52EBKy66oFTn/cgKumBoDYPf7lAJseZFaULDXOSWRspD61G79hGZgD07S6awqjAfFZCAtg42h
	mKsEpz2KwfuEYmBVqvM86uulmgAm0i6eU8MzttxivurJO6xyu3EfmmjJcAJ+ZXQBYPJ7XcC5uoqsL
	eRZlf6Q6bcz4JCkFcjO3lq79DY4AhwJchKVU4UoMb51hUksuPftFnUv+9j4wRUv9xGMivXJRugIKt
	DrnzDfu1o6bsHLd15HpdTcAz3YgDPMRzWxOLS4ySVb6HmecwWQaEp6JVWMuYkBwIdfAXXYotLh8uL
	90ae8eXw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJz5S-0000000Czw6-20nu;
	Fri, 14 Nov 2025 19:03:58 +0000
Message-ID: <cf524169-fdfa-43f8-999d-a0fb36607a05@infradead.org>
Date: Fri, 14 Nov 2025 11:03:57 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation: Move rpmsg.rst and remoteproc.rst out
 of staging
To: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
 andersson@kernel.org, mathieu.poirier@linaro.org
Cc: dan.j.williams@intel.com, cedric.xing@intel.com,
 pasha.tatashin@soleen.com, kevin.tian@intel.com, skhawaja@google.com,
 yesanishhere@gmail.com, taimoorzaeem@gmail.com, linux@treblig.org,
 arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 daniel.baluta@gmail.com, imx@lists.linux.dev
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-2-daniel.baluta@nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251114065746.901649-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 10:57 PM, Daniel Baluta wrote:
> rpmsg.rst and remoteproc.rst are documentation files for
> mature remoteproc and rpmsg systems in the Linux kernel
> so their place is not under staging.
> 
> Move them to Documentation/driver-api to better reflect that.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/driver-api/index.rst                   | 2 ++
>  Documentation/{staging => driver-api}/remoteproc.rst | 0
>  Documentation/{staging => driver-api}/rpmsg.rst      | 0
>  Documentation/staging/index.rst                      | 2 --
>  MAINTAINERS                                          | 4 ++--
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename Documentation/{staging => driver-api}/remoteproc.rst (100%)
>  rename Documentation/{staging => driver-api}/rpmsg.rst (100%)
> 
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index baff96b5cf0b..5321a9459440 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -129,8 +129,10 @@ Subsystem-specific APIs
>     pwm
>     pwrseq
>     regulator
> +   remoteproc
>     reset
>     rfkill
> +   rpmsg
>     s390-drivers
>     scsi
>     serial/index
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/driver-api/remoteproc.rst
> similarity index 100%
> rename from Documentation/staging/remoteproc.rst
> rename to Documentation/driver-api/remoteproc.rst
> diff --git a/Documentation/staging/rpmsg.rst b/Documentation/driver-api/rpmsg.rst
> similarity index 100%
> rename from Documentation/staging/rpmsg.rst
> rename to Documentation/driver-api/rpmsg.rst
> diff --git a/Documentation/staging/index.rst b/Documentation/staging/index.rst
> index 77bae5e5328b..de6dff862a0c 100644
> --- a/Documentation/staging/index.rst
> +++ b/Documentation/staging/index.rst
> @@ -9,8 +9,6 @@ Unsorted Documentation
>     crc32
>     lzo
>     magic-number
> -   remoteproc
> -   rpmsg
>     speculation
>     static-keys
>     xz
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41ded579750c..490100765611 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21898,7 +21898,7 @@ S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
>  F:	Documentation/ABI/testing/sysfs-class-remoteproc
>  F:	Documentation/devicetree/bindings/remoteproc/
> -F:	Documentation/staging/remoteproc.rst
> +F:	Documentation/driver-api/remoteproc.rst
>  F:	drivers/remoteproc/
>  F:	include/linux/remoteproc.h
>  F:	include/linux/remoteproc/
> @@ -21910,7 +21910,7 @@ L:	linux-remoteproc@vger.kernel.org
>  S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
>  F:	Documentation/ABI/testing/sysfs-bus-rpmsg
> -F:	Documentation/staging/rpmsg.rst
> +F:	Documentation/driver-api/rpmsg.rst
>  F:	drivers/rpmsg/
>  F:	include/linux/rpmsg.h
>  F:	include/linux/rpmsg/

-- 
~Randy

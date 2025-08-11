Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B291B87F2;
	Mon, 11 Aug 2025 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921499; cv=none; b=CKHlBGG4/ISvsU23RBlGeIslKLbviECncigXs3tAbZjYi7h3jaFt0uwUzZ2reWONU1AUtHNXAd3+M6D/6zkejEKyjE+y6d8KbNayAlP873vxxmkBRaNL4GWmW2ObATZLvvcCBNw+MQxsW+RUASuagC1HMzexlb6tCkwD7SnmGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921499; c=relaxed/simple;
	bh=HC0XY4Rhc7WOuzRzVmyl37sEhdbWKSBnwHufZNs1mlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh6uZXrfK3bqxomTSQAr9UWhWpl83rem0TAk1kIOptDymaaW5JMPxkU33Z7enxS1t/TU+tJ6tqQOGa4tfjgrBevyvJdsw+CNcjMtVz3k+gYsXQMv4TUgfb3YrcDlWwbDtmVkf5L+67Kec0NmbV0AclIRm+Oap5dVmTOGhffmGM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCnli5jA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCnli5jA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C30C4CEED;
	Mon, 11 Aug 2025 14:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754921497;
	bh=HC0XY4Rhc7WOuzRzVmyl37sEhdbWKSBnwHufZNs1mlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCnli5jA26zq2pNPHckm2vDfk0UjlenfmUYYa6r4zxT4SvDbqTPGY4e/Xm2uTfzNg
	 lJbx4VXtQsWqEpP4mvR8bW0qazkFXDdDB+RQ3ZA+/rsyoaFq+I3Mrhpo56v3jU7r9q
	 mNCGBrZbz5m3YwfzJBfaSkpWwpsqpyyIitgbB5UF8is+j5NT4SghI4DFNcaiRtod2E
	 VBNLUH0yUHs5ic3z3zAX9hDoHhDk1EKD3xGcBQub25x+4BRdgCrjOEfoN+nIt6dKS8
	 VXLlVhHtuOBSc8Yaa1WBBfoJfakAJktRvuhamGBuN85S2PE0Bze9VYv0WmpVr2dzzC
	 xgV/rJFmzNmvQ==
Date: Mon, 11 Aug 2025 19:41:28 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Harshal Dev <quic_hdev@quicinc.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 2/6] remoteproc: Add TEE support
Message-ID: <aJn6EPjXzq07aDTM@sumit-X1>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-3-arnaud.pouliquen@foss.st.com>
 <d4694157-a757-41f5-8874-4b67b262bc83@quicinc.com>
 <7c77dba4-27f9-4840-b9aa-253119308519@foss.st.com>
 <e5a234c7-0f8d-4b52-95fb-82371c8e4460@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5a234c7-0f8d-4b52-95fb-82371c8e4460@quicinc.com>

Hi Harshal,

On Mon, Aug 04, 2025 at 02:56:18PM +0530, Harshal Dev wrote:
> Hi Arnaud,
> 
> On 8/1/2025 12:53 PM, Arnaud POULIQUEN wrote:
> > Hello Harshal,
> > 
> > 
> > On 7/31/25 12:25, Harshal Dev wrote:
> >> Hello Arnaud,
> >>
> >> On 6/25/2025 3:10 PM, Arnaud Pouliquen wrote:
> >>> Add a remoteproc TEE (Trusted Execution Environment) driver that will be
> >>> probed by the TEE bus. If the associated Trusted application is supported
> >>> on the secure part, this driver offers a client interface to load firmware
> >>> by the secure part.
> >>> This firmware could be authenticated by the secure trusted application.
> >>>
> >>> A specificity of the implementation is that the firmware has to be
> >>> authenticated and optionally decrypted to access the resource table.
> >>>
> >>> Consequently, the boot sequence is:
> >>>
> >>> 1) rproc_parse_fw --> rproc_tee_parse_fw
> >>>    remoteproc TEE:
> >>>    - Requests the TEE application to authenticate and load the firmware
> >>>      in the remote processor memories.
> >>>    - Requests the TEE application for the address of the resource table.
> >>>    - Creates a copy of the resource table stored in rproc->cached_table.
> >>>
> >>> 2) rproc_load_segments --> rproc_tee_load_fw
> >>>    remoteproc TEE:
> >>>    - Requests the TEE application to load the firmware. Nothing is done
> >>>      at the TEE application as the firmware is already loaded.
> >>>    - In case of recovery, the TEE application has to reload the firmware.
> >>>
> >>> 3) rproc_tee_get_loaded_rsc_table
> >>>    remoteproc TEE requests the TEE application for the address of the
> >>>    resource table.
> >>>
> >>> 4) rproc_start --> rproc_tee_start
> >>>    - Requests the TEE application to start the remote processor.
> >>>
> >>> The shutdown sequence is:
> >>>
> >>> 5) rproc_stop --> rproc_tee_stop
> >>>    - Requests the TEE application to stop the remote processor.
> >>>
> >>> 6) rproc_tee_release_fw
> >>>    This function is used to request the TEE application to perform actions
> >>>    to return to the initial state on stop or on error during the boot
> >>>    sequence.
> >>>
> >>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>> ---
> >>> Updates vs version [18]:
> >>> - rework/fix function headers
> >>> - use memremap instead of ioremap for the resource table.
> >>> - realign comments to 80 chars limit, with few exceptions for readability
> >>> - replace spinlock by mutex and and protect APIs from concurrent access
> >>> - add support of 64-bit address in rproc_tee_get_loaded_rsc_table()
> >>> - Generalize teston rproc_tee_ctx.dev to prevent an unbind
> >>> - update copyright year
> >>>
> >>> Updates vs version [17]:
> >>> Fix warning:
> >>> warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> >>> ---
> >>>  drivers/remoteproc/Kconfig          |  10 +
> >>>  drivers/remoteproc/Makefile         |   1 +
> >>>  drivers/remoteproc/remoteproc_tee.c | 708 ++++++++++++++++++++++++++++
> >>>  include/linux/remoteproc_tee.h      |  87 ++++
> >>>  4 files changed, 806 insertions(+)
> >>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
> >>>  create mode 100644 include/linux/remoteproc_tee.h
> >>>

<snip>

> >>> +
> >>> +static int rproc_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> >>> +{
> >>> +	/* Today we support only the OP-TEE, could be extend to other tees */
> >>> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
> >>> +}
> >>> +
> >>> +static int rproc_tee_probe(struct device *dev)
> >>> +{
> >>> +	struct tee_context *tee_ctx;
> >>> +	int ret;
> >>> +
> >>> +	/* Open context with TEE driver */
> >>> +	tee_ctx = tee_client_open_context(NULL, rproc_tee_ctx_match, NULL, NULL);
> >>> +	if (IS_ERR(tee_ctx))
> >>> +		return PTR_ERR(tee_ctx);
> >>> +
> >>> +	ret = mutex_lock_interruptible(&ctx_lock);
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>> +	rproc_tee_ctx.dev = dev;
> >>> +	rproc_tee_ctx.tee_ctx = tee_ctx;
> >>> +	INIT_LIST_HEAD(&rproc_tee_ctx.sessions);
> >>> +	mutex_unlock(&ctx_lock);
> >>> +
> >>> +	return 0;
> >>> +}
> >>
> >> As you mentioned above, this could be extended to other TEEs. If so, is it possible for probe
> >> to be called multiple times if we we have other TEE devices exposing the firmware authentication
> >> service? In that case, I think rproc_tee_ctx should be dynamically initializated instead of being
> >> static. And since we are creating a link between the Rproc device and TEE device, a call to a
> >> function like rproc_tee_start() could retreive the associated TEE device, and then the associated
> >> rproc_tee? :)
> > 
> > I have never seen a use case that requires multiple instances, but perhaps you
> > have some?
> > 
> > We can expect only one TEE, which could be OP-TEE, Trusty, or another.
> > The device is associated with a unique UUID, so only one instance is expected.
> > 
> > That said, making this driver support multiple instances seems like a valid
> > future enhancement. However, I would suggest implementing it as a second step
> > when there is a concrete need.
> > 
> 
> My thought process on this stems from 1) the recent ARM FF-A developments and 2) from the current
> implementation of the TEE subsystem which allows multiple back-end drivers to register themselves
> via the tee_device_register() API. This means, that it's possible to have a configuration
> where a platform supports multiple TEEs running as Secure Partitions via FF-A, and each of those
> TEEs register their services as PTA devices on the TEE bus.
> 
> However, I do not really know if it's possible to have a UUID collision in such a case, which
> would lead to rproc_tee_probe() being called twice above, which is why I raised this question. :)
> 
> All of this aside, I realize now that other TEE client drivers are also implemented with a static
> private data similar to how you are doing it. So perhaps we can think of this as a later
> enhancement if we believe that the scenario I am describing is not possible in the near future..
>

Theoretically it is possible for multiple TEE services to be there but
why should a platform/silicon vendor require 2 redundant remoteproc firmware
loading services to be supported? It should either be a service hosted
by the trusted OS or can rather be an independent platform service
running as a FF-A secure partition.

-Sumit

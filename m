Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54912877C4;
	Wed, 13 Aug 2025 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755103417; cv=none; b=Rmk4zbDyxUFUGJUUzPt6Ui7yI+B5jNidvd8QVj0ZsIqTTzCKNPKIhhV7nB30oboH0SH7hDK6S91NNoEvYl2uKRAvqKB7xKT4/hhHCe61bS6QtgfZFq1eg+Y7AzPMJvf3KMeHRhUGQuSF4H9g/1gK4b1r5H7bGi7jLK+0hkbkhmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755103417; c=relaxed/simple;
	bh=eGOtfUOzn7VJhhjgjc5OkdQcb/GSkSfB33WxAxwSZy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ecv0lhDXd8eMcn+Qy90HB3ev3WRTeXcypdi/QH4pWKmkf4Ack94oTzlrrE1zx90rSNhXb/h1B84Ax8Aij94sh6qaCLORZQ6PZKhD6Kz3jtbE706v3snu/tdDe9FKDdjHjW9R1SFUSiIg8VhiZ/k7s1IShC64jxIKhW8EGHkG8DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCEFB12FC;
	Wed, 13 Aug 2025 09:43:25 -0700 (PDT)
Received: from e130802.arm.com (e130802.arm.com [10.1.33.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0D923F5A1;
	Wed, 13 Aug 2025 09:43:30 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:42:58 +0100
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Srinivas Kalaga <Srinivas.Kalaga2@arm.com>
Subject: Re: [PATCH v19 2/6] remoteproc: Add TEE support
Message-ID: <aJzAkk-k4nfXY7Ux@e130802.arm.com>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625094028.758016-3-arnaud.pouliquen@foss.st.com>

Hi Arnaud,

> Add a remoteproc TEE (Trusted Execution Environment) driver that will be
> probed by the TEE bus. If the associated Trusted application is supported
> on the secure part, this driver offers a client interface to load firmware
> by the secure part.
> This firmware could be authenticated by the secure trusted application.
> 
> A specificity of the implementation is that the firmware has to be
> authenticated and optionally decrypted to access the resource table.
> 
> Consequently, the boot sequence is:
> 
> 1) rproc_parse_fw --> rproc_tee_parse_fw
>    remoteproc TEE:
>    - Requests the TEE application to authenticate and load the firmware
>      in the remote processor memories.
>    - Requests the TEE application for the address of the resource table.
>    - Creates a copy of the resource table stored in rproc->cached_table.
> 
> 2) rproc_load_segments --> rproc_tee_load_fw
>    remoteproc TEE:
>    - Requests the TEE application to load the firmware. Nothing is done
>      at the TEE application as the firmware is already loaded.
>    - In case of recovery, the TEE application has to reload the firmware.
> 
> 3) rproc_tee_get_loaded_rsc_table
>    remoteproc TEE requests the TEE application for the address of the
>    resource table.
> 
> 4) rproc_start --> rproc_tee_start
>    - Requests the TEE application to start the remote processor.
> 
> The shutdown sequence is:
> 
> 5) rproc_stop --> rproc_tee_stop
>    - Requests the TEE application to stop the remote processor.
> 
> 6) rproc_tee_release_fw
>    This function is used to request the TEE application to perform actions
>    to return to the initial state on stop or on error during the boot
>    sequence.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
...
> +
> +static const struct tee_client_device_id rproc_tee_id_table[] = {
> +	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905, 0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
> +	{}
> +};

Other implementations may use different UUIDs.
What about adding a kernel configuration option which, when enabled, allows
alternative implementations to override this table?

> +/**
> + * rproc_tee_register() - Register a remote processor controlled by the TEE application.
...
> +
> +static int rproc_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	/* Today we support only the OP-TEE, could be extend to other tees */
> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
> +}

Could we make ver->impl_id user-configurable please ? for example, by reading
it from the device tree since it isn’t discoverable at runtime? In our setup, we’d set
it to TEE_IMPL_ID_TSTEE.

> +
> +static int rproc_tee_probe(struct device *dev)
> +{
> +	struct tee_context *tee_ctx;
> +	int ret;
> +
> +	/* Open context with TEE driver */
> +	tee_ctx = tee_client_open_context(NULL, rproc_tee_ctx_match, NULL, NULL);
> +	if (IS_ERR(tee_ctx))
> +		return PTR_ERR(tee_ctx);
> +
> +	ret = mutex_lock_interruptible(&ctx_lock);
> +	if (ret)
> +		return ret;

In some TEEs, the client driver might need to perform extra work during probing.
For example, when using TS TEE, calling tee_shm_alloc_kernel_buf() is required.
Could we introduce an rproc_tee_ops and add a TEE probe operation called by the
remoteproc driver for performing custom TEE setup ?

Kind regards,
Abdellatif

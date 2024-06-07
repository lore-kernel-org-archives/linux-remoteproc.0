Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7B1474BD;
	Fri,  7 Jun 2024 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717778784; cv=none; b=NgeqSZwVc2NTN7NEn9CI5euQxL6E5PbfknR19vMbP8k64LznQRnrNa8oobDohaXjRIHXSmHjmf9tlNRUk3JUaZ0iHF6iMDPGhqa0kvb9vDEGouLlk4nL4O2Be5i5sJQmbPUyYFF5Y2E2/EA68EH6OWd/Dh04Ji0/HAmbi5PRk+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717778784; c=relaxed/simple;
	bh=9soF2Dca9cc8N19dsRYxKK4fnoA4knis7MNTRdapdIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0jif43M2ECerQwpsGk624aQyrhdTrYUVE8ckDeSK9RYHoDbvmp2Nj27j3IG3SzMb+TK6pEvf2nzWtJR1utM61Tx3Xoip+7fW38uS4pZ+Wo1aTRjyZmbCLyVGdAdOQ8y+11IqrHSc9jhz4bQfBmeoExNTVX1WXcgKLj8Aeii8HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIl0FQ43; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIl0FQ43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5478C3277B;
	Fri,  7 Jun 2024 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717778783;
	bh=9soF2Dca9cc8N19dsRYxKK4fnoA4knis7MNTRdapdIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIl0FQ43kLDTq/5kSJGPigMUBiGF+vWcdmGWSfjdA/e94hdfhvBtHyeiWJhZXGI9K
	 2aSSfdqFTPn0mSwu9yoxqlNR0sp5DXzs9TpAKzxmUx2CU3RQOPijl5V1t8amEEM9vF
	 c8PjWyZ/ZCAk21XnMlKPSQU9p7DOiE4e3A9sAPs8HZBuIsD0VkZJyU8EmA5+zbqUJT
	 V9uGMDBNpLSItYDqL3xme8Oh4oAY+jI9JBtVMypcM0u2N9byQstWt8+tUg9TrydLtn
	 RF5UlLQTCeBP8PSJO5KeekMzpaDfB7iRoYYBv+jbK9xlxNgxN7T/HxuTPME4BGbk5u
	 DSnc2XL7KL9tw==
Date: Fri, 7 Jun 2024 10:46:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor+dt@kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: Re: [PATCH v6 3/5] dt-bindings: remoteproc: Add compatibility for
 TEE support
Message-ID: <171777877866.3290379.8347507744430863687.robh@kernel.org>
References: <20240607093326.369090-1-arnaud.pouliquen@foss.st.com>
 <20240607093326.369090-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607093326.369090-4-arnaud.pouliquen@foss.st.com>


On Fri, 07 Jun 2024 11:33:24 +0200, Arnaud Pouliquen wrote:
> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
> (TEE).
> 
> For instance, this compatible is used in both the Linux and OP-TEE device
> trees:
> - In OP-TEE, a node is defined in the device tree with the
>   "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
>   Based on DT properties, the OP-TEE remoteproc framework is initiated to
>   expose a trusted application service to authenticate and load the remote
>   processor firmware provided by the Linux remoteproc framework, as well
>   as to start and stop the remote processor.
> - In Linux, when the compatibility is set, the Cortex-M resets should not
>   be declared in the device tree. In such a configuration, the reset is
>   managed by the OP-TEE remoteproc driver and is no longer accessible from
>   the Linux kernel.
> 
> Associated with this new compatible, add the "st,proc-id" property to
> identify the remote processor. This ID is used to define a unique ID,
> common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
> This ID will be used in requests to the OP-TEE remoteproc Trusted
> Application to specify the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update vs previous version
> - merge [PATCH v5 4/7] remoteproc: core introduce rproc_set_rsc_table_on_start function
>   as new "st,proc-id" is associated to "st,stm32mp1-m4-tee" compatible
> - update commit message
> - remove Reviewed-by: Rob Herring <robh@kernel.org> as patch is updated
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 58 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


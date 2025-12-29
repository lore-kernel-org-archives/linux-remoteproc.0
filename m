Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E7262FFC;
	Mon, 29 Dec 2025 23:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767050732; cv=none; b=XFnsHXffH3MNINEMNc2RAq2S3rd/m2RgJhyyi7XvzOZEFDJojrtyraRhrDho2DtU5kLpN3S2hHwjvME5P/3XEdZj46RXmAY+FHhvZTnySNMRr1uexgTyyF81VUj/+nZkneu7w58RH2E8nrcuEDqciKusSfpJuB4H21up749JLCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767050732; c=relaxed/simple;
	bh=gBic61XhRnhOC+5nNfIY22uN2UTZjrJ0gw/UGoHisUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCvE1Ao+i/xV1vG9NTtpS7nuc+a8nNfXOhLmCvVTorvDDsTr0FYEQd4mt2254BU4RHQAniq1R/Bu04kKEji1fvxkOrnwiOAtM7HOUuj8zepvQwWrREoFxPUo0jyn7W4wfHd6To4Du9M9Bof5f6hfSeAvhb3ZazBPxwPwF6ZMvgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY9VGVHh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY9VGVHh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29ADC4CEF7;
	Mon, 29 Dec 2025 23:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767050731;
	bh=gBic61XhRnhOC+5nNfIY22uN2UTZjrJ0gw/UGoHisUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aY9VGVHhUxXe6n10yUd3Ij+dXkWLdgZUtVl2t7HHs71hCLrC6/bpMaQhij2BtIOKX
	 8I9pes7DADMkBv7d6XdEZdDndszB06v88ncLpH1JwJCzwgDIQiwzlEfOBK3CVDDrJ7
	 g6AWyiwCStbcLLy2cD90Xpf77wPXM7KUN3Ziq614OHCEYrBfIKMXAvKJ9+da00RSoa
	 Eh9kpcEtN61/0dJ7xPJwAQ65YtSVVmkC4MX/rIBohFQKt5HUe9P7lLhDT6eM6sme6f
	 supwRhDPB4Lf3Vpl4g88tqGjg4ygBBa7DKyXeAli3xv7pGi007KfbwA4t9pS90CUcg
	 ZBVU67HBEptBQ==
Date: Mon, 29 Dec 2025 17:25:30 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc
 service binding
Message-ID: <20251229232530.GA2753472-robh@kernel.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>

On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> Add a device tree binding for the TEE-based remote processor control
> service implemented as an OP-TEE Trusted Application identified by
> UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> 
> The TEE service node is a child of the "linaro,optee-tz" firmware node and
> acts as a container for remoteproc devices that are controlled via TEE.

Is this generic for any remoteproc device or just ST's remoteproc. Looks 
like the latter to me.

> In addition, the "linaro,optee-tz" binding is updated to specify the
> '#address-cells' and '#size-cells' values used for child TEE service
> nodes.

I'm pretty sure I already rejected per service/app child nodes for 
OP-TEE when its binding was submitted. If we do need something in DT 
to define some resources, then can't we have some sort of 
standard/common communications channel? I don't care to see some sort of 
free-for-all where we have every vendor doing their own thing. OP-TEE 
needs to standarize this.

Rob

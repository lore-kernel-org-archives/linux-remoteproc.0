Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBF3921C5;
	Wed, 25 Feb 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014494; cv=none; b=gLEGqdcR+HXzo6b7CGeVDBzmCn9xdtMCNXbEQJOHWkr+KpslH3JhYARcGoawE9bjJ25nANv8PSFmHARhT2RiIG9fTaHPNVQyLL5MzKjlW8pSdcFEaZLqUi+KBA2sva3pl/SDr1AcYI0En+sEzL05ul7Lr5r74UC/CWmXGsBdrOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014494; c=relaxed/simple;
	bh=1Ezybvb09OMMSafqRAumx+H3UoRIusDuBCGUgx389YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMhLik0BBDTb3+Dy22Cfu+Uqovq7TSTLGmGeGtEV2A7pisMSoZL0abydRKywK8/3cER43tjYmLsYrUNsOrr6D0WsfEkanzBUBiQ5CsFTkSAA1CQihk9w6IeiCL5rVF8pjh2/X5bG9UhGkwnDyoRCMue1lRKlisJ5oGb/ZYKbgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiYgKzsm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiYgKzsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DFDC19422;
	Wed, 25 Feb 2026 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772014494;
	bh=1Ezybvb09OMMSafqRAumx+H3UoRIusDuBCGUgx389YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiYgKzsm7m4PU0dl3fUp9v+0qOHH54sdDVevNNI4MTN8F7mg8jyfqvy21+ARQjC0b
	 RZz/GXiP5ix4rHmMrmt79i3HsHIDhR2gJmIiegSE7JH/NI3ucHG1FBm4b8oR7t/ena
	 lj2cxWwPoVcEWKNnPdNz4OKcNNIyaNhSDL8/rLnvZ4I/s/lhALu5+4KFP+2ovZ16Ba
	 VMgJ8fXtmIvudCjo1oQXtLct5gjixPIQ4T+MUKtfgx39O4zksV1VRikeFmVDpAavng
	 UdaB4exN0KrNgjdgM/gQViVNf8w+ec/QfvhDvtgeNecVOJTL4aHcOIHjo2mIHBFmh8
	 gJpBfITZU8beA==
Date: Wed, 25 Feb 2026 11:14:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20260225-free-fractal-ladybug-f02feb@quoll>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
 <20260224220407.2351692-2-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224220407.2351692-2-kamal.dasu@broadcom.com>

On Tue, Feb 24, 2026 at 05:04:05PM -0500, Kamal Dasu wrote:
> The Broadcom settop SoCs have hardware semaphores as part of the
> "sundry" IP block which has other controls that do not belong anywhere
> else e.g. pin/mux controls, SoC identification, drive strength, reset
> controls, and other misc bits are part of this block.
> 
> Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
> to iomap only the 16 hardware semaphore registers that are part of all
> settop SoCs. The semaphore registers are based on the BCM7038 SoC
> where they were first introduced in settop chips.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


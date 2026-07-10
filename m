Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A13B6BF4;
	Fri, 10 Jul 2026 07:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667391; cv=none; b=t/C8BVKtc1yUB5HyN0sqqFKdydjUZzCuscosf2p0QR/1TL8Ep8dYirLSToK0IC812vwIlwN2Y6rBDGGao2sc2RK6T/rUnUZUAPTZKrqzjJyZhuzxtjKvPNpyelQinP8WwsZfoHAycXgXE7gYFprXovEdW/2fqp105Tvih6HxaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667391; c=relaxed/simple;
	bh=K11PFQv05/T58IuwlWV/QZI0LBp93RPbq3M43Z49Jh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbNH2SOkeOEYS58w7n0IDUNxrz1Xkw4aPe3gYvtV1IXGw/EIqjZrkTco+hM0wj/mDh6T7vThUxCyRG5JDfvIH+8Ig96PnzI5soSTaX3EnLjsCPagpwdVz4AaBJhPXYCGC88fU5t8G7MRw4KZ9HFB5+XrxLRsbHlNLtPjJAWluCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZxU1LTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZxU1LTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84031F000E9;
	Fri, 10 Jul 2026 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783667390;
	bh=OnW9tZCzvEibPwZFYJAhgoxRdJXq4UMH/Otdmqv+Npc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QZxU1LTLaLACO5N0FiqVi+GtOM5NqghWw6q7vcEH8djeJMisVbstYDy2/xCcdzCqK
	 UssrAarscWtvYOk/PB9CeiBM0i0aPkRwV4sq8W6JxUWRK6mWZHnpmUbkBN1nF+fyyc
	 bgSVEdxwNEIX6FFgWFYDCNtZDho0F1wQTDgRiiRNn9nRB8yYtm/ZKVVtCEvFstnMPa
	 M+n8IGilV1fBiBLgPwr7zVQlE+m3OTMxghV0/TBwlp6x8thrrduK0gZeN3ZZ9EmuqG
	 6dUXxtoszQBkPR958pdQg/YOOhJEKXB59SWnWx47he3SjTUJwh4XQfS7T6HE3fQ4t9
	 ZOaC5thL2q6Og==
Date: Fri, 10 Jul 2026 09:09:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com, 
	michal.simek@amd.com
Subject: Re: [PATCH v5 1/2] dt-bindings: remoteproc: document AMD
 MicroBlaze/V BRAM-based rproc
Message-ID: <20260710-noisy-curassow-of-contentment-f0dbd6@quoll>
References: <20260709145712.951146-1-ben.levinsky@amd.com>
 <20260709145712.951146-2-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709145712.951146-2-ben.levinsky@amd.com>

On Thu, Jul 09, 2026 at 07:57:11AM -0700, Ben Levinsky wrote:
> Describe an AMD MicroBlaze/V BRAM-based remote processor controlled
> through the remoteproc framework.
> 
> The binding models a soft-core processor subsystem instantiated in AMD
> programmable logic and using dual-port BRAM for firmware storage and
> execution. The remoteproc device is represented as a child node whose
> reg property describes the firmware memory window in the processor-local
> address space. The parent bus node provides standard devicetree address
> translation through ranges so Linux can access the same BRAM through the
> system physical address space.
> 
> A clock input feeds the soft-core processor subsystem, and an active-low
> reset GPIO holds the processor in reset until firmware loading completes.
> The firmware-name property is optional.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

NAK.

You are not allowed to invent tags. You did not receive such tag.

Best regards,
Krzysztof


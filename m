Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3B22154F;
	Wed,  7 Jan 2026 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767772945; cv=none; b=kuRXboQOXJg18pSdb0Hf+DGZt5iqGsj0OeiOJjQqicubnqyHj6MPod1U1yYyTMcNoXwly6RHn1xDfvCdlUnIdUffXkNY4XizqFAHi7yhE87JQH2H6eYlii52LgcZjSAB1c7/0B6uXwG+2oGm25pZ2Fur8K/prowroS6ynB/f6p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767772945; c=relaxed/simple;
	bh=DiFqXXAVH3dPVWjI5I+jZNWn92Ms+skONWcK14qKhUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=troJ/xqoLDunOqGzwNxVAfcWNKTBVZqTQv+CUzzaw2NRtpRoNlctVrKRmdC5R5kPHzIB4BtZ1cw+6l0neru1KGz1/QF6r3BIg6/WmuZV7fjcFc07tnUJbadB2JKPIEpOA9laywagAyLYi8sb6bOWqUzoWrhiiGCK7oJSL/m27m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Be3ZtXSN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Be3ZtXSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC51C4CEF7;
	Wed,  7 Jan 2026 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767772945;
	bh=DiFqXXAVH3dPVWjI5I+jZNWn92Ms+skONWcK14qKhUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Be3ZtXSN81ERsHazYcsdBODBq4DwMkOekC1QcoriNRSz1bTBkiwbG2KXC5L03a4r5
	 /oNuWfkzG4c8xXx8ATOyXN4vShoULb5kssGr5asZB9rmxBX3DzZdY/0E1N4Is5uEO5
	 YNvVWTEwGyjq0ry63b9jRgEJwaS2ah4Q00taNup+kCYyE4Z1xShjJsctMW0X38nkFN
	 Ps7rq8Y+sBcEZkNjaJScRT3q0gC152bxGcFKcZrSGVH/yKmguEx5w2XL0PhAtHzqrJ
	 xbwII5wCSNn05NYCnfB2qMx758kdLwoBjbpk0x2HiXsjZsEWsrOkRd/wIXITfIY+wR
	 SmeFDG0RNUttg==
Date: Wed, 7 Jan 2026 09:02:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, 
	kristo@kernel.org, afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: Add HSM M4F core on TI
 K3 SoCs
Message-ID: <20260107-nippy-doberman-of-growth-164f2a@quoll>
References: <20260106104755.948086-1-b-padhi@ti.com>
 <20260106104755.948086-2-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106104755.948086-2-b-padhi@ti.com>

On Tue, Jan 06, 2026 at 04:17:53PM +0530, Beleswar Padhi wrote:
> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
> core in the Wakeup Voltage Domain which could be used to run secure
> services like Authentication. Add the device tree bindings document for
> this HSM M4F core.
> 
> The added example illustrates the DT node for the HSM core present on K3
> J722S SoC.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


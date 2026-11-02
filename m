Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617469;
	b=pyf3CzaJ1J6+p3gG3wLgSfJfxLvRp6Wu5Iauo9lzAWC9isOLBJKF6FxaohF2tN949J00
	 fPmm6pMam41fSwqcjbn9zZ0fAVWm52TYo5ZnOcpZFH+FEZdaLfhlhwDlSrx/10/hhnyal
	 YcbJPJjjiNMDP57uIEKA6U0GA9/E+CJ7radaZCuuKearJ0Oqg1MxcekfznB/sxvHtKczT
	 +ozfwEIlBtxsKp3GqeNNQaKsB8EzWAqdU1l3qPO6LMGkIY/9Aq3YiHHNqDK1Gs79ThgLX
	 qk0GZvSNeUSFFsXJoQtZ0PdrLEOUpzsAVDuh1zs7L2TmbGL3XZdCttIV+sn6ClCPBUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617469;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7ge4xhF2ujfXkwVZrVQamV67uWn0z1MILFxq9yG0j48=;
	b=4RcppAoaPpx73+qpvMPEAYVJD4yQ7nio2Ye98MpEFGwBbajRjWDJxw+iQB4LUAKYTDhJ
	 UFmmpycqKdkiHD7b2rl0u3YV5vK4vSrNc850QFR2u3V/RKdiugekfAsnezGFrkZzpvpbW
	 L18Boe2nhJK9XRymAdbLFFlP9nL9rdOmSJhd643/dVBYNsGR8+yWmMjisBum2Pq1tnYRY
	 S2TKJXy441jCF2FsT/mx0SH89Bs9ISzkTw5pYUo3O6uSmM+s9eJ+2gt0ywOCwbfeFUeEB
	 cbU8IAQWDyMdhGIjDMwf5NdHKIu6VS04sHN7iM9uxt01MDfiBWxkGBpkDyKzVUYIfvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVFhxY1U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447E0606A324;
	Mon,  2 Nov 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVFhxY1U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E803D1F00A17;
	Mon,  2 Nov 2026 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617468;
	bh=7ge4xhF2ujfXkwVZrVQamV67uWn0z1MILFxq9yG0j48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XVFhxY1UjgyRi2hSOwlMwP5vymSaoqhkIKQ3Ie6kb528DKM5H+VO405Y4Zwf1lHsC
	 1F3RYrBIQNJSVHpfKgqLsJBXicpnAPu6xiJbdYBiOI0fOFwnswCXiuUkDmuqhUT81E
	 Kq8FUqpVQgDPnle5HbzW0Lwo0rceA9SYHhJWol/IPLwDUaQqO51XogniUt16Y6zMQg
	 aJvKo+ws5NUL24IO2UCW2a7eMZpcXMhd8DCiY6RLXcktSAlA12ae7eIuD1iWQgT3mW
	 l5JTENAeMXAFRa5eqwhbMQiVehdhXLEY911nGJ+E0YhMJz41sF4T6NQXj7lEe6sKQ5
	 UHnbpmLdkJGeg==
Date: Mon, 2 Nov 2026 12:04:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset
 control
Message-ID: <20261102-tough-brawny-rooster-a3d3cd@quoll>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-2-shengjiu.wang@oss.nxp.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029073257.84594-2-shengjiu.wang@oss.nxp.com>

On Thu, Oct 29, 2026 at 03:32:54PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The HIFI4 DSP provides an additional debug reset control that can be
> used by the debug interface.  This patch adds the `dbgreset` entry to

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> the `reset-names` property and expands the `resets` array to allow up to
> three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.

No need to repeat the diff. And if explaining more, say something
useful.

Best regards,
Krzysztof


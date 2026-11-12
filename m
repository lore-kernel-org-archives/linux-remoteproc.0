Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479895;
	b=TlpHIO3w8mY2E16nxRYrkt2ApDVuJLJnVw93y12bThxREYUwyu6NFZBEODrk0dVMiHPS
	 AnOS1WPghSXs6uJAioW4OU23YieEq71NWoznZasxxQkR2NcwspeQhqp8nrtMx3+ihHkJ5
	 FXk3lg0UAIKyqVdcfZLIRKeISdEbqTIM+XysVwt9ccGYjRfTluvfwizDOeRgBUlxDHadW
	 zhZ5J8UOsSF9VLPVZw1dhjS1wkRfRa217kSBrijVj6zwSghQ2ZSrTgaho1po6MWB4/B9Z
	 0a/eNSVkThjuzm5yzvDBr5DrNi3uaeWLB+BNZCbft2YqvPbdG53zxp+kwEIQR1lw73A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479895;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UlhJcu9wlQGccgc3eyv9RsDxodKeawxsHzV+5724IEQ=;
	b=Nz1eG7nBmggKwlid9FFnY72AolZCCZfJnu9Y+6fBwyIgwx3fdQHTVe4EfiYlnMfqhv9M
	 JwcNd/fyFNCz3tt/C+kKpFGBQGdwc8eWxV4HF/1A/tRgDRo5JQGfjuo7mFgcR+0czvVIX
	 FiIcWio/43BZ4d1oZLUOTtygknrK0KOQfaBUyIvIt/4D7VlRbKSZh+T4ENiqPaf0Kfvf0
	 2hUKoli8/tbukCi+7sRAIWtN8NpJml1wn+YqPlEm4xjYRZmq8e3Q+/mIVPmk2hqkveUIK
	 fvqMRvi2EQmQfmkhVRPeOSEH0a4H2Hyw0mFD8eInO9QrhNbv0dSfRGo6ilf1AT198VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hy938g/4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE0606A32D;
	Thu, 12 Nov 2026 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hy938g/4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E69E1F00A05;
	Thu, 12 Nov 2026 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479894;
	bh=UlhJcu9wlQGccgc3eyv9RsDxodKeawxsHzV+5724IEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hy938g/4igzFgZNjlYHansFdKN84iLAOP6GO3DGPfd3lO8kATH511IHcPmG/OXvQf
	 CtmX8jk5hD80fGKSMNuTEJ8JXT1VaM1PQN6Lo9CHe7sMDSw45YvyJInoIXiB+qKr91
	 IACb78C7dwP8dOGcSe53M5bIHrTsTU/jY5ibuTPLwx4p44ouTu23FLlklRUaETZUW2
	 lqEO54b1bd6DFLcJHMAfytA9Tlk+0Y1tk6+0F2LBYaKZdPPe8uzp1lhHE6xgB8TKnP
	 bl+wzgMJfOrHwp7se6dkdJuDIryZupIOZhUAwFblH2D/dlQzvEy3gmZsZV1q4/bNYQ
	 GVHKgUZRxNu+w==
Date: Thu, 12 Nov 2026 11:38:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: dsp: fsl,dsp: document debug reset
 control
Message-ID: <20261112-sociable-prudent-newt-be2b30@quoll>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
 <20261111031808.570680-2-shengjiu.wang@oss.nxp.com>
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
In-Reply-To: <20261111031808.570680-2-shengjiu.wang@oss.nxp.com>

On Wed, Nov 11, 2026 at 11:18:04AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The HiFi4 DSP provides a separate reset control for its debug logic.
> Keep this reset deasserted so that an external debug agent can access
> the DSP and perform debug operations.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


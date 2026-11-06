Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969543;
	b=JlxxAXtZtqYpVfzRjROxdMDUoxubmVoiCtoNUr7ab0nBe6fYZG5zmv4LIsNFjyU/I1Nj
	 qbI+4hlj+zRLWOSCgRc2Ecyn4pMt/ZmiOLkPrkJIFoigOX48ZqnAeYUqURYsH2p11soad
	 PiwkkzTiovr2F47//jzdWSmcQOTfBlxYCcQqB/VnU8ohen09HAAmqdYUj/JfWHeu/FLHd
	 39f/UYwca7034x6mTT/7a8SEtFtxr3oC0MpZ+9HVRxRarxz7mkfJsSoyclZmFlzltXTN4
	 UW5Ycn0ALx4IfzssIrqvzPtV2cbc//k2jkPyBPlhM/0iJP1t0IDGmgzBcGwpI157LCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969543;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JjNTyIpsD0vhIknxm9oFvMY1a10mRNqNJaX39V1v6Vk=;
	b=fEGSm7IiyWdWbdkFngVme3GTxrZ/Lh1yJAAp0gzzqJNSetzP4SxRbd61l+DtREv/YfT8
	 cuaEjMabDTsLdV5qbvyhWgil6lo0zxhPOr4mo3+1tcI/643ooQ5w3/MF9S0WaEXGzWbNS
	 h8Spmq6PScoIFyYoZwA+DKo++GoGoVnBh7XvwaV9i9JXxYmo8fMnbDx9R0SRL9PVsUi94
	 Tj1Ctgf3csRK7RB9C33FpnYgO6jnlWr0eZj+BZrGwdIzWi6uSHvZjRTW2gwWttkEtC1EU
	 6LCW7mMc2lKcbWegOXI/Bc3gwy9P0qgZQQmu0smUjv2cWFP7DJzWWHiGjjngo91wNhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuVLNIC1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF0606A326;
	Fri,  6 Nov 2026 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuVLNIC1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920ED1F0089F;
	Fri,  6 Nov 2026 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969543;
	bh=JjNTyIpsD0vhIknxm9oFvMY1a10mRNqNJaX39V1v6Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TuVLNIC1x2sGzEiOW04ml49LmDYKCUXm/jkGVvvwEwL+eXgnMtZ92Hb9JFrne/uA1
	 DpXhM7nm7swma0juSd2QrxPTER665+mTSoIbL9g+UbDLyyNOdZ4efXmYTMDAHbOA4p
	 7W7TzD/tbeFNwZQWfPIC0zWgVbENvtdxX+FLZQ036BSrNnzp/RcZ0yV38jgIOCG7Pf
	 c34KFovB9A5CWsy2JX00dAD1LZIyjHjd+QHAeLMTvrwnOO1uFvaW9yRXxRNdzTa3lP
	 NPEpMNqGEabe1o6AQbP2S/+eiOgUivPB2tKxFlHSxIs6N/zUKqXAosZMTPwXhxz98w
	 3xVKyyYGt9Eag==
Date: Fri, 6 Nov 2026 13:52:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset
 control
Message-ID: <20261106-savvy-invaluable-gaur-7af1b6@quoll>
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com>
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
In-Reply-To: <20261105024106.338791-2-shengjiu.wang@oss.nxp.com>

On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The HiFi4 DSP provides a separate reset control for its debug logic.
> Keep this reset deasserted so that an external debug agent can access
> the DSP and perform debug operations.
> 
> Also require the reset properties for the i.MX8ULP HiFi4 DSP.

That's ABI break without explanation.

Best regards,
Krzysztof


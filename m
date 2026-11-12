Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479913;
	b=4zITvm4Y/onYbssqJP3bfZGxdhR2XbIA0QM4v32pxNTPAr58tc/o1X8kuXcIDBnkSK9n
	 2iKj0GaPlgYS6H61sJKwd49QfKfJR0gKsgAv+nl1YyIaCi0/IItnp4b45v69jx9NhcuVD
	 dVbIwOktw5WKL38E5LzHMXzieFNDQzNYCnfg37gje7U29AG6dHvUoCHG20IlCSrqm9nd6
	 X4Fnqu1Sul2jSA0EBhld/E61QXqbAvkhMGbM95TXWm36kyqE6NO8WNAMLO2YCFProqDqm
	 moMgvStKh1H5sRp2ymiA79FalfFn24goI13llY6E312Su/J0/cwTWHHlPdjKE230tew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479913;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zxGrY/yv5DlURBF46MBwUxTu/De/cHT0VqcnOPhuVio=;
	b=Cdvm0QhQ1TeDI9UBXus6KodDwZn41qM+JwkNgrg+8MG1hBeLAp7Jtff6egowmsgbWfJP
	 wBZTqEXWNjsvTOC6JsMZx5zz0h8zXeRg/mB3eEDEnm3na4mWMwCtBEbSFy+ptpyjaNoZ1
	 aHqoZLhTpnjGw1dgRXAmqMPcge9Bq17OO3hq1HKDq0aDWV5sVr0bhyjWZDlv+RJuzk6a9
	 nrElvMxzP4tCzElQ4NbIpJJU0iLysImW2cw059IUsICxjOCpDXoqsnjETVnSjz420evty
	 obt4oNI9GPSO+opdB2LUyBf6036PbB11keiksSeSVz1Z7l7HVk2yz3Ml3z8WCQ36eZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k5tJvW/P";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B26A606A31C;
	Thu, 12 Nov 2026 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5tJvW/P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E4B1F00A05;
	Thu, 12 Nov 2026 10:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479913;
	bh=zxGrY/yv5DlURBF46MBwUxTu/De/cHT0VqcnOPhuVio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k5tJvW/POtD4AHMN//o2doJBE7F3UIluVskFSREJoHmK3WiX13ORVq/8tK8lDSy7M
	 cntSS2AuQ1/67rPzodjz6/j2aksvDFmn23pMtiLIrwbjkZpz2zIWVnnhETSV7NcSZy
	 dFZzd901HqSKpk8GLBs/Wtwu+YhM1X5p8mruRRXw5+FMaIxG+wd4dOdNmqyh8SP3V2
	 hln44v32lvdK7xGOyk6WHNXhAd1S/A0+e1f+h8zdNsXJkcsvBeUAcjIixGRUOLGfNl
	 TAu1rWTLOAug3ZbUvefTUQqEY2ScEALJH1FThfnFJHRV2tTAMTx0N/kI7W5FuJM5JM
	 RNt2v6LLQ8/og==
Date: Thu, 12 Nov 2026 11:38:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/5] dt-bindings: dsp: fsl,dsp: require resets for
 i.MX8ULP
Message-ID: <20261112-mystic-loyal-millipede-66bce1@quoll>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
 <20261111031808.570680-3-shengjiu.wang@oss.nxp.com>
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
In-Reply-To: <20261111031808.570680-3-shengjiu.wang@oss.nxp.com>

On Wed, Nov 11, 2026 at 11:18:05AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Commit e1b312356d7a ("dt-bindings: dsp: fsl,dsp: Add resets property")
> introduced the reset controller interface for DSP reset handling instead
> of accessing the reset control bits through syscon.
> 
> The i.MX8ULP DSP also requires reset controls for reset handling, but
> they were previously missing from the binding requirements. Require the
> reset properties for i.MX8ULP.
> 
> This changes the binding ABI, but the i.MX8ULP DSP has not been enabled
> upstream before.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81E41B366;
	Fri, 22 May 2026 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458593; cv=none; b=f47lMy5F24E6p4GBEchg1vY+2FL/Gw+C4M0/zoMrS1iqA2GV5f7w9NJnBEKD0qqC3a3QvtDJJkiuxEiIssW8JmJaBA3j7Ukko00PADtj+06UQ6YbH4w1E3p/rYKQXeuggdn9aYBEBxDjiTH3tlmWegxTsoIb37b7omRBsykJVJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458593; c=relaxed/simple;
	bh=4kSaALWt2CYQtSO08OULmKTu6gRW0vwaKeECn92Cwu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E30GGCwiPnKpWShrVR9EL0Cijpc4TZ1ZpgHV1kGQ0hbgaua2e6wyKXcBgFNN8NfJXws3CFZ+ITXZn+F+w3w+h0Y4jW1JcNhxNrSaVLp/AzVhaK32rA5wgIyOnIttzNmXvJnlZc6mbgT2Ew22ZpwLQxHoeXvbhfhl+kr4Nkzb7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=iy8YrBTr; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="iy8YrBTr"
Received: from francesco-nb (93-38-247-131.ip73.fastwebnet.it [93.38.247.131])
	by mail11.truemail.it (Postfix) with ESMTPA id ECF911F81F;
	Fri, 22 May 2026 16:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1779458584;
	bh=aQfUzeILNu5tcktKZdX1Dp06noZVwCjrBQxp9UsjPno=; h=From:To:Subject;
	b=iy8YrBTrKvM9jFeXPgme3Laz8+PEoMqJufzTCq0Rl15cX0EjncveuErsbv2FyD/AV
	 HD3E7dH21SGFSibTVLc8JaNqku7hCeyD4JXOm8PGljjOqScxzWzO7iW4mikL2+qFbh
	 DXGZgaVJs6rb7CTFZ5UJaUl8IxcEHMXrks+N3MLHXzBavEZRP87p0grvzodlGSpDrj
	 UwzEI9CKcskxWgKh09aVYRS9rTS189LdqHRoG6XdjuiNfgXxUZv7DgJiM2jllfGUWN
	 gVwYNY9OjYbhbMYs8cRHdpz0x0dxve4e/Z8078dANCCcHFfXXgWvliep7414eivNIJ
	 TQqmQb2Mbj61Q==
Date: Fri, 22 May 2026 16:02:57 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7
 node to SoC DTSI
Message-ID: <20260522140257.GA93826@francesco-nb>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-4-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522111849.783-4-laurentiumihalcea111@gmail.com>

On Fri, May 22, 2026 at 04:18:47AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The CM7 remoteproc configuration is common to multiple MX95-based
> platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
> Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
> channels using <>.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

...

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 3e35c956a4d7..f8760ac067fa 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -272,6 +272,13 @@ opp-1000000000 {
>  		};
>  	};
>  
> +	cm7: remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		status = "disabled";
> +	};
> +

As sashiko noticed, this is introducing a regression. No-one is enabling
this node anymore.

Francesco



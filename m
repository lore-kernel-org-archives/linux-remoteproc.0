Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6AB189BBB;
	Thu, 24 Oct 2024 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729755961; cv=none; b=mqz3Q4uwz3Y5fAh8xhhChLZ98ExbuhvkhqJmuIxh6OU3zP+tNPdqyVPFlcO2+jTKhWkPI1jwqLhBEjZ1DOwKFdhQ9ECMZ0/ie1+ySQaeOCp/eeGMZ2uSqTFzxdFIcjMsgL5ugrbVnzYr1YG053iEGLjsBmKj14pJ9+X5C9GkZNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729755961; c=relaxed/simple;
	bh=T+80owMJgrDDVyRL0LAjbSEBW9ztZO0IsWvfnxMpzZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcyvvyjimXSEEdUmRHDSAHZLH/zWdgGK8tgiLyE4rcmAeOuFBCSYgExSESnP4J/gJShwkc7pVgPC/8oJhDOGUQkmRMTPwHc+h6NPTWE52M4anIUo++BYvxtkDxhSfwQHeJXV5NIXUF1ebtiIIJ1Y3QMgPnkm9D8kvwyuFMGppKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tt1ityiM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tt1ityiM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86070C4CEC7;
	Thu, 24 Oct 2024 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755961;
	bh=T+80owMJgrDDVyRL0LAjbSEBW9ztZO0IsWvfnxMpzZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tt1ityiMhdKTNa3OQE0xi1izaNQbq7V4iSTnwz8hIrXm86sAuKUnTVnvRU5cnPaIU
	 2Ijj75H4fbPWjP0NCtJ88qppe895e7FBMD8aekXUKgaM4pY8mvdN5xww+7YHxuOV7z
	 12K0i6K597AfMYhbPw0LUPFRtSJbb7EpJAFQpGvNuqlWkGDNIVGrDoLCswyqAjq4a3
	 4tolrgHS7cm0eMYa72kVjHHpoNnU5P3i8XMXI1Habxq/VfsysLj18ig2PIEcajXnzL
	 4uK1CWdJyWIqZX916mcSZwZtzwIER6XcmJpH3IkxygSRRj7weXE1TOHyBfPkmPSoze
	 nO5lw03ZgAexg==
Date: Thu, 24 Oct 2024 09:45:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
Message-ID: <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023162114.3354-2-laurentiumihalcea111@gmail.com>

On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add new compatible for imx95's CM7 with SOF.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..ab0d8e017965 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,15 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7-sof
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dram
> +      - const: mailbox

That's quite different programming model. Are you sure these are devices
from similar class/type?

Your big if:then: block suggests this could be separate binding.

Best regards,
Krzysztof


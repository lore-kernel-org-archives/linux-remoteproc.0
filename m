Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2411FFC59;
	Fri, 27 Jun 2025 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007982; cv=none; b=kP7uC0wJKkyrqfZFfLy/99y+rZ3jB4CREbgahE+QOdGRondA6TeyeVpQc5tOa4meFlN1yWedVEEaBjgubSRMsgYTbI0iCeUpyvTYJXdp7NvWkk2w9yJIoI5kK0OPrEY0I3MGhCEpfXEWNvuMtW8LnFQBaEHyPOcmvwT+/LK2j9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007982; c=relaxed/simple;
	bh=/EqmbAddrBe3sC3E4/NL8P/ElonLTvB2i50FUAlbfZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZ4ZfPPN+JuIQ0EP6UXeeIMwvP8wZALzN411fENgWHKqjWV0hUbv0imi4XxP9TufLBMQKGQNEg1X3x0sqtkPzuFv0/0srqWIPpakurhYX08tb5Ift6nYmoydL0tVbZFULjKmYGX4D56lY7AvpD3DAb+SX3jWsvPXGf8qulKYMQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlhhgT01; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlhhgT01"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470CBC4CEE3;
	Fri, 27 Jun 2025 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751007982;
	bh=/EqmbAddrBe3sC3E4/NL8P/ElonLTvB2i50FUAlbfZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlhhgT01QFwkK+tQ8E/QRH4IcSsZdRubxsCP2dZRJAySq3PluNhZIBqdISbYnAV1O
	 KtEOj3fJ++oUiRh/Z6elHNO1LIR/Vog1nwTgItuFfrnsjnB1gPcosJGal/MX++h7p4
	 Fin51fnxkHL1wDG36Iz7wt2kMmCGufkhRtx6aIJGuEXPH0qXEtgDFTiOacMpTw0XlE
	 be9IoyfQLpd8wwRMQtsvM9HyLxtWKYi7eZWrRBoWgJTjN32Uy739khE0dlnGH0xAHU
	 OceAXsyEsN+zMVuruFChe4FakDZgwMMBygplBSFx3fi4LAm+oBgnv8gOrTzJ5Eestl
	 XNPm502aEcGmA==
Date: Fri, 27 Jun 2025 09:06:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
Message-ID: <20250627-black-skua-of-admiration-f6ccbb@krzk-bin>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-1-699031f5926d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-1-699031f5926d@nxp.com>

On Wed, Jun 25, 2025 at 10:23:27AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add compatible string for the Cortex-M7 core in i.MX95
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


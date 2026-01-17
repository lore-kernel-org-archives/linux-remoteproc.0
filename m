Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9317286891;
	Sat, 17 Jan 2026 01:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768613093; cv=none; b=PrK5KtqWjJdwA4O446JLvuHBjRjEqqcGz04D5qaJPDLz7/9752TQE52cpjkxw5rqCh/qLdNNs8vDMQA6skHSuLYx5tFgaKaUz30UAMzo90+dYBY6OAdPI0PzozMFkoeeRsWZ2S6RL+vGkrq1RgC9I6ZowWWZCufFnOEmy7DoA9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768613093; c=relaxed/simple;
	bh=+/nCIgRUvPlsiKTpAeKa3/TVmwZi8Ea2lEh1s9Lq5fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZ81Zwy08w9/jwsuEHGcFtTazU9u5qcCys/8HjcAJESc+S95ZaB+YCOz4T0fJsm+eawOkq3GzCk3e9Mz7DX+LSHdjS2DiEoPKHjqKAYFUvnvdAVg5kQPekrCw49Bf816cC4Pd7FdcyM99Nv5wh6xRPVtvHTPzODsmjuyWnybsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHZWO9Eu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHZWO9Eu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E498FC116C6;
	Sat, 17 Jan 2026 01:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768613093;
	bh=+/nCIgRUvPlsiKTpAeKa3/TVmwZi8Ea2lEh1s9Lq5fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHZWO9Euy1ms1PqJiF5griw+xUiA/79k/DFTwa0Ew1Pp9Xn2PW2UxwdfuA6G7jkU/
	 d3d3xqSIZKijc41DlUXLMdLZaFoUAQAY2IB8yArUTFaW6bzQzMsUNFRUyerxjjdQlY
	 NWcuCf0nLkFufGI8yngHpfpEfWo1YLL7MtlcUzzwW13fD/dOif/4+N2Ox5d2k+3ME3
	 dFKymoIz4Nx6PWwCYVSSgMwxJg4JLaIjpKTTVDs2zNZ5D4qihMIGtpjVKlDlYiJgty
	 PU46N4Ii9uBe3n8yc1ufLKMv6a1eHQ7FF2NrIXyFERohT8/mkNEaXPvg7mmLYgx0SY
	 Zqd/yIPyljb8w==
Date: Fri, 16 Jan 2026 19:24:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in
 maintainers
Message-ID: <176861309133.2330594.16947587442978287595.robh@kernel.org>
References: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>


On Fri, 16 Jan 2026 18:29:16 +0100, Krzysztof Kozlowski wrote:
> Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
> tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
> so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
> maintainer.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 2 +-
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!


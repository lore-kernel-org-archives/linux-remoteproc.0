Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724C2FFDF7;
	Thu, 19 Mar 2026 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907587; cv=none; b=iI6/Q6XGja2djQxparJvNEWvzX9BblIgnlu7Xur11u09hv5yOhgzYx/Eb8qWs7JkvfC8UaGPPrw2bRC1kZhJc3+TpiyemHW4JPJz95DmMiPVIl8rh595US0ckO5dQc93Ot22cX+5iVa89Z8UlzpUvY6k3/DZU1laIKYTIo1mQ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907587; c=relaxed/simple;
	bh=LND9QP38YR3zwrHcZrV2AQ0j85RMG+MUPI/TxNx7ph4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orSD+ogas6YIzLD56M2MnPJyurKOZHEBJBrhOdeSyLJzrzgWjdoMZFhPRz6JnIpe7AAr9ipvq+uWJ4mB+TX34T/VdQzgh1aDnNKq7+/NHG1aUgEGf7QnJytLygQTSCdiIOme1HKpWWUDFCSK87QJQn9c8Wv3mX9auAFuyv2lqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAoLMsnh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAoLMsnh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19E5C19424;
	Thu, 19 Mar 2026 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773907587;
	bh=LND9QP38YR3zwrHcZrV2AQ0j85RMG+MUPI/TxNx7ph4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAoLMsnhwO55TSj97BpIYQ6GGdnoo4+804Ny+0owESLqk3FJnTkHlhyv9bLhrCF99
	 0sT9NpOmTKokTvdExb8z1iErj+uk0TzkZSU4ditf/VT0VWAYsiFFZTHZWFPSA16YBz
	 HGR/abXCzo4q5Nmyw6affJxlSHF78KGysbFhvCPbYOEvMAGCORBZkJKJ0R+UAZYJ8O
	 qAgEa3Sl1SpgbcJmBhJAcZdxXh84wI39Yqazewcwl3riFVXoG6FzQetlqQ50sJ0QmB
	 u2L2i6/3KU4FprDksfvPZ2uG4Xm+QPvcKE0Egk0g9uftSHIuR8QAnY/gyQMB4se5cW
	 +2bWg2UcYBLYA==
Date: Thu, 19 Mar 2026 09:06:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 2/6] dt-bindings: remoteproc: Add STM32
 TEE-controlled rproc binding
Message-ID: <20260319-prehistoric-mongrel-of-essence-fea9b0@quoll>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
 <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>

On Tue, Mar 17, 2026 at 07:03:23PM +0100, Arnaud Pouliquen wrote:
> Add a Device Tree binding for the STM32 remote processor controlled
> via a Trusted Application running in OP-TEE.
> This binding describes the interface and properties required for STM32MP
> remoteproc instances managed by the TEE rproc service, including a
> linkage to the TEE backend through the property "rproc-tee-phandle".
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---

Heh, and standard comment...

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1373AE198;
	Sat, 17 Oct 2026 17:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256832; cv=none; b=dCa3Je25F3u/koE/6V9yOE1XsIFx5++kkiQwq4QW2XGLaDnfKSeJyH9VqA3rpMbpB62BUvd4rPwFsUx/FeoxfrP16X7stfRVUvjd94VQQMvCaC25usOe5xfnWj54zE9qRzRm46nVY7z34+CpXcoSRODM3okSzAqqK7qEnwrH/Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256832; c=relaxed/simple;
	bh=YQiMZ9iQNkj6yK50eZfDDsSadt+7FuwK8EMS6ozdQWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhXrCO03oXWLW8RZTMxdAZi8u4Qvy4ETDG2kpA1SJ2UCiJUU9mPks9Vn53Oy4MH75pRrboVoUzL0RG+wlaCiql79RRRU8jp9u4CQ3FNFyy60nX25RgRR/GmaFrUCAxMgSWqxQBOQ3eOBALZcRy/aziLJxU+CLXNuJkikROGT2cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmuShcwX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmuShcwX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19BB1F000C5;
	Sat, 17 Oct 2026 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256829;
	bh=Ox82d8xsVWHly72RET7XBCYX+P0mTZ4/xADAS4+N6Vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GmuShcwX7M7KQgQIvkovOFSmeFKetPGFb6KnVPTafLlcTDn+bv0q7KDScKMz2vfnS
	 sWlXRmlzS37LnH3myrHN7B83xVM2M0ZioEKvoHxidlEVgHeR8zZ76JAyB3JTiS6VEz
	 UCuHfr0J65PE5hmihw4JMnzg2QYOwf6+spoU8AlYPOrGlwF5pqqq5wF59LWdNU0QRB
	 oM8v5EcAgs1ZSS2yVYdXrtxS94X25+77r2ak/kmjQDqO/BhbU3DLnDsUsgd+HvY+qq
	 tK0/ICSybB8DEU8LRUZwA0TBcGSTpz1Yb/H5Vbx2PsPYgXrxDwyVqqn3/RZkwYiJar
	 GgturKf90xpOg==
Date: Sat, 17 Oct 2026 19:07:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm6350-pas: Document
 SM7250 ADSP
Message-ID: <20261017-berserk-paper-shark-7c1d66@quoll>
References: <20261016-adsp-sm7250-v1-0-2f39ac1f0496@brar.si>
 <20261016-adsp-sm7250-v1-1-2f39ac1f0496@brar.si>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-adsp-sm7250-v1-1-2f39ac1f0496@brar.si>

On Fri, Oct 16, 2026 at 01:50:18PM +0530, Ishu Brar wrote:
> Document the ADSP Peripheral Authentication Service on the Qualcomm
> SM7250 SoC. It has the same interrupts and LCX/LMX power domains as the
> SM6350 ADSP.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432C0210F59;
	Wed, 11 Mar 2026 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210763; cv=none; b=flFJKd/56nNIN1BUZZN+FYbJoekAJkICak4crqjBlnTpN3Bwr21S/oCv832bodSqRLdK9OzbZ3UXcRmErGBRijYL/CY6TwR27GEiDGs2Fp8otsEWnvYnSqwsl3aqbimfmBklk0/JO+CNckcbTeINeQ7bBGXUhuFzOuMYDch3TVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210763; c=relaxed/simple;
	bh=r84PTh2GchmN444XX1lzb9EoE4RVwTrG3MMrWXdhY5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyOL67AGl5/4aombb+xzLfrkbjjOstAzsFykc5dZFeQmyBkyOBgQe27EP9qqitHIZNCs6VynlwEzRn1yaXBaCy98qd8Tql6kvkvlvttLFD6K5eHJ8AjeRWpq51mfmEl0IHzt7W4sTifo6aJ2XoyWy59MhOtV9RCA7BfjiyPhb/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgl3T6Wd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgl3T6Wd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E76DC4CEF7;
	Wed, 11 Mar 2026 06:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210762;
	bh=r84PTh2GchmN444XX1lzb9EoE4RVwTrG3MMrWXdhY5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgl3T6WdfrCDvYK9p3umV/SGyegSGmx3UX+19+gH/zxr08N5iK4lxXlU6hyabPi35
	 YUg1b0LceYhqJtQXk7WKsWo9sTTnkALFokyx6VjS38nBvZE9Qb3nwItnFEA/v3nr2+
	 dI9BRB4d5ETeNSvf406bZhF5XLBL0INqDDbFIpeQMiHZQKJa9rK3W5FUCmA9IGxrnN
	 wWC0OcEe50EMzPUsST1wFRLfRsMjJmr6Oh/QCfHjCctXPWDommcxc/M7em7THwX12K
	 3WLX1PDBg5G7c/C39ISLF/ahRsVYqFR92xrfyhBMTX8aBgeYlLpzRzPvdwOXhaXq8Y
	 9iKy54hLy8YOQ==
Date: Wed, 11 Mar 2026 07:32:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <20260311-strange-hospitable-alligator-91ad98@quoll>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>

On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
>  2 files changed, 159 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC5847668B;
	Thu, 15 Oct 2026 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060457; cv=none; b=Iuhm4+W64Sy6nDXe2ypwYeprNvR0AvbGgfqbN5oKd7SSzsGCGtypR26gzTH5YzHXN12TjcPJNN2Oq06KnbiucRXpiJmRDmZBMsiiB0OIeyCi0clkQoY+XYvqF/a29OeOYCht+llas0fDK4cyLmTJvgejf865GCr7pJCmj2xnaqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060457; c=relaxed/simple;
	bh=04QRdu53sGSD9g5VwPo1CCDjru65OUKDsByW8v4NHHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCkofg9asqreE+98RBvpl7ganY/tzly1wg+q4ZZec1jhlkRR/5Dpb9DNbkuo9xbNbH8TFj8Wv90r5SWjwn9D7t/RRve80Ok8uIOFLrtqWeRmEitExih0/jKtNXy6nErm2vrO+d12ewhZ12rSxPJUzfzULKgSWXFb0Q+DBD6y4PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlpvqeCk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlpvqeCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06BC1F000C6;
	Thu, 15 Oct 2026 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060456;
	bh=3Z+4M64hUfhs9pGZHZHfFJhY3EClvyG3SJLyCeXv+qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nlpvqeCkzrlamEibo8iJS4EWoKlzCgtzXLnYaHhPG1fFK7FQS8/NJ+sD1FRGxZJk/
	 UcLkvOKIVkT4LBOetSBGVcMbWrv7PUquJ0Hao64KRGNE3RIlvboz4+vWdrI1hAKSAk
	 qjgIbVNII5qWUkzJxZuObeM2kvpbsaTMl4cHdHBckc0QIAAnKTM6DfUReGIfBjA/vm
	 6ooXiB4NUMBhcbRWVL1Cq86Q++/i8+OtC+dL1kP5KswoBqSrCiYsKyfmLBmIE7E82Z
	 /D4ifKkZw4VpMox4+FIudThYsvi4XrpoBOd0x/Y/DaZZ1/o5RK7zAOFdjpTJli9ukI
	 Xw39+hPVwlbNQ==
Date: Thu, 15 Oct 2026 12:34:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
Message-ID: <20261015-silver-binturong-of-reverence-f8ac8f@quoll>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>

On Thu, Oct 15, 2026 at 11:25:49AM +0530, Anvesh Jain P wrote:
> Document the Glymur OOBMSS PAS node with its secure GLink edge,
> shared-memory signaling, firmware carveouts, and power resources.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
>  1 file changed, 154 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
> new file mode 100644
> index 000000000000..3aa96d2262f1

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AC070818;
	Sat, 14 Mar 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773478881; cv=none; b=hIfpzsNn0EphWIleQMRu+wvHvvHA3ON0uBWfWI/nHLJNRwnO7C1FcAWS/RamofaB40Jbe7ilD7egqR2Eg2+x4dMAeZweeiRWPU+9IYilScamBObb1b8p6HPryBKNO9WzBmDRWG0yWZ6qpfRqkAfA7uJvCr0cPnGxMJG3gaGm3C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773478881; c=relaxed/simple;
	bh=pBaaXeu9/QXt2rXgK/g7ZRMeYiCZNValiF26uuS2oas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nn/0dcnWUrrvtysBmWNIt0HfBSVfl466bpqFeGanLzdXPB5ePUoEWBL/iubSeP6xc//udMlqRHBHvElCFZw5KBWwdYm1Pt3jT0cJePxXtvjH6qFxWphGQ8WTx6y7OQErfl1Vy5mMn/4jmxO09qujrMMy4WRapp605cPNz+ZNyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfBAuSv6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfBAuSv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD96EC116C6;
	Sat, 14 Mar 2026 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773478881;
	bh=pBaaXeu9/QXt2rXgK/g7ZRMeYiCZNValiF26uuS2oas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BfBAuSv6vxRq44BmB3CzXkjxAsS3geeYNSuPbBisMIy0ye5AkK5Vv+fPMoc5yF66m
	 JeanQNrLtCMYrt00OHEhIIv+Oqn7HEjVR51d8WWplydz1jPOftm+SRYSPcjR9mIFm9
	 Bt85TNZNGlwL1jGpDvl+NconhfzKtvEOh1ViG/prVstsr16bH+C764pUwI+/NrXPq3
	 VfppXW9dKaUriD8ryLSyexlta6sB4yX5t7PQruK9GJCa+T4+EbyZ+6bqC/zEeWOuOP
	 E1UYgmQwU7Hvn4DaWrdYrJFvTvqoEz1k0jJ6FMrKS3/PAlMPFb9yjctKC++qyGwia4
	 +Hp4bTiFYxI9g==
Date: Sat, 14 Mar 2026 10:01:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mani@kernel.org
Subject: Re: [PATCH V5 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
Message-ID: <20260314-dynamic-terrestrial-pegasus-81c507@quoll>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
 <20260313120814.1312410-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313120814.1312410-2-sibi.sankar@oss.qualcomm.com>

On Fri, Mar 13, 2026 at 05:38:10PM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur ADSP PAS which is compatible
> with SM8750, which can fallback to SM8550 except for the one additional
> interrupt ("shutdown-ack").
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


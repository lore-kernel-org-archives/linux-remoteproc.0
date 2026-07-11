Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181CB28CF6F;
	Sat, 11 Jul 2026 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781836; cv=none; b=Hinx/W5EJwnsYJkgdJTesIqFvmXZfFyxPhbsNIbQWQzyIB05/dkid4AGEjiFSXndDqice0Aj1Dp9cwMUCgXfod6XDRyUu8ksNbTRt+zNcYbYOvl6l42hnmcqEbgvqzicLp+gkNj+uIMqxASBSc7R8d4NkxH1gcmitsreFbD50+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781836; c=relaxed/simple;
	bh=Ynij4Jgo7pYvJ/6r83hvCfm/h9Amr6Dm3dEjTMIcqIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqWNogps872wW33SUTXsonPFdmnEMCb/5w3sp4XC/Z+SaBa0xOqLh2Ix9cdMWMn3xSRe0xLR6KrsbtMTBdwzieIHYYrlIYnVcE9cxDupbpUyD8IXwax906xyZl33/l8Lt8HiacSqgWAHZp2NqEcBcLoWTcbfLRca5bZFTG5Vn9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1uTYTzh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1uTYTzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585691F000E9;
	Sat, 11 Jul 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783781834;
	bh=ZRu2C+pypTWNVGcW4Msl94QsEJjH8FM6FJdsgl5DJ/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c1uTYTzhlSnLHRD1P7XP13WaSNP6htxBsJcrRMzP/U1wAExHj6OFEZwPMY/xgh2dl
	 QC+ZTzvXnY2QqnnBwTBCWptDhte42E924JnxTS2c1+JETmACncBbPzvdZ95D8L2qBq
	 5LNKKMC+Zo2w/9paHVlMglG4ZNNxEiD26HscUeFE53fjOe2zdQOX2hLxxulVmqmIEe
	 fIz0tGIQCUMrEGxCGMfQF+I7nrhCkg3KNybEIG218MfCH1KQBP55cB+mTthNkuH7Wp
	 a5HzeIV3yLDA5yEMnyiSWEImdA4L3FJ00qgwjcbsJ6mHCR2GYxYK9kUFxwfzYuFTLk
	 05YZ3cF/ujyjg==
Date: Sat, 11 Jul 2026 16:57:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: remoteproc: qcom: move glymur SoCCP
 pas to standalone
Message-ID: <20260711-topaz-hippo-of-romance-3e8c09@quoll>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
 <20260709-glymur-soccp-v6-1-16f70227547d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709-glymur-soccp-v6-1-16f70227547d@oss.qualcomm.com>

On Thu, Jul 09, 2026 at 11:39:42PM -0700, Ananthu C V wrote:
> SHM bridge creation is required to enable memory protection for both
> remoteproc metadata and its memory region on Qualcomm SoCs like Glymur
> running non-Gunyah based Hypervisors, unlike Kaanapali.
> 
> Having Glymur fall back to the Kaanapali binding is therefore incorrect
> and breaks subsystem restart on Glymur.
> 
> Fix this by decoupling Glymur SoCCP PAS from Kaanapali and registering
> it as its own binding.
> 
> Fixes: 8b54bacadc0c ("dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms")
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


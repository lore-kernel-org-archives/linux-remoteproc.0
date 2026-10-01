Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1838F236;
	Thu,  1 Oct 2026 08:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843638; cv=none; b=ttXbSxMgcB4e++6o5qqur3ll3JKZ5LOfYFRmCwo7fQdnkWASCcajE8bTPGU1popBiIPd91YjepUAUZHC0C9SckB1gkWvga/5y4ie/E12JvCi94ekTc7gqRhS0KvHYg+50IOGl89Im1JcVUYps3y2Ks33zCBy4sC6U39p+OGrImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843638; c=relaxed/simple;
	bh=AWcbBfNDyZ+zJ2ESfYX/90qhK2pfCU6JgAqqiKTG4ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwkUuXasuTwk9siINQBW649tBJAWDsP4M2xzZlzBQAz1blLgrh1JBQOVafCahKdbHgha5tMyw5dMJKkcdE/ill150Ry+NPG9EfjMSu4o2lEVJVKSgDDPGorUnha8k0x+9IlEXbwuDRzNdCgPWjNzMVN520CnJ532JnyWxtcRmRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJBWCOJX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJBWCOJX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909791F000FF;
	Thu,  1 Oct 2026 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843637;
	bh=AWcbBfNDyZ+zJ2ESfYX/90qhK2pfCU6JgAqqiKTG4ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aJBWCOJXO2Ggzgwc0AeSA8myKYNQG6gtOpiBCKNRCOPXHk6HFHIiAZBnWVnwm0QKD
	 +Cz8f3MJte7Dg/L/tB0WHCXp1IA0Q9zZQExYFFzLOkPCf7rUAFyhbfzdi1B3kc7HoB
	 cSGt7yoLlqlXU8PNdHyTpb8w+jmRh+YCPanScnvj7ur5+tzWOilMIPbG6LO7WxihB/
	 lVAcXgGgSzMMjXHK36hhXuXUrscOonMOgF+MpBnGR6a13YGAySXP2lT7TFvgb9IGr0
	 J1F9bJD+1CQsqoDsDADh7Uxpm5nfykh+aTlkUarTeIG89Zc5rIfVtLlX4O1Lf+Gu73
	 /ki/MJQzLN52Q==
Date: Thu, 1 Oct 2026 10:33:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Relax PAS iommus
 item limit
Message-ID: <20261001-ordinary-cheerful-velociraptor-80c793@quoll>
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
 <20260930-shikra-el2-v2-1-f0822be5aaee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930-shikra-el2-v2-1-f0822be5aaee@oss.qualcomm.com>

On Wed, Sep 30, 2026 at 05:19:03PM +0530, Komal Bajaj wrote:
> Some PAS users require more than one IOMMU mapping. Update
> qcom,pas-common.yaml to allow up to three iommus entries so
> PAS bindings can represent multi-stream mappings used by
> platform device trees and avoid dt-schema array length failures.

This is incomplete. You just added two more iommus to all devices. You
need constraints and proper user of this.

Best regards,
Krzysztof


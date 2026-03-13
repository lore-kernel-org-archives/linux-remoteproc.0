Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C1A313E30;
	Fri, 13 Mar 2026 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407597; cv=none; b=MrqJGpgMGq4EWurp6RFrE9vAo2I3QhUCRtI9AnHjqvA0qBVu/mRZCJJOQzmlV5c25eLhgpxCaZP6B7LT3HrIE+q3OCyTBNNRLTpC1JK5M7Khz5QEYBAgPmAt0TKuboqe0fdrsWmm/J2UnczKPpUHeGux8uuJpF0Rk580ODKgluY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407597; c=relaxed/simple;
	bh=xPo27vZQHa0VeHvoMBo74iwsNctKnm9rabgW9XwYVLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcO0+mBk26vesC96yuWU3iAsM2DEzLBZaUr3FuHev+Dr8yrBFhRmSJbKlhzJpaPxY16uZKrdPnem9GqVmRufCm5cOtdL7JERucK2jOl/DHWCOyM0tg8graO7t0mNV+mKO2Of3Z/rpvqa3+xa3MgsZ8dS3o4/AKA9ThbqcTnirFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACiGhfKv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACiGhfKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191D8C19421;
	Fri, 13 Mar 2026 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773407596;
	bh=xPo27vZQHa0VeHvoMBo74iwsNctKnm9rabgW9XwYVLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACiGhfKv9t/rD8sS2RO+9g8GTBcDunz8x0Ns2ztzualQDiIVtrVeqf23WQWpP4ggC
	 HXiXRJ+ANzqK7n56ITmhjWoL9qAFW/4hdJqfXgENa37HtazsFyefWxQw20rgpXRw/A
	 6kmj2h9WDLC5V07NYTY3xxFvCaQU94OWfzEcDlecSJr5DaTKDulVp+3o9eWtuOuTZ2
	 btcq+PUzoDu4I6b94Z4Lu8WMYe9b0XOx58/nTxGfrQ3hu7eus5BtZRwh1sVNSzr9CA
	 C7CjYSmF18DkzgbvZ3mp3HFniDEWIFEOX59ggtBwaSDtZG0fp0MjIYu1Lu+0MXrq3c
	 NLbOmxTnCAfKw==
Date: Fri, 13 Mar 2026 14:13:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
Message-ID: <20260313-quantum-modest-prawn-896bde@quoll>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
 <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com>

On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (TI) wrote:
> If memory-region is used, require memory-region-names.

Why?

I don't understand also why this is a separate change, but maybe answer
to "Why are you doing it" would cover it as well.

> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Best regards,
Krzysztof

